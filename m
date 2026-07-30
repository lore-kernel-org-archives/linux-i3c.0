Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E8EC55162
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJF553Sjgbu8K47WHTLncOzebIRU1yt82ggfGv5HtJA=; b=bw1yj18qr9d/Yy
	IWB6u7Xrg7n4Vg4ROjuDoYG2DO/JZIpOlTgm5czcWVW72U1sRS4M2M/d84/TYezWR7MUo3LIPSTE1
	3n+tLv0+gT1R92SOGSJ5QOilWsGECzOouMGTlEoc1H3TDHqTWni2R4S/8itJOI9xj3rMlQzKX8mmA
	d98R0w63zxcGV2nbhkMb4squ4WqSTnu1WPPxLDH+yFVII8nTlNUs6WNKTFgRtm476lmbcOhyD68rf
	jDhBqZSTXMHy9ZivoMIxIl6AK/0I32TrKaO0pytk/FRAq3la35kmytQADjGwYYHZa/81o6aiau6jZ
	/fmEEsIWkzb74cdhYmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSHC-0000000AoJx-1ymq;
	Thu, 30 Jul 2026 15:02:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSH9-0000000AoJO-1lxF
	for linux-i3c@lists.infradead.org;
	Thu, 30 Jul 2026 15:02:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 540C11A1324;
	Thu, 30 Jul 2026 15:02:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25E1D602B8;
	Thu, 30 Jul 2026 15:02:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46B0811C15D32;
	Thu, 30 Jul 2026 17:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785423739; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=d317ugAiqpM95cgs8G/oQ1yGnWR/jqWeC9N4GlR+HoM=;
	b=2Vs5g4Gy6pnvO5J8ADug0cCmgxbYnVkbeF7+45SI+D+GGUQQz1k8H5l0CS/UmUrAWEMSZd
	Jik2oyguq+bXqPicnfk2bd9aRnzlmA9Tey0061NR7q+NUFJViayPS2mX02DZNkih2rWK9f
	W50H5zOl4421wRF4Gh3lJRVFDaQG/1mZkphuI+w89FlBbzrKeX5jNf/W1qDvm6XczgFaGw
	h7PjtzDsBmip/17keQ0zLXEYVgiYbVgyC7YIYOSyWrwxGb1ZgMAVIxXuCsUe6+1zH+NaAD
	AYIZr9qtfUMdAdK0/gkk5UOBrCxgKW+HsLLKX8S5Wc17RmFIZl7OXrn/Rww7Yw==
Date: Thu, 30 Jul 2026 17:02:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: tze.yee.ng@altera.com
Cc: Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Message-ID: <20260730150214206bab95@mail.local>
References: <1573f05c63fe965c3816bf90d29c6cd16557a326.1784775201.git.tze.yee.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573f05c63fe965c3816bf90d29c6cd16557a326.1784775201.git.tze.yee.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_080223_606639_4D4492E7 
X-CRM114-Status: GOOD (  29.70  )
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

On 22/07/2026 19:57:33-0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Implement ->set_speed() so the I3C core can switch open-drain timing for
> the first broadcast address per spec: I3C_OPEN_DRAIN_SLOW_SPEED programs
> tHIGH_INIT (200 ns) before RSTDAA, and I3C_OPEN_DRAIN_NORMAL_SPEED restores
> normal OD timing afterward. Cache the normal OD register value during bus
> init and use a separate od_hcnt for the slow path so SDR extended timing
> remains derived from the normal PP hcnt.
> 
> For AMD_I3C_OD_PP_TIMING, cache AMD_I3C_OD_TIMING as the normal OD
> baseline and stop rewriting OD timing in send_ccc_cmd()/runtime resume so
> I3C_OPEN_DRAIN_SLOW_SPEED is preserved through RSTDAA.
> 
> Use PM_RUNTIME_ACQUIRE_AUTOSUSPEND() in set_speed(). Compute od_hcnt with
> DIV_ROUND_UP_ULL() for 32-bit safety and clamp it to U8_MAX to match the
> 8-bit I3C_OD_HCNT field.
> 
> Fixes I2C devices with spike filters not being detected on mixed buses.
> 
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

This looks good to me but as I took the SETAASA series, this doesn't
apply anymore. Can you rebase on top of i3c/next?

Thanks!

> ---
> Changes in v3:
> - Use DIV_ROUND_UP_ULL(..., NSEC_PER_SEC) for od_hcnt to avoid
>   __udivdi3 linker failures on 32-bit platforms (Sashiko/Frank)
> - Compute od_hcnt as u32 and clamp to U8_MAX to match the 8-bit
>   I3C_OD_HCNT field and avoid silent truncation (Sashiko/Frank)
> 
> Changes in v2:
> - Recalculate od_hcnt with Zephyr-style formula (Sashiko)
> - Fix AMD_I3C_OD_PP_TIMING interaction with set_speed() (Sashiko)
> - Switch set_speed() to PM_RUNTIME_ACQUIRE_AUTOSUSPEND() (Frank)
> ---
>  drivers/i3c/master/dw-i3c-master.c | 82 +++++++++++++++++++++++-------
>  drivers/i3c/master/dw-i3c-master.h |  1 +
>  include/linux/i3c/master.h         |  1 +
>  3 files changed, 67 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 2f8c0c4683e0..2867ffccea3a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -554,6 +554,13 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  }
>  
> +static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
> +{
> +	master->i3c_od_timing = AMD_I3C_OD_TIMING;
> +	master->i3c_od_timing_normal = AMD_I3C_OD_TIMING;
> +	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
> +}
> +
>  static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  {
>  	unsigned long core_rate, core_period;
> @@ -592,6 +599,18 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
>  	master->i3c_od_timing = scl_timing;
> +	master->i3c_od_timing_normal = scl_timing;
> +
> +	/*
> +	 * AMD legacy platforms need fixed OD/PP timings. Cache them as the
> +	 * normal OD baseline so set_speed(NORMAL) restores AMD values, and
> +	 * set_speed(SLOW) can stretch HCNT while keeping the AMD LCNT.
> +	 */
> +	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
> +		amd_configure_od_pp_quirk(master);
> +		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
> +		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
> +	}
>  
>  	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
>  	scl_timing = SCL_EXT_LCNT_1(lcnt);
> @@ -786,12 +805,6 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  	return ret;
>  }
>  
> -static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
> -{
> -	master->i3c_od_timing = AMD_I3C_OD_TIMING;
> -	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
> -}
> -
>  static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  				      struct i3c_ccc_cmd *ccc)
>  {
> @@ -801,13 +814,6 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  	if (ccc->id == I3C_CCC_ENTDAA)
>  		return -EINVAL;
>  
> -	/* AMD platform specific OD and PP timings */
> -	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
> -		amd_configure_od_pp_quirk(master);
> -		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
> -		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
> -	}
> -
>  	ret = pm_runtime_resume_and_get(master->dev);
>  	if (ret < 0) {
>  		dev_err(master->dev,
> @@ -1484,6 +1490,50 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
> +				   enum i3c_open_drain_speed speed)
> +{
> +	struct dw_i3c_master *master = to_dw_i3c_master(m);
> +	unsigned long core_rate;
> +	u32 scl_timing, od_hcnt;
> +	u8 lcnt;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(master->dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;
> +
> +	switch (speed) {
> +	case I3C_OPEN_DRAIN_SLOW_SPEED:
> +		core_rate = clk_get_rate(master->core_clk);
> +		if (!core_rate)
> +			return -EINVAL;
> +
> +		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
> +		od_hcnt = DIV_ROUND_UP_ULL((u64)I3C_BUS_THIGH_INIT_OD_MIN_NS *
> +					  core_rate, NSEC_PER_SEC) - 1;
> +		if (od_hcnt < SCL_I3C_TIMING_CNT_MIN)
> +			od_hcnt = SCL_I3C_TIMING_CNT_MIN;
> +		else if (od_hcnt > U8_MAX)
> +			od_hcnt = U8_MAX;
> +		scl_timing = SCL_I3C_TIMING_HCNT(od_hcnt) |
> +			     SCL_I3C_TIMING_LCNT(lcnt);
> +		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
> +		master->i3c_od_timing = scl_timing;
> +		break;
> +
> +	case I3C_OPEN_DRAIN_NORMAL_SPEED:
> +		writel(master->i3c_od_timing_normal,
> +		       master->regs + SCL_I3C_OD_TIMING);
> +		master->i3c_od_timing = master->i3c_od_timing_normal;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
>  					    unsigned int dev_nack_retry_cnt)
>  {
> @@ -1538,6 +1588,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
>  	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
>  	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
> +	.set_speed = dw_i3c_master_set_speed,
>  	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
>  };
>  
> @@ -1728,10 +1779,7 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
>  
>  static void dw_i3c_master_restore_timing_regs(struct dw_i3c_master *master)
>  {
> -	/* AMD platform specific OD and PP timings */
> -	if (master->quirks & AMD_I3C_OD_PP_TIMING)
> -		amd_configure_od_pp_quirk(master);
> -
> +	/* Preserve cached OD timing; it may be the SLOW setting from set_speed(). */
>  	writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
>  	writel(master->bus_free_timing, master->regs + BUS_FREE_TIMING);
>  	writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index 28e9348f2153..17ad817d1f8e 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -46,6 +46,7 @@ struct dw_i3c_master {
>  	u32 dev_addr;
>  	u32 i3c_pp_timing;
>  	u32 i3c_od_timing;
> +	u32 i3c_od_timing_normal;
>  	u32 ext_lcnt_timing;
>  	u32 bus_free_timing;
>  	u32 i2c_fm_timing;
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 4d2a68793324..eca79ea1598a 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -259,6 +259,7 @@ struct i3c_device {
>  #define I3C_BUS_THIGH_MIXED_MAX_NS	41
>  #define I3C_BUS_TIDLE_MIN_NS		200000
>  #define I3C_BUS_TLOW_OD_MIN_NS		200
> +#define I3C_BUS_THIGH_INIT_OD_MIN_NS	200
>  
>  /**
>   * enum i3c_bus_mode - I3C bus mode
> -- 
> 2.43.7
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
