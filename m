Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E70E937E4
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fer8xHijKVE3yclJKt7GUGY4jz+Vh9oEbjugWZCR1Us=; b=3n70+oAX0HLEfN
	/J8m+1fEgbyAPiW4OiEqvTpSJ8418GM9FYuDeBsSVSNUDU8Cuh7W4cvSOQ6YGohV73nJ1Y3VI3OJo
	8IYMp4kmlm0OshLgvJywoGDrZ+1cDebB8pqmbFPVnLtjPUP+LGOcLVuUlnXGudld+gabg2hqW7ap0
	FsSboKUUrH4NAYS0jRM4xck1So401oiKEg99Ra0J5zWTEO8WtVsg0tRqkpQTBbbK1a4QMHUDkkbEb
	zoB7c3ApceJQoU10EI2w4rM0wERttSf3QvnR/acKq7kxYAM7TDCjb/eLW28s0buYo5WCCk2h5Qs66
	UWctuS5d3X+VgYn9tG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvyK-0000000EOhT-2BHr;
	Sun, 12 Apr 2026 14:39:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvyH-0000000EOgB-3z50
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 14:39:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 50AB24E42964
	for <linux-i3c@lists.infradead.org>; Sun, 12 Apr 2026 14:39:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 264615FFB9;
	Sun, 12 Apr 2026 14:39:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74AD910451B8E;
	Sun, 12 Apr 2026 16:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776004771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hWFIOejcuhQvzDku/L8qRYOm+1/NEX9AoIMh+TRZ4e0=;
	b=hqZWyHGOyrOH65PXl5cwY5SjxTjY182lETdYcPOJCtQ4XW8aVnn7+UDeWAsqCx0+Lny3Gx
	/+uQuHLSDsOVGfR67LuQqnOUoRWE2oTCRQzpSook5O9tCtao8IoBRtFAjVORIag8zvqOFU
	3sYdkK9hfjo8ydWD2ETtCvyjz01pNfPsQUPUXMiU03qEhXHhQCmUYMPgE2FtIw7teIQneW
	XFGHx5aP71Vfx7B7vc71viPz/njTprSvoW3cqlub4hMEZW8y6mC7TI/NPHwwe7rO+YAiaN
	yQ2n/8upp8ZGIGxvblfsfe3YC3H/mpibTSeLVRwOyGb290eCi4aChVJDF8pH3Q==
Date: Sun, 12 Apr 2026 16:39:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Aniket <aniketmaurya@google.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i3c: master: dw-i3c: Fix missing reset assertion in
 remove() callback
Message-ID: <177600475243.2784942.15371518202236531894.b4-ty@b4>
References: <20260320-dw-i3c-v3-1-477040c2e3f5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260320-dw-i3c-v3-1-477040c2e3f5@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_073934_152262_683837B6 
X-CRM114-Status: UNSURE (   6.98  )
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

On Fri, 20 Mar 2026 22:18:02 +0800, Felix Gu wrote:
> The reset line acquired during probe is currently left deasserted when
> the driver is unbound.
> 
> Switch to devm_reset_control_get_optional_exclusive_deasserted() to
> ensure the reset is automatically re-asserted by the devres core when
> the driver is removed.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: dw-i3c: Fix missing reset assertion in remove() callback
      https://git.kernel.org/i3c/c/bef1eef66718

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
