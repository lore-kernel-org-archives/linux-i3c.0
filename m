Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8684CCFA02
	for <linux-i3c@archiver.kernel.org>; Sat,  1 Nov 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzkDty3NEb9usZuwwgd6X97QO376sGlo4tOtov2uS1Y=; b=DSUzjEiFsfLpgM
	Gh0zW4hrcBVTl+yAdEnAla18tT4fQvcgWaeaCouKJchypp7NhzPj1YK0IQXtC7iIbZNHrxmJ5Pxd/
	zXszbY8C1u+jst2PRizlUorHmUNXGn7wPZe+cL/cGOTRIbfdWXgSZqA8wt/SjRnZ6uO4NPqA5Eq8a
	aOMb5GfX6146wZC+LJdiUMRA2uTYU8klFRr4Kd0jhrN902M6UodaTud3DlLU7FCvWBtthw1YoCcDk
	vpePlwqP8bzGlHGaX+q7yT/n9rr4keImQFcyJHAIPdXNepy7be+UQ3bHJls4Kh+lBkoxwor/Wkwr0
	D8kf5wACiMj7689fdfUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEQ7-00000007vhK-1ryg;
	Sat, 01 Nov 2025 16:25:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEQ4-00000007vgv-30U3
	for linux-i3c@lists.infradead.org;
	Sat, 01 Nov 2025 16:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 971944043E;
	Sat,  1 Nov 2025 16:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7BBC4CEF1;
	Sat,  1 Nov 2025 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762014335;
	bh=SRbrrNLlJ5lCbs8a/4PWMzoJ6nWZ1XkxIIFLmPdvMh4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ND0y+nybUBovBHJJGQhF0YDfxfAQZWjjCD6xEBXDM+C2f+k06RTyJrp54kXqb+6yZ
	 2toHnjxWY10D7gZKaO63DhrOcx3VSiZsYMbAI8RlSO6hSJrN0gsJl07GlrRTExg5Mm
	 fzBBu15ZEew41apW9f7pH5kzZL7iObKgrvwJ/0bfyV/CARe+rKha1pHvEBltcZ/ANf
	 7sWljTmDpl4gcDF+kYoA0ziyG4euiz0gY/CWUYU93eWJTEsYdrQy0P55tv4NqXpRlX
	 439sQAld8HajfvUaez574QXfnUKEHq2I3evrRUGYoxGa0igT7fQU/pCFBH0rI/KLf6
	 AmZpG7/srIDMw==
Date: Sat, 1 Nov 2025 16:25:25 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
 devicetree@vger.kernel.org, linux@roeck-us.net, Carlos Song
 <carlos.song@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Adrian
 Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v9 0/6] i3c: Add basic HDR mode support
Message-ID: <20251101162525.44c9862b@jic23-huawei>
In-Reply-To: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_092536_802553_D8F48931 
X-CRM114-Status: GOOD (  17.96  )
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

On Fri, 31 Oct 2025 12:39:12 -0400
Frank Li <Frank.Li@nxp.com> wrote:

> Add basic HDR mode support, only support private transfer, not support
> CCC command.
> 
> Update i3c framework API to allow pass down mode and extend driver callback
> function.
> 
> Implement HDR transfer in svc i3c master driver.
> 
> Simplifed HDR flow is (ref i3c spec line 5514) Figure 129
> 
> <--              SDR            ---> | <--- HDR
> START 0x7E RnW(0) ACK CCC(ENTHDR0) T   HDR-CMD(00-7f write, 80--ff read)
> 
>                                     ----> |  
> HDR-DATA HDR-CRC HDR-RESTART .... HDR-EXIT
> 
> Note: HDR-CMD is 16bit data, which included 7bit slave address and 8bit
> read/write command.
> 
> svc hardware can auto issue SDR part.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Hi. Assuming everyone is happy with this version, the next question is how
we expect to merge this. I think someone (either myself or Alexandre most likely)
probably needs to spin an immutable branch with the i3c parts in it.

Then we can merge that into both trees and I can apply the driver on top.

Jonathan

> ---
> Changes in v9:
> - remove reducated check for ops->priv_xfer.
> - improve mmc5633 (see patch's change log for detail)
> - Link to v8: https://lore.kernel.org/r/20251028-i3c_ddr-v8-0-795ded2db8c2@nxp.com
> 
> Changes in v8:
> - Add cleanup patch replace framework's i3c_priv_xfer with i3c_xfer
> - Link to v7: https://lore.kernel.org/r/20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com
> 
> Changes in v7:
> - add explicit define for I3C_HDR_*
> - add missed include files.
> - detail see each patches' change log
> - CONFIG_DEBUG_ATOMIC_SLEEP=y
> - Link to v6: https://lore.kernel.org/r/20251014-i3c_ddr-v6-0-3afe49773107@nxp.com
> 
> Changes in v6:
> - remove acpi part
> - collect Conor Dooley ack tags
> - Link to v5: https://lore.kernel.org/r/20251007-i3c_ddr-v5-0-444184f7725e@nxp.com
> 
> Changes in v5:
> - Just realized missed CC mail list devicetree@vger.kernel.org and resend
> - Link to v4: https://lore.kernel.org/r/20251007-i3c_ddr-v4-0-3afea5105775@nxp.com
> 
> Changes in v4:
> - use master's hdr_cap to check HDR cap.
> - add mmc5603 support.
> - Link to v3: https://lore.kernel.org/r/20250930-i3c_ddr-v3-0-b627dc2ef172@nxp.com
> 
> Changes in v3:
> - Add new patch for change rnw to union for svc.
> - Detial changes see each patch's change log.
> - Link to v2: https://lore.kernel.org/r/20250924-i3c_ddr-v2-0-682a0eb32572@nxp.com
> 
> Changes in v2:
> - Add sensor driver, which use HDR mode read/write data.
> - change priv_xfer to i3c_xfer.
> - Link to v1: https://lore.kernel.org/r/20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com
> 
> ---
> Frank Li (6):
>       i3c: Add HDR API support
>       i3c: Switch to use new i3c_xfer from i3c_priv_xfer
>       i3c: master: svc: Replace bool rnw with union for HDR support
>       i3c: master: svc: Add basic HDR mode support
>       dt-bindings: trivial-devices: add MEMSIC 3-axis magnetometer
>       iio: magnetometer: Add mmc5633 sensor
> 
>  .../devicetree/bindings/trivial-devices.yaml       |   4 +
>  drivers/i3c/device.c                               |  27 +-
>  drivers/i3c/internals.h                            |   6 +-
>  drivers/i3c/master.c                               |  19 +-
>  drivers/i3c/master/svc-i3c-master.c                | 115 +++-
>  drivers/iio/magnetometer/Kconfig                   |  12 +
>  drivers/iio/magnetometer/Makefile                  |   1 +
>  drivers/iio/magnetometer/mmc5633.c                 | 598 +++++++++++++++++++++
>  include/linux/i3c/device.h                         |  42 +-
>  include/linux/i3c/master.h                         |   4 +
>  10 files changed, 784 insertions(+), 44 deletions(-)
> ---
> base-commit: df05ef50ada6a8e2fe758adf1b8fa35eea801b2d
> change-id: 20250129-i3c_ddr-b15488901eb8
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
