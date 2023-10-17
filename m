Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCCFCDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzBfaBlaokk7jissMCpZjb6kCv+6wsFZNLBk64V15hE=; b=b4N/q2eeKn9iU+
	mrMPNc3AmZX90QlDpA+7tusqaKm2wkAO+nrJ91msYmvXk6ZL0L48oWXG8jL7TaNRYcinBxeOLBqwd
	lvpkLNtbkKPoaljPkW4yXyIwqQOuk1mQD4JifmCtrZnI3DpuAbQSuHBsigUoq5WYb4H+zKMuGjnLr
	+Nrarua6OOl2NCjfd+NBZENKufFSNsUFbABITMHnta9T10njRdw8QUTeGB0AgY/DT/IpkDXUs1eXM
	hecRiJVCy05/LLJwZ7B7zB7VCrD83qfPYJzZCa1GQqOe/4VzuCzA1wmFetF14fvIIui3SYXUpXiNh
	fT46oJ06mAZUMfEMGR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskx5-00CVzO-2l;
	Tue, 17 Oct 2023 14:21:43 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskx2-00CVyb-2t
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:21:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57382FF813;
	Tue, 17 Oct 2023 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9F2O1hUuTA305YQvsLaxDl9n6cTOvILCqabWe62sTuY=;
	b=NlRsGPFLgtMCAaHHKHIsiue0/sUOs/plEshex/IKlbhSyq0suiV7m7NE/LORSpRExgQ2fz
	XeNmCFzogXqDT8X3m6g8py1l1ydb/ahFi+6jnDw0bcY3hqTKPk+tk+nbEGoPwxJZQBSACt
	Csn+ND7pcJBTqMamp/SBFgV573b7UjMV7dIjuArL7w12RqQexTtbyoExuxpnZ3A4dNyu7n
	OKtMBw1e6EUyxTLr/TZeg1xH7yH+XLlJXFczDNjdmbu3KtpQoFfPJVoXqK7o/0lh9fvRFX
	07ouiYh+EJHSV2GDSqcugF9HisdikqRCUlG46/gm453qcX3E7X7oUGpCX3ANcQ==
Date: Tue, 17 Oct 2023 16:21:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/6] i3c: master: svc: fix wrong data return when IBI
 happen during start frame
Message-ID: <20231017162132.361be2c3@xps-13>
In-Reply-To: <20231016153232.2851095-3-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-3-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_072141_229319_9EDB5EE7 
X-CRM114-Status: GOOD (  17.78  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTYgT2N0IDIwMjMgMTE6
MzI6MjggLTA0MDA6Cgo+ICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQICAgICDilI/ilIDilIDi
lJAgIOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQICDilI/ilIDilIDilJAgIOKUj+KUgOKUgOKU
kCAg4pSP4pSA4pSA4pSQICDilI/ilIDilIDilJAgIOKUj+KUgOKUgOKUkCAg4pSM4pSA4pSA4pSA
4pSA4pSACj4gU0NMOiDilJggICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSb
ICDilJTilIDilIDilJsgIOKUlOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJsg
IOKUlOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJgKPiAgICAgIOKUgOKUgOKU
gOKUkCAgICAgICAgICAgICAgICAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQICAgICDilIzi
lIDilIDilIDilIDilIDilJAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUkAo+IFNEQTogICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYICAgICDilJTilIDilIDilIDilIDilIDi
lJggICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCAgICAgICAgICAg4pSU4pSA4pSA4pSA4pSA4pSA
Cj4gICAgICB4eHjilbEgICAg4pWy4pWxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIOKVsuKVsSAgICDilbLilbEgICAg4pWy4pWxICAgIOKVsgo+ICAgIDogeHh44pWySUJJ
IOKVseKVsiAgICAgICAgICAgICAgIEFkZHIoMHgwYSkgICAgICAgICAgICAgICDilbHilbIgUlcg
4pWx4pWyTkFDS+KVseKVsiBTICDilbEKPiAKPiBJbi1CYW5kIEludGVycnVwdCAoSUJJKSBvY2N1
cnJlZCBhbmQgSUJJIHdvcmsgdGhyZWFkIG1heSBub3QgdG8gYmUKCklmIGFuIEluLUJhbmQuLi4J
b2NjdXJzIGFuZCB0aGUgSUJJIHdvcmsgdGhyZWFkIGlzIG5vdAppbW1lZGlhdGVseSBzY2hlZHVs
ZWQsIHdoZW4gc3ZjLi4uIGluaXRpYXRlcyBhbiBJM0MgdHJhbnNmZXIgYW5kCmF0dGVtcHRzLi4u
Cgo+IHNjaGVkdWxlZC4gV2hlbiBzdmNfaTNjX21hc3Rlcl9wcml2X3hmZXJzKCkgaW5pdGlhdGVz
IHRoZSBJM0MgdHJhbnNmZXIKPiBmcmFtZSBhbmQgYXR0ZW1wdHMgdG8gc2VuZCBhZGRyZXNzIDB4
N2UsIHRoZSB0YXJnZXQgaW50ZXJwcmV0cyBpdCBhcyBhbgo+IElCSSBoYW5kbGVyIGFuZCByZXR1
cm5zIHRoZSB0YXJnZXQgYWRkcmVzcyAweDBhLgo+IAo+IEhvd2V2ZXIsIHN2Y19pM2NfbWFzdGVy
X3ByaXZfeGZlcnMoKSBkb2VzIG5vdCBoYW5kbGUgdGhpcyBjYXNlIGFuZCBwcm9jZWVkcwo+IHdp
dGggb3RoZXIgdHJhbnNmZXJzLCByZXN1bHRpbmcgaW4gaW5jb3JyZWN0IGRhdGEgYmVpbmcgcmV0
dXJuZWQuCj4gCj4gSUJJV09OIGNoZWNrIGhhcyBiZWVuIGFkZGVkIGluIHN2Y19pM2NfbWFzdGVy
X3hmZXIoKS4gSW4gY2FzZSB0aGlzCgpBZGQgSUJJV09OIGNoZWNrIGluIHN2Y18uLi4KCj4gc2l0
dWF0aW9uIG9jY3VycywgYSBmYWlsdXJlIGlzIG5vdyByZXR1cm5lZCB0byB0aGUgZHJpdmVyLgoK
CQkJcmV0dXJuIGEgZmFpbHVyZS4uLgoKPiAKPiBGaXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBt
YXN0ZXI6IHN2YzogQWRkIFNpbHZhY28gSTNDIG1hc3RlciBkcml2ZXIiKQo+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMjAgKysr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IGluZGV4IGViZGIzZWExYWY5ZC4uMGY1
N2E1Zjc1ZTM5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtMTAw
OSw2ICsxMDA5LDkgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNf
aTNjX21hc3RlciAqbWFzdGVyLAo+ICAJdTMyIHJlZzsKPiAgCWludCByZXQ7Cj4gIAo+ICsJLyog
Y2xlYW4gU1ZDX0kzQ19NSU5UX0lCSVdPTiB3MWMgYml0cyAqLwo+ICsJd3JpdGVsKFNWQ19JM0Nf
TUlOVF9JQklXT04sIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUyk7Cj4gKwo+ICAJd3Jp
dGVsKFNWQ19JM0NfTUNUUkxfUkVRVUVTVF9TVEFSVF9BRERSIHwKPiAgCSAgICAgICB4ZmVyX3R5
cGUgfAo+ICAJICAgICAgIFNWQ19JM0NfTUNUUkxfSUJJUkVTUF9OQUNLIHwKPiBAQCAtMTAyNyw2
ICsxMDMwLDIzIEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihzdHJ1Y3Qgc3ZjX2kz
Y19tYXN0ZXIgKm1hc3RlciwKPiAgCQlnb3RvIGVtaXRfc3RvcDsKPiAgCX0KPiAgCj4gKwkvKgo+
ICsJICogQWNjb3JkaW5nIHRvIEkzQyBzcGVjIHZlciAxLjEuMSwgNS4xLjIuMi4zIENvbnNlcXVl
bmNlIG9mIENvbnRyb2xsZXIgU3RhcnRpbmcgYSBGcmFtZQo+ICsJICogd2l0aCBJM0MgVGFyZ2V0
IEFkZHJlc3MuCj4gKwkgKgo+ICsJICogVGhlIEkzQyBDb250cm9sbGVyIG5vcm1hbGx5IHNob3Vs
ZCBzdGFydCBhIEZyYW1lLCB0aGUgQWRkcmVzcyBtYXkgYmUgYXJiaXRyYXRlZCwgYW5kIHNvCj4g
KwkgKiB0aGUgQ29udHJvbGxlciBzaGFsbCBtb25pdG9yIHRvIHNlZSB3aGV0aGVyIGFuIEluLUJh
bmQgSW50ZXJydXB0IHJlcXVlc3QsIGEgQ29udHJvbGxlcgo+ICsJICogUm9sZSBSZXF1ZXN0IChp
LmUuLCBTZWNvbmRhcnkgQ29udHJvbGxlciByZXF1ZXN0cyB0byBiZWNvbWUgdGhlIEFjdGl2ZSBD
b250cm9sbGVyKSwgb3IKPiArCSAqIGEgSG90LUpvaW4gUmVxdWVzdCBoYXMgYmVlbiBtYWRlLgo+
ICsJICoKPiArCSAqIElmIG1pc3NlZCBJQklXT04gY2hlY2ssIHRoZSB3cm9uZyBkYXRhIHdpbGwg
YmUgcmV0dXJuLiBXaGVuIElCSVdPTiBoYXBwZW4sIHJldHVybiBmYWx1cmUKPiArCSAqIGFuZCB5
ZWlsZCB0aGUgYWJvdmUgZXZlbnRzIGhhbmRsZXIuCgpUeXBvczogeWVpbGQgYW5kIGZhbHVyZQoK
PiArCSAqLwo+ICsJaWYgKFNWQ19JM0NfTVNUQVRVU19JQklXT04ocmVnKSkgewo+ICsJCXJldCA9
IC1FTlhJTzsKPiArCQlnb3RvIGVtaXRfc3RvcDsKPiArCX0KPiArCj4gIAlpZiAocm53KQo+ICAJ
CXJldCA9IHN2Y19pM2NfbWFzdGVyX3JlYWQobWFzdGVyLCBpbiwgeGZlcl9sZW4pOwo+ICAJZWxz
ZQoKV2l0aCBhbGwgdGhlIHR5cG9zIGZpeGVkOgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
