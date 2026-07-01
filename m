Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F8AC43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4Gd4l7VyfXpg9YDH49lvgXKATGUKvZNmZzabSSo7c0=; b=mwSDNYJxOCdbr9
	vzblBh2mqpWi0U7h4TR7+cHUjLNBnWM9fkAp1Qg4lCsGlq2jegvu3byNg4kUlv8lTKBa2cy/CMkfC
	MM3+5CgSWX/uCXvcqo9/zV8fo7/1APO2awG7pp3kaop49IIWDtxzE9EVkLj121pPzTCR15oyM/Ng1
	/feDcP0x6QgTzMBVbCt8imNAanbF+hVbhnNY35GiyhVUhto7X5L/jCS4hDgg8FefINcvtonCiYfHH
	nLYwEUfKjdr/wDl6KLyjhAWsNpuB6mlWrLOBNHU7ZBHpv8NtzII+VUsZMrr6cPpBNorNCWHvMuFBJ
	IyikuJVKBxvyvtHE4V9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1aB-00000002y4G-3lvc;
	Wed, 01 Jul 2026 20:30:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1aA-00000002y3u-1KYW
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:30:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08CA4400D9;
	Wed,  1 Jul 2026 20:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3971F000E9;
	Wed,  1 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937853;
	bh=/8AD4OkCqqUUNVESKyOnJS50oc0cOHIUm2AjhDgAbOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jksGBYXEvJ1bf0PQtnqDzfAR9jyDb2tXQ2ANpIWS6VpuDrnCeRTWDL4s8QnXiG8Lm
	 vQhgALiqIjKktr+AicRPiX76nRUzjnoc7JFfGKm3dyHtv1chBl9oYZcUSEDSmEdsA2
	 TU+EYZQ6XqDqMmQh8+cuoHWJKNfECbeL7gBEuqxtJTNexXx21zGRME1j2k85bTxYj1
	 QNisXrEV+fSLTbQ/X9aJtZM3YIzLiSWHLBF7ByfNUZ3TNPEupIrw072aoceaN2+Hg6
	 Cr3Kx6hxovWr2XQM815IWiwPqIx9+pq0DfJNka5Zb2QcqgVZdYwlo5QCVwdIOaUKHN
	 tuITYwFgmcPLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND 1/7] i3c: master: Support IBI-based wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260701201533.220818-2-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
 <20260701201533.220818-2-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:30:53 +0000
Message-Id: <20260701203053.8F3971F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBVc2UtQWZ0ZXItRnJlZSBhbmQgZG91YmxlLWZyZWUgb2YgSTNDIGRldmljZSBkdWUg
dG8gZGFuZ2xpbmcgcG9pbnRlciBvbiBkZXZpY2VfcmVnaXN0ZXIoKSBmYWlsdXJlLgotIFtIaWdo
XSBSZWZlcmVuY2UgY291bnQgdW5kZXJmbG93IG9mIE9GIG5vZGUgZHVlIHRvIG1pc3Npbmcgb2Zf
bm9kZV9nZXQoKSBkdXJpbmcgZGV2aWNlIHJlZ2lzdHJhdGlvbi4KLS0KCmNvbW1pdCA5ZWZjZmEx
ZGYxOTEyZWRmODM1OTZlMWViZDM4NTU5ZmM3MTBhYWNhCkF1dGhvcjogQWRyaWFuIEh1bnRlciA8
YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgppM2M6IG1hc3RlcjogU3VwcG9ydCBJQkktYmFzZWQg
d2FrZXVwIGNhcGFiaWxpdHkKClRoaXMgcGF0Y2ggYWRkcyBhbiBpYmlfd2FrZXVwIGZsYWcgdG8g
dGhlIEkzQyBtYXN0ZXIgY29udHJvbGxlci4gSXQgYWxsb3dzCklCSS1jYXBhYmxlIEkzQyBkZXZp
Y2VzIHRvIGJlIG1hcmtlZCBhcyB3YWtldXAgY2FwYWJsZSBkdXJpbmcgcmVnaXN0cmF0aW9uCmlm
IHRoZSBjb250cm9sbGVyIHN1cHBvcnRzIHdha2luZyB0aGUgc3lzdGVtIHZpYSBJbi1CYW5kIElu
dGVycnVwdHMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMv
aTNjL21hc3Rlci5jCj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwpbIC4uLiBdCj4gQEAgLTE5MzAsNiArMTkzMSwxMyBAQCBpM2NfbWFzdGVy
X3JlZ2lzdGVyX25ld19pM2NfZGV2cyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0
ZXIpCj4gIAkJaWYgKGRlc2MtPmJvYXJkaW5mbykKPiAgCQkJZGVzYy0+ZGV2LT5kZXYub2Zfbm9k
ZSA9IGRlc2MtPmJvYXJkaW5mby0+b2Zfbm9kZTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24n
dCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHRoaXMgYXNzaWdubWVu
dCBjYXVzZQphbiBPRiBub2RlIHJlZmVyZW5jZSBjb3VudCB1bmRlcmZsb3c/CgpUaGUgcG9pbnRl
ciBpcyBhc3NpZ25lZCB3aXRob3V0IHRha2luZyBhIG5ldyByZWZlcmVuY2UgdmlhIG9mX25vZGVf
Z2V0KCkuCkhvd2V2ZXIsIHdoZW4gdGhlIGRldmljZSBpcyBmcmVlZCwgaTNjX2RldmljZV9yZWxl
YXNlKCkgdW5jb25kaXRpb25hbGx5CmNhbGxzIG9mX25vZGVfcHV0KGkzY2Rldi0+ZGV2Lm9mX25v
ZGUpLgoKSWYgZGV2aWNlX3JlZ2lzdGVyKCkgZmFpbHMganVzdCBiZWxvdyB0aGlzLCBvciB3aGVu
IHRoZSBkZXZpY2UgaXMgZXZlbnR1YWxseQp1bnJlZ2lzdGVyZWQsIHRoZSByZWxlYXNlIGZ1bmN0
aW9uIHdpbGwgZHJvcCBhIHJlZmVyZW5jZSB0aGF0IHdhcyBuZXZlcgphY3F1aXJlZCBmb3IgdGhl
IGRldmljZSBpdHNlbGYuCgo+ICAKPiArCQkvKgo+ICsJCSAqIEluIHRoZSBjYXNlIG9mIElCSSB3
YWtldXAsIGFueSBJQkktY2FwYWJsZSBkZXZpY2UgY2FuCj4gKwkJICogd2FrZXVwLgo+ICsJCSAq
Lwo+ICsJCWlmIChtYXN0ZXItPmliaV93YWtldXAgJiYgKGRlc2MtPmluZm8uYmNyICYgSTNDX0JD
Ul9JQklfUkVRX0NBUCkpCj4gKwkJCWRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUoJmRlc2MtPmRl
di0+ZGV2LCB0cnVlKTsKPiArCj4gIAkJcmV0ID0gZGV2aWNlX3JlZ2lzdGVyKCZkZXNjLT5kZXYt
PmRldik7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlkZXZfZXJyKCZtYXN0ZXItPmRldiwKPiAgCQkJ
CSJGYWlsZWQgdG8gYWRkIEkzQyBkZXZpY2UgKGVyciA9ICVkKVxuIiwgcmV0KTsKPiAgCQkJcHV0
X2RldmljZSgmZGVzYy0+ZGV2LT5kZXYpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJl
LWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIGVycm9yIHBhdGggbGVhdmUgYSBkYW5nbGlu
Zwpwb2ludGVyIHRoYXQgY2F1c2VzIGEgdXNlLWFmdGVyLWZyZWUgYW5kIGRvdWJsZS1mcmVlIGxh
dGVyPwoKSWYgZGV2aWNlX3JlZ2lzdGVyKCkgZmFpbHMsIHB1dF9kZXZpY2UoKSBpcyBjYWxsZWQg
d2hpY2ggZnJlZXMgZGVzYy0+ZGV2CnZpYSBpM2NfZGV2aWNlX3JlbGVhc2UoKSwgYnV0IGRlc2Mt
PmRldiBpcyBuZXZlciBzZXQgdG8gTlVMTC4KCkxhdGVyLCBkdXJpbmcgY29udHJvbGxlciB0ZWFy
ZG93biwgaTNjX21hc3Rlcl91bnJlZ2lzdGVyX2kzY19kZXZzKCkKaXRlcmF0ZXMgb3ZlciB0aGUg
YnVzIGFuZCBjaGVja3MgaWYgKCFpM2NkZXYtPmRldikuIFNpbmNlIHRoZSBwb2ludGVyCndhc24n
dCBjbGVhcmVkLCBpdCBwcm9jZWVkcyB0byBkZXJlZmVyZW5jZSBpdCBhbmQgZnJlZSBpdCBhZ2Fp
bjoKCmkzY19tYXN0ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2cygpIHsKICAgIC4uLgogICAgaTNjX2J1
c19mb3JfZWFjaF9pM2NkZXYoJm1hc3Rlci0+YnVzLCBpM2NkZXYpIHsKICAgICAgICBpZiAoIWkz
Y2Rldi0+ZGV2KQogICAgICAgICAgICBjb250aW51ZTsKCiAgICAgICAgaTNjZGV2LT5kZXYtPmRl
c2MgPSBOVUxMOwogICAgICAgIC4uLgogICAgICAgIGVsc2UKICAgICAgICAgICAgcHV0X2Rldmlj
ZSgmaTNjZGV2LT5kZXYtPmRldik7Cn0KClNob3VsZCBkZXNjLT5kZXYgYmUgc2V0IHRvIE5VTEwg
YWZ0ZXIgdGhlIHB1dF9kZXZpY2UoKSBjYWxsIGhlcmU/Cgo+ICAJCX0KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MDEyMDE1MzMu
MjIwODE4LTEtYWRyaWFuLmh1bnRlckBpbnRlbC5jb20/cGFydD0xCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
