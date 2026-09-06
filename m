Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA1EC79F99
	for <linux-i3c@archiver.kernel.org>; Sun,  6 Sep 2026 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+XwmcDJthFilv1u61sReWOwg6VY7+3WyzFwfoB/Ah0=; b=btUHlFj5t/ji1b
	AHWfSdMv27oI/qH2MGIY99fEXDofBGkgVBQzmOGJfP7cmRA/w/GhSF2ES5+mPAbdxIv5iKEN8NcLR
	5l0PmhdZKt9gRTYB8jO1IPomJEbPNzj0PMAqZYRcnKVQ7veeHwOWTogZRNDm2wRDwN3S/wjiungl4
	79eA5ic02fmczfs8Wb9zJ7o8p2R6nxjiTokGIMM1nFYU4uO9c0kTJ6tbm1VXttmta1FTdlXhjp5k5
	elgVfWLeXDJ/D4ze4vRubiBqKbZgCrsGbcxai0jHcMEjLhxGdyUDs+STJlxNH8uvX2F2Qh5YwJTBX
	IhYHy4A1TX3wuprMiZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Jf7-00000005Z78-2Hc1;
	Sun, 06 Sep 2026 20:40:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Jf2-00000005Z6a-3Edr
	for linux-i3c@lists.infradead.org;
	Sun, 06 Sep 2026 20:40:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87F2F40303;
	Sun,  6 Sep 2026 20:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9FD1F00A3A;
	Sun,  6 Sep 2026 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788727220;
	bh=yv8JKnEhkx8YpSVyo0hoNa27BO/JLrkBmUq9KhVtCWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P+FOMWP4GlxLXcl2phyyBbJSoteryPVX9GiFK6XGiQDM/uXfWk6NQYWA1VnFfcgZb
	 UeBQh/1f2pS6caD4pFDBrNcSKllbgl4VKFjQavaMVLdJrmcPRtofTD3oTI/57lGrQK
	 gQjlUdciEcdqfWpF3kTcs8Iqrzzzgo/55nPsQfnmCVxKHIJ02o5nit+LKKvs45f2+B
	 MDxZ76Kd+Sp4q/mPjdtbE3Ex/sId/LZozDc3eXuQg29u2ho5QM022a5djqop/WEgwX
	 95/8lpOKXkNgeabIL9wqbeBV+bqA1jduX8v5hOxg+6ZAxBIWd58+/+sat7ZgRtcSBY
	 A/bX6oSu6uCDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] i3c: master: add i3c_for_each_dev helper
To: "Sam Agazaryan" <samagazaryan@google.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260906202747.4041389-3-samagazaryan@google.com>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-3-samagazaryan@google.com>
Date: Sun, 06 Sep 2026 20:40:19 +0000
Message-Id: <20260906204020.2F9FD1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVubmVjZXNzYXJ5IGFj
cXVpc2l0aW9uIG9mIGBpM2NfY29yZV9sb2NrYCBpbiBgaTNjX2Zvcl9lYWNoX2RldmAgY3JlYXRl
cyBhIGRlYWRsb2NrIHJpc2sgYW5kIGludHJvZHVjZXMgYSBsb2NrIGludmVyc2lvbiB3aXRoIGRl
dmljZSByZWxlYXNlIHBhdGhzLgotLQoKY29tbWl0IGNmNGVkM2U3ZGEyZGVkOGRjNWVjN2E1ZDc0
Yzc0NWFhZTI3ZTRlMGEKQXV0aG9yOiBWaXRvciBTb2FyZXMgPHZpdG9yLnNvYXJlc0B0b3JhZGV4
LmNvbT4KCmkzYzogbWFzdGVyOiBhZGQgaTNjX2Zvcl9lYWNoX2RldiBoZWxwZXIKCkludHJvZHVj
ZSBpM2NfZm9yX2VhY2hfZGV2KCksIGFuIGkzYyBkZXZpY2UgaXRlcmF0b3IgZm9yIHVzZSBieSBp
M2NkZXYuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNj
L21hc3Rlci5jCj4gaW5kZXggZThhOWY4YzMwNDFlNi4uZGQ1MDcxY2E5MTk1YSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4g
QEAgLTQwMTEsNiArNDAxMSwxOCBAQCB2b2lkIGkzY19kZXZfZnJlZV9pYmlfbG9ja2VkKHN0cnVj
dCBpM2NfZGV2X2Rlc2MgKmRldikKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChpM2NfZGV2X2Zy
ZWVfaWJpX2xvY2tlZCk7Cj4gIAo+ICtpbnQgaTNjX2Zvcl9lYWNoX2Rldih2b2lkICpkYXRhLCBp
bnQgKCpmbikoc3RydWN0IGRldmljZSAqLCB2b2lkICopKQo+ICt7Cj4gKwlpbnQgcmVzOwo+ICsK
PiArCW11dGV4X2xvY2soJmkzY19jb3JlX2xvY2spOwo+ICsJcmVzID0gYnVzX2Zvcl9lYWNoX2Rl
digmaTNjX2J1c190eXBlLCBOVUxMLCBkYXRhLCBmbik7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMg
aG9sZGluZyBpM2NfY29yZV9sb2NrIGhlcmUgY3JlYXRlIGEgcG90ZW50aWFsIGRlYWRsb2NrIHJp
c2s/CgpTaW5jZSBidXNfZm9yX2VhY2hfZGV2KCkgaW52b2tlcyBhbiBvcGFxdWUgY2FsbGJhY2sg
Zm4oKSBvdmVyIGFsbCBidXMKZGV2aWNlcywgaWYgZm4oKSBwZXJmb3JtcyBhbiBhY3Rpb24gdGhh
dCBkcm9wcyB0aGUgbGFzdCByZWZlcmVuY2UgdG8gYW4gSTNDCm1hc3RlciBjb250cm9sbGVyIGRl
dmljZSwgdGhlIHJlbGVhc2UgZnVuY3Rpb24gaTNjX21hc3RlcmRldl9yZWxlYXNlKCkgY291bGQK
ZXhlY3V0ZSBzeW5jaHJvbm91c2x5IG9uIHRoZSBzYW1lIHRocmVhZC4KCklmIHRoYXQgb2NjdXJz
LCBpM2NfbWFzdGVyZGV2X3JlbGVhc2UoKSBjYWxscyBpM2NfYnVzX2NsZWFudXAoKSwgd2hpY2gK
dW5jb25kaXRpb25hbGx5IGF0dGVtcHRzIHRvIGxvY2sgaTNjX2NvcmVfbG9jazoKCmRyaXZlcnMv
aTNjL21hc3Rlci5jOmkzY19idXNfY2xlYW51cCgpIHsKICAgIC4uLgogICAgbXV0ZXhfbG9jaygm
aTNjX2NvcmVfbG9jayk7CiAgICBpZHJfcmVtb3ZlKCZpM2NfYnVzX2lkciwgaTNjYnVzLT5pZCk7
CiAgICBtdXRleF91bmxvY2soJmkzY19jb3JlX2xvY2spOwogICAgLi4uCn0KCkJlY2F1c2UgaTNj
X2NvcmVfbG9jayBhcHBlYXJzIHRvIGV4Y2x1c2l2ZWx5IHByb3RlY3QgdGhlIHN1YnN5c3RlbSBJ
RFIKKGkzY19idXNfaWRyKSByYXRoZXIgdGhhbiB0aGUgZHJpdmVyIGNvcmUgZGV2aWNlIGxpc3Qg
dXNlZCBieQpidXNfZm9yX2VhY2hfZGV2KCksIGNhbiB3ZSBzYWZlbHkgcGVyZm9ybSB0aGlzIGl0
ZXJhdGlvbiB3aXRob3V0IGhvbGRpbmcKdGhlIGdsb2JhbCBsb2NrIHRvIGF2b2lkIHRoaXMgaW52
ZXJzaW9uPwoKPiArCW11dGV4X3VubG9jaygmaTNjX2NvcmVfbG9jayk7Cj4gKwo+ICsJcmV0dXJu
IHJlczsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChpM2NfZm9yX2VhY2hfZGV2KTsKCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5
MDYyMDI3NDcuNDA0MTM4OS0xLXNhbWFnYXphcnlhbkBnb29nbGUuY29tP3BhcnQ9MgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
