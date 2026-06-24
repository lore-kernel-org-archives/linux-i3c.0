Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8BACDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqVyQxM34cKylQZMEljDHBTnHWBU9ZBNMkDColHxOmA=; b=refCMkECKbJpWu
	OTLKAN4aRsX7vzxEE0xAXAP1Sfka0KX4zwaloh7NH97Pgm0Fj7locHXMSyL3gNgIXe9LLYCsW4BfZ
	9fIYTbhiH5Q7US31dj6PR8KfiFMw5h/lshX6fC2nj1OS4pymkubGeUQjAC5MDTg+oARVxNFjn6o+Y
	ZUr20c6xgvqVJmLARSCCglsVGaTZ2se3X1dTbmCwfe6xLp6qsClx6IQejB7Yn2qhvLKAHi6tDu7i2
	FFCyCV03W55rIXGuCZ2fVq8vwZ6Vvx1aOo6tAD8Qd/ByANrsG3VbqGt70FuI9ETENwkpdMlqkiNsH
	RNF6eme6zQYl2Iaj9rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcL9m-00000007dGE-1wmF;
	Wed, 24 Jun 2026 10:48:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcL9l-00000007dFr-2r3d
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:48:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E942A60018;
	Wed, 24 Jun 2026 10:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2241F000E9;
	Wed, 24 Jun 2026 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782298112;
	bh=1pSfilZOpgczgI3MMALVqKge1TLKEkbDSBwSHoxbtS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VW5xipDvj3DPfkKfLWwVclujeDCRlsC7Pknuh+cAKuMQ0GR24c/XJBCODhFcuXPs2
	 IaIygPEm0PAmuDfLPWBVMns2r67wJqgUFYtrj22wvGj/uUcwlevVN8zwLg17dOfZcq
	 Ob8k3X6p+ruMCaN4+0wXnx5Vz0BliHc9vdpicVR6Y6qjcNx8ZhMhYJKSB6ugePZLlC
	 /ydzDEJWtAdaK0GgXZ3ywxSUYBlhddExSdFmU0xJziMlzhScy7HQkscvT8k8UjebQz
	 8jnfYQMotmtJsahoiaMbuRzuEs7Oycve8aJ+MohON6zFLFwki5cmxbSQbdysn6bTkq
	 w2uDXTwGntiBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/12] i3c: master: Use unified device property
 interface
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260624102153.1770072-3-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-3-akhilrajeev@nvidia.com>
Date: Wed, 24 Jun 2026 10:48:31 +0000
Message-Id: <20260624104832.4A2241F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBG
d25vZGUgcmVmZXJlbmNlcyBhY3F1aXJlZCBmb3IgSTJDIGFuZCBJM0MgYm9hcmRpbmZvIGVudHJp
ZXMgYXJlIHBlcm1hbmVudGx5IGxlYWtlZC4KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0hpZ2hd
IERhbmdsaW5nIGBkZXNjLT5kZXZgIHBvaW50ZXIgY2F1c2VzIFVzZS1BZnRlci1GcmVlIGFuZCBE
b3VibGUgRnJlZSB3aGVuIGRldmljZSByZWdpc3RyYXRpb24gZmFpbHMuCi0tCgpjb21taXQgY2Y1
OWJiMGY3MDZjZjI2N2M5Y2ExNTg4MTU4MzU3NjZhODFmYzIxNApBdXRob3I6IEFraGlsIFIgPGFr
aGlscmFqZWV2QG52aWRpYS5jb20+CgppM2M6IG1hc3RlcjogVXNlIHVuaWZpZWQgZGV2aWNlIHBy
b3BlcnR5IGludGVyZmFjZQoKUmVwbGFjZSBhbGwgT0Ytc3BlY2lmaWMgZnVuY3Rpb25zIHdpdGgg
dW5pZmllZCBkZXZpY2UgcHJvcGVydHkgZnVuY3Rpb25zCmFzIGEgcHJlcmVxdWlzaXRlIHRvIHN1
cHBvcnQgYm90aCBBQ1BJIGFuZCBkZXZpY2UgdHJlZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCBmMWJlMzhhNjQwY2Ex
Li5iMjBmNTZmN2I2OGU4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysr
IGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKClsgLi4uIF0KCj4gQEAgLTE5MjgsNyArMTkzMCw4IEBA
IGkzY19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZzKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRy
b2xsZXIgKm1hc3RlcikKPiAgCQkJICAgICBkZXNjLT5pbmZvLnBpZCk7Cj4gIAo+ICAJCWlmIChk
ZXNjLT5ib2FyZGluZm8pCj4gLQkJCWRlc2MtPmRldi0+ZGV2Lm9mX25vZGUgPSBkZXNjLT5ib2Fy
ZGluZm8tPm9mX25vZGU7Cj4gKwkJCWRldmljZV9zZXRfbm9kZSgmZGVzYy0+ZGV2LT5kZXYsCj4g
KwkJCQkJZndub2RlX2hhbmRsZV9nZXQoZGVzYy0+Ym9hcmRpbmZvLT5md25vZGUpKTsKCltTZXZl
cml0eTogSGlnaF0KRG9lcyB0aGlzIHRha2UgYW4gZXh0cmEgcmVmZXJlbmNlIHRvIHRoZSBmd25v
ZGUgdGhhdCBlbmRzIHVwIGxlYWtpbmc/CgpUaGUgb3JpZ2luYWwgY29kZSBzaW1wbHkgYXNzaWdu
ZWQgdGhlIHBvaW50ZXIsIGJ1dCB0aGUgbmV3IGNvZGUgY2FsbHMKZndub2RlX2hhbmRsZV9nZXQo
KSwgYWNxdWlyaW5nIGFuIGFkZGl0aW9uYWwgcmVmZXJlbmNlLiBXaGVuIHRoZSBkZXZpY2UgaXMK
c3Vic2VxdWVudGx5IHJlbGVhc2VkIHZpYSBpM2NfZGV2aWNlX3JlbGVhc2UoKSwgaXQgd2lsbCBk
cm9wIHRoaXMgc2Vjb25kCnJlZmVyZW5jZS4KClNpbmNlIHRoZSBvcmlnaW5hbCByZWZlcmVuY2Ug
c3RvcmVkIGluIGRlc2MtPmJvYXJkaW5mby0+Zndub2RlIGRvZXMgbm90IGFwcGVhcgp0byBiZSBk
cm9wcGVkIGR1cmluZyBtYXN0ZXIgdGVhcmRvd24sIGRvZXMgdGhpcyBjYXVzZSB0aGUgaW5pdGlh
bCByZWZlcmVuY2UgdG8KcGVybWFuZW50bHkgbGVhayBvbiB0aGUgbm9ybWFsIHN1Y2Nlc3MgcGF0
aD8KCj4gIAkJcmV0ID0gZGV2aWNlX3JlZ2lzdGVyKCZkZXNjLT5kZXYtPmRldik7Cj4gIAkJaWYg
KHJldCkgewoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkg
dGhpcyBwYXRjaCwgYnV0IGRvZXMgdGhpcyBlcnJvciBwYXRoIGxlYXZlIGEKZGFuZ2xpbmcgcG9p
bnRlciBpbiBkZXNjLT5kZXY/CgpJZiBkZXZpY2VfcmVnaXN0ZXIoKSBmYWlscywgcHV0X2Rldmlj
ZSgmZGVzYy0+ZGV2LT5kZXYpIGlzIGNhbGxlZCwgd2hpY2ggZHJvcHMKdGhlIHJlZmVyZW5jZSBj
b3VudCB0byAwIGFuZCBpbnZva2VzIGkzY19kZXZpY2VfcmVsZWFzZSgpLiBUaGUgcmVsZWFzZQpm
dW5jdGlvbiBmcmVlcyBkZXNjLT5kZXYgKHRoZSBpM2NkZXYgc3RydWN0dXJlKS4gSG93ZXZlciwg
ZGVzYy0+ZGV2IGlzIG5vdCBzZXQKdG8gTlVMTC4KCkxhdGVyLCB3aGVuIGkzY19tYXN0ZXJfdW5y
ZWdpc3Rlcl9pM2NfZGV2cygpIGl0ZXJhdGVzIHRocm91Z2ggdGhlIGJ1cywKaXQgd2lsbCBkZXJl
ZmVyZW5jZSB0aGUgZGFuZ2xpbmcgcG9pbnRlcjoKCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19t
YXN0ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2cygpIHsKICAgIC4uLgogICAgaTNjX2J1c19mb3JfZWFj
aF9pM2NkZXYoJm1hc3Rlci0+YnVzLCBpM2NkZXYpIHsKICAgICAgICBpZiAoIWkzY2Rldi0+ZGV2
KQogICAgICAgICAgICBjb250aW51ZTsKCiAgICAgICAgaTNjZGV2LT5kZXYtPmRlc2MgPSBOVUxM
OwogICAgICAgIGlmIChkZXZpY2VfaXNfcmVnaXN0ZXJlZCgmaTNjZGV2LT5kZXYtPmRldikpCiAg
ICAgICAgICAgIGRldmljZV91bnJlZ2lzdGVyKCZpM2NkZXYtPmRldi0+ZGV2KTsKICAgICAgICBl
bHNlCiAgICAgICAgICAgIHB1dF9kZXZpY2UoJmkzY2Rldi0+ZGV2LT5kZXYpOwogICAgICAgIGkz
Y2Rldi0+ZGV2ID0gTlVMTDsKICAgIH0KICAgIC4uLgp9CgpDb3VsZCB0aGlzIGxlYWQgdG8gYSB1
c2UtYWZ0ZXItZnJlZSBhbmQgZG91YmxlLWZyZWUgd2hlbiBpdCBldmFsdWF0ZXMKaTNjZGV2LT5k
ZXYgYW5kIGF0dGVtcHRzIHRvIGNhbGwgcHV0X2RldmljZSgpIGFnYWluPwoKWyAuLi4gXQoKPiBA
QCAtMjY0OSwxNCArMjY1NiwxNCBAQCBvZl9pM2NfbWFzdGVyX2FkZF9pMmNfYm9hcmRpbmZvKHN0
cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiAgCWJvYXJkaW5mby0+bHZyID0g
cmVnWzJdOwo+ICAKPiAgCWxpc3RfYWRkX3RhaWwoJmJvYXJkaW5mby0+bm9kZSwgJm1hc3Rlci0+
Ym9hcmRpbmZvLmkyYyk7Cj4gLQlvZl9ub2RlX2dldChub2RlKTsKPiArCWZ3bm9kZV9oYW5kbGVf
Z2V0KGZ3bm9kZSk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KCltTZXZlcml0eTogSGlnaF0KRG9l
cyB0aGlzIGNvZGUgbGVhayB0aGUgZndub2RlIHJlZmVyZW5jZT8KClRoZSBmd25vZGVfaGFuZGxl
X2dldChmd25vZGUpIGNhbGwgaW5jcmVtZW50cyB0aGUgcmVmZXJlbmNlIGNvdW50LCBidXQgdGhl
CnJlc3VsdGluZyByZWZlcmVuY2UgaXMgbmVpdGhlciBzdG9yZWQgaW4gYm9hcmRpbmZvIG5vciBk
cm9wcGVkIGJlZm9yZSB0aGUKZnVuY3Rpb24gcmV0dXJucy4gVGhpcyBhcHBlYXJzIHRvIGxlYWsg
dGhlIHJlZmVyZW5jZSBpbW1lZGlhdGVseSBvbiB0aGUKc3VjY2VzcyBwYXRoLgoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYyNDEw
MjE1My4xNzcwMDcyLTEtYWtoaWxyYWplZXZAbnZpZGlhLmNvbT9wYXJ0PTIKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
