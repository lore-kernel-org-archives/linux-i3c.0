Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DABAC982D8
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrMCrYpSZbc93z3SKY52g//oPkIltevTyZYIH1Yg02o=; b=TyDCQDzaudlInJ
	Nt4TAdCM5D3Desg7GOkSJUErAN8AVTyObpIwWISke8w4TtUAEdPKQRTTq9fEJ0mrhL6ucTKG86Qua
	VDcRRWkwg8k5i2m0zIKnFkxPiuiR0ESe+eHclotAs/qgNq9cuoGrB09G/pCqtp9viT7zpARZYp25A
	LQWVhpeqHBoAttC6YFoNHqjl0HtPiiwsUIM7zTY/OPfm+EBQUNvpTUh7hA40RsV8lbVvLRzqF2gA7
	rxSUUscVT0JNzs1bNbKheBt8Brb3+R424LN5Nosr6Q/eNm21EDjvg/E940+2nJManKaQKjPZ0ebux
	GyjzFlCSJx8Yp1A9JLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JYI-000000004Fv-1egy;
	Sun, 20 Sep 2026 15:34:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JYH-000000004Fg-0ucr
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:34:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F5CE43D50;
	Sun, 20 Sep 2026 15:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2171F000FF;
	Sun, 20 Sep 2026 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789918440;
	bh=2EkjM4Uur1S1G3vddj+HAO5lyMdZohxbnFJ5cahRT2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fnM08ZkB32Dr2tS6IbL4DT1V1Jg1+ZIcpWJS4aYWxO7WO/KAlzl5Kdns+4zGU+0fI
	 34vrpSY7SJSmeqIlyfuLD1+qGDnoe2S1m1KTFGhM+ZKttzbxchk7xKpCHcWQK6p6r6
	 KYBrznAYAGH9tuAe3jJ4Y4JpTTFOFL5yuDeNIOhH4onaLVuv2NIsEX5GiwVidFvQ7M
	 nM/zSqrAzltA7qK9KiZg5fJo6uYYSR0agFiY4oUawsMxrFW1XbAKIkysUd517aXzar
	 lv72/7cnS8vu6muhVBGNgzVZUbW4kaTBaFuI4AJwxb6W5R0VUv8gO3c1mLyrCV/XEj
	 6ozG9fRLns1tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 16/17] i3c: Restrict HDR modes to those supported by
 the bus and target
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260920151248.46936-17-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
 <20260920151248.46936-17-adrian.hunter@intel.com>
Date: Sun, 20 Sep 2026 15:33:59 +0000
Message-Id: <20260920153400.0E2171F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGkzYzogbWlzc2luZyBO
VUxMIGNoZWNrIGZvciBkZXYtPmRlc2MgaW4gaTNjX2RldmljZV9nZXRfc3VwcG9ydGVkX3hmZXJf
bW9kZQotLQoKY29tbWl0IDYyNTI5YmQ2NTVkNGMxOGQ2OWRhMzRmOTNkMTc5Y2UzNjNhYmE4NWMK
QXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogUmVz
dHJpY3QgSERSIG1vZGVzIHRvIHRob3NlIHN1cHBvcnRlZCBieSB0aGUgYnVzIGFuZCB0YXJnZXQK
ClRoaXMgY29tbWl0IHJlZmFjdG9ycyBpM2NfZGV2aWNlX2dldF9zdXBwb3J0ZWRfeGZlcl9tb2Rl
KCkgdG8gY29uc2lkZXIgSERSCm1vZGVzIGFsbG93ZWQgYnkgdGhlIGNvbnRyb2xsZXIsIGJ1cyBj
b25maWd1cmF0aW9uLCBhbmQgdGFyZ2V0LiBJdAppbnRyb2R1Y2VzIGEgaGVscGVyIGkzY19kZXZf
c3VwcG9ydGVkX3hmZXJfbW9kZXNfbG9ja2VkKCkgYW5kIGFkZHMgYnVzCmxvY2tpbmcgaW4gbm9y
bWFsIHVzZSBtb2RlIHRvIGFjY2VzcyB0aGUgZGV2aWNlIGRlc2NyaXB0b3Igc2FmZWx5LgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvZGV2aWNlLmMgYi9kcml2ZXJzL2kzYy9kZXZpY2UuYwo+
IGluZGV4IGYxYmEzNjNiMjJhMTcuLjRkZjQ2ODJhZjE1MDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9pM2MvZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2kzYy9kZXZpY2UuYwpbIC4uLiBdCj4gQEAg
LTMwMSwxNiArMzAxLDIzIEBAIGkzY19kZXZpY2VfbWF0Y2hfaWQoc3RydWN0IGkzY19kZXZpY2Ug
KmkzY2RldiwKPiAgRVhQT1JUX1NZTUJPTF9HUEwoaTNjX2RldmljZV9tYXRjaF9pZCk7Cj4gIAo+
ICAvKioKPiAtICogaTNjX2RldmljZV9nZXRfc3VwcG9ydGVkX3hmZXJfbW9kZSAtIFJldHVybnMg
dGhlIHN1cHBvcnRlZCB0cmFuc2ZlciBtb2RlIGJ5Cj4gLSAqCQkJCQljb25uZWN0ZWQgbWFzdGVy
IGNvbnRyb2xsZXIuCj4gKyAqIGkzY19kZXZpY2VfZ2V0X3N1cHBvcnRlZF94ZmVyX21vZGUgLSBS
ZXR1cm5zIHRoZSB0cmFuc2ZlciBtb2RlcyBzdXBwb3J0ZWQgYnkKPiArICoJCQkJCXRoZSBjb25u
ZWN0ZWQgbWFzdGVyIGNvbnRyb2xsZXIgYW5kIEBkZXYsCj4gKyAqCQkJCQlhbmQgYWxsb3dlZCBi
eSB0aGUgYnVzIGNvbmZpZ3VyYXRpb24uCj4gICAqIEBkZXY6IEkzQyBkZXZpY2UKPiAgICoKPiAg
ICogUmV0dXJuOiBhIGJpdCBtYXNrLCB3aGljaCBzdXBwb3J0ZWQgdHJhbnNmZXIgbW9kZSwgYml0
IHBvc2l0aW9uIGlzIGRlZmluZWQgYXQKPiAtICoJICAgZW51bSBpM2NfaGRyX21vZGUKPiArICoJ
ICAgZW51bSBpM2NfeGZlcl9tb2RlCj4gICAqLwo+ICB1MzIgaTNjX2RldmljZV9nZXRfc3VwcG9y
dGVkX3hmZXJfbW9kZShzdHJ1Y3QgaTNjX2RldmljZSAqZGV2KQo+ICB7Cj4gLQlyZXR1cm4gaTNj
X2J1c190b19pM2NfbWFzdGVyKGRldi0+YnVzKS0+dGhpcy0+aW5mby5oZHJfY2FwIHwgQklUKEkz
Q19TRFIpOwo+ICsJdTMyIG1vZGVzOwo+ICsKPiArCWkzY19idXNfbm9ybWFsdXNlX2xvY2soZGV2
LT5idXMpOwo+ICsJbW9kZXMgPSBpM2NfZGV2X3N1cHBvcnRlZF94ZmVyX21vZGVzX2xvY2tlZChk
ZXYtPmRlc2MpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29kZSByaXNrIGEgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIGR1cmluZyBkZXZpY2UgdW5yZWdpc3RyYXRpb24/CgpJZiBhIGRl
dmljZSBpcyBiZWluZyBjb25jdXJyZW50bHkgdW5yZWdpc3RlcmVkLAppM2NfbWFzdGVyX3VucmVn
aXN0ZXJfaTNjX2RldnMoKSBhc3luY2hyb25vdXNseSBzZXRzIGRldi0+ZGVzYyA9IE5VTEwKYmVm
b3JlIGRyaXZlciB1bmJpbmRpbmcgY29tcGxldGVzLiBPdGhlciBBUElzIGluIHRoZSBJM0Mgc3Vi
c3lzdGVtIChzdWNoCmFzIGkzY19kZXZpY2VfZ2V0X2luZm8oKSBhbmQgaTNjX2RldmljZV9kaXNh
YmxlX2liaSgpKSBhcHBlYXIgdG8gZ3VhcmQKYWdhaW5zdCB0aGlzIHRlYXJkb3duIHJhY2UgY29u
ZGl0aW9uIGJ5IGV4cGxpY2l0bHkgY2hlY2tpbmcgaWYgKGRldi0+ZGVzYykKaW5zaWRlIHRoZSBi
dXMgbG9jay4KCldpdGhvdXQgYSBwcmlvciBOVUxMIGNoZWNrIGhlcmUsIGRldi0+ZGVzYyBpcyBw
YXNzZWQgaW50bwppM2NfZGV2X3N1cHBvcnRlZF94ZmVyX21vZGVzX2xvY2tlZCgpLCB3aGljaCB1
bmNvbmRpdGlvbmFsbHkgZGVyZWZlcmVuY2VzCml0OgoKaW5jbHVkZS9saW51eC9pM2MvbWFzdGVy
Lmg6aTNjX2Rldl9nZXRfbWFzdGVyKCkgewogICAgcmV0dXJuIGRldi0+Y29tbW9uLm1hc3RlcjsK
fQoKZHJpdmVycy9pM2MvbWFzdGVyLmM6aTNjX2Rldl9zdXBwb3J0ZWRfeGZlcl9tb2Rlc19sb2Nr
ZWQoKSB7CiAgICBzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIgPSBpM2NfZGV2
X2dldF9tYXN0ZXIoZGV2KTsKICAgIC4uLgp9CgpDb3VsZCBhIGNoZWNrIGZvciBkZXYtPmRlc2Mg
YmUgYWRkZWQgaW5zaWRlIHRoZSBsb2NrIGJlZm9yZSBjYWxsaW5nIHRoZQpoZWxwZXI/Cgo+ICsJ
aTNjX2J1c19ub3JtYWx1c2VfdW5sb2NrKGRldi0+YnVzKTsKPiArCj4gKwlyZXR1cm4gbW9kZXM7
Cj4gIH0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA5MjAxNTEyNDguNDY5MzYtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0
PTE2CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
