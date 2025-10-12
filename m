Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7043CCCD187
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Oct 2025 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zT3XuqhB9HmV4ZHxR0EXbQk2SokLCNK9jjZjWigGmu0=; b=nd64q9/lrxSb5+
	bzLGBCsruv6c/j5TYMnAyulUfJ6lWL351PdmZf5wrixFmWcL2wPCZWl0CmidpH+4p3x7tLn2/Px/M
	Y6o1e3pCLTIohz/CqBb0na0AJP2S1cqNptyAgZtek366s4HV/zPbFD8xjhGobQMWT3FtsgthKiLUn
	z8VareH5ty3rXUMpktOYN/OYOSR3dhftZFBqdl6fgJoI7jhwHb365Hm+Z7jrm29+7ptkYUNNmTMdE
	m6Y5SdA+MgLuumuZfaMmgJiDFSVo6GWZAKFWEQkbTdfd7gNLD8SO6Yq9PkNkUOsus02G7zOFmb85/
	J/50kVULKIx3bX/XgQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7zTx-0000000BZGF-0riZ;
	Sun, 12 Oct 2025 17:03:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7zTv-0000000BZG9-1yfV
	for linux-i3c@lists.infradead.org;
	Sun, 12 Oct 2025 17:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D5F86055A;
	Sun, 12 Oct 2025 17:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218E6C4CEF8;
	Sun, 12 Oct 2025 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760288618;
	bh=drlLQGlwLQo2pYW3pURe98GZgeWSVpXQQiStRl+tcvs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FEEDutV8crqRGBHnLSYU+7zC5L/vb02ZyzH38InOMP7klwj600fQPtjdnAea+l7Lu
	 D0A78tRChRSuHZmelmiysDNSBHE4+K7eF3TGRZrr4ydDDqV0CZBIY7IqNM/bFu5IT9
	 zRqR09CgmYEbIQoQDRx1+2NiiOGpavmaUdsUSkKdioFzsujuTfu9m84DumgCnGe/Ox
	 8ta3Uy3g4oW4yTSmnhDySLdL+Goch1dEdmPO++bmCgO14qD7lyvtdE49v9PalDziiy
	 zfYlRwK1c3BuziZXLNYEjgxoADov1UGRLGfIQqqPul2mRYgQlRUpKIZK80OFHjtEIp
	 W0hLwyT/jhDkg==
Date: Sun, 12 Oct 2025 18:03:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
 devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>, Adrian
 Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: Add basic HDR mode support
Message-ID: <20251012180327.5d94dda2@jic23-huawei>
In-Reply-To: <20251007-i3c_ddr-v5-0-444184f7725e@nxp.com>
References: <20251007-i3c_ddr-v5-0-444184f7725e@nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Tue, 07 Oct 2025 16:06:12 -0400
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

Whilst there will probably have to be a v6 for the ACPI ID issue in patch 5,
I'd like to ask the question of how are we planning to merge this?

Maybe an immutable branch either in IIO or I3C trees that the other one picks up?

It's a new driver so could gamble on taking the IIO driver the I3C tree but even
then I'd like a topic / immutable branch in case any IIO wide refactors or similar
hit this cycle.

Thanks,

Jonathan

> ---
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
> Frank Li (5):
>       i3c: Add HDR API support
>       i3c: master: svc: Replace bool rnw with union for HDR support
>       i3c: master: svc: Add basic HDR mode support
>       dt-bindings: trivial-devices: add MEMSIC 3-axis magnetometer
>       iio: magnetometer: Add mmc5633 sensor
> 
>  .../devicetree/bindings/trivial-devices.yaml       |   4 +
>  drivers/i3c/device.c                               |  27 +-
>  drivers/i3c/internals.h                            |   6 +-
>  drivers/i3c/master.c                               |  19 +-
>  drivers/i3c/master/svc-i3c-master.c                |  96 +++-
>  drivers/iio/magnetometer/Kconfig                   |  12 +
>  drivers/iio/magnetometer/Makefile                  |   1 +
>  drivers/iio/magnetometer/mmc5633.c                 | 579 +++++++++++++++++++++
>  include/linux/i3c/device.h                         |  34 +-
>  include/linux/i3c/master.h                         |   4 +
>  10 files changed, 745 insertions(+), 37 deletions(-)
> ---
> base-commit: 5248ab97a6dd1dc6856422f6b1595baaf4fa85ce
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
