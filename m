Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F83DC43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7wT7YHfQ5aIBGErgod5KXhK89rKry9Oly7v/D7Fp8o=; b=LcQyQX24GJmmon
	1RMVcMWvahgUlPtRclrROS3e4OfNXnxb3TETxyVWrWjqforuhKwPwCJY7JpTrsjCzKujkb6wbVZC1
	YkV6dIW697ZSNyt7NTvm9Xf0FWT6Iq/NosDBxv1P+u783BuAJ6YKyktVNXOXy+LI2NY31AWcNgnUz
	KO/sTlff82/wcofrxKm6kdOFY4t2UyHfBkFmu1zc5HfLNgFGzgfj02TFiqHeW0kEY2TBHNdnOxnWo
	pha2P23Zwg+QLCZ9FCko/5tHKlKYze/8J5ud7kzn30/0VdPMeFpKYBFxvLp2UM6E+ZRSw/tTMp/+z
	MxGG5MfqBAIG8fJpr7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Vq-00000002xuC-19IK;
	Wed, 01 Jul 2026 20:26:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Vp-00000002xu1-23tj
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:26:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9573E60138;
	Wed,  1 Jul 2026 20:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BA31F000E9;
	Wed,  1 Jul 2026 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937584;
	bh=nd7Sm1e6eLttT/DTuyjaBipxYLQmTT7kNJa4M9DesPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbEQUD8jndJIPEQZpZcl5hfVaSIeqS0ueCdK3JtiFstV1YpZcKtntGZ7y1ZGeH0C1
	 mG2VeGFXtf9n6ZnBe+kAbi4hRSrvybTm8q86BrotpT7E9HPzwxuSSjxhikgdffdh01
	 XONK1sXlHdZA5sO5uNRR6Q7EBXuSDyMq+S2z+eWIYvGHxGN3Z77U3pnESE/liAuRmw
	 zdG4U1nPvCnepxeaEDsStVA44OhObcv3OTY21qqMF7rbXAl2PDoGIRiaRApsoHz2Je
	 zNEJmV4AtYGM4G/HOYur1uxIDyyXBG8yE/u3+2sUlfGePX2CKihUZlGLWFjLIZkBNq
	 dwKQY6bDMwvZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/7] i3c: master: Support IBI-based wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260701200552.220042-2-adrian.hunter@intel.com>
References: <20260701200552.220042-1-adrian.hunter@intel.com>
 <20260701200552.220042-2-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:26:23 +0000
Message-Id: <20260701202624.18BA31F000E9@smtp.kernel.org>
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
IFtIaWdoXSBEYW5nbGluZyBwb2ludGVyIGFuZCBkb3VibGUgZnJlZSBvbiBkZXZpY2VfcmVnaXN0
ZXIoKSBlcnJvciBwYXRoCi0gW0hpZ2hdIE1pc3Npbmcgb2Zfbm9kZV9nZXQoKSBjYXVzZXMgVXNl
LUFmdGVyLUZyZWUgb2YgZGV2aWNlIHRyZWUgbm9kZQotLQoKY29tbWl0IGVhODBkYmNlMGY1Y2Rk
YTc4MThlODBiNmRhYjUxZGM2OGY3NjhkNzIKQXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4u
aHVudGVyQGludGVsLmNvbT4KCmkzYzogbWFzdGVyOiBTdXBwb3J0IElCSS1iYXNlZCB3YWtldXAg
Y2FwYWJpbGl0eQoKQWRkcyBhbiBpYmlfd2FrZXVwIGZsYWcgdG8gc3RydWN0IGkzY19tYXN0ZXJf
Y29udHJvbGxlciBzbyBjb250cm9sbGVyCmRyaXZlcnMgY2FuIGFkdmVydGlzZSBzdXBwb3J0IGZv
ciBJQkktYmFzZWQgd2FrZXVwLiBJZiBzZXQsIG1hcmtzCklCSS1jYXBhYmxlIEkzQyBkZXZpY2Vz
IGFzIHdha2V1cCBjYXBhYmxlIHdoZW4gdGhleSBhcmUgcmVnaXN0ZXJlZC4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCBm
MWJlMzhhNjQwY2ExLi5hNDdlMjkyNGJiNzAxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKClsgLi4uIF0KCj4gQEAgLTE5MzAs
NiArMTkzMSwxMyBAQCBpM2NfbWFzdGVyX3JlZ2lzdGVyX25ld19pM2NfZGV2cyhzdHJ1Y3QgaTNj
X21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpCj4gIAkJaWYgKGRlc2MtPmJvYXJkaW5mbykKPiAg
CQkJZGVzYy0+ZGV2LT5kZXYub2Zfbm9kZSA9IGRlc2MtPmJvYXJkaW5mby0+b2Zfbm9kZTsKPiAg
CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBh
dGNoLCBidXQgZG9lcyB0aGlzIGFzc2lnbm1lbnQgbmVlZCB0bwppbmNyZW1lbnQgdGhlIHJlZmVy
ZW5jZSBjb3VudCBvZiB0aGUgZGV2aWNlIHRyZWUgbm9kZSB1c2luZyBvZl9ub2RlX2dldCgpPwoK
Q3VycmVudGx5LCB0aGUgbm9kZSBpcyBhc3NpZ25lZCBkaXJlY3RseSBmcm9tIGRlc2MtPmJvYXJk
aW5mby0+b2Zfbm9kZS4KSG93ZXZlciwgd2hlbiB0aGUgSTNDIGRldmljZSBpcyBsYXRlciByZWxl
YXNlZCAoZWl0aGVyIHZpYSB1bnJlZ2lzdHJhdGlvbiBvcgphIGRldmljZV9yZWdpc3RlcigpIGZh
aWx1cmUpLCBpM2NfZGV2aWNlX3JlbGVhc2UoKSB1bmNvbmRpdGlvbmFsbHkgY2FsbHMKb2Zfbm9k
ZV9wdXQoaTNjZGV2LT5kZXYub2Zfbm9kZSkuCgpDb3VsZCB0aGlzIGNvbnN1bWUgdGhlIHJlZmVy
ZW5jZSBjb25jZXB0dWFsbHkgb3duZWQgYnkgYm9hcmRpbmZvIGFuZCBsZWFkIHRvCmEgdXNlLWFm
dGVyLWZyZWUgb2YgdGhlIGRldmljZSBub2RlIG9uIHJlcGVhdGVkIGhvdC1wbHVnIGN5Y2xlcyBv
cgpyZWdpc3RyYXRpb24gZmFpbHVyZXM/Cgo+ICsJCS8qCj4gKwkJICogSW4gdGhlIGNhc2Ugb2Yg
SUJJIHdha2V1cCwgYW55IElCSS1jYXBhYmxlIGRldmljZSBjYW4KPiArCQkgKiB3YWtldXAuCj4g
KwkJICovCj4gKwkJaWYgKG1hc3Rlci0+aWJpX3dha2V1cCAmJiAoZGVzYy0+aW5mby5iY3IgJiBJ
M0NfQkNSX0lCSV9SRVFfQ0FQKSkKPiArCQkJZGV2aWNlX3NldF93YWtldXBfY2FwYWJsZSgmZGVz
Yy0+ZGV2LT5kZXYsIHRydWUpOwo+ICsKPiAgCQlyZXQgPSBkZXZpY2VfcmVnaXN0ZXIoJmRlc2Mt
PmRldi0+ZGV2KTsKPiAgCQlpZiAocmV0KSB7Cj4gIAkJCWRldl9lcnIoJm1hc3Rlci0+ZGV2LAo+
ICAJCQkJIkZhaWxlZCB0byBhZGQgSTNDIGRldmljZSAoZXJyID0gJWQpXG4iLCByZXQpOwo+ICAJ
CQlwdXRfZGV2aWNlKCZkZXNjLT5kZXYtPmRldik7Cj4gIAkJfQoKW1NldmVyaXR5OiBIaWdoXQpU
aGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgaXMgaXQgcG9zc2libGUgZm9yIHRoaXMg
ZXJyb3IgcGF0aCB0bwpsZWF2ZSBhIGRhbmdsaW5nIHBvaW50ZXIgdGhhdCBjYXVzZXMgYSB1c2Ut
YWZ0ZXItZnJlZSBsYXRlcj8KCklmIGRldmljZV9yZWdpc3RlcigpIGZhaWxzLCBwdXRfZGV2aWNl
KCkgZnJlZXMgZGVzYy0+ZGV2IHZpYQppM2NfZGV2aWNlX3JlbGVhc2UoKS4gSG93ZXZlciwgZGVz
Yy0+ZGV2IGFuZCBkZXNjLT5kZXYtPmRlc2MgYXJlIG5vdApjbGVhcmVkLgoKSWYgaTNjX21hc3Rl
cl91bnJlZ2lzdGVyX2kzY19kZXZzKCkgaXMgbGF0ZXIgaW52b2tlZCBkdXJpbmcgZHJpdmVyIHVu
YmluZCwKaXQgYXBwZWFycyB0byBmaW5kIHRoZSBub24tTlVMTCBwb2ludGVyIGFuZCB3cml0ZSB0
byBmcmVlZCBtZW1vcnk6CgppM2NfbWFzdGVyX3VucmVnaXN0ZXJfaTNjX2RldnMoKSB7CiAgICAu
Li4KICAgIGkzY2Rldi0+ZGV2LT5kZXNjID0gTlVMTDsKICAgIGlmIChkZXZpY2VfaXNfcmVnaXN0
ZXJlZCgmaTNjZGV2LT5kZXYtPmRldikpCiAgICAgICAgZGV2aWNlX3VucmVnaXN0ZXIoJmkzY2Rl
di0+ZGV2LT5kZXYpOwogICAgZWxzZQogICAgICAgIHB1dF9kZXZpY2UoJmkzY2Rldi0+ZGV2LT5k
ZXYpOwogICAgLi4uCn0KCmFuZCB0aGVuIGV4ZWN1dGUgYSBkb3VibGUtZnJlZSBvbiB0aGUgZGV2
aWNlIG9iamVjdC4gU2hvdWxkIHRoaXMgZXJyb3IgcGF0aApjbGVhciBkZXNjLT5kZXYgdG8gcHJl
dmVudCB0aGlzPwoKPiAgCX0KPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcwMTIwMDU1Mi4yMjAwNDItMS1hZHJpYW4uaHVu
dGVyQGludGVsLmNvbT9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
