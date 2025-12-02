Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1ADD12688
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 23:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/9V2BGCSdjjQYPlWdQ8VHIk7+NkE8zHlW96EGDelRo=; b=LV+XY8K0uaPhYC
	cgRXbXyHFsliYTt7M8Ngwupmjgf7KxpO2DPPdp5Jl0sOQ/XNXYZQ2MDzaKIzIKLQg5HSNSgcqz8g7
	e+Jub3G5jsmL+I4h/TKje77J2LackIZFwQDal9zhO6X8I2n+sT8RnVj4SwEskVLUAzB4goWqXK1X9
	xnY1xHWjdMM6vT4OiAgm1W/+iSqm+fjp99HyiHlPKBfuCtiQhuCqXMyUPtkUdlnQePqYXQY5D/ghm
	FDmXv51Lu90UJ95aOuKbfQxYGUQEy3f0K6RxYiV00JMBzedYzjB0VXLK7xcppZmOC6Y/ZkeSf84C4
	gV+XM5dQSyJN5XYASYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZcF-00000005vn1-0yck;
	Tue, 02 Dec 2025 23:17:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZc9-00000005vmG-29CS
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 23:17:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 01490C15D7E;
	Tue,  2 Dec 2025 23:16:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D169606D6;
	Tue,  2 Dec 2025 23:16:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C34FD103C8EA1;
	Wed,  3 Dec 2025 00:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764717414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=4ejK9vvuuZYHr7Cy6jfuXKRnJwX7YlvukXcTs/O/z/U=;
	b=VjG5jwcWVP5PIPuT+EtTS06m/+jY80Z4BLIziqD56jGK8AGcdx+bPxjBZkZ1vLuHTJS52E
	aubbdDZGVxxE2KMHFcPiYqQZXcjEP3yePX0YtnvVBIsdxMLHSzgQ5D05F4cYgg2GtaOqJN
	osda0yos+6J2/n087lmjFCodlHvzk9Gnu0WI01WvjqU4Ep7rXh14V+iQ09hOyq5zETVp5I
	R1mrMti/0uO2ekMTVYITjfG3JAHDWZEAzxp3RzhNAvu3JqqlQs7qIn9vEu6vxGz9PFMD0m
	CGm+0BvA3sF1xSddOoCE8y3F709sukTmyOA6ON3xq7ZqnOGEQcXYviOMiClw2Q==
Date: Wed, 3 Dec 2025 00:16:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i3c: master: switch to use new callback .i3c_xfers()
 from .priv_xfers()
Message-ID: <202512022316516aae2c3f@mail.local>
References: <20251027-i3c_xfer_cleanup_master-v1-0-e9bfcb083a38@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027-i3c_xfer_cleanup_master-v1-0-e9bfcb083a38@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_151659_541636_9C0A372B 
X-CRM114-Status: GOOD (  11.50  )
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

Hello,

This series need rebasing

On 27/10/2025 16:57:38-0400, Frank Li wrote:
> switch all controller driver use new callback .i3c_xfers() from
> .priv_xfers() and remove .priv_xfers() in framework.
> 
> This serise is base on
> https://lore.kernel.org/linux-i3c/20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com/T/#t
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (2):
>       i3c: master: switch to use new callback .i3c_xfers() from .priv_xfers()
>       i3c: master: cleanup callback .priv_xfers()
> 
>  drivers/i3c/master.c                   | 17 ++---------------
>  drivers/i3c/master/adi-i3c-master.c    |  8 ++++----
>  drivers/i3c/master/dw-i3c-master.c     |  8 ++++----
>  drivers/i3c/master/i3c-master-cdns.c   |  8 ++++----
>  drivers/i3c/master/mipi-i3c-hci/core.c |  8 ++++----
>  drivers/i3c/master/renesas-i3c.c       |  6 +++---
>  include/linux/i3c/master.h             |  6 ------
>  7 files changed, 21 insertions(+), 40 deletions(-)
> ---
> base-commit: f22e2617a331cf4800d6468cf0455db05a74c9a4
> change-id: 20251027-i3c_xfer_cleanup_master-cf75a712dc7c
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
