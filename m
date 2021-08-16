Return-Path: <SRS0=Fyq7=NH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA6DC4338F
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Aug 2021 07:02:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA1E761A86
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Aug 2021 07:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA1E761A86
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8S4KJJHjfHjP8U5Ldjkb47tZiva1zLEh+dV3BuEOBcY=; b=rh/URSr8KPQVfW
	5pgcKtv/srde3nDQXqdCcc0DwG8GM4cqkX/hKHVZUrUWAfrQTZU5LJDICDSJVcj8b25WdVrJ0y55J
	UVHYtjEVoP6ug2UgD/eYasmhS6Qr6oZY4euozRqU6k4X/V648KNKnZ0+dQe25WWdSLkqjRtnygGXL
	jWzt7/AQ/0Gak6BWihxNGFDZKuRfIzUp9Zs8uZCCkN/kgbrs2RzTX3r1BbDG4TsB0F9ehM+D0OiyO
	cP0LudcZwGRxgR7KknhyJ2gyuRyAF8JKA5/z0DGdqo6IFNTTtfiQGRmk7I8LOpZDCdVsBfNh316uG
	jO58XxXuyd0eVEvV3sxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWdj-00GKXQ-A7; Mon, 16 Aug 2021 07:02:31 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWdg-00GKWq-G5
 for linux-i3c@lists.infradead.org; Mon, 16 Aug 2021 07:02:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AF17724000A;
 Mon, 16 Aug 2021 07:02:24 +0000 (UTC)
Date: Mon, 16 Aug 2021 09:02:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com
Subject: Re: [PATCH V4 8/8] i3c: master: svc: enable the interrupt in the
 enable ibi function
Message-ID: <20210816090223.32475a5c@xps13>
In-Reply-To: <20210809063645.2289988-9-xiaoning.wang@nxp.com>
References: <20210809063645.2289988-1-xiaoning.wang@nxp.com>
 <20210809063645.2289988-9-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_000228_712540_8B322E8E 
X-CRM114-Status: GOOD (  17.25  )
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

SGkgQ2xhcmssCgpDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+IHdyb3RlIG9uIE1v
biwgIDkgQXVnIDIwMjEgMTQ6MzY6NDUKKzA4MDA6Cgo+IElmIGVuYWJsZSBpbnRlcnJ1cHQgaW4g
dGhlIHN2Y19pM2NfbWFzdGVyX2J1c19pbml0KCkgYnV0IGRvIG5vdCBjYWxsCj4gZW5hYmxlIGli
aSBpbiB0aGUgZGV2aWNlIGRyaXZlciwgaXQgd2lsbCBjYXVzZSBhIGtlcm5lbCBkdW1wIGluIHRo
ZQo+IHN2Y19pM2NfbWFzdGVyX2hhbmRsZV9pYmkoKSB3aGVuIGEgc2xhdmUgc3RhcnQgb2NjdXJz
IG9uIHRoZSBpM2MgYnVzLAo+IGJlY2F1c2UgdGhlIGRhdGEtPmliaV9wb29sIGlzIG5vdCBpbml0
aWFsaXplZC4KPiBTbyBvbmx5IGVuYWJsZSB0aGUgaW50ZXJydXB0IGluIHN2Y19pM2NfbWFzdGVy
X2VuYWJsZV9pYmkoKSBmdW5jdGlvbi4KCklzIHRoaXMgc2l0dWF0aW9uIGFjdHVhbGx5IGhhcHBl
bmluZyBvciBpcyB0aGlzIHB1cmVseSB0aGVvcmV0aWNhbD8KCkFueXdheSB0aGlzIGRvZXNuJ3Qg
aHVydCBzbzoKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54
cC5jb20+Cj4gLS0tCj4gVjQ6IE5ldyBwYXRjaCBpbiB0aGlzIHBhdGNoc2V0Cj4gLS0tCj4gIGRy
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
c3ZjLWkzYy1tYXN0ZXIuYwo+IGluZGV4IDc3ZjY3ZDQwN2FjZC4uYjgwMmFmZDhlYjdkIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJp
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtNTY5LDggKzU2OSw2IEBAIHN0
YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfYnVzX2luaXQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJv
bGxlciAqbSkKPiAgCWlmIChyZXQpCj4gIAkJZ290byBycG1fb3V0Owo+ICAKPiAtCXN2Y19pM2Nf
bWFzdGVyX2VuYWJsZV9pbnRlcnJ1cHRzKG1hc3RlciwgU1ZDX0kzQ19NSU5UX1NMVlNUQVJUKTsK
PiAtCj4gIHJwbV9vdXQ6Cj4gIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KG1hc3Rlci0+ZGV2
KTsKPiAgCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKG1hc3Rlci0+ZGV2KTsKPiBAQCAtMTM5
OCw2ICsxMzk2LDggQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9lbmFibGVfaWJpKHN0cnVj
dCBpM2NfZGV2X2Rlc2MgKmRldikKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiArCXN2Y19p
M2NfbWFzdGVyX2VuYWJsZV9pbnRlcnJ1cHRzKG1hc3RlciwgU1ZDX0kzQ19NSU5UX1NMVlNUQVJU
KTsKPiArCj4gIAlyZXR1cm4gaTNjX21hc3Rlcl9lbmVjX2xvY2tlZChtLCBkZXYtPmluZm8uZHlu
X2FkZHIsIEkzQ19DQ0NfRVZFTlRfU0lSKTsKPiAgfQo+ICAKPiBAQCAtMTQwNyw2ICsxNDA3LDgg
QEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9kaXNhYmxlX2liaShzdHJ1Y3QgaTNjX2Rldl9k
ZXNjICpkZXYpCj4gIAlzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciA9IHRvX3N2Y19pM2Nf
bWFzdGVyKG0pOwo+ICAJaW50IHJldDsKPiAgCj4gKwlzdmNfaTNjX21hc3Rlcl9kaXNhYmxlX2lu
dGVycnVwdHMobWFzdGVyKTsKPiArCj4gIAlyZXQgPSBpM2NfbWFzdGVyX2Rpc2VjX2xvY2tlZCht
LCBkZXYtPmluZm8uZHluX2FkZHIsIEkzQ19DQ0NfRVZFTlRfU0lSKTsKPiAgCj4gIAlwbV9ydW50
aW1lX21hcmtfbGFzdF9idXN5KG1hc3Rlci0+ZGV2KTsKClRoYW5rcywKTWlxdcOobAoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
