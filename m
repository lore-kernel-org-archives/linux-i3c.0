Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A722DC83F0A
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrTiTN4rc8XcFEmRW/gWoHl06pPVZVqLG2mC9cHHJ4Y=; b=QBJwtwQm1RTq70
	YLy7RG1EYS/5K+sDwcRTVm0ODHVWHpi7aYJUOPu1EM0dWiwr0PU5dj575qs18VaxUzGtnPgoE3tUx
	PcbP3bsCevo0nTy9FxHtaTdBUZ3NYHKrk8EfKE+O8RwDCL40ciE6oSh7YBhErAerP4VYDTENMXbQs
	iHrHEeqAK1P+Q3Y7zRqi8MeBaqPqsPT7fYD8NcdQGTC1jfEblxR5Nfcn5EjzZCcHP4jUekOhVnygK
	p2M8KSfhHRVZbbE9/1WxvLzvosNUsqxHEkbGFcb7hs0DO0vp/Fg4IYI/juM36C1lr+zp4rnU/63iY
	oKnmf8kfbtVyMGSzhfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bX-00000009fBJ-1bqs;
	Wed, 02 Jul 2025 22:06:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWi1g-00000006cgf-3MEM
	for linux-i3c@lists.infradead.org;
	Tue, 01 Jul 2025 20:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BA54A533C7;
	Tue,  1 Jul 2025 20:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DD7C4CEEB;
	Tue,  1 Jul 2025 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403383;
	bh=y5wwDYXuc6Vw2z4nsQx8Z6oOr8liqV38GCIpo1HQsuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbWFsTLKXGAe7ycsuFsAOLYv4wrMjHzmUmFG01DNYp/nlLcmt9NwIr7BEvSl2HEgC
	 VO65bTmvJdPY3be1brPOWRSF6GfBXTWGPqHKyZaW/zwCUPF3lsBEaaKhEWckMaD8qv
	 awxor2r1H6LZ+Hbp8Qc3iNk2KFfuuTyXFB2NK7drHSj2AU1U6z+4TNEUSm4xeWVnti
	 JoaNmme0FQ4yoLnShN25h9yzcS1ymUQhPy/sfgDo4/INQsCHFYmgK/yMaibr2WizS1
	 5pCwqTXkJ8Pv4qokQH/iuCz/4MwRX1r1qN4VIRo5ZFksgD0NjTSir+PvUKlgq8rpQk
	 QRFy6MP+oSqRQ==
Date: Tue, 1 Jul 2025 15:56:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frank.Li@nxp.com, wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com, 
	konradybcio@kernel.org
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <h4c5oybkuxf2wmja2osm73ntpolx2ap3csskipbuyoks6xtdsi@5ihhj6ztn7mq>
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_135624_972948_9BD65A17 
X-CRM114-Status: GOOD (  22.49  )
X-Mailman-Approved-At: Wed, 02 Jul 2025 15:04:03 -0700
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

On Tue, Jul 01, 2025 at 12:48:51PM +0530, Mukesh Kumar Savaliya wrote:
> Add support for the Qualcomm I3C controller driver, which implements
> I3C master functionality as defined in the MIPI Alliance Specification
> for I3C, Version 1.0.
> 
> This driver supports master role in SDR mode.
> 
> Unlike some other I3C master controllers, this implementation
> does not support In-Band Interrupts (IBI) and Hot-join requests.

I believe the capitalization of the last feature is "Hot-Join"

It's not entirely clear from this sentence if it's the controller or the
driver that doesn't support these features. Please update to make it
clear.

[..]
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc..0e3ad9d96424 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
> +obj-$(CONFIG_I3C_QCOM_GENI)		+= i3c-qcom-geni.o
>  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>  obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/i3c-qcom-geni.c
[..]
> +
> +struct geni_i3c_i2c_dev_data {
> +	u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy for now */

Commit message says that QUP doesn't support IBI, so what is this?

Also, why "keep as dummy"?

> +};
> +
[..]
> +static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum i3c_bus_phase bus_phase)
> +{
> +	const struct geni_i3c_clk_settings *clk_idx = gi3c->clk_cfg;
> +	unsigned long freq;
> +	u32 val, dfs_idx;
> +	int ret;
> +
> +	if (bus_phase == OPEN_DRAIN_MODE)
> +		clk_idx = gi3c->clk_od_cfg;
> +
> +	ret = geni_se_clk_freq_match(&gi3c->se, clk_idx->clk_src_freq,
> +				     &dfs_idx, &freq, false);
> +	if (ret)
> +		dfs_idx = 0;
> +
> +	writel_relaxed(dfs_idx, gi3c->se.base + SE_GENI_CLK_SEL);
> +
> +	val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
> +	val |= SER_CLK_EN;
> +	writel_relaxed(val, gi3c->se.base + GENI_SER_M_CLK_CFG);
> +
> +	val = FIELD_PREP(I2C_SCL_HIGH_COUNTER_MASK, clk_idx->i2c_t_high_cnt);
> +	val |= FIELD_PREP(I2C_SCL_LOW_COUNTER_MASK, clk_idx->i2c_t_low_cnt);
> +	val |= FIELD_PREP(I2C_SCL_CYCLE_COUNTER_MASK, clk_idx->i2c_t_cycle_cnt);
> +	writel_relaxed(val, gi3c->se.base + SE_I2C_SCL_COUNTERS);
> +
> +	writel_relaxed(clk_idx->i3c_t_cycle_cnt, gi3c->se.base + SE_I3C_SCL_CYCLE);
> +	writel_relaxed(clk_idx->i3c_t_high_cnt, gi3c->se.base + SE_I3C_SCL_HIGH);
> +
> +	writel_relaxed(M_IBI_IRQ_IGNORE, gi3c->se.base + SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE);
> +
> +	val = M_IBI_IRQ_PARAM_STOP_STALL | M_IBI_IRQ_PARAM_7E;
> +	writel_relaxed(val, gi3c->se.base + SE_GENI_HW_IRQ_CMD_PARAM_0);
> +
> +	writel_relaxed(M_IBI_IRQ_EN, gi3c->se.base + SE_GENI_HW_IRQ_EN);

Don't you want a non-relaxed write here, to clarify that the ordering of
this write and the previous are significant?


As above, the commit message says the controller doesn't do IBI, so why
are we enabling IBI interrupts? (Just guessing based on the IRQ names)

> +}
> +
[..]
> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i2c_dev_set_master_data(dev, data);

As far as I can tell, the master_data is private to the controller
driver, and the only thing I can find you do with it to free it again on
detach.

Am I missing something or can these 4 optional functions be removed?

> +
> +	return 0;
> +}
> +
> +static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> +
> +	i2c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
> +
> +static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i3c_dev_set_master_data(dev, data);
> +
> +	return 0;
> +}
> +
> +static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
> +

Regards,
Bjorn

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
