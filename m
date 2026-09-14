Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD9AC88E64
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWp24bXEdynWZE4whp1V8vD8avhMzLf7RkoWqwfzcUc=; b=m/u8ir2zLHts7i
	crNuUf8NiFms89MWuuUfhlwoWDUK+7zR3Ad9ayEB44AQqkQJqZn7Ns/WH6+oXHND1Hxrdu6WaJA3q
	8w1mDhThpIaCpTgLPjZkFJGVcBB79bHVEvzN32mJkOSgyOeTNQZSwA+gXcgaJJDv81HSqLAlodypu
	AClzqW6fLblTKhodbu1uhQ2DP4AWTU3FK9YGwvFBenexfXDI0vr/V2116QyJxUJskfRAyRN0Dolry
	OVmjNY8Nd+0mXsE+Zk64BWB15u7poXqecRHx+YRju/TLY2hVBeA8XdC1jiGgUDipha93hPbGqi4Vz
	FQCY6o4e2fAd0VEihvKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x657X-00000003MqZ-3wAH;
	Mon, 14 Sep 2026 11:45:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x657W-00000003Mpp-35QY
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:45:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F69E409AF;
	Mon, 14 Sep 2026 11:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46EB1F000FF;
	Mon, 14 Sep 2026 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386310;
	bh=KTm5JjWIX229q/IXpI8iQ/Q59w2fzg3y+RLLuE444Ko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VTq9JwNb8aLVdLrshOu5eISxNh5z+xXAr6GwfWNkADCKfo6jbJgKl/GbPPOmgSP0/
	 E2Olg4KhmVnQgMZFGGDZBECLo26tTZklOnvfUkth8cOnE4I6LmRWJbQHSALwMlZdAD
	 T4SCnOPQWzj8W9n9BYgq84k9PYO12qvOYJp26mVsmVVbLSwm3pkpECb1/eq8i5cvc2
	 oXFo4V5R8WxkIOndwBs9kfMqy0nMq6l894M9GNRg3ByisMxzY5cD/fqgMcuCrbEV+V
	 mfaYh0oQc5xlbJ3eNTpj5PyUeBn0JWU/8Mjvs4bRgNt6sgRTLVVxUpOuoEj/UHrhCN
	 qt9BMaotH5b6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/17] i3c: mipi-i3c-hci-pci: Set drvdata before
 creating LTR sysfs attribute
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260914113003.183150-4-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-4-adrian.hunter@intel.com>
Date: Mon, 14 Sep 2026 11:45:09 +0000
Message-Id: <20260914114509.B46EB1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBNaXNzaW5nIHBjaV9mcmVlX2lycV92ZWN0b3JzKCkgb24gcHJvYmUgZXJyb3IgcGF0
aHMgYW5kIGluIHJlbW92ZSgpLCBsZWFkaW5nIHRvIGxlYWtlZCBJUlEgcmVzb3VyY2VzLgotLQoK
Y29tbWl0IGFjYWVlMTRkMzhmOTMzZDhiYWRiOTcwMGNhZmU0MTBmYTRjMzU3ZmEKQXV0aG9yOiBB
ZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogbWlwaS1pM2MtaGNp
LXBjaTogU2V0IGRydmRhdGEgYmVmb3JlIGNyZWF0aW5nIExUUiBzeXNmcyBhdHRyaWJ1dGUKClRo
aXMgcGF0Y2ggbW92ZXMgcGNpX3NldF9kcnZkYXRhKCkgYmVmb3JlIHRoZSBoY2ktPmluZm8tPmlu
aXQoKSBjYWxsIGluIHByb2JlCnRvIGVuc3VyZSBkcnZkYXRhIGlzIGF2YWlsYWJsZSBiZWZvcmUg
dGhlIHBtX3Fvc19sYXRlbmN5X3RvbGVyYW5jZV91cyBzeXNmcwphdHRyaWJ1dGUgYmVjb21lcyBh
Y2Nlc3NpYmxlIHRvIHVzZXJzcGFjZS4KCkZpeGVzOiA4ODRhMzMxMzFmMmEgKCJpM2M6IG1pcGkt
aTNjLWhjaS1wY2k6IEFkZCBMVFIgc3VwcG9ydCBmb3IgSW50ZWwgY29udHJvbGxlcnMiKQpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVy
L21pcGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNpLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlw
aS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYwo+IGluZGV4IGFiNTk1NjYxZGIxZTguLmFmOTU5
NTAwOWIwM2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9t
aXBpLWkzYy1oY2ktcGNpLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNp
L21pcGktaTNjLWhjaS1wY2kuYwo+IEBAIC00NDUsNiArNDQ1LDggQEAgc3RhdGljIGludCBtaXBp
X2kzY19oY2lfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwY2ksCj4gIAlpZiAocmV0IDwgMCkK
PiAgCQlyZXR1cm4gcmV0Owo+ICAKPiArCXBjaV9zZXRfZHJ2ZGF0YShwY2ksIGhjaSk7Cj4gKwo+
ICAJaGNpLT5pbmZvID0gKGNvbnN0IHN0cnVjdCBtaXBpX2kzY19oY2lfcGNpX2luZm8gKilpZC0+
ZHJpdmVyX2RhdGE7Cj4gIAo+ICAJcmV0ID0gaGNpLT5pbmZvLT5pbml0ID8gaGNpLT5pbmZvLT5p
bml0KGhjaSkgOiAwOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0OwoKW1NldmVyaXR5OiBI
aWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIGVycm9yIHBh
dGggbGVhayB0aGUgSVJRIHZlY3RvcnMKYWxsb2NhdGVkIGVhcmxpZXIgaW4gbWlwaV9pM2NfaGNp
X3BjaV9wcm9iZSgpPwoKSWYgaGNpLT5pbmZvLT5pbml0KCkgZmFpbHMsIHRoZSBmdW5jdGlvbiBy
ZXR1cm5zIGRpcmVjdGx5LiBGYWlsaW5nIHRvIGNhbGwKcGNpX2ZyZWVfaXJxX3ZlY3RvcnMoKSBh
ZnRlciBhIHN1Y2Nlc3NmdWwgcGNpX2FsbG9jX2lycV92ZWN0b3JzKCkgbGVha3MgSVJRCnJlc291
cmNlcywgd2hpY2ggY2FuIHByZXZlbnQgZnV0dXJlIGFsbG9jYXRpb25zIGFuZCBleGhhdXN0IHN5
c3RlbSBjYXBhY2l0eS4KClRoZSBzYW1lIGlzc3VlIGFwcGVhcnMgdG8gZXhpc3QgaW4gdGhlIHNo
YXJlZCBlcnJvciBleGl0IHBhdGggd2hlbiBzdWJzZXF1ZW50CmluaXRpYWxpemF0aW9uIHN0ZXBz
IGZhaWw6CgplcnJfZXhpdDoKCWlmIChoY2ktPmluZm8tPmV4aXQpCgkJaGNpLT5pbmZvLT5leGl0
KGhjaSk7CglyZXR1cm4gcmV0OwoKQW5kIGFsc28gZHVyaW5nIGRldmljZSByZW1vdmFsIGluIG1p
cGlfaTNjX2hjaV9wY2lfcmVtb3ZlKCk6CgpzdGF0aWMgdm9pZCBtaXBpX2kzY19oY2lfcGNpX3Jl
bW92ZShzdHJ1Y3QgcGNpX2RldiAqcGNpKQp7CglzdHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaSAqaGNp
ID0gcGNpX2dldF9kcnZkYXRhKHBjaSk7CgoJaWYgKGhjaS0+aW5mby0+ZXhpdCkKCQloY2ktPmlu
Zm8tPmV4aXQoaGNpKTsKCgltaXBpX2kzY19oY2lfcGNpX3JwbV9mb3JiaWQoJnBjaS0+ZGV2KTsK
CgltZmRfcmVtb3ZlX2RldmljZXMoJnBjaS0+ZGV2KTsKfQoKU2hvdWxkIHRoZXJlIGJlIGNhbGxz
IHRvIHBjaV9mcmVlX2lycV92ZWN0b3JzKCkgaW4gdGhlc2UgbG9jYXRpb25zIHRvIGVuc3VyZQp0
aGUgYWxsb2NhdGVkIElSUSB2ZWN0b3JzIGFyZSBwcm9wZXJseSBmcmVlZCBvbiBwcm9iZSBmYWls
dXJlIGFuZCB3aGVuIHRoZQpkZXZpY2UgaXMgdW5ib3VuZD8KClsgLi4uIF0KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTQxMTMw
MDMuMTgzMTUwLTEtYWRyaWFuLmh1bnRlckBpbnRlbC5jb20/cGFydD0zCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
