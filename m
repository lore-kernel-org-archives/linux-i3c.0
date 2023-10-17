Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454DFCDB483
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Zuzte+QgodjYqJJQqP6h7KbmphFSYtDR364be+3PM0=; b=4+hw7YbxpCp+Mu
	wWP3jsySwO3ZA+fVCM5AdvFgVseNkI9BwSuoShfIf8TzUjkyUKqklxB+OyqMterNno1x9csoSqrs9
	TJAZoHoZXE9i8OWfEAnZU92V7xdx/G7Iy3iE2GZQEa32JvEtlHHZzX6GKXPcWY81tjACIAdarMiCl
	iPzY0La1JuVfxqvuf48FN7pigliPCfsyWaGZXzGyaYWUaZ4AoX7egoGixhhRZyHJ+UmeriwCcyCnA
	CkyzzzeGRXFSPYXvnLhmlzEyfYKmwhIAuB8JimkkPI37p/qtpr6kmBrzBq6DLIb10L1ETblKkvul8
	9BNnskAmmGSTGezfSMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsl8g-00CXH7-2p;
	Tue, 17 Oct 2023 14:33:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsl8e-00CXGf-0w
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:33:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80A74240006;
	Tue, 17 Oct 2023 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697553217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yj04gDIpwLQf3yC7GJzN0bzDkhZ5RbyoNmRB6vDiyLw=;
	b=TGT4lwgXQeq65HB4JNBIRBYFdwQvbs/oISsROLQIPjog0d6TVxO+nSdTVRRP+q1icCmvyj
	go2Ynxu2HOnyMXQckPiXuMG/LEGvZ82SwPaQn41vrqIIuIbWejyYwFMNfUbla6gXsAADcw
	d5qS8rMNF+5mDUyRVCoeuzX0vlrnVLT74ChN33GpdhUFL1QuuLTsrGXnJwaefphbK33uAW
	suj5iT8vspsyQTN+HMbtNIShmtjbz773v+vg0HNR/mMJ8+I+xvvyoKsXrfTI3jhW/0bOlD
	84BlcmgWJP0QdsOWoYddpOx10nLFoD4hUgnlFFXmRTY2HS8Q3GOzwIuqYxt//g==
Date: Tue, 17 Oct 2023 16:33:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 6/6] i3c: master: svc: fix random hot join failure since
 timeout error
Message-ID: <20231017163335.16770af2@xps-13>
In-Reply-To: <20231016153232.2851095-7-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-7-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_073340_501499_3295E2A0 
X-CRM114-Status: GOOD (  18.79  )
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
MzI6MzIgLTA0MDA6Cgo+IG1hc3RlciBzaWRlIHJlcG9ydDoKPiAgIHNpbHZhY28taTNjLW1hc3Rl
ciA0NDMzMDAwMC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBj
NywgTUVSUldBUk4gMHgwMDEwMDAwMAo+IAo+IEJJVCAyMDogVElNRU9VVCBlcnJvcgo+ICAgVGhl
IG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hl
bjoKPiAgIC0gVGhlIFRYIEZJRk8gb3IgUlggRklGTyBpcyBub3QgaGFuZGxlZCBhbmQgdGhlIGJ1
cyBpcyBzdHVjayBpbiB0aGUKPiBtaWRkbGUgb2YgYSBtZXNzYWdlLAo+ICAgLSBObyBTVE9QIHdh
cyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMsCj4gICAtIElCSSBtYW51YWwgaXMgdXNlZCBh
bmQgbm8gZGVjaXNpb24gd2FzIG1hZGUuCj4gICBUaGUgbWF4aW11bSBzdGFsbCBwZXJpb2QgaXMg
MTAgS0h6IG9yIDEwMCDOvHMuCj4gCj4gVGhpcyBpcyBhIGp1c3Qgd2FybmluZy4gU3lzdGVtIGly
cSB0aHJlYWQgc2NoZWR1bGUgbGF0ZW5jeSBpcyBwb3NzaWJsZQoKCQkJCQkJCWNhbiBiZSBiaWdn
ZXIKPiBiaWdnZXIgdGhhbiAxMDB1cy4gSnVzdCBvbWl0IHRoaXMgd2FyaW5nLgoKSSdtIG5vdCBz
dXJlIHRoaXMgaXMgdGhlIGNvcnJlY3QgYXBwcm9hY2guIEl0J3MgYSByZWFsIGlzc3VlIGJ1dCB0
aGVyZQppcyBub3QgbXVjaCB3ZSBjYW4gZG8gYWJvdXQgaXQuIFBlcmhhcHMgZGV2X2VyciBpcyB0
b28gaGlnaCwgYnV0IEkKd291bGQgbm90IGVudGlyZWx5IGRyb3AgdGhpcyBtZXNzYWdlLiBNYXli
ZSBhIGNvbW1lbnQgYW5kIHR1cm5pbmcgdGhlCm1lc3NhZ2UgaW50byBhIGRiZyBwcmludGsgd291
bGQgYmUgbW9yZSBhcHByb3ByaWF0ZT8KCj4gRml4ZXM6IGRkM2M1Mjg0NmQ1OSAoImkzYzogbWFz
dGVyOiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0ZXIgZHJpdmVyIikKPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDYgKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3Zj
LWkzYy1tYXN0ZXIuYwo+IGluZGV4IDViY2EzNjlkNjkxMi4uMThiYzI3N2VkYzhhIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtOTMsNiArOTMsNyBAQAo+ICAjZGVm
aW5lIFNWQ19JM0NfTUlOVE1BU0tFRCAgIDB4MDk4Cj4gICNkZWZpbmUgU1ZDX0kzQ19NRVJSV0FS
TiAgICAgMHgwOUMKPiAgI2RlZmluZSAgIFNWQ19JM0NfTUVSUldBUk5fTkFDSyBCSVQoMikKPiAr
I2RlZmluZSAgIFNWQ19JM0NfTUVSUldBUk5fVElNRU9VVCBCSVQoMjApCj4gICNkZWZpbmUgU1ZD
X0kzQ19NRE1BQ1RSTCAgICAgMHgwQTAKPiAgI2RlZmluZSBTVkNfSTNDX01EQVRBQ1RSTCAgICAw
eDBBQwo+ICAjZGVmaW5lICAgU1ZDX0kzQ19NREFUQUNUUkxfRkxVU0hUQiBCSVQoMCkKPiBAQCAt
MjI1LDYgKzIyNiwxMSBAQCBzdGF0aWMgYm9vbCBzdmNfaTNjX21hc3Rlcl9lcnJvcihzdHJ1Y3Qg
c3ZjX2kzY19tYXN0ZXIgKm1hc3RlcikKPiAgCWlmIChTVkNfSTNDX01TVEFUVVNfRVJSV0FSTiht
c3RhdHVzKSkgewo+ICAJCW1lcnJ3YXJuID0gcmVhZGwobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19N
RVJSV0FSTik7Cj4gIAkJd3JpdGVsKG1lcnJ3YXJuLCBtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01F
UlJXQVJOKTsKPiArCj4gKwkJLyogaWdub3JlIHRpbWVvdXQgZXJyb3IgKi8KPiArCQlpZiAobWVy
cndhcm4gJiBTVkNfSTNDX01FUlJXQVJOX1RJTUVPVVQpCj4gKwkJCXJldHVybiBmYWxzZTsKPiAr
Cj4gIAkJZGV2X2VycihtYXN0ZXItPmRldiwKPiAgCQkJIkVycm9yIGNvbmRpdGlvbjogTVNUQVRV
UyAweCUwOHgsIE1FUlJXQVJOIDB4JTA4eFxuIiwKPiAgCQkJbXN0YXR1cywgbWVycndhcm4pOwoK
ClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
