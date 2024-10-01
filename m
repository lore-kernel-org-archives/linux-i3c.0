Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59C5CEACFB
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Oct 2024 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvePlAchrYCePJlMPQ9+mGrc7d0/lCnrgadqBLqAXaI=; b=v4EDYknTGMRi8Y
	1L9ND1glMDu9fVE2++TYsTLZbgDsoZiyEi6D71wr1o4GyykVFMu6128vC0oz5Rg3BHWShKIgLX2Wn
	dKQeEwtgof8vJhnYbDXgu7wvpGSNRqDMnqxjDSkAIc0zTViXIrMxATq+0D6x6XIAXWaiDWJSekDA+
	DwPTu/7EQRSBiNjLheq0m77fnyAdu4WBWa64kHgaAK7/M7TY2tC98zDQ/92dixyaIrqMiQ1f3p0MM
	PIWIKvZ/G1N0WyorGJzctN9g6h9JG9EHxvcxVVMxQhTKVpkgOqieL6Sw4vpDNqb7LvTxLR4jaPSMU
	to/zhK8H1xrH1T5Vbocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjHp-00000003y8R-1xfR;
	Tue, 01 Oct 2024 20:15:57 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjHn-00000003y85-1GV9
	for linux-i3c@lists.infradead.org;
	Tue, 01 Oct 2024 20:15:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12F7360002;
	Tue,  1 Oct 2024 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727813753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMCu9S88LmTnOV1hGWnst/c8TivrKNRNEF/23Xt/h18=;
	b=k9PwsBOXL/lyCjGDXNmyyVzLqsheJ/JP+CYlorocEKoO5U/wUuNCF6TtqzeloxkBo6dTgA
	uhU+m4wfslqxbRGYbUZ4lb0HwjUHH34wrzMOgPSioWHzDWNs03PK7rpdU1wdUTNY7+1zia
	VxR9CukznPbu6lFlgKNEE0GAOUbUuXqhG8UQRjkYYaCyMVgOMc0R2PL/yLHQNiLlxhAf7b
	OepbniovvKC3Wh1bPWdwqEBppmdwNDHWP0ijVwvXd9xBYH50OjVK7RNiMKysmP10vSw9Pi
	Je1ZutsHu/ugO90n377Zog2F4HTyurduFilaYdprhzmI/OAuy7mNjeB+ucqSbw==
Date: Tue, 1 Oct 2024 22:15:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 5/6] i3c: master: svc: wait for Manual ACK/NACK Done
 before next step
Message-ID: <20241001221551.27dc2301@xps-13>
In-Reply-To: <20241001-svc-i3c-hj-v5-5-480ab8aed849@nxp.com>
References: <20241001-svc-i3c-hj-v5-0-480ab8aed849@nxp.com>
	<20241001-svc-i3c-hj-v5-5-480ab8aed849@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_131555_628584_5BF24F57 
X-CRM114-Status: GOOD (  18.64  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMDEgT2N0IDIwMjQgMTI6
MDI6NTQgLTA0MDA6Cgo+IFdhaXQgZm9yIHRoZSBjb250cm9sbGVyIHRvIGNvbXBsZXRlIGVtaXR0
aW5nIEFDSy9OQUNLLCBvdGhlcndpc2UgdGhlIG5leHQKPiBjb21tYW5kIG1heSBiZSBvbWl0dGVk
IGJ5IHRoZSBoYXJkd2FyZS4KPiAKPiBBICJjb21tYW5kIGRvbmUiIGNoZWNrIGluIHN2Y19pM2Nf
bWFzdGVyX25hY2soYWNrKV9pYmkoKSBhbmQgY2hhbmdlIHRoZQoKQWRkIGE/Cgo+IHJldHVybiB0
eXBlIHRvIGludCB0byBmbGFnIHBvc3NpYmxlIHRpbWVvdXRzLgo+IAo+IFJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+IC0tLQo+IENoYW5nZSBmcm9tIHYzIHRvIHY0
Cj4gLSByZXdvcmsgY29tbWl0IG1lc3NhZ2UKPiAtIGFkZCBtaXF1ZWwncyByZXZpZXcgdGFnCj4g
LSBkaXJlY3RseSByZXR1cm4gcmVhZGwoLi4uKQo+IC0tLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIv
c3ZjLWkzYy1tYXN0ZXIuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNj
L21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gaW5kZXggMWVlNmNlMTg2MTk1Yy4uMzM4OGM5YWY2
M2ZjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+
ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTM4OCwxMCAr
Mzg4LDExIEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfaGFuZGxlX2liaShzdHJ1Y3Qgc3Zj
X2kzY19tYXN0ZXIgKm1hc3RlciwKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9p
ZCBzdmNfaTNjX21hc3Rlcl9hY2tfaWJpKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLAo+
ICtzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX2Fja19pYmkoc3RydWN0IHN2Y19pM2NfbWFzdGVy
ICptYXN0ZXIsCj4gIAkJCQkgICBib29sIG1hbmRhdG9yeV9ieXRlKQo+ICB7Cj4gIAl1bnNpZ25l
ZCBpbnQgaWJpX2Fja19uYWNrOwo+ICsJdTMyIHJlZzsKPiAgCj4gIAlpYmlfYWNrX25hY2sgPSBT
VkNfSTNDX01DVFJMX1JFUVVFU1RfSUJJX0FDS05BQ0s7Cj4gIAlpZiAobWFuZGF0b3J5X2J5dGUp
Cj4gQEAgLTQwMCwxOCArNDAxLDMwIEBAIHN0YXRpYyB2b2lkIHN2Y19pM2NfbWFzdGVyX2Fja19p
Ymkoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gIAkJaWJpX2Fja19uYWNrIHw9IFNW
Q19JM0NfTUNUUkxfSUJJUkVTUF9BQ0tfV0lUSE9VVF9CWVRFOwo+ICAKPiAgCXdyaXRlbChpYmlf
YWNrX25hY2ssIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTUNUUkwpOwo+ICsKPiArCXJldHVybiBy
ZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUywg
cmVnLAo+ICsJCQkJCSBTVkNfSTNDX01TVEFUVVNfTUNUUkxET05FKHJlZyksIDEsIDEwMDApOwo+
ICsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgc3ZjX2kzY19tYXN0ZXJfbmFja19pYmkoc3RydWN0
IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIpCj4gK3N0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfbmFj
a19pYmkoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIpCj4gIHsKPiArCWludCByZXQ7Cj4g
Kwl1MzIgcmVnOwo+ICsKPiAgCXdyaXRlbChTVkNfSTNDX01DVFJMX1JFUVVFU1RfSUJJX0FDS05B
Q0sgfAo+ICAJICAgICAgIFNWQ19JM0NfTUNUUkxfSUJJUkVTUF9OQUNLLAo+ICAJICAgICAgIG1h
c3Rlci0+cmVncyArIFNWQ19JM0NfTUNUUkwpOwo+ICsKPiArCXJldCA9IHJlYWRsX3BvbGxfdGlt
ZW91dF9hdG9taWMobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTLCByZWcsCj4gKwkJCQkJ
U1ZDX0kzQ19NU1RBVFVTX01DVFJMRE9ORShyZWcpLCAxLCAxMDAwKTsKPiArCXJldHVybiByZXQ7
Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfaGFuZGxlX2liaV93b24oc3Ry
dWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsIHUzMiBtc3RhdHVzKQo+ICB7Cj4gIAl1MzIgaWJp
dHlwZTsKPiArCWludCByZXQgPSAwOwo+ICAKPiAgCWliaXR5cGUgPSBTVkNfSTNDX01TVEFUVVNf
SUJJVFlQRShtc3RhdHVzKTsKPiAgCj4gQEAgLTQyMSwxMCArNDM0LDEwIEBAIHN0YXRpYyBpbnQg
c3ZjX2kzY19tYXN0ZXJfaGFuZGxlX2liaV93b24oc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0
ZXIsIHUzMiBtc3RhCj4gIAlzd2l0Y2ggKGliaXR5cGUpIHsKPiAgCWNhc2UgU1ZDX0kzQ19NU1RB
VFVTX0lCSVRZUEVfSE9UX0pPSU46Cj4gIAljYXNlIFNWQ19JM0NfTVNUQVRVU19JQklUWVBFX01B
U1RFUl9SRVFVRVNUOgo+IC0JCXN2Y19pM2NfbWFzdGVyX25hY2tfaWJpKG1hc3Rlcik7Cj4gKwkJ
cmV0ID0gc3ZjX2kzY19tYXN0ZXJfbmFja19pYmkobWFzdGVyKTsKPiAgCX0KPiAgCj4gLQlyZXR1
cm4gMDsKPiArCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIHN2Y19pM2NfbWFz
dGVyX2liaV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiBAQCAtOTM1LDcgKzk0OCw5
IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfZG9fZGFhX2xvY2tlZChzdHJ1Y3Qgc3ZjX2kz
Y19tYXN0ZXIgKm1hc3RlciwKPiAgCQkJaWYgKHJldCkKPiAgCQkJCWJyZWFrOwo+ICAJCX0gZWxz
ZSBpZiAoU1ZDX0kzQ19NU1RBVFVTX0lCSVdPTihyZWcpKSB7Cj4gLQkJCXN2Y19pM2NfbWFzdGVy
X2hhbmRsZV9pYmlfd29uKG1hc3RlciwgcmVnKTsKPiArCQkJcmV0ID0gc3ZjX2kzY19tYXN0ZXJf
aGFuZGxlX2liaV93b24obWFzdGVyLCByZWcpOwo+ICsJCQlpZiAocmV0KQo+ICsJCQkJYnJlYWs7
Cj4gIAkJCWNvbnRpbnVlOwo+ICAJCX0gZWxzZSBpZiAoU1ZDX0kzQ19NU1RBVFVTX01DVFJMRE9O
RShyZWcpKSB7Cj4gIAkJCWlmIChTVkNfSTNDX01TVEFUVVNfU1RBVEVfSURMRShyZWcpICYmCj4g
QEAgLTEyMDksNyArMTIyNCw5IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihzdHJ1
Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKPiAgCQkgKiBzdGFydC4KPiAgCQkgKi8KPiAgCQlp
ZiAoU1ZDX0kzQ19NU1RBVFVTX0lCSVdPTihyZWcpKSB7Cj4gLQkJCXN2Y19pM2NfbWFzdGVyX2hh
bmRsZV9pYmlfd29uKG1hc3RlciwgcmVnKTsKPiArCQkJcmV0ID0gc3ZjX2kzY19tYXN0ZXJfaGFu
ZGxlX2liaV93b24obWFzdGVyLCByZWcpOwo+ICsJCQlpZiAocmV0KQo+ICsJCQkJZ290byBlbWl0
X3N0b3A7Cj4gIAkJCWNvbnRpbnVlOwo+ICAJCX0KPiAgCj4gCgoKVGhhbmtzLApNaXF1w6hsCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
