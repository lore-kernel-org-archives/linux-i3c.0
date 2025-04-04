Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06B9C36010
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Apr 2025 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTlDiiam1FpJiISnqb5hBWQODAIPmpQO53AHNvTzlb0=; b=fA61Wcs6Wq+0UU
	Z1mZLvCXLruGGAW+L9yJblz03YrcmPuQ8ceW5NHnrSDk7yURf55rtRKKCKg1PeWRtbpF2YWHobr/p
	nj+oCtTz8CBISWMoty7eIDyRmy94NdGzB0g5GEhkywkTGZsYqmoMmsnFdfOH4/9npgUiWsiNrKxlW
	bqemMDByzQIOv2A4qOu9zmqbJbAKckTrzsIVbsqP91YI454oiBQ3jBHYk5FmA2tMqqCJ3QIDKtrW0
	74mzNJLYTIC4ECA1holFkRfqvcETQlnAl3ixwSydLpKcuJ+zZweJSwAZ3FuyQDGB8ubei9B6ZY5yl
	rOIzWbcvwRVWv+eF1RJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0eM0-0000000BQHJ-2mUL;
	Fri, 04 Apr 2025 10:32:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0eLy-0000000BQGg-0CNk
	for linux-i3c@lists.infradead.org;
	Fri, 04 Apr 2025 10:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5152E5C64F2;
	Fri,  4 Apr 2025 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BA7C4CEDD;
	Fri,  4 Apr 2025 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743762769;
	bh=RnB3hqCazfynhXC46ZCpg6iui2CdO8E5L3mhRcFt/kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdYgJILcljmS2dEju5a5G3ZhdswondY0YXolrLFuSzHVl1Qu7sD9zklAzlo/oFwlc
	 kBjZSTQObCQUB4lZZLouYFyGkiz3mxdjjnrZq5gDe4ozPtmwRL22f2ERSD2jL58mJ7
	 iHyGfr8tOh37pkOX5FEuYWEoVpIhmf/jqrOsqtZwqHLi1itnkBB6gX0sVsSqqf7zMI
	 MfIK1asSZZwKCgkYryNjmSxoTugZZfiFqJO4UucNsOkTh2zfQeVLAWIYc000+T7qD3
	 QfRGe2lT19kPVgaUiqR5up2BXfQw6202F4Dkdk6UAKuAN8vbOb2wT2FvPxRZdTWLm0
	 ioqcTZUjrp51Q==
Date: Fri, 4 Apr 2025 12:32:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <20250404-provocative-mayfly-of-drama-eeddc1@shite>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_033250_203910_B70CAB96 
X-CRM114-Status: GOOD (  30.70  )
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

On Thu, Apr 03, 2025 at 07:16:43PM GMT, Mukesh Kumar Savaliya wrote:
> Add support for the Qualcomm I3C controller driver, which implements
> I3C master functionality as defined in the MIPI Alliance Specification
> for I3C, Version 1.0.
> 
> This driver supports master role in SDR mode.
> 
> Unlike some other I3C master controllers, this implementation
> does not support In-Band Interrupts (IBI) and Hot-join requests.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/i3c/master/Kconfig         |   13 +
>  drivers/i3c/master/Makefile        |    1 +
>  drivers/i3c/master/i3c-qcom-geni.c | 1099 ++++++++++++++++++++++++++++
>  3 files changed, 1113 insertions(+)
>  create mode 100644 drivers/i3c/master/i3c-qcom-geni.c
> 
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 77da199c7413..30b768df94c9 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -44,6 +44,19 @@ config SVC_I3C_MASTER
>  	help
>  	  Support for Silvaco I3C Dual-Role Master Controller.
>  
> +config I3C_QCOM_GENI
> +	tristate "Qualcomm Technologies Inc.'s I3C controller driver"
> +	depends on I3C
> +	depends on QCOM_GENI_SE
> +	help
> +	  This driver supports QUPV3 GENI based I3C controller in master
> +	  mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
> +	  this option, support will be included for the built-in I3C interface
> +	  on the Qualcomm Technologies Inc.s SoCs.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i3c-qcom-geni.
> +
>  config MIPI_I3C_HCI
>  	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>  	depends on I3C
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc..bc11eecd4692 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>  obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
>  obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> +obj-$(CONFIG_I3C_QCOM_GENI)		+= i3c-qcom-geni.o

Did you just add entry to the end of file? No, don't break ordering.
That's a standard rule for most subsystems.

...

> +irqret:
> +	if (m_stat)
> +		writel_relaxed(m_stat, gi3c->se.base + SE_GENI_M_IRQ_CLEAR);
> +
> +	if (dma) {
> +		if (dm_tx_st)
> +			writel_relaxed(dm_tx_st, gi3c->se.base + SE_DMA_TX_IRQ_CLR);
> +		if (dm_rx_st)
> +			writel_relaxed(dm_rx_st, gi3c->se.base + SE_DMA_RX_IRQ_CLR);
> +	}
> +
> +	/* if this is err with done-bit not set, handle that through timeout. */
> +	if (m_stat & M_CMD_DONE_EN || m_stat & M_CMD_ABORT_EN) {
> +		writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +		complete(&gi3c->done);
> +	} else if (dm_tx_st & TX_DMA_DONE || dm_rx_st & RX_DMA_DONE	||
> +		dm_rx_st & RX_RESET_DONE) {
> +		complete(&gi3c->done);
> +	}
> +
> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> +	return IRQ_HANDLED;
> +}
> +
> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
> +{

You miss sparse/lockdep annotations.

> +	int ret;
> +
> +	mutex_lock(&gi3c->lock);
> +	reinit_completion(&gi3c->done);
> +	ret = pm_runtime_get_sync(gi3c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(gi3c->se.dev);
> +		/* Set device in suspended since resume failed */
> +		pm_runtime_set_suspended(gi3c->se.dev);
> +		mutex_unlock(&gi3c->lock);

Either you lock or don't lock, don't mix these up.

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
> +{

Missing annotations.

> +	pm_runtime_mark_last_busy(gi3c->se.dev);
> +	pm_runtime_put_autosuspend(gi3c->se.dev);
> +	mutex_unlock(&gi3c->lock);
> +}
> +
> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
> +{
> +	unsigned long time_remaining;
> +	unsigned long flags;
> +
> +	reinit_completion(&gi3c->done);
> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
> +	geni_se_abort_m_cmd(&gi3c->se);
> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
> +	if (!time_remaining)
> +		dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
> +}

...

> +
> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(gi3c->se.base))
> +		return PTR_ERR(gi3c->se.base);
> +
> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se");
> +	if (IS_ERR(gi3c->se.clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
> +							"Unable to get serial engine core clock: %pe\n",
> +							gi3c->se.clk);

Totally messed indentation.

> +	ret = geni_icc_get(&gi3c->se, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the bus quota to a reasonable value for register access */
> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
> +	ret = geni_icc_set_bw(&gi3c->se);
> +	if (ret)
> +		return ret;
> +
> +	/* Default source clock (se-clock-frequency) freq is 100Mhz */
> +	gi3c->clk_src_freq = KHZ(100000);

And why can't you use clk_get_rate()?

> +
> +	return 0;
> +}
> +
> +static int geni_i3c_probe(struct platform_device *pdev)
> +{
> +	u32 proto, tx_depth, fifo_disable;
> +	struct geni_i3c_dev *gi3c;

Just store pdev->dev in local dev variable, to simplify everything here.

> +	int ret;
> +
> +	gi3c = devm_kzalloc(&pdev->dev, sizeof(*gi3c), GFP_KERNEL);
> +	if (!gi3c)
> +		return -ENOMEM;
> +
> +	gi3c->se.dev = &pdev->dev;
> +	gi3c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> +
> +	init_completion(&gi3c->done);
> +	mutex_init(&gi3c->lock);
> +	spin_lock_init(&gi3c->irq_lock);
> +	platform_set_drvdata(pdev, gi3c);
> +
> +	ret = i3c_geni_resources_init(gi3c, pdev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error Initializing GENI Resources\n");
> +
> +	gi3c->irq = platform_get_irq(pdev, 0);
> +	if (gi3c->irq < 0)
> +		return dev_err_probe(&pdev->dev, gi3c->irq, "Error getting IRQ number for I3C\n");
> +
> +	ret = devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error registering core IRQ\n");
> +
> +	ret = geni_se_resources_on(&gi3c->se);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error turning resources ON\n");
> +
> +	proto = geni_se_read_proto(&gi3c->se);
> +	if (proto != GENI_SE_I3C) {
> +		geni_se_resources_off(&gi3c->se);
> +		return dev_err_probe(&pdev->dev, -ENXIO, "Invalid proto %d\n", proto);
> +	}
> +
> +	fifo_disable = readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
> +	if (fifo_disable) {
> +		geni_se_resources_off(&gi3c->se);
> +		return dev_err_probe(&pdev->dev, -ENXIO, "GPI DMA mode not supported\n");
> +	}
> +
> +	tx_depth = geni_se_get_tx_fifo_depth(&gi3c->se);
> +	gi3c->tx_wm = tx_depth - 1;
> +	geni_se_init(&gi3c->se, gi3c->tx_wm, tx_depth);
> +	geni_se_config_packing(&gi3c->se, BITS_PER_BYTE, PACKING_BYTES_PW, true, true, true);
> +	geni_se_resources_off(&gi3c->se);
> +	dev_dbg(&pdev->dev, "i3c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +
> +	pm_runtime_set_autosuspend_delay(gi3c->se.dev, I3C_AUTO_SUSPEND_DELAY);
> +	pm_runtime_use_autosuspend(gi3c->se.dev);
> +	pm_runtime_set_active(gi3c->se.dev);
> +	pm_runtime_enable(gi3c->se.dev);
> +
> +	ret = i3c_master_register(&gi3c->ctrlr, &pdev->dev, &geni_i3c_master_ops, false);
> +	if (ret) {
> +		pm_runtime_disable(gi3c->se.dev);
> +		pm_runtime_set_suspended(gi3c->se.dev);
> +		pm_runtime_dont_use_autosuspend(gi3c->se.dev);
> +		return ret;
> +	}
> +
> +	return ret;

return 0;

> +}

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
