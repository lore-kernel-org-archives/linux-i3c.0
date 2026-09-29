Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE26CA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3e8Bn0/KzDHyNi2no7Dm3CmMjfLQwJU5tZpV4S3R5U=; b=4xlOWhifMer90Q
	1S1PiaQrwjHF2t3sAnHIjvp6gHF7KD7rA6535ofu9+wuZin16C1J4YkTZ8oetnpTiTxmqSK4PwoOj
	1Lx6EpeZUF0Nbi3DMGL5vzDw5MaPZU3qevlbI0jHmxasHv+esrg5xkYgusKpT1fPOUMMq/QcklcG5
	dFB5p/H4WG0Z8AFNayqiHRSIQPkMbpiYCsCLuKaCBiQIYKkgiLaA4hAnIdApDijXvxYZF+tjm2RqP
	2oITdaeTWVbGIVpz8svdYd+SJhADGgcA769bie2fpNWjsd+ZblrRXQNFJM//qKuI1d5falma+p4O/
	vsaOTuswYTN9SZigHacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRXR-00000002W7d-3tmT;
	Tue, 29 Sep 2026 06:42:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRXR-00000002W7U-0jjY
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:42:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D56A602CA;
	Tue, 29 Sep 2026 06:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A2F1F000FF;
	Tue, 29 Sep 2026 06:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664124;
	bh=2N7jDM+9hFYnb48ukyAiHHWnpDNVGGJi1n6b/5syDm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n6UJ7g4OgPgCm0SpXm1g34MxjN7OH8/r+0kD2ipg9qc2zyWqMXJu4+3mthplwY6Mo
	 KYmDZNK3wGCA8KtXqtIpvEM62SYHa4OvzPIIcYlIbCoVLFGePizKfYuBET7sFvdGeP
	 GY2JnxG5lvSyrKAG7LLoMHBnB37S/mOowCUdr7UXToiH0ey5fOop+QBullSE+4aWUc
	 fNJD8l5O4Gw12ndv3in5qBWsDP5yXzOjxhBmKGGOO9gD7uFCIYvgphsQ4XAQfOZxwJ
	 xo6KktMyMXQnyqUojrCcRad5iC+FWvs+LZUc/Bxtwblg6KtJWJAEXP3WeCWuKod74C
	 wqc2+fLIR9pWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/20] dt-bindings: reset: add Synaptics SL261X SoCs
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, lee@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-clk@vger.kernel.org
In-Reply-To: <20260929061417.20733-9-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-9-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:42:03 +0000
Message-Id: <20260929064203.B8A2F1F000FF@smtp.kernel.org>
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

PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSByZXNldHMgb24gU3luYXB0aWNzIFNM
MjYxWCBTb0NzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2Vy
bmVsLm9yZz4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlz
c3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0BrZXJu
ZWwub3JnP3BhcnQ9OAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
