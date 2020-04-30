Return-Path: <SRS0=RdhX=6O=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982CDC83009
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2020 07:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F03E2137B
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2020 07:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oq08dtZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F03E2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=696sZsDakmroldwMIEIkorzOyG+o8dSadvFInK1NBXM=; b=oq08dtZU7Yn/M2
	aLnqtD8Rx9HjDWYY11H4NIdaDCpL+dKdzn374X197hVrJKzC5/P65M+/mwKHgYlogYNJfjd4IygGJ
	JIcuQFuD66Fmsbm4PtJ5TQ46xo229NN20VfipUqGKBjnfzUS+fNutEndZXp3oDEBYMDFKMX/wOarA
	j3+dbDoJqi42s3ri7pkznJMnbAEePJmzGrJHWYKlAdAJ8fK4NED5cQpZ+TalME0HeYhvMi8abgxH0
	pRMzyI4NKYms1jWMHTmq7ZEZ+naFiZ/aPN3XMObPWU+4SvFDwhDeJV0WgYN1CHX+RKsvh2w4k0/ct
	5AcfeteHNLwAXnm7d4BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU439-00022Z-Ln; Thu, 30 Apr 2020 07:56:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU436-00021H-5D
 for linux-i3c@lists.infradead.org; Thu, 30 Apr 2020 07:56:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B15842A239C;
 Thu, 30 Apr 2020 08:55:58 +0100 (BST)
Date: Thu, 30 Apr 2020 09:55:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v6 2/8] i3c: master: split bus_init callback into
 bus_init and master_set_info
Message-ID: <20200430095555.40ff15d7@collabora.com>
In-Reply-To: <1587140452-30071-1-git-send-email-pthombar@cadence.com>
References: <1587140398-29473-1-git-send-email-pthombar@cadence.com>
 <1587140452-30071-1-git-send-email-pthombar@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_005600_467165_68BE5373 
X-CRM114-Status: GOOD (  25.26  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mparab@cadence.com, bbrezillon@kernel.org, praneeth@ti.com,
 linux-kernel@vger.kernel.org, vitor.soares@synopsys.com, pgaj@cadence.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 17 Apr 2020 18:20:52 +0200
Parshuram Thombare <pthombar@cadence.com> wrote:

> To support mastership handover procedure, this patch splits the
> bus_init callback into bus_init and master_set_info callbacks

Missing period at the end of this sentence.

IIRC, we discussed passing master info directly at controller
registration time for primary master registration, thus avoiding this
->master_set_info() step. Any good reason for doing that? I mean, I'd
expect the PID, BCR, DCR to be fixed, the only one that can be assigned
automatically is the address, and we can have a magic value for
'auto-assign the first available address', like '0'. The
write to DEV_ID_RR0() can be done conditionally in master_bus_init()
when '!secondary_master'.

> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  drivers/i3c/master.c                 | 10 +++--
>  drivers/i3c/master/dw-i3c-master.c   | 29 ++++++++-----
>  drivers/i3c/master/i3c-master-cdns.c | 63 ++++++++++++++++++----------
>  include/linux/i3c/master.h           |  7 +++-
>  4 files changed, 71 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52121fe..0ec332e45737 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1716,6 +1716,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	if (ret)
>  		goto err_detach_devs;
>  
> +	ret = master->ops->master_set_info(master);
> +	if (ret)
> +		goto err_detach_devs;
> +
>  	/*
>  	 * The master device should have been instantiated in ->bus_init(),
>  	 * complain if this was not the case.
> @@ -2378,9 +2382,9 @@ EXPORT_SYMBOL_GPL(i3c_generic_ibi_recycle_slot);
>  
>  static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  {
> -	if (!ops || !ops->bus_init || !ops->priv_xfers ||
> -	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers ||
> -	    !ops->i2c_funcs)
> +	if (!ops || !ops->bus_init || !ops->master_set_info ||
> +	    !ops->priv_xfers || !ops->send_ccc_cmd || !ops->do_daa ||
> +	    !ops->i2c_xfers || !ops->i2c_funcs)
>  		return -EINVAL;
>  
>  	if (ops->request_ibi &&
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 1d83c97431c7..5c9a72d68fb8 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -593,7 +593,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  {
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
> -	struct i3c_device_info info = { };
>  	u32 thld_ctrl;
>  	int ret;
>  
> @@ -624,6 +623,24 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  	writel(INTR_MASTER_MASK, master->regs + INTR_STATUS_EN);
>  	writel(INTR_MASTER_MASK, master->regs + INTR_SIGNAL_EN);
>  
> +	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_SIR_REQ_REJECT);
> +	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
> +
> +	/* For now don't support Hot-Join */
> +	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_HOT_JOIN_NACK,
> +	       master->regs + DEVICE_CTRL);
> +
> +	dw_i3c_master_enable(master);
> +
> +	return 0;
> +}
> +
> +static int dw_i3c_master_set_info(struct i3c_master_controller *m)
> +{
> +	struct dw_i3c_master *master = to_dw_i3c_master(m);
> +	struct i3c_device_info info = { };
> +	int ret;
> +
>  	ret = i3c_master_get_free_addr(m, 0);
>  	if (ret < 0)
>  		return ret;
> @@ -638,15 +655,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  	if (ret)
>  		return ret;
>  
> -	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_SIR_REQ_REJECT);
> -	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
> -
> -	/* For now don't support Hot-Join */
> -	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_HOT_JOIN_NACK,
> -	       master->regs + DEVICE_CTRL);
> -
> -	dw_i3c_master_enable(master);
> -
>  	return 0;
>  }
>  
> @@ -1088,6 +1096,7 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  
>  static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.bus_init = dw_i3c_master_bus_init,
> +	.master_set_info = dw_i3c_master_set_info,
>  	.bus_cleanup = dw_i3c_master_bus_cleanup,
>  	.attach_i3c_dev = dw_i3c_master_attach_i3c_dev,
>  	.reattach_i3c_dev = dw_i3c_master_reattach_i3c_dev,
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 8889a4fdb454..c2d1631a9e38 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1199,21 +1199,20 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
>  	unsigned long pres_step, sysclk_rate, max_i2cfreq;
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
> -	u32 ctrl, prescl0, prescl1, pres, low;
> -	struct i3c_device_info info = { };
> -	int ret, ncycles;
> +	u32 ctrl, prescl0, prescl1, pres, low, bus_mode;
> +	int ncycles;
>  
>  	switch (bus->mode) {
>  	case I3C_BUS_MODE_PURE:
> -		ctrl = CTRL_PURE_BUS_MODE;
> +		bus_mode = CTRL_PURE_BUS_MODE;
>  		break;
>  
>  	case I3C_BUS_MODE_MIXED_FAST:
> -		ctrl = CTRL_MIXED_FAST_BUS_MODE;
> +		bus_mode = CTRL_MIXED_FAST_BUS_MODE;
>  		break;
>  
>  	case I3C_BUS_MODE_MIXED_SLOW:
> -		ctrl = CTRL_MIXED_SLOW_BUS_MODE;
> +		bus_mode = CTRL_MIXED_SLOW_BUS_MODE;
>  		break;
>  
>  	default:
> @@ -1244,7 +1243,6 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	bus->scl_rate.i2c = sysclk_rate / ((pres + 1) * 5);
>  
>  	prescl0 |= PRESCL_CTRL0_I2C(pres);
> -	writel(prescl0, master->regs + PRESCL_CTRL0);
>  
>  	/* Calculate OD and PP low. */
>  	pres_step = 1000000000 / (bus->scl_rate.i3c * 4);
> @@ -1252,15 +1250,43 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	if (ncycles < 0)
>  		ncycles = 0;
>  	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
> +
> +	ctrl = readl(master->regs + CTRL);
> +	if (ctrl & CTRL_DEV_EN)
> +		cdns_i3c_master_disable(master);
> +	writel(prescl0, master->regs + PRESCL_CTRL0);
>  	writel(prescl1, master->regs + PRESCL_CTRL1);
> +	ctrl &= ~CTRL_BUS_MODE_MASK;
> +	ctrl |= bus_mode | CTRL_HALT_EN | CTRL_MCS_EN;
> +	/*
> +	 * Enable Hot-Join, and, when a Hot-Join request happens,
> +	 * disable all events coming from this device.
> +	 * We will issue ENTDAA afterwards from the threaded IRQ
> +	 * handler.
> +	 */
> +	if (!m->secondary)
> +		ctrl |= CTRL_HJ_ACK | CTRL_HJ_DISEC;
> +	writel(ctrl, master->regs + CTRL);
> +	cdns_i3c_master_enable(master);
>  
> -	/* Get an address for the master. */
> -	ret = i3c_master_get_free_addr(m, 0);
> -	if (ret < 0)
> -		return ret;
> +	return 0;
> +}
>  
> -	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
> -	       master->regs + DEV_ID_RR0(0));
> +static int cdns_i3c_master_set_info(struct i3c_master_controller *m)
> +{
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	struct i3c_device_info info = { };
> +	int ret;
> +
> +	if (!m->secondary) {
> +		/* Get an address for the master. */
> +		ret = i3c_master_get_free_addr(m, 0);
> +		if (ret < 0)
> +			return ret;
> +
> +		writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
> +		       master->regs + DEV_ID_RR0(0));
> +	}
>  
>  	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
>  	if (info.bcr & I3C_BCR_HDR_CAP)
> @@ -1270,16 +1296,6 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	if (ret)
>  		return ret;
>  
> -	/*
> -	 * Enable Hot-Join, and, when a Hot-Join request happens, disable all
> -	 * events coming from this device.
> -	 *
> -	 * We will issue ENTDAA afterwards from the threaded IRQ handler.
> -	 */
> -	ctrl |= CTRL_HJ_ACK | CTRL_HJ_DISEC | CTRL_HALT_EN | CTRL_MCS_EN;
> -	writel(ctrl, master->regs + CTRL);
> -
> -	cdns_i3c_master_enable(master);
>  
>  	return 0;
>  }
> @@ -1507,6 +1523,7 @@ static void cdns_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
>  
>  static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
>  	.bus_init = cdns_i3c_master_bus_init,
> +	.master_set_info = cdns_i3c_master_set_info,
>  	.bus_cleanup = cdns_i3c_master_bus_cleanup,
>  	.do_daa = cdns_i3c_master_do_daa,
>  	.attach_i3c_dev = cdns_i3c_master_attach_i3c_dev,
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f13fd8b1dd79..3dc7eafe811a 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -337,10 +337,12 @@ struct i3c_bus {
>  
>  /**
>   * struct i3c_master_controller_ops - I3C master methods
> - * @bus_init: hook responsible for the I3C bus initialization. You should at
> - *	      least call master_set_info() from there and set the bus mode.
> + * @bus_init: hook responsible for the I3C bus initialization.
>   *	      You can also put controller specific initialization in there.
>   *	      This method is mandatory.
> + * @master_set_info: hook responsible for assigning address to main master.
> + *			You should call i3c_master_set_info from here.
> + *			This method is mandatory.
>   * @bus_cleanup: cleanup everything done in
>   *		 &i3c_master_controller_ops->bus_init().
>   *		 This method is optional.
> @@ -421,6 +423,7 @@ struct i3c_bus {
>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> +	int (*master_set_info)(struct i3c_master_controller *m);
>  	void (*bus_cleanup)(struct i3c_master_controller *master);
>  	int (*attach_i3c_dev)(struct i3c_dev_desc *dev);
>  	int (*reattach_i3c_dev)(struct i3c_dev_desc *dev, u8 old_dyn_addr);


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
