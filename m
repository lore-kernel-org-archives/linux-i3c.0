Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780D1076373
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Apr 2026 06:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDpFOYdSLI0U/crTGP0Q+yl5Fz5Sa1a6yEXTSbfQaQY=; b=GnXhnFA9F60UOJ
	zIOodjcSGOpKwUHh50WC6dFgdk2l9eDhATmEW40Ty3P9PJHIafGxJI9q4+iAWLDMK0fmPbUG+joNJ
	R5AKHXCXqq2XIJOLqYPe2YQ2RGu9Pjm1qMMGbwsJEUyBej/SZ1JHpOgLm47YhiGs5fWT2CT1wZ1Bi
	aKSc5z8fXST07K+nFgsjIsEPKXj/ahDn+hmmAsIbSUxFJHH3Pcw3pA3nMRQXkbxGeb9G7wsPIasWo
	atbjgb66AhJSUq4cdE8CbuZMDGRWK56uQpgzCkV3+wl2j4qHiCAWZPPlHuPCMt3h59zzbVh4etSrJ
	dV++7uxKbQjeVLPYLLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ooe-0000000E5vE-2hXX;
	Wed, 01 Apr 2026 06:12:36 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ooc-0000000E5uJ-2Rdg
	for linux-i3c@lists.infradead.org;
	Wed, 01 Apr 2026 06:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1775023949;
	bh=PP8ht5mK1RSgutrNVTFAjzZOS3ocw0FInOljxxhLecs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SKtrweD6tT6auKN82Lv08WOc+guVPWvuDr8LvmxeBPuL4WQkZ5s+5GEwEM5d+JvIS
	 qL6MARuF7YtQALRKZC/bQ5oIgu4pO+bQUQlLvlohkw1nu6wDTOMAOrs5s1tGpx/Dr2
	 Dr0YD+izJQArnwpRqmW01rgDLgOfvEyE8iODH3SLVbE7AyDzmtur3HooF2HJ3w0hGO
	 bKznzBbKC+bmOHE4sUlTOjQifyGJ7Rk1do8n1j2zxupx+uQeLA7J5E91MlCTISyIyX
	 607GJyRnzg0KXCLxzMdVqL9H4WXXnM+VHbAxISfeGx6GUts3JD1QfbLZ2F4qt1Fm1o
	 jGnSUReL1rl+A==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 723F264FEF;
	Wed,  1 Apr 2026 14:12:28 +0800 (AWST)
Message-ID: <139edc8cdd621451ca9993ea94b617f76340539d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	linux-kernel@vger.kernel.org
Cc: git@amd.com, Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	 <Frank.Li@nxp.com>, Joel Stanley <joel@jms.id.au>, 
	linux-i3c@lists.infradead.org
Date: Wed, 01 Apr 2026 14:12:28 +0800
In-Reply-To: <20260401041937.279621-1-shubhrajyoti.datta@amd.com>
References: <20260401041937.279621-1-shubhrajyoti.datta@amd.com>
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_231234_966615_FC289E14 
X-CRM114-Status: GOOD (  16.40  )
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

SGkgU2h1YmhyYWp5b3RpLAoKPiBPbiBEZXNpZ25XYXJlIEkzQyBjb250cm9sbGVycyB3aGVyZSBJ
Q19IQVNfSUJJX0RBVEE9MCAoc3VjaCBhcyB2ZXJzYWxuZXQpLAo+IHRoZSBJQklfU1RTX0NOVCBm
aWVsZCAoYml0cyBbMjg6MjRdIG9mIFFVRVVFX1NUQVRVU19MRVZFTCkgaXMgaGFyZHdpcmVkCj4g
dG8gMC4gVGhlIElCSSBzdGF0dXMgZW50cnkgY291bnQgaXMgaW5zdGVhZCByZXBvcnRlZCB2aWEg
SUJJX0JVRl9CTFIKPiAoYml0cyBbMjM6MTZdIG9mIHRoZSBzYW1lIHJlZ2lzdGVyKS4KCk9LLiBZ
b3Ugc2VlbSB0byBoYXZlIHNvbWUgb2RkIGNvbnRleHQgaW4geW91ciBwYXRjaCB0aG91Z2g6Cgo+
IGlycV9oYW5kbGVfaWJpcygpIHdhcyB1bmNvbmRpdGlvbmFsbHkgcmVhZGluZyBJQklfU1RTX0NO
VCwgY2F1c2luZyBpdCB0bwo+IGFsd2F5cyBzZWUgMCBwZW5kaW5nIElCSXMgb24gdmVyc2FsbmV0
IGFuZCByZXR1cm4gZWFybHkgd2l0aG91dCBkcmFpbmluZwo+IHRoZSBJQkkgYnVmZmVyLiBTaW5j
ZSBJTlRSX0lCSV9USExEX1NUQVQgaXMgbGV2ZWwtdHJpZ2dlcmVkIGFnYWluc3QgdGhlCj4gYnVm
ZmVyIGZpbGwgbGV2ZWwsIHRoaXMgbGVmdCB0aGUgaW50ZXJydXB0IHBlcm1hbmVudGx5IGFzc2Vy
dGVkLgo+IAo+IERldGVjdCBJQkkgZGF0YSBjYXBhYmlsaXR5IGF0IHByb2JlIHRpbWUgYnkgd3Jp
dGluZyB0aGUgSUJJIGRhdGEgdGhyZXNob2xkCj4gZmllbGQgaW4gUVVFVUVfVEhMRF9DVFJMIGFu
ZCByZWFkaW5nIGl0IGJhY2suIFVzZSB0aGUgcmVzdWx0IHRvIHNlbGVjdCB0aGUKPiBjb3JyZWN0
IHJlZ2lzdGVyIGZpZWxkIGluIGlycV9oYW5kbGVfaWJpcygpLgo+IAo+IEZpeGVzOiBlMzg5YjFk
NzJhNjIgKCJpM2M6IGR3OiBBZGQgc3VwcG9ydCBmb3IgaW4tYmFuZCBpbnRlcnJ1cHRzIikKPiBT
aWduZWQtb2ZmLWJ5OiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90aS5kYXR0YUBhbWQu
Y29tPgo+IC0tLQo+IAo+IMKgZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyB8IDIx
ICsrKysrKysrKysrKysrKysrKysrLQo+IMKgZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0
ZXIuaCB8wqAgMSArCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0
ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiBpbmRleCBmMmE3Zjgx
MjJkOWUuLjdhMTc4MmE2OTA4MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHct
aTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+
IEBAIC0xNDU1LDcgKzE0NTUsMTEgQEAgc3RhdGljIHZvaWQgZHdfaTNjX21hc3Rlcl9pcnFfaGFu
ZGxlX2liaXMoc3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlcikKPiDCoMKgwqDCoMKgwqDCoMKg
dTMyIHJlZzsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZWcgPSByZWFkbChtYXN0ZXItPnJlZ3Mg
KyBRVUVVRV9TVEFUVVNfTEVWRUwpOwo+IC3CoMKgwqDCoMKgwqDCoG5faWJpcyA9IFFVRVVFX1NU
QVRVU19JQklfU1RBVFVTX0NOVChyZWcpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChtYXN0ZXItPmhh
c19pYmlfZGF0YSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbl9pYmlzID0gUVVF
VUVfU1RBVFVTX0lCSV9TVEFUVVNfQ05UKHJlZyk7Cj4gK8KgwqDCoMKgwqDCoMKgZWxzZQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBuX2liaXMgPSBRVUVVRV9TVEFUVVNfSUJJX0JV
Rl9CTFIocmVnKTsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghbl9pYmlzKQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbl9pYmlzID0gUVVFVUVfU1RBVFVTX0lCSV9CVUZfQkxS
KHJlZyk7CgouLi4gd2hlcmUgdGhpcyBsYXN0IGNvbmRpdGlvbmFsIGlzIG5vdCBwcmVzZW50IHVw
c3RyZWFtPyBJdCB3b3VsZCBzZWVtCnRvIGR1cGxpY2F0ZSB0aGUgcHVycG9zZSBvZiB0aGlzIHBh
dGNoLgoKV2hpbGUgdGhhdCB0d28tbGluZSBhZGRpdGlvbiBjb3VsZCBiZSBhIHNpbXBsZXIgd29y
a2Fyb3VuZCwgSSB0aGluayB5b3VyCmludGVuZGVkIGNoYW5nZSBsb29rcyBhIGJpdCBtb3JlIHNv
bGlkLgoKPiBGaXhlczogZTM4OWIxZDcyYTYyICgiaTNjOiBkdzogQWRkIHN1cHBvcnQgZm9yIGlu
LWJhbmQgaW50ZXJydXB0cyIpCgpJIGRvbid0IHRoaW5rIHRoaXMgaXMgcXVhbGlmaWVzIGFzIGEg
Zml4IGlmIGl0IGVuYWJsZXMgc3VwcG9ydCBmb3IgbmV3CmhhcmR3YXJlIGNvbmZpZ3VyYXRpb25z
LgoKQ2hlZXJzLAoKCkplcmVteQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
