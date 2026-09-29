Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5EDC9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rq7ZFYLpIjbc1iiXnCFcnl7+dBxMjcuQrVmeOkkMWXU=; b=422ohH29VGUvIA
	lIpW0tWFrIWpxELjJdslYhRpSKvugY6dvBPAll8OJrtc/f9cn588PE580/v7zBlnP1bhWwLYLPj5R
	GlzDEFaSLa6D5FnEtsAC/NQ7C1SIjvxcFl+VaA3YWx1iT2Hx/8E8P8motEx7Bbiu3TS+dFpqHvbGL
	a0muAbH/RD6c+21IJI7RZtfMmLsKCWX8VVpeI3VJ5uLaUuJK2XCCnk/rxrCv28gPbLLwkSNMsVDP0
	3LTins8KwgERggXgTAswZbFMMCdfOm9HyOFph8a36DsCqvXWzgkVlufeNq+GayJfFbWkz6QXlH/oy
	BgQxMYRRuMZx5NVXTBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRUl-00000002VnN-0Znj;
	Tue, 29 Sep 2026 06:39:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRUj-00000002Vn7-0Vvn
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:39:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 733D160A5F;
	Tue, 29 Sep 2026 06:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B6C1F000FF;
	Tue, 29 Sep 2026 06:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663956;
	bh=I5U0sXtR3w2jaTwAbtvqA6EKgKPWpEiqC6dQ6AT5K+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k8u1ODgTqiEqZojc/7MIa+HmnPRaYfqySzSmJ8pPYZuhM6QUpB+Swxado6SDPPMLZ
	 OOWP5j+C3keSdGUnaqBddDCN3R84GzZX6QrImEwKWkt+cUmQl0kjZMM+LlRuVTC3MX
	 lh0Rww+nIpqu8CicPMCwZvN6ELnOQQgrpNZAu5yqZABG4V2HF8rSgng36GzjIbFTj2
	 +4qApjomlArlXoxx/u7m3ytjP+Y48myg+HIttUF6W4JqHfcXh1QP9YyzleotLdZTXZ
	 BWeartKdWrbA29Yt/jt0P08+lPbC8QrDYhcyZVEHl6ED/6fk8fOxINNnx94ju1vqz9
	 ntCIIyrIQaJtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/20] dt-bindings: i2c: dw: Add Synaptics sl261x i2c
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-serial@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260929061417.20733-3-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-3-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:39:15 +0000
Message-Id: <20260929063915.B7B6C1F000FF@smtp.kernel.org>
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

PiBBZGQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBTeW5hcHRpY3MgU0wyNjFYIFNvQyBJMkMgY29u
dHJvbGxlcnMsIHdoaWNoCj4gYXJlIGNvbXBhdGlibGUgd2l0aCB0aGUgU3lub3BzeXMgRGVzaWdu
V2FyZSBJMkMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJu
ZWwub3JnPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNz
dWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjkwNjE0MTcuMjA3MzMtMS1qc3poYW5nQGtlcm5l
bC5vcmc/cGFydD0yCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MK
