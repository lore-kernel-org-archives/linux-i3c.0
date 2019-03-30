Return-Path: <SRS0=GBB+=SB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CF8C43381
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 15:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D944218A3
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 15:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9MdpNdn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D944218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sowxg3uAyphx1CCz5hY+Vwayj0UMyHB3Mww7lcLeXTM=; b=L9MdpNdnEGWam7
	bjvxt5JsNeiGepe5lZ1cJWOmmzd0ZGExjQnTljjzmNlbQ7LJVeKzbgHcoG7GwsJA1jHTYrZRr05R5
	IM9kSkeKJStsmMFGO6oE+So5iUP7JowMABibIcb0bIcRwkknQb3e8MsEaPeYmY67SWwAIF9Xn9AtD
	r39tduDmyJGBrvzkt3imYn4fDspwjL/399d4J1gaI4wiSdnT1MsISlUUbk0uYe4vjvDQJTdVizuJi
	MixPjxDgvD0iNliFVw511T3bIO5bXwMv5RpZapDBZAbOshahL7ZtdKlsw9yE/KbH2BemBTq6A80cC
	TUI+urHq5mGsERtcddyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAG9Y-00018Z-T0; Sat, 30 Mar 2019 15:44:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAG9V-000181-PN
 for linux-i3c@lists.infradead.org; Sat, 30 Mar 2019 15:44:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1BB612639F1;
 Sat, 30 Mar 2019 15:44:12 +0000 (GMT)
Date: Sat, 30 Mar 2019 16:44:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v4 4/6] i3c: master: cdns: add support for mastership
 request to Cadence I3C master driver.
Message-ID: <20190330164409.45e6edfb@collabora.com>
In-Reply-To: <20190310135843.21154-5-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-5-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_084414_082209_4AA8D1CC 
X-CRM114-Status: GOOD (  27.49  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sun, 10 Mar 2019 13:58:41 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch adds support for mastership request to Cadence I3C master driver.
> 
> Mastership is requested automatically after secondary master
> receives mastership ENEC event. This allows secondary masters to
> initialize their bus.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> 
> ---
> 
> Main changes between v3 and v4:
> - Refactored the code
> 
> Main changes between v2 and v3:
> - Add mastership type
> - Add postponed master registration
> - Add update device definition on bus initialization time
> - Removed redundant mastership work structs
> - Reworked IBI slot lookup
> - Reworked Mastership event enabling/disabling
> 
> Changes in v2:
> - Add work structs for mastership purpose
> - Add missing mastership disable feature
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 495 +++++++++++++++++++++++++++++++----
>  1 file changed, 443 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 237f24a..61d6416 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -157,6 +157,7 @@
>  #define SLV_IMR				0x48
>  #define SLV_ICR				0x4c
>  #define SLV_ISR				0x50
> +#define SLV_INT_DEFSLVS			BIT(21)
>  #define SLV_INT_TM			BIT(20)
>  #define SLV_INT_ERROR			BIT(19)
>  #define SLV_INT_EVENT_UP		BIT(18)
> @@ -388,8 +389,19 @@ struct cdns_i3c_xfer {
>  	struct cdns_i3c_cmd cmds[0];
>  };
>  
> +enum cdns_i3c_mr {
> +	REQUEST,
> +	HANDOFF,
> +	TAKEOVER
> +};
> +
>  struct cdns_i3c_master {
>  	struct work_struct hj_work;
> +	struct {
> +		struct work_struct work;
> +		enum cdns_i3c_mr mr_type;
> +		u32 ibir;
> +	} mastership;
>  	struct i3c_master_controller base;
>  	u32 free_rr_slots;
>  	unsigned int maxdevs;
> @@ -408,6 +420,8 @@ struct cdns_i3c_master {
>  	struct clk *pclk;
>  	struct cdns_i3c_master_caps caps;
>  	unsigned long i3c_scl_lim;
> +	struct device *parent;
> +	struct workqueue_struct *wq;
>  };
>  
>  static inline struct cdns_i3c_master *
> @@ -663,6 +677,88 @@ static void cdns_i3c_master_unqueue_xfer(struct cdns_i3c_master *master,
>  	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
>  }
>  
> +static void
> +cdns_i3c_master_i3c_dev_rr_to_info(struct cdns_i3c_master *master,

cdns_i3c_master_dev_rr_to_i3c_info(...


> +				   unsigned int slot,
> +				   struct i3c_device_info *info)
> +{
> +	u32 rr;
> +
> +	memset(info, 0, sizeof(*info));
> +	rr = readl(master->regs + DEV_ID_RR0(slot));
> +	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
> +	rr = readl(master->regs + DEV_ID_RR2(slot));
> +	info->dcr = rr;
> +	info->bcr = rr >> 8;
> +	info->pid = rr >> 16;
> +	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
> +}
> +
> +static void
> +cdns_i3c_master_i2c_dev_rr_to_info(struct cdns_i3c_master *master,

cdns_i3c_master_dev_rr_to_i2c_info(...

> +				   unsigned int slot,
> +				   u16 *addr, u8 *lvr)
> +{
> +	u32 rr;
> +
> +	rr = readl(master->regs + DEV_ID_RR0(slot));
> +	*addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
> +	rr = readl(master->regs + DEV_ID_RR2(slot));
> +	*lvr = rr;
> +}
> +
> +static
> +int cdns_i3c_sec_master_request_mastership(struct i3c_master_controller *m)

It's also used for the primary master to get ownership back, right? In
that case, don't prefix things with _sec_master.

> +{
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	u32 status;
> +	int ret;
> +
> +	status = readl(master->regs + MST_STATUS0);
> +	if (WARN_ON(status & MST_STATUS0_MASTER_MODE))
> +		return -EEXIST;
> +
> +	status = readl(master->regs + SLV_STATUS1);
> +	if (status & SLV_STATUS1_MR_DIS)
> +		return -EACCES;
> +
> +	writel(SLV_INT_MR_DONE, master->regs + SLV_IER);

Hm, you seem to poll the master mode status, what's the point of
enabling this interrupt?

> +	writel(readl(master->regs + CTRL) | CTRL_MST_INIT | CTRL_MST_ACK,
> +	       master->regs + CTRL);
> +
> +	ret = readl_poll_timeout(master->regs + MST_STATUS0, status,
> +				 status & MST_STATUS0_MASTER_MODE, 100,
> +				 100000);
> +	return ret;
> +}
> +
> +static void cdns_i3c_master_update_devs(struct i3c_master_controller *m)
> +{
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	u32 val, newdevs;
> +	u16 addr;
> +	u8 lvr;
> +	int slot;
> +	struct i3c_device_info i3c_info;
> +
> +	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
> +	for (slot = 1; slot <= master->maxdevs; slot++) {
> +		val = readl(master->regs + DEV_ID_RR0(slot));
> +
> +		if ((newdevs & BIT(slot)) && (val & DEV_ID_RR0_IS_I3C)) {
> +			cdns_i3c_master_i3c_dev_rr_to_info(master, slot,
> +							   &i3c_info);
> +
> +			i3c_master_add_i3c_dev_locked(m, i3c_info.dyn_addr);
> +		} else if ((newdevs & BIT(slot)) &&
> +			   !(val & DEV_ID_RR0_IS_I3C)) {
> +			cdns_i3c_master_i2c_dev_rr_to_info(master, slot,
> +							   &addr, &lvr);
> +			i3c_master_add_i2c_dev(m, addr, lvr);
> +		}
> +	}
> +}
> +
>  static enum i3c_error_code cdns_i3c_cmd_get_err(struct cdns_i3c_cmd *cmd)
>  {
>  	switch (cmd->error) {
> @@ -913,6 +1009,7 @@ static int cdns_i3c_master_get_rr_slot(struct cdns_i3c_master *master,
>  		return ffs(master->free_rr_slots) - 1;
>  	}
>  
> +
>  	activedevs = readl(master->regs + DEVS_CTRL) &
>  		     DEVS_CTRL_DEVS_ACTIVE_MASK;
>  
> @@ -1005,9 +1102,9 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
>  	master->free_rr_slots &= ~BIT(slot);
>  	i2c_dev_set_master_data(dev, data);
>  
> -	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
> +	writel(prepare_rr0_dev_address(dev->addr),
>  	       master->regs + DEV_ID_RR0(data->id));
> -	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
> +	writel(dev->lvr, master->regs + DEV_ID_RR2(data->id));
>  	writel(readl(master->regs + DEVS_CTRL) |
>  	       DEVS_CTRL_DEV_ACTIVE(data->id),
>  	       master->regs + DEVS_CTRL);

Should be part of patch 1, and you need to patch the designware driver
too.

> @@ -1037,22 +1134,6 @@ static void cdns_i3c_master_bus_cleanup(struct i3c_master_controller *m)
>  	cdns_i3c_master_disable(master);
>  }
>  
> -static void cdns_i3c_master_dev_rr_to_info(struct cdns_i3c_master *master,
> -					   unsigned int slot,
> -					   struct i3c_device_info *info)
> -{
> -	u32 rr;
> -
> -	memset(info, 0, sizeof(*info));
> -	rr = readl(master->regs + DEV_ID_RR0(slot));
> -	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
> -	rr = readl(master->regs + DEV_ID_RR2(slot));
> -	info->dcr = rr;
> -	info->bcr = rr >> 8;
> -	info->pid = rr >> 16;
> -	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
> -}
> -
>  static void cdns_i3c_master_upd_i3c_scl_lim(struct cdns_i3c_master *master)
>  {
>  	struct i3c_master_controller *m = &master->base;
> @@ -1180,10 +1261,6 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
>  
>  	cdns_i3c_master_upd_i3c_scl_lim(master);
>  
> -	/* Unmask Hot-Join and Mastership request interrupts. */
> -	i3c_master_enec_locked(m, I3C_BROADCAST_ADDR,
> -			       I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
> -
>  	return 0;
>  }
>  
> @@ -1247,15 +1324,17 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
>  	writel(prescl1, master->regs + PRESCL_CTRL1);
>  
> -	/* Get an address for the master. */
> -	ret = i3c_master_get_free_addr(m, 0);
> -	if (ret < 0)
> -		return ret;
> +	if (!m->secondary) {
> +		/* Get an address for the master. */
> +		ret = i3c_master_get_free_addr(m, 0);
> +		if (ret < 0)
> +			return ret;
>  
> -	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
> -	       master->regs + DEV_ID_RR0(0));
> +		writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
> +		       master->regs + DEV_ID_RR0(0));
> +	}
>  
> -	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
> +	cdns_i3c_master_i3c_dev_rr_to_info(master, 0, &info);
>  	if (info.bcr & I3C_BCR_HDR_CAP)
>  		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
>  
> @@ -1274,9 +1353,32 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  
>  	cdns_i3c_master_enable(master);
>  
> +	if (m->secondary) {
> +		i3c_bus_maintenance_lock(&master->base.bus);
> +		cdns_i3c_master_update_devs(&master->base);
> +		i3c_bus_maintenance_unlock(&master->base.bus);
> +	}

Okay, I changed my mind on this solution (it's not the first time that
happens, and unfortunately won't be the last time either :-)). I think
I don't like the idea of exposing the i3c_bus_maintenance_unlock/lock()
functions in the end.

I'd like to reconsider what you initially proposed: having an
->update_devs() hook that is called by the core, except I'd call it
->populate_bus().

BTW, there's still something that's unclear to me. You seem to populate
the bus here and also when acquiring bus ownership. Is this correct?
I'd expect it to be 'partially' populated at bus-init+defslvs time,
which would trigger a mastership request if I3C devices are present (as
we need to send a GETPID to know more about I3C devs).

Also, what happens if i3c_master_add_i3c_dev_locked() fails? You
don't seem to handle that case at all.

> +
>  	return 0;
>  }
>  
> +static
> +struct i3c_dev_desc *cdns_i3c_get_ibi_device(struct cdns_i3c_master *master,
> +					     u32 ibir)
> +{
> +	struct i3c_dev_desc *dev;
> +	u32 id = IBIR_SLVID(ibir);
> +
> +	if (id >= master->ibi.num_slots || (ibir & IBIR_ERROR))
> +		return NULL;
> +
> +	dev = master->ibi.slots[id];
> +	if (!dev)
> +		return NULL;
> +
> +	return dev;
> +}
> +
>  static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
>  				       u32 ibir)
>  {
> @@ -1354,27 +1456,100 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
>  
>  		case IBIR_TYPE_MR:
>  			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
> +			master->mastership.ibir = ibir;
> +			master->mastership.mr_type = HANDOFF;
> +			queue_work(master->base.wq,
> +				   &master->mastership.work);
> +			break;
>  		default:
>  			break;
>  		}
>  	}
>  }
>  
> +static void cdns_i3c_master_bus_handoff(struct cdns_i3c_master *master)
> +{
> +	struct i3c_dev_desc *dev;
> +
> +	dev = cdns_i3c_get_ibi_device(master, master->mastership.ibir);
> +
> +	writel(MST_INT_MR_DONE, master->regs + MST_ICR);
> +
> +	master->base.bus.cur_master = dev;
> +}
> +
> +static void cdns_i3c_master_mastership_takeover(struct cdns_i3c_master *master)
> +{
> +	if (master->base.init_done) {

Can this really happen that init_done is not set when you reach this
point.

> +		i3c_bus_maintenance_lock(&master->base.bus);
> +		cdns_i3c_master_update_devs(&master->base);
> +		i3c_bus_maintenance_unlock(&master->base.bus);
> +
> +		i3c_master_register_new_devs(&master->base);

The core will somehow be informed that this master now owns the bus, so
it can call i3c_master_register_new_devs() for us, right?

But as said above, I'm not even sure this is correct to do it from
here. I'd expect this to happen at DEFSLVS or BUS init time.

> +	}
> +
> +	writel(readl(master->regs + CTRL) & ~CTRL_MST_ACK, master->regs + CTRL);
> +}
> +
> +static void cdns_i3c_sec_master_event_up(struct cdns_i3c_master *master)

Again, not specific to secondary masters, the primary master can go
through that path too.

> +{
> +	u32 status;
> +
> +	writel(SLV_INT_EVENT_UP, master->regs + SLV_ICR);
> +	status = readl(master->regs + SLV_STATUS1);
> +	if (!(status & SLV_STATUS1_MR_DIS) &&
> +	    !master->base.this) {
> +		master->mastership.mr_type = REQUEST;
> +		queue_work(master->wq, &master->mastership.work);
> +	}
> +}

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
