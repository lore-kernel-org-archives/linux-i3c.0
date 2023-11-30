Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5A6C07CA9
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Nov 2023 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8Sab1Kwr6VXnhYM95Y4kluyW+PXriVDJrOHH0m79q8=; b=MWfIPb58OPrXYx
	a/iQrA7urPffE8rXmP1cmxZdyIA90dZFv5ER+tsQ5+IYEetqTob1VEJloBgvIFCsFz0Ae7MK5MveC
	Z8FCKUG3Jz3GPc0+kviYxFZBOT9SGaMmmfMhIiX2R8qfXIDUWZoen5PsKR+/6Xq0UuLYXDTDsLUhO
	AVgkbsDrJRSoI3Yxr96Odob+/nDCissu0I/T4Qn+kK9jjq8lucPmYLCrL+MOOJW+KcFfrLZdEaC4Q
	vZAvhPJSsZ77P5IUQy7jViqbv3ZsuDzxW2xDD4y4Z10Os3j2CISLV4ebuXlbsK20b/0/nHGrKVh59
	GYmLpxBnxNI6ckD7ajmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8e6B-00AQ5K-11;
	Thu, 30 Nov 2023 10:16:47 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8e68-00AQ41-18
	for linux-i3c@lists.infradead.org;
	Thu, 30 Nov 2023 10:16:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A9AF1C0003;
	Thu, 30 Nov 2023 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701339400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPIe8MgFoopxf4QsCc/BpkQti0xvkaZYjK5Tti66Lbc=;
	b=PcTsnGKj9xD4qwl2AK2ml4mmiZb0t/wDx8QFPg2FfBZjTU+Y11qIoLb1rJK2+AfKDC0LgK
	qoqi8ihWII60uWhFnD7hYwdBRapqWRbG4tUgCmRdXms0msaybEphU8DtwHvqnPseubsyX5
	tBHsZw4N64qMYE8z8parVWA8zqDoWtc3PqDhZZC7Yu+T/eDYINxxNxr0YLD/iXFDD+uTgY
	BITgAJ/XkIxowTXRTV1skLpxFZC7UW/w+8UpXunj+s1jCZajI8kAImS4AClPvAgADjSU2k
	bf5eaNx2WLwhZq9NwPewvMLTWsQE/KDpqiFDi+nihmqkHtJVdJu5qRaTdJ9jHg==
Date: Thu, 30 Nov 2023 11:16:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 2/6] i3c: master: svc: add hot join support
Message-ID: <20231130111636.34432d30@xps-13>
In-Reply-To: <20231129221225.387952-3-Frank.Li@nxp.com>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-3-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_021644_675409_FC8DF6C7 
X-CRM114-Status: GOOD (  19.28  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMjkgTm92IDIwMjMgMTc6
MTI6MjEgLTA1MDA6Cgo+IEFkZCBob3Qgam9pbiBzdXBwb3J0IGZvciBzdmMgbWFzdGVyIGNvbnRy
b2xsZXIuIEVuYWJsZSBob3Qgam9pbiBkZWZhdWx0bHkuCgoJCQkJCQkJYnkgZGVmYXVsdAoKPiBV
c2VyIGNhbiB1c2Ugc3lzIGVudHJ5IHRvIGRpc2FibGUgaG90IGpvaW4uCgpTaG91bGQgd2UgZG8g
dGhlIG9wcG9zaXRlPyBEaXNhYmxlIGhvdC1qb2luIGJ5IGRlZmF1bHQgYW5kIGFsbG93CmVuYWJs
aW5nIGl0PwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCA1OCArKysrKysr
KysrKysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2
Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IGlu
ZGV4IDZiNmJkZDE2M2FmNGYuLjg4MGM2YWU3NmMwMTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
M2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3Zj
LWkzYy1tYXN0ZXIuYwo+IEBAIC0xMjgsNiArMTI4LDkgQEAKPiAgLyogVGhpcyBwYXJhbWV0ZXIg
ZGVwZW5kcyBvbiB0aGUgaW1wbGVtZW50YXRpb24gYW5kIG1heSBiZSB0dW5lZCAqLwo+ICAjZGVm
aW5lIFNWQ19JM0NfRklGT19TSVpFIDE2Cj4gIAo+ICsjZGVmaW5lIFNWQ19JM0NfRVZFTlRfSUJJ
CUJJVCgwKQo+ICsjZGVmaW5lIFNWQ19JM0NfRVZFTlRfSE9USk9JTglCSVQoMSkKPiArCj4gIHN0
cnVjdCBzdmNfaTNjX2NtZCB7Cj4gIAl1OCBhZGRyOwo+ICAJYm9vbCBybnc7Cj4gQEAgLTE3Niw2
ICsxNzksNyBAQCBzdHJ1Y3Qgc3ZjX2kzY19yZWdzX3NhdmUgewo+ICAgKiBAaWJpLnRicV9zbG90
OiBUbyBiZSBxdWV1ZWQgSUJJIHNsb3QKPiAgICogQGliaS5sb2NrOiBJQkkgbG9jawo+ICAgKiBA
bG9jazogVHJhbnNmZXIgbG9jaywgcHJvdGVjdCBiZXR3ZWVuIElCSSB3b3JrIHRocmVhZCBhbmQg
Y2FsbGJhY2tzIGZyb20gbWFzdGVyCj4gKyAqIEBlbmFibGVkX2V2ZW50czogQml0IG1hc2tzIGZv
ciBlbmFibGUgZXZlbnRzIChJQkksIEhvdEpvaW4pLgo+ICAgKi8KPiAgc3RydWN0IHN2Y19pM2Nf
bWFzdGVyIHsKPiAgCXN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgYmFzZTsKPiBAQCAtMjA1
LDYgKzIwOSw3IEBAIHN0cnVjdCBzdmNfaTNjX21hc3RlciB7Cj4gIAkJc3BpbmxvY2tfdCBsb2Nr
Owo+ICAJfSBpYmk7Cj4gIAlzdHJ1Y3QgbXV0ZXggbG9jazsKPiArCWludCBlbmFibGVkX2V2ZW50
czsKPiAgfTsKPiAgCj4gIC8qKgo+IEBAIC00MjgsMTMgKzQzMywxNiBAQCBzdGF0aWMgdm9pZCBz
dmNfaTNjX21hc3Rlcl9pYmlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIAlzd2l0
Y2ggKGliaXR5cGUpIHsKPiAgCWNhc2UgU1ZDX0kzQ19NU1RBVFVTX0lCSVRZUEVfSUJJOgo+ICAJ
CWRldiA9IHN2Y19pM2NfbWFzdGVyX2Rldl9mcm9tX2FkZHIobWFzdGVyLCBpYmlhZGRyKTsKPiAt
CQlpZiAoIWRldikKPiArCQlpZiAoIWRldiB8fCAhKG1hc3Rlci0+ZW5hYmxlZF9ldmVudHMgJiBT
VkNfSTNDX0VWRU5UX0lCSSkpCgpJZiB3ZSBhcmUgZ29pbmcgdG8gYWRkIG5ldyBldmVudHMgbGlr
ZSB0aGF0IG1heWJlIHdlIHNob3VsZCBoYXZlIGEKaGVscGVyLiBTbyB3ZSBjYW4gdGhlbiBleHRl
bmQgdGhlIGhlbHBlciB3aXRoIHRoZSBsaXN0IG9mIGVuYWJsZWQKZXZlbnRzPwoKPiAgCQkJc3Zj
X2kzY19tYXN0ZXJfbmFja19pYmkobWFzdGVyKTsKPiAgCQllbHNlCj4gIAkJCXN2Y19pM2NfbWFz
dGVyX2hhbmRsZV9pYmkobWFzdGVyLCBkZXYpOwo+ICAJCWJyZWFrOwo+ICAJY2FzZSBTVkNfSTND
X01TVEFUVVNfSUJJVFlQRV9IT1RfSk9JTjoKPiAtCQlzdmNfaTNjX21hc3Rlcl9hY2tfaWJpKG1h
c3RlciwgZmFsc2UpOwo+ICsJCWlmIChtYXN0ZXItPmVuYWJsZWRfZXZlbnRzICYgU1ZDX0kzQ19F
VkVOVF9IT1RKT0lOKQoKQW5kIHlvdSBjb3VsZCByZXVzZSB0aGUgaGVscGVyIGhlcmUKCj4gKwkJ
CXN2Y19pM2NfbWFzdGVyX2Fja19pYmkobWFzdGVyLCBmYWxzZSk7Cj4gKwkJZWxzZQo+ICsJCQlz
dmNfaTNjX21hc3Rlcl9uYWNrX2liaShtYXN0ZXIpOwo+ICAJCWJyZWFrOwo+ICAJY2FzZSBTVkNf
STNDX01TVEFUVVNfSUJJVFlQRV9NQVNURVJfUkVRVUVTVDoKPiAgCQlzdmNfaTNjX21hc3Rlcl9u
YWNrX2liaShtYXN0ZXIpOwo+IEBAIC00NzEsNyArNDc5LDkgQEAgc3RhdGljIHZvaWQgc3ZjX2kz
Y19tYXN0ZXJfaWJpX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAJCXN2Y19pM2Nf
bWFzdGVyX2VtaXRfc3RvcChtYXN0ZXIpOwo+ICAJCWJyZWFrOwo+ICAJY2FzZSBTVkNfSTNDX01T
VEFUVVNfSUJJVFlQRV9IT1RfSk9JTjoKPiAtCQlxdWV1ZV93b3JrKG1hc3Rlci0+YmFzZS53cSwg
Jm1hc3Rlci0+aGpfd29yayk7Cj4gKwkJc3ZjX2kzY19tYXN0ZXJfZW1pdF9zdG9wKG1hc3Rlcik7
Cj4gKwkJaWYgKG1hc3Rlci0+ZW5hYmxlZF9ldmVudHMgJiBTVkNfSTNDX0VWRU5UX0hPVEpPSU4p
CgphbmQgaGVyZQoKPiArCQkJcXVldWVfd29yayhtYXN0ZXItPmJhc2Uud3EsICZtYXN0ZXItPmhq
X3dvcmspOwo+ICAJCWJyZWFrOwoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
