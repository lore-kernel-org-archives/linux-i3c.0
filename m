Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158E4C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaZ088F/8Dk+9JgAh6qSCJzuxU2aWjtYjTpBFB0VegM=; b=HZLO+6VALENH2D
	Bp4ibOBxAuy6NZvNeXEoLtWSZiLKJ59dms5tGtzx5VT2IoGmiA3x7NO8oVltuoO5prLEAGfmmdqaa
	7Q68u1I9NxWwDWv5ZJ4Wq0UeMWCpSGQwJQqq98M1k/u1ezhQISYc8LM0UE6LD1ysnlPFrCR7SzRJ2
	z31K+BWifBzsUBy4HMAcDFpN9qvYIwVHomezMxLJdfxEsF4Riw0FEuUO1EKTXFybT3lkdzE9mIh07
	Qj/HOpaRABxEhfYOzLQzSc/HybK6jFKowRmKv7/3Qj9zZt69IwViy/k08gBqNTcsrLBG/djLYlfze
	MlpTUOjrklwV/rB9NuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepBH-00000000sav-3FfO;
	Wed, 01 Jul 2026 07:16:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepBG-00000000sal-1hwl
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 07:16:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D49BB6001D;
	Wed,  1 Jul 2026 07:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FFB1F000E9;
	Wed,  1 Jul 2026 07:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890181;
	bh=t8lEN/CQ3SSKCD2ZV8UDWfXdk/FdIKSDEkblhguEzPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MJuaUm79h1YWuKZY456wmZ7HKPRTn3TYgf34VGSpPefOxSWYXCRntSFsdXpggIN0v
	 HYlq6/f9IUL84Wil7Qo7m6ncrhHjaXbNgjq8JYPSiJDR7gx0PmxzKB6OuMUK8ZHood
	 /cCzMKP4rH0WBx/BLSCBCfL0BSXFUk3z8zU+NCohs1tL5C77xNv3mjarMU8agXGi70
	 rZjNMzB3+QiAiDEegGsi93ma3ua+YSntioxgBi61BhJhh5c73jD1Dz6WwZ3ju0J8W1
	 Gl4k4cB0ueXM1uI4rex/lIzNyGtBuGnSC1nuZlnGNs9X2GKuJv4iR9m43+D+hu/hlz
	 l63ZqiHkS53QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/7] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260701065755.2067793-5-lakshay.piplani@nxp.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-5-lakshay.piplani@nxp.com>
Date: Wed, 01 Jul 2026 07:16:20 +0000
Message-Id: <20260701071621.43FFB1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIERvdWJsZS11bmxvY2sg
YW5kIG1pc3NpbmcgZXJyb3IgcHJvcGFnYXRpb24gaW4gYHAzaDJ4NHhfcmVnYCBsb2NrIGd1YXJk
IG9uIGByZWdtYXBfcmVhZCgpYCBmYWlsdXJlLgotLQoKY29tbWl0IGVjNDI4ZmY0NzllZWUyNzQw
ZmYzOTA0NGQ3NGI2NzUyN2YxOGMzZTYKQXV0aG9yOiBBbWFuIEt1bWFyIFBhbmRleSA8YW1hbi5r
dW1hcnBhbmRleUBueHAuY29tPgoKcmVndWxhdG9yOiBwM2gyeDR4OiBBZGQgZHJpdmVyIGZvciBv
bi1kaWUgcmVndWxhdG9ycyBpbiBOWFAgUDNIMng0eCBpM2MgaHViCgpUaGUgTlhQIFAzSDJ4NHgg
ZmFtaWx5IGludGVncmF0ZXMgb24tZGllIHJlZ3VsYXRvcnMgYWxvbmdzaWRlIEkzQyBodWIKZnVu
Y3Rpb25hbGl0eS4gVGhpcyBkcml2ZXIgcmVnaXN0ZXJzIHRoZSByZWd1bGF0b3JzIHVzaW5nIHRo
ZSBNRkQKZnJhbWV3b3JrIGFuZCBleHBvc2VzIHRoZW0gdmlhIHRoZSByZWd1bGF0b3Igc3Vic3lz
dGVtLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3Jl
Z3VsYXRvci5jIGIvZHJpdmVycy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRvci5j
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi43ODE2MjJhNmZm
NDY3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcmVndWxhdG9yL3AzaDI4NDBfaTNj
X2h1Yl9yZWd1bGF0b3IuYwpbIC4uLiBdCj4gK3N0YXRpYyB2b2lkIHAzaDJ4NHhfcmVnX2d1YXJk
X2VudGVyKHN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2LAo+ICsJCQkJICAgIHN0cnVjdCBwM2gy
eDR4X3JlZ19zdGF0ZSAqc3RhdGUpCj4gK3sKPiArCXN0cnVjdCBwM2gyeDR4X3JlZ3VsYXRvcl9k
ZXYgKnByaXYgPSByZGV2X2dldF9kcnZkYXRhKHJkZXYpOwo+ICsKPiArCW11dGV4X2xvY2soJnBy
aXYtPmxvY2spOwo+ICsJc3RhdGUtPnJlc3RvcmUgPSBmYWxzZTsKPiArCj4gKwlpZiAocmVnbWFw
X3JlYWQocmRldi0+cmVnbWFwLAo+ICsJCQlQM0gyWDRYX0RFVl9SRUdfUFJPVEVDVElPTl9DT0RF
LAo+ICsJCQkmc3RhdGUtPm9yaWcpKSB7Cj4gKwkJbXV0ZXhfdW5sb2NrKCZwcml2LT5sb2NrKTsK
PiArCQlyZXR1cm47Cj4gKwl9CgpbU2V2ZXJpdHk6IEhpZ2hdCklmIHJlZ21hcF9yZWFkKCkgZmFp
bHMgaGVyZSwgd2UgdW5sb2NrIHRoZSBtdXRleCBhbmQgcmV0dXJuLiAKClNpbmNlIHRoaXMgZnVu
Y3Rpb24gaXMgdXNlZCBhcyB0aGUgbG9jayBndWFyZCBjb25zdHJ1Y3RvciwgdGhlIGNhbGxlciBp
cyBub3QKYXdhcmUgb2YgdGhlIGZhaWx1cmUuIERvZXMgdGhpcyBhbGxvdyB0aGUgY2FsbGVyIHRv
IHByb2NlZWQgYW5kIGV4ZWN1dGUgdGhlCmd1YXJkZWQgY3JpdGljYWwgc2VjdGlvbiB3aXRob3V0
IGhvbGRpbmcgdGhlIGxvY2s/CgpGb3IgZXhhbXBsZSwgaW4gcDNoMng0eF9yZWd1bGF0b3JfZW5h
YmxlKCk6CgoJZ3VhcmQocDNoMng0eF9yZWcpKHJkZXYpOwoJcmV0dXJuIHJlZ3VsYXRvcl9lbmFi
bGVfcmVnbWFwKHJkZXYpOwoKV291bGQgcmVndWxhdG9yX2VuYWJsZV9yZWdtYXAoKSBleGVjdXRl
IGNvbmN1cnJlbnRseSB3aXRob3V0IHRoZSBsb2NrIGlmIHRoZQppbml0aWFsaXphdGlvbiByZWFk
IGZhaWxzPwoKWyAuLi4gXQo+ICtzdGF0aWMgdm9pZCBwM2gyeDR4X3JlZ19ndWFyZF9leGl0KHN0
cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2LAo+ICsJCQkJICAgc3RydWN0IHAzaDJ4NHhfcmVnX3N0
YXRlICpzdGF0ZSkKPiArewo+ICsJc3RydWN0IHAzaDJ4NHhfcmVndWxhdG9yX2RldiAqcHJpdiA9
IHJkZXZfZ2V0X2RydmRhdGEocmRldik7Cj4gKwo+ICsJaWYgKHN0YXRlLT5yZXN0b3JlKQo+ICsJ
CXJlZ21hcF93cml0ZShyZGV2LT5yZWdtYXAsCj4gKwkJCSAgICAgUDNIMlg0WF9ERVZfUkVHX1BS
T1RFQ1RJT05fQ09ERSwKPiArCQkJICAgICBzdGF0ZS0+b3JpZyk7Cj4gKwo+ICsJbXV0ZXhfdW5s
b2NrKCZwcml2LT5sb2NrKTsKPiArfQoKW1NldmVyaXR5OiBIaWdoXQpXaGVuIHRoZSBsb2NrIGd1
YXJkIGdvZXMgb3V0IG9mIHNjb3BlLCBwM2gyeDR4X3JlZ19ndWFyZF9leGl0KCkgaXMgaW52b2tl
ZAp1bmNvbmRpdGlvbmFsbHkuIAoKSWYgd2UgcHJldmlvdXNseSBoaXQgdGhlIHJlZ21hcF9yZWFk
KCkgZXJyb3IgcGF0aCBpbiB0aGUgY29uc3RydWN0b3IgYW5kCmFscmVhZHkgdW5sb2NrZWQgdGhl
IG11dGV4LCB3aWxsIHRoaXMgc2Vjb25kIGNhbGwgdG8gbXV0ZXhfdW5sb2NrKCZwcml2LT5sb2Nr
KQpjYXVzZSBhIGRvdWJsZS11bmxvY2s/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzAxMDY1NzU1LjIwNjc3OTMtMS1sYWtzaGF5
LnBpcGxhbmlAbnhwLmNvbT9wYXJ0PTQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtaTNjCg==
