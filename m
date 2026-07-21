Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ACAC44529
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bNUtbTSoBkAjJNEDEAWyK9xUUUJ1WFUSEJbKZ1HCcw=; b=ZMNAtDuDh3jorJ
	jqR2wjbJ++vm8cCmYHoqY5yKExB2YgyXq3yQgaoUOQEN+nABrYoOwdlgbkaOyCQeL+kEA17MMhbfP
	XHAgdl09ccCRmsrU5dJeKZTCW+r5xrExGLhqMisBVs/WnsjBAwGNbgkGE3tGtOcqI35CDCjvutq4K
	T91IfBL7MwfhkubuS0BqSNAAJDSLau3RaYsltYFB43QY4wilRA8D1VFVVuI9MdJcVxOVAUdNJtPWi
	0P/ZuWa3XE+C/HckUj0LdbBMwyhaRbESfmUnDlz+jEDMPES1hF0q2fe0p5o01o6WTcg9JeoqGPYso
	BS/bh/0TJMT7AlOsSLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm25o-00000008NrE-0SvA;
	Tue, 21 Jul 2026 04:28:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm25n-00000008Nr5-24QH
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:28:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A03360A7A;
	Tue, 21 Jul 2026 04:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3331F000E9;
	Tue, 21 Jul 2026 04:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784608109;
	bh=FZw7pIg/LDfDyt/lhCm7JiguQ/YyI1pHEVAYl5e8WYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XMNH6k6v3x/BUp/NOHOzEeakMZG7vQp8H6uL0+qi3yDFRI2HQoMI5xq5d89f0i/b3
	 1BiUJyMhlCo0RBRXWMNF3LhvyH6UhSysgkJMCnqeDB/1z0aGoRjJtzCT7TvxmC6uNX
	 HwAsb37ALIrmIkiLH4hxvMO22H3xzUOsKRYW8+DmbJyv3w4rcc57Ph4Vfw+0k9rR0o
	 Myg/ZRFhFtWQwdXrwhvtKOmYeyLixoICWefRBCawAjfEbwrwYT7JapcLACOahCnCcB
	 4hufhJm4Lyd0TD2i60A83GB0ck1v4XXCmjFBKFvql6zVEBrQBZ+kjNKg7HHHx/jpr2
	 COGbofLwHwYYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260721040805.1696503-13-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-13-akhilrajeev@nvidia.com>
Date: Tue, 21 Jul 2026 04:28:28 +0000
Message-Id: <20260721042829.4E3331F000E9@smtp.kernel.org>
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

PiBFbmFibGUgSTNDIHN1YnN5c3RlbSAoSTNDKSwgU3lub3BzeXMgRGVzaWduV2FyZSBJM0MgbWFz
dGVyIGNvbnRyb2xsZXIKPiAoRFdfSTNDX01BU1RFUiksIGFuZCBTUEQ1MTE4IGh3bW9uIHRlbXBl
cmF0dXJlIHNlbnNvciAoU0VOU09SU19TUEQ1MTE4KQo+IGFzIG1vZHVsZXMuCj4gCj4gVGhlIE5W
SURJQSBWZXJhIENQVSB1c2VzIFNPQ0FNTSBMUEREUjVYIG1lbW9yeSBtb2R1bGUsIHdoaWNoIGNv
bnRhaW5zCj4gU1BENTExOCAoSkVERUMgSkVTRDMwMCkgY29tcGxpYW50IHRlbXBlcmF0dXJlIHNl
bnNvci4gVGhpcyBzZW5zb3IgaXMKPiBhY2Nlc3NpYmxlIG92ZXIgdGhlIEkzQyBidXMgdGhyb3Vn
aCB0aGUgRGVzaWduV2FyZSBJM0MgY29udHJvbGxlciBwcmVzZW50Cj4gb24gdGhlIFNvQy4gRW5h
YmxpbmcgdGhlc2UgY29uZmlncyBhbGxvd3MgbW9uaXRvcmluZyBtZW1vcnkgbW9kdWxlCj4gdGVt
cGVyYXR1cmVzIG9uIHBsYXRmb3JtcyBzdWNoIGFzIFZlcmEgUnViaW4uIFZlcmEgaXMgYW4gQUNQ
SS1iYXNlZAo+IHBsYXRmb3JtIGFuZCBkb2VzIG5vdCB1c2UgZGV2aWNlIHRyZWUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFz
IHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQh
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNzIxMDQwODA1LjE2OTY1MDMtMS1ha2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9MTIK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
