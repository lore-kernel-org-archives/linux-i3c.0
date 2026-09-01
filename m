Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F15EC61DD3
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Sep 2026 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSFBN0+xXELLxG6oqa6OAtHHqHh7gwSO1R7DMrS+5nA=; b=3k7L1zPz1HOLWl
	iGbIqBA+dXCfI8Bn4+RXp4KxgV7huxvaSpoMX4ZtWbnFkSHvTUoqjuQDmeFrczhxQkuHFKaOfxuG8
	w40k8whAWskLnGet378olpf4ej6hRdT9mWJL55gN6e+d4umK7wXBB6QAWKkuagtgL53bd5dn+CrUA
	Hip2SgQUu1pVj1Jyl+eJYtajDrdJTRgGnJMW3TmQ4XtlyGAK77nndVmQc770YQBkki1MnQ5fwDXB+
	76DKArrsz3nwtwGnpOo4IvqBABoOjTEXGULCSyhE29va0PHXgxeA0lLtCGXsmivfWz3k5dlwfbr3C
	qbTTgJViYwaug7HkUV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MzG-0000000BjV4-0eIM;
	Tue, 01 Sep 2026 11:49:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MzD-0000000BjTS-3OOO
	for linux-i3c@lists.infradead.org;
	Tue, 01 Sep 2026 11:49:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F91342BC6;
	Tue,  1 Sep 2026 11:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CE71F00A3E;
	Tue,  1 Sep 2026 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788263345;
	bh=t8CB3Kr/s6Z9zrGxkkQwOcxU2ceXbA4biiHcngD+pOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ce/2BhlFYPNucqXHXAC8kDGbpZEp1JoxA5fLfg2coPSEDQh4veP/QnVUXt2UWasJN
	 Rhb2moK8Dxl4lM4wuAmLymbJhkaBDxOSWhjFqSKEIzPTdsuGiS4nAKhsLUbo2kxD2y
	 HxhV/3pqYXa4koe0rbbPIJxp0I+uXdpzTbkyKOCBAQ5L28NOlvUAwqhTVoI3u6vXlw
	 DbeAFJUEZ0GERcteIHE8Sv807MSgp1MIZ/ixltl4bTi0w50zXyzebWY9IqwVqRL7c3
	 W+CCj/4C3ai42i82YICEDNSeRcdR0RzOwmKLNc97/8Q4qv6ZlNW6koS/ugo/NSyXoy
	 fGcWO7DNnoa4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] i3c: mipi-i3c-hci: Support address-indexed DAT
 slots
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-2-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-2-19909e7cbd7e@aspeedtech.com>
Date: Tue, 01 Sep 2026 11:49:04 +0000
Message-Id: <20260901114905.10CE71F00A3E@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIG1hY3JvIGBIQ0lf
REFUX0FOWV9BRERSRVNTYCBpcyBkZWZpbmVkIGJ1dCBuZXZlciB1c2VkLgotLQoKY29tbWl0IDhl
YmUyMzNhMWYyMjBkY2ZmN2EyOGE3NzlmNzg3ZjhiNjNlYTE3ODcKQXV0aG9yOiBCaWxseSBUc2Fp
IDxiaWxseV90c2FpQGFzcGVlZHRlY2guY29tPgoKaTNjOiBtaXBpLWkzYy1oY2k6IFN1cHBvcnQg
YWRkcmVzcy1pbmRleGVkIERBVCBzbG90cwoKVGhpcyBjb21taXQgaW50cm9kdWNlcyB0aGUgSENJ
X1FVSVJLX0RBVF9JTkRFWF9JU19BRERSIHF1aXJrIHRvIHN1cHBvcnQKQVNQRUVEIEkzQyBjb250
cm9sbGVycy4gQ29udHJvbGxlcnMgd2l0aCB0aGlzIHF1aXJrIGFsbG9jYXRlIERBVCBzbG90cwpi
YXNlZCBkaXJlY3RseSBvbiB0aGUgZGV2aWNlJ3MgNy1iaXQgYWRkcmVzcyBpbnN0ZWFkIG9mIHVz
aW5nIHNlcXVlbnRpYWwKREFUIHNsb3QgYXNzaWdubWVudHMuCgpbIC4uLiBdCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2RhdC5oIGIvZHJpdmVycy9pM2Mv
bWFzdGVyL21pcGktaTNjLWhjaS9kYXQuaAo+IGluZGV4IDY4ODFmMTlkYTc3ZjIuLmQ0YzdiMDM3
MjRkMzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9kYXQu
aAo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvZGF0LmgKPiBAQCAtMTQs
MTIgKzE0LDEzIEBACj4gICNkZWZpbmUgREFUXzBfSTJDX0RFVklDRQkJVzBfQklUXygzMSkKPiAg
I2RlZmluZSBEQVRfMF9TSVJfUkVKRUNUCQlXMF9CSVRfKDEzKQo+ICAjZGVmaW5lIERBVF8wX0lC
SV9QQVlMT0FECQlXMF9CSVRfKDEyKQo+ICsjZGVmaW5lIEhDSV9EQVRfQU5ZX0FERFJFU1MJCSgo
dW5zaWduZWQgaW50KS0xKQoKW1NldmVyaXR5OiBMb3ddCklzIEhDSV9EQVRfQU5ZX0FERFJFU1Mg
aW50ZW5kZWQgdG8gYmUgdXNlZCBpbiB0aGlzIHBhdGNoIHNlcmllcz8gVGhpcyBtYWNybwppcyBk
ZWZpbmVkIGhlcmUgaW4gZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9kYXQuaCBidXQg
bmV2ZXIgcmVmZXJlbmNlZAphbnl3aGVyZSBpbiB0aGUgY29kZWJhc2Ugb3IgaW4gdGhlIHJlbWFp
bmRlciBvZiB0aGUgcGF0Y2guIElmIGl0IGlzIHVudXNlZCwKY2FuIGl0IGJlIHJlbW92ZWQgdG8g
cHJldmVudCBkZWFkIGNvZGU/CgpbIC4uLiBdCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAxLWI0LWkzYy1oY2ktYXN0MjcwMC12
MS0wLTE5OTA5ZTdjYmQ3ZUBhc3BlZWR0ZWNoLmNvbT9wYXJ0PTIKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
