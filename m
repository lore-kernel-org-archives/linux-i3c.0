Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB9DCD98ED
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jun 2026 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBaxLPjuyOG6ess93nNZfXuCfqg/AHDGZATti1jWNs4=; b=ziNSp1lhxkp5pl
	DKKDo7yAeCb4gJIn0zEvnI+ZKenYwkN+Uadh4mN+ZPBgtxBpRhjgX/Ozi8sWsdZO431lk81pMK+6q
	SU+4MMlDHLZq3K9HnCKpwKl7Rat5yBR34hQmb1aG8+MIrwFNMok3ytPvVSUZDcM6AwvUAbHMkb5E+
	20Yd1ibcD/6JZZjPJmK5CBzHgoQkcJp0srpiiNjy6dLiysZve5pQCKVJdHiMx5cKqYZcb8iCgMayb
	+1C8wdAVP3blgrL8TH+qDlZK8LXLLd2mW+XxCzwmP9qrsFzMfdo4e3JHEtxZbplB7x4LXXwWHIrkU
	pcqB2Toh1JvGJVvrCxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCY3-00000001Kiw-2BCJ;
	Thu, 18 Jun 2026 13:12:47 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCY0-00000001KiO-16Fm
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jun 2026 13:12:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5440220071A;
	Thu, 18 Jun 2026 15:12:41 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1waCXx-003RXD-0m;
	Thu, 18 Jun 2026 15:12:41 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1waCXx-00000000B3O-0Xsr;
	Thu, 18 Jun 2026 15:12:41 +0200
Message-ID: <b84c8940187da3a493c8334bb50a992be7553092.camel@pengutronix.de>
Subject: Re: [PATCH v4 08/12] i3c: dw-i3c-master: Add a quirk to skip clock
 and reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil R <akhilrajeev@nvidia.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Guenter Roeck <linux@roeck-us.net>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding	
 <thierry.reding@kernel.org>, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 18 Jun 2026 15:12:40 +0200
In-Reply-To: <20260616095429.3947205-9-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
	 <20260616095429.3947205-9-akhilrajeev@nvidia.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_061244_451171_8BD6410D 
X-CRM114-Status: GOOD (  25.00  )
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

On Di, 2026-06-16 at 09:54 +0000, Akhil R wrote:
> Some ACPI-enumerated devices like Tegra410 do not have clock and reset
> resources exposed via the clk/reset frameworks. Unlike device tree,
> ACPI on Arm does not model such provider functions. The hardware is
> expected to be brought out of reset and have its clocks enabled by the
> firmware before the OS takes over. Any data to be shared with the OS is
> passed using the _DSD property.
> 
> Add match data for such devices to skip acquiring clock and reset controls
> during probe and read the clock rate from the "clock-frequency" _DSD
> property. Note that the "clock-frequency" here is the controller's core
> clock and not the bus speed. I3C specifies the bus speed separately using
> "i3c-scl-hz" and "i2c-scl-hz" and hence this should not cause any conflict.
> 
> Also, move match data parsing before clock/reset acquisition so the quirk
> is available early enough.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 66 ++++++++++++++++++++----------
>  1 file changed, 44 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 3e510fddf06c..a2a4b88c2017 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -242,6 +242,7 @@
>  /* List of quirks */
>  #define AMD_I3C_OD_PP_TIMING		BIT(1)
>  #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
> +#define DW_I3C_ACPI_SKIP_CLK_RST		BIT(3)
>  
>  struct dw_i3c_cmd {
>  	u32 cmd_lo;
> @@ -556,13 +557,28 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  }
>  
> +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
> +{
> +	unsigned int core_rate_prop;
> +
> +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
> +		return clk_get_rate(master->core_clk);
> +
> +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop)) {
> +		dev_err(master->dev, "missing clock-frequency property\n");
> +		return 0;
> +	}
> +
> +	return core_rate_prop;
> +}
> +
>  static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  {
>  	unsigned long core_rate, core_period;
>  	u32 scl_timing;
>  	u8 hcnt, lcnt;
>  
> -	core_rate = clk_get_rate(master->core_clk);
> +	core_rate = dw_i3c_master_get_core_rate(master);
>  	if (!core_rate)
>  		return -EINVAL;
>  
> @@ -615,7 +631,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
>  	u16 hcnt, lcnt;
>  	u32 scl_timing;
>  
> -	core_rate = clk_get_rate(master->core_clk);
> +	core_rate = dw_i3c_master_get_core_rate(master);
>  	if (!core_rate)
>  		return -EINVAL;
>  
> @@ -1577,18 +1593,33 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
>  
> -	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> -	if (IS_ERR(master->core_clk))
> -		return PTR_ERR(master->core_clk);
> -
> -	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> -	if (IS_ERR(master->pclk))
> -		return PTR_ERR(master->pclk);
> +	if (has_acpi_companion(&pdev->dev)) {
> +		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> +	} else if (pdev->dev.of_node) {
> +		drvdata = device_get_match_data(&pdev->dev);
> +		if (drvdata)
> +			quirks = drvdata->flags;
> +	}
> +	master->quirks = quirks;
>  
> -	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> -										"core_rst");
> -	if (IS_ERR(master->core_rst))
> -		return PTR_ERR(master->core_rst);
> +	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
> +		master->core_clk = NULL;
> +		master->pclk = NULL;
> +		master->core_rst = NULL;
> +	} else {
> +		master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +		if (IS_ERR(master->core_clk))
> +			return PTR_ERR(master->core_clk);
> +
> +		master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +		if (IS_ERR(master->pclk))
> +			return PTR_ERR(master->pclk);
> +
> +		master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> +											"core_rst");
> +		if (IS_ERR(master->core_rst))
> +			return PTR_ERR(master->core_rst);

Why does this need to move around at all?

The reset control is already optional, so I would expect this to set
core_rst to NULL on missing reset, no quirk necessary.

Same question for pclk. Wouldn't it be enough to make core_clk optional
as well?

regards
Philipp

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
