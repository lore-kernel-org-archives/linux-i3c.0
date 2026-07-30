Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32793C55164
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 14:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXwjHM4XVV2GYrKHmPSzLseVDL/tiF94As10+PQm1aM=; b=jGuRsunXIXVHlq
	2gjSMgVpJ+22XPumtUf6BU+4IbYZPhZXcwAi8ulL2287xP5Qmm+K8PLcMjeLXK0HwLkU7g5S3fjr9
	29jUoBAq8RF5yu+gqYFBp5oHO1ZihwCbLbLfcW8O9UFxI7OAmTdrhmpKVy6BFgEE38qOvTxUOcgax
	W3EME64nAfocbG2o1BFBzgoKnHCzZirg1A42YbkVb8ywy8iF4lnE5NNHW2xZoAsgoPWUKzve0ihSP
	oI+yq2l3Qo6sTATPPqcEFddR5acB15VKvUOLO1O8Z3JfbmFMmYxsJuCkrz9yrcoaoAgUtDRs7h+WU
	Ba1IAGZKdVFrQdfqY8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpS2s-0000000Amrh-3iOH;
	Thu, 30 Jul 2026 14:47:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpS2p-0000000Amqq-3Isx
	for linux-i3c@lists.infradead.org;
	Thu, 30 Jul 2026 14:47:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B53C4E40F47;
	Thu, 30 Jul 2026 14:47:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E035602B8;
	Thu, 30 Jul 2026 14:47:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E22B11C15D1D;
	Thu, 30 Jul 2026 16:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785422848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=feo9Jm3yXHIvrDKdw9TVOwnY48iBlHT3LyvIl0cmFHs=;
	b=jIqslaInDWAKhi+AQIcTTOUrtzN3b7rVfdOvEHSerw9G1op2Myk24dQ15aIPy/5uv3s0ZA
	mqqDSB7IKincE+fTwIk9eC/9o7E6Jz2Gid8wz18VLbaoXsywjLGKDKQZNaTO/6lfjidKk1
	0i1dgdPjzv1GAcpzXKY4h3/FWHZQ3AiT8uhBt0F4YE8mID+PwBPhlgn/7lG3cvprb45Lsx
	k+lGrM/z3C6oCOPdXz5AKGOr8vIrQkpUvpmgKKzrIJ/amo7YOWEIRGU6rzD1x7o/uD8+6l
	915Za/OqryNNTeokikDUHUFA2kJ0YEU1nkgj94KmW7mcJeEGGSxkf9w9qVjMGQ==
Date: Thu, 30 Jul 2026 16:47:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	Frank.Li@nxp.com, Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2] i3c: renesas: Drop unused structure member 'resuming'
Message-ID: <178542283972.1795404.2499723599356198654.b4-ty@b4>
References: <20260721191618.1850795-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260721191618.1850795-1-claudiu.beznea+renesas@tuxon.dev>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_074735_967882_0C54BD06 
X-CRM114-Status: UNSURE (   5.41  )
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

On Tue, 21 Jul 2026 22:16:18 +0300, Claudiu Beznea wrote:
> The struct renesas_i3c::resuming is a leftover from a rebase. It is not
> used anywhere within the driver. Drop it.

Applied, thanks!

[1/1] i3c: renesas: Drop unused structure member 'resuming'
      https://git.kernel.org/i3c/c/279a9de1bb1b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
