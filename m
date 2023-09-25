Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1881ECE79A6
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 21:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OsIy3+UgV2XksBSi8WCdHAAvvcmsT6zUKXn+q4dLFc=; b=NalYkhOav4vFbW
	RrNcrmemgNoWd/oOVneB9dXmp7U2tZNBpQTQPueWH2pezPeY8kwhg2KOQhFTU2sThWl95CIEUL4r0
	ejCgOhWuGvqLe2iSa7KvijXG+syTW1rcK3Z7C3Q5Ika4bJwW4LE7SNpEZAjegvX5tWJUTV4tt9jRk
	ayKYbIqx0As+uXyhQmtrC9yNi8NslPnxB34RotY6iLnJL8qbMOtWGPW2B+6PzYGZ6GlcjXDXSEHRn
	I7qVfPr9mHuOVhU31oL55NcYzCgG9NGHU/XRYIEFgSkDpmlva1VJcwp7dHOkimvQHT3F9rynDMioZ
	VPAkG7a4zhHjz2sOywMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktFp-00F4N7-2d;
	Mon, 25 Sep 2023 21:36:33 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktFm-00F4L8-2a
	for linux-i3c@lists.infradead.org;
	Mon, 25 Sep 2023 21:36:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0D4E1BF204;
	Mon, 25 Sep 2023 21:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f2wGeLXAhYMiEQV6PFmquWY/Y7ZW7oHoV6lKqrItjsc=;
	b=hUusch+GfAF5Yy9LLsV7BGQUOgUfBF8BuHtGScU1AZvzg+MZj+T7RiT3XkqLdYWec4QIvq
	4PuJMapE5sP6X181rIbQcFfcF6H4g8hZi6WaBE7icYJ8DUCic9Msno6wgUQkg9sRcmo6on
	pJqYDSYCzzCOkMiwiLfLCBgKRMHHZXZwc3g+jybZHtVBBMiZTsL4bJnWl0GSLMQA31YnnO
	2VkRvsWMgwqBvzXgf4fvy0Psvi4NjlR1SUvEdZ0To6BjMKHAi0gxIv9cUWCJEZdm4YKTvt
	kLnRib8IMWgjOUlHq8XyTP6lUm9ZCi8c4tJ5LPkQqTcAmh/Eey8HqY64KNM4qA==
Date: Mon, 25 Sep 2023 23:36:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: pgaj@cadence.com, miquel.raynal@bootlin.com,
	Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/1] Cadence I3C Status Register Bit Mask Error
Message-ID: <169567773732.243402.3105216980564759261.b4-ty@bootlin.com>
References: <20230913031743.11439-1-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913031743.11439-1-joshua.yeong@starfivetech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_143630_982931_CF5529C5 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


On Wed, 13 Sep 2023 11:17:43 +0800, Joshua Yeong wrote:
> I3C ibirfifodepth and cmdrfifodepth field should read from status0 instead of
> status1. Update I3C slave macro.
> 
> Joshua Yeong (1):
>   i3c: master: cdns: Fix reading status register
> 
>  drivers/i3c/master/i3c-master-cdns.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> [...]

Applied, thanks!

[1/1] i3c: master: cdns: Fix reading status register
      commit: 4bd8405257da717cd556f99e5fb68693d12c9766

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
