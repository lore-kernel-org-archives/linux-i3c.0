Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F8CD31A28
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0YTZ/lVpY8vMamwDrEg7C8L2z1zq0r3BJ9b12gR/so=; b=GEInH0DHryUj2G
	ovpwC/C7T5mAqTegcHzAteLPZlg2pftEa0foCkiZSbnZUbxftUy6w0ivFbGgqQdsR5Nihmy3q2ZOb
	xo7pZgXoKI/qGSNt2qE5mAUoeErqWBqNlZDZ5GlFM9a53sLZjkaM2YR+/KteCcz4GkXW4Bg/X/rWq
	vtFGPdBs3QHg1OawQEPrbkFvD4H4KJ9ZM7lSnEa9dSguH3Gy/JIVmikKdmoPWilKV21RQs3B+fgzd
	73o1FOHGdoEsWy6EBL+1VU6VHTC7038u4dVd5hM0ErBUgw06Lpp1jsoa1Cfoaequ5IuTCcHbjKBWm
	CLI4vXC1Qfloq4KnYyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwGl-00000008LME-2RVI;
	Wed, 14 Jan 2026 08:30:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwGj-00000008LLS-1Uip
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 08:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A427043510;
	Wed, 14 Jan 2026 08:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1194C16AAE;
	Wed, 14 Jan 2026 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768379420;
	bh=vklD5dgHR8fE9oJ8NWm7S/QeQyUS1dHDszF/PFoFAXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3y4qzZFTpfySEbSb7bEs6OslrJFG0dF/AKeEQewpA5KEuXINup2qw3MF5BKSItX4
	 +FKfB7ks19iZRN8LS8vRRKEMtFeZ/g7mRT8jMFl8bkRHJejCpBk4gGH1ozqEOCCR8U
	 twZBHExlXfxlRsviVTRhxM9Kdd7qq5QYYAvJnmRF28uVzWk2vXisimylb6OvkoYIPZ
	 zNeWRPhE+Os2hfL378vsq4Lr0k8SIQdxNW737oO7eqa/0GpRIDqOa8Yd/Eku+O4hkN
	 4sjWQuN2xtuc7NyUXTim3Nk4xw2PRk/V4nlKqg2JpSsvYQ7f/OwY7N1XZkCu9be1Zj
	 BYrDoKDLUB8ug==
Date: Wed, 14 Jan 2026 09:30:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, Frank.Li@nxp.com, 
	lgirdwood@gmail.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v4 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <20260114-tireless-dexterous-starling-f559dc@quoll>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
 <20260113114529.1692213-5-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_003021_449600_38AED717 
X-CRM114-Status: GOOD (  16.80  )
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

On Tue, Jan 13, 2026 at 01:45:29PM +0200, Aman Kumar Pandey wrote:
> Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
> These devices support downstream target ports that can be configured
> as I3C, I2C, or SMBus.
> 
> This driver enables:
> - I3C/I2C communication between host and hub
> - Transparent communication with downstream devices
> - Target port configuration (I3C/I2C/SMBus)
> - MCTP device support
> - In-band interrupt handling
> 
> P3H2440/P3H2441 support 4 target ports;
> P3H2840/P3H2841 support 8 target ports.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
> Changes in v4:
>  - Split the driver into three separate patches (mfd, regulator and I3C hub) 
>  - Added support for NXP P3H2x4x I3C hub functionality
>  - Integrated hub driver with its on-die regulator
> 
> Changes in v3:
>  - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator
> 
> Changes in v2:
>  - Refined coding style and incorporated review feedback
>  - Updated directory structure
>  - Revised logic for parsing DTS nodes
> ---
> ---
>  MAINTAINERS                              |   4 +
>  drivers/i3c/Kconfig                      |   1 +
>  drivers/i3c/Makefile                     |   1 +
>  drivers/i3c/hub/Kconfig                  |  10 +
>  drivers/i3c/hub/Makefile                 |   4 +
>  drivers/i3c/hub/p3h2840_i3c_hub.h        | 348 +++++++++++++++++++
>  drivers/i3c/hub/p3h2840_i3c_hub_common.c | 425 +++++++++++++++++++++++
>  drivers/i3c/hub/p3h2840_i3c_hub_i3c.c    | 351 +++++++++++++++++++
>  drivers/i3c/hub/p3h2840_i3c_hub_smbus.c  | 418 ++++++++++++++++++++++
>  include/linux/i3c/device.h               |   1 +
>  10 files changed, 1563 insertions(+)
>  create mode 100644 drivers/i3c/hub/Kconfig
>  create mode 100644 drivers/i3c/hub/Makefile
>  create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
>  create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
>  create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
>  create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4bcd52d65f1a..659a1132aa6c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18931,12 +18931,16 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c-owner@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml
> +F:	drivers/i3c/Kconfig
> +F:	drivers/i3c/Makefile

From where did you get such pattern? Which other entries look like this?
Why are you doing something completely different than entire (ENTIRE!)
community?


> +F:	drivers/i3c/hub/*
>  F:	drivers/mfd/Kconfig
>  F:	drivers/mfd/Makefile
>  F:	drivers/mfd/p3h2840.c
>  F:	drivers/regulator/Kconfig
>  F:	drivers/regulator/Makefile
>  F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
> +F:	include/linux/i3c/device.h
>  F:	include/linux/mfd/p3h2840.h

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
