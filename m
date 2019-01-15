Return-Path: <SRS0=cIL5=PX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CCBC43387
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jan 2019 21:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF38320657
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jan 2019 21:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U3NjSOjS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7/v98b0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF38320657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+MbUstSPFLlPZ7vqqgbZQtx9FhmBXctAHUR7xIvzDM=; b=U3NjSOjSbx41F8
	SfDmiZrTMS5RwA3pt1gYHfaDW+7rvIW9WUYdnB/3h20e9SwsHcFniegsS4fRwhDRv+ZgYTr/pJF1n
	d2cUQx6XYthH87mvhHGISN/dpYV07DCwHZIrylSCe+fEEfKJ1c06Sjk8c+rlF9/wStlSLdE/l8vl8
	g7/Tx1JPkPOwrIzKPZtKBLrtsCV5pIy+bYlV6hU3A/HOkx2W+jnfne8Ma3X7vLtqzS/v39Gnipdcq
	Sytx67RWvHrWuzOv/ZETGaBLivtgXhHZhnrm/ajTJu1TQGx9kjQBz+fmpdjR+t0dTvBtnJhfksVVN
	dHRoFHNnogKYLCoF6+7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjWOO-0004i8-FI; Tue, 15 Jan 2019 21:37:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjWOK-0004hl-3b
 for linux-i3c@lists.infradead.org; Tue, 15 Jan 2019 21:37:02 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C7A320657;
 Tue, 15 Jan 2019 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547588219;
 bh=fOZ8ssms0FqcdUvAhM4GfQ94hiNnqg5IWSS4LASuxj8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F7/v98b0NmSZbpcrxSTQrCxRs3fec8Dd109hRnNsn/tIwd+rigGMNuaCMY+64tVRc
 oc+/k5rx4yZaA1dokuYp/Pkaker5mypREyGImgQ/n9e3Vn7Zg1l8NpKxdRkg7/79DG
 KAp78SSAeepfmeEIzVvGCWnD3qqLEE+u1C4akJsY=
Date: Tue, 15 Jan 2019 22:36:50 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v2 2/3] i3c: master: cdns: add support for mastership
 request to Cadence I3C master driver.
Message-ID: <20190115223650.03e0f435@bbrezillon>
In-Reply-To: <bbf21a32340d06d48b98204921b1007ca5ec569e.1547227861.git.pgaj@cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
 <bbf21a32340d06d48b98204921b1007ca5ec569e.1547227861.git.pgaj@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_133700_208844_8FF35546 
X-CRM114-Status: GOOD (  27.09  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 11 Jan 2019 17:43:36 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch adds support for mastership request to Cadence I3C master driver.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> 
> Changes in v2:
> - Add work structs for mastership purpose
> - Add missing mastership disable feature
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 385 ++++++++++++++++++++++++++++++-----
>  1 file changed, 339 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 02a8297..578fc1e 100644
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
> @@ -390,6 +391,12 @@ struct cdns_i3c_xfer {
>  
>  struct cdns_i3c_master {
>  	struct work_struct hj_work;
> +	struct {
> +		struct work_struct handover_work;
> +		struct work_struct takeover_work;
> +		struct work_struct request_work;

Can't we use the same work for all of them and just have a state or
type field reflecting the kind of MR request?

> +		u32 ibir;
> +	} mastership;
>  	struct i3c_master_controller base;
>  	u32 free_rr_slots;
>  	unsigned int maxdevs;
> @@ -664,6 +671,89 @@ static void cdns_i3c_master_unqueue_xfer(struct cdns_i3c_master *master,
>  	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
>  }
>  
> +static void
> +cdns_i3c_master_i3c_dev_rr_to_info(struct cdns_i3c_master *master,
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
> +cdns_i3c_master_i2c_dev_rr_to_boardinfo(struct cdns_i3c_master *master,
> +					unsigned int slot,
> +					struct i2c_dev_boardinfo *info)
> +{
> +	u32 rr;
> +
> +	memset(info, 0, sizeof(*info));
> +	rr = readl(master->regs + DEV_ID_RR0(slot));
> +	info->base.addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
> +	rr = readl(master->regs + DEV_ID_RR2(slot));
> +	info->lvr = rr;
> +}
> +
> +static
> +int cdns_i3c_sec_master_request_mastership(struct i3c_master_controller *m)
> +{
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	u32 status;
> +	int ret;
> +
> +	status = readl(master->regs + MST_STATUS0);
> +	if (status & MST_STATUS0_MASTER_MODE)
> +		return -EEXIST;

This deserves a WARN_ON() as we should not hit that case unless the
driver or core is buggy.

> +
> +	status = readl(master->regs + SLV_STATUS1);
> +	if (status & SLV_STATUS1_MR_DIS)
> +		return -EBUSY;

Maybe EACCES instead of EBUSY.

> +
> +	writel(readl(master->regs + CTRL) | CTRL_MST_INIT | CTRL_MST_ACK,
> +	       master->regs + CTRL);
> +
> +	writel(SLV_INT_MR_DONE, master->regs + SLV_IER);
> +
> +	ret = readl_poll_timeout(master->regs + MST_STATUS0, status,
> +				 status & MST_STATUS0_MASTER_MODE, 100,
> +				 1000000);
> +
> +	return ret;
> +}
> +
> +static void cdns_i3c_master_update_devs(struct i3c_master_controller *m)
> +{
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	u32 val, newdevs;
> +	int slot;
> +	struct i3c_device_info i3c_info;
> +	struct i2c_dev_boardinfo i2c_info;
> +
> +	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
> +	for (slot = 1; slot <= master->maxdevs; slot++) {
> +		val = readl(master->regs + DEV_ID_RR0(slot));
> +
> +		if ((newdevs & BIT(slot)) && (val & DEV_ID_RR0_IS_I3C)) {
> +			cdns_i3c_master_i3c_dev_rr_to_info(master, slot,
> +							   &i3c_info);
> +			i3c_master_add_i3c_dev_locked(m, i3c_info.dyn_addr);
> +		} else if ((newdevs & BIT(slot)) &&
> +			   !(val & DEV_ID_RR0_IS_I3C)) {
> +			cdns_i3c_master_i2c_dev_rr_to_boardinfo(master, slot,
> +								&i2c_info);
> +			i3c_master_add_i2c_dev(m, &i2c_info);
> +		}
> +	}
> +}
> +
>  static enum i3c_error_code cdns_i3c_cmd_get_err(struct cdns_i3c_cmd *cmd)
>  {
>  	switch (cmd->error) {
> @@ -1045,22 +1135,6 @@ static void cdns_i3c_master_bus_cleanup(struct i3c_master_controller *m)
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
> @@ -1259,15 +1333,17 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
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
> @@ -1289,6 +1365,23 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
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
> @@ -1366,27 +1459,105 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
>  
>  		case IBIR_TYPE_MR:
>  			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
> +			master->mastership.ibir = ibir;
> +			queue_work(master->base.wq,
> +				   &master->mastership.handover_work);
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
> +static void cdns_i3c_master_mastership_takeover(struct work_struct *work)
> +{
> +	struct cdns_i3c_master *master = container_of(work,
> +						      struct cdns_i3c_master,
> +						      mastership.takeover_work);
> +
> +	writel(SLV_INT_MR_DONE, master->regs + SLV_ICR);
> +
> +	master->base.bus.cur_master = master->base.this;
> +
> +	if (master->base.init_done)
> +		i3c_master_bus_takeover(&master->base);
> +
> +	writel(readl(master->regs + CTRL) & ~CTRL_MST_ACK, master->regs + CTRL);
> +}
> +
> +static void cdns_i3c_sec_master_mastership_request(struct work_struct *work)
> +{
> +	struct cdns_i3c_master *master = container_of(work,
> +						      struct cdns_i3c_master,
> +						      mastership.request_work);
> +
> +	if (cdns_i3c_sec_master_request_mastership(&master->base))
> +		dev_err(&master->base.dev, "Mastership takeover failed\n");
> +	else
> +		dev_err(&master->base.dev, "Mastership takeover succeed\n");
> +}
> +
> +static void cdns_i3c_sec_master_event_up(struct cdns_i3c_master *master)
> +{
> +	u32 status;
> +
> +	writel(SLV_INT_EVENT_UP, master->regs + SLV_ICR);
> +	status = readl(master->regs + SLV_STATUS1);
> +	if (!(status & SLV_STATUS1_MR_DIS) &&
> +	    !master->base.bus.cur_master) {

Hm, don't we need to make sure we actually have something to do? I
mean, we could receive ENEC(MR) event for the second time and actually
have no devices to register. In this case we probably don't want to
send an MR event...

> +		queue_work(master->base.wq, &master->mastership.request_work);
> +	}
> +}
> +
> +static void cdns_i3c_sec_mastership_done(struct cdns_i3c_master *master)
> +{
> +	writel(SLV_INT_MR_DONE, master->regs + SLV_ICR);
> +
> +	queue_work(master->base.wq, &master->mastership.takeover_work);
> +}
> +
>  static irqreturn_t cdns_i3c_master_interrupt(int irq, void *data)
>  {
>  	struct cdns_i3c_master *master = data;
>  	u32 status;
>  
> -	status = readl(master->regs + MST_ISR);
> -	if (!(status & readl(master->regs + MST_IMR)))
> -		return IRQ_NONE;
> +	if (master->base.bus.cur_master != master->base.this) {
> +		status = readl(master->regs + SLV_ISR);
>  
> -	spin_lock(&master->xferqueue.lock);
> -	cdns_i3c_master_end_xfer_locked(master, status);
> -	spin_unlock(&master->xferqueue.lock);
> +		if (!(status & readl(master->regs + SLV_IMR)))
> +			return IRQ_NONE;
> +
> +		if (status & SLV_INT_MR_DONE)
> +			cdns_i3c_sec_mastership_done(master);
> +
> +		if (status & SLV_INT_EVENT_UP)
> +			cdns_i3c_sec_master_event_up(master);
> +	} else {
> +		status = readl(master->regs + MST_ISR);
> +		if (!(status & readl(master->regs + MST_IMR)))
> +			return IRQ_NONE;
>  
> -	if (status & MST_INT_IBIR_THR)
> -		cnds_i3c_master_demux_ibis(master);
> +		spin_lock(&master->xferqueue.lock);
> +		cdns_i3c_master_end_xfer_locked(master, status);
> +		spin_unlock(&master->xferqueue.lock);
> +
> +		if (status & MST_INT_IBIR_THR)
> +			cnds_i3c_master_demux_ibis(master);
> +
> +		if (status & MST_INT_MR_DONE)
> +			cdns_i3c_master_bus_handoff(master);
> +	}
>  
>  	return IRQ_HANDLED;
>  }
> @@ -1455,30 +1626,46 @@ static int cdns_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
>  	return ret;
>  }
>  
> -static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
> -				       const struct i3c_ibi_setup *req)
> +static int cdns_i3c_master_find_ibi_slot(struct cdns_i3c_master *master,
> +					 struct i3c_dev_desc *dev,
> +					 s16 *slot)
>  {
> -	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> -	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> -	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	unsigned long flags;
>  	unsigned int i;
> -
> -	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
> -	if (IS_ERR(data->ibi_pool))
> -		return PTR_ERR(data->ibi_pool);
> +	int ret = -ENOENT;
>  
>  	spin_lock_irqsave(&master->ibi.lock, flags);
>  	for (i = 0; i < master->ibi.num_slots; i++) {
> -		if (!master->ibi.slots[i]) {
> -			data->ibi = i;
> +		/*
> +		 * We only need 'SIR' slots to describe IBI-capable devices.
> +		 * This slot may be used by mastership request interrupt,
> +		 * We can ruse the same 'SIR' map entry.
> +		 */
> +		if (!master->ibi.slots[i] ||
> +		    master->ibi.slots[i] == dev) {

Doesn't work if you have empty slots in the middle. You should first
iterate over all entries searching for slots[i] == dev and if there's
no match, pick the first empty entry.

>  			master->ibi.slots[i] = dev;
> +			*slot = i;
> +			ret = 0;
>  			break;
>  		}
>  	}
>  	spin_unlock_irqrestore(&master->ibi.lock, flags);
>  
> -	if (i < master->ibi.num_slots)
> +	return ret;
> +}
> +
> +static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
> +				       const struct i3c_ibi_setup *req)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
> +	if (IS_ERR(data->ibi_pool))
> +		return PTR_ERR(data->ibi_pool);
> +
> +	if (cdns_i3c_master_find_ibi_slot(master, dev, &data->ibi) == 0)

	if (!....)

>  		return 0;
>  
>  	i3c_generic_ibi_free_pool(data->ibi_pool);
> @@ -1487,6 +1674,37 @@ static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
>  	return -ENOSPC;
>  }
>  
> +static int cdns_i3c_master_enable_mastership_events(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	unsigned long flags;
> +	u32 sircfg, sirmap;
> +	int ret;
> +
> +	ret = cdns_i3c_master_find_ibi_slot(master, dev, &data->ibi);
> +	if (ret)
> +		return -ENOSPC;

Please propagate the error instead of returning ENOSPC.

> +
> +	spin_lock_irqsave(&master->ibi.lock, flags);
> +	sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
> +	sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
> +	sircfg = SIR_MAP_DEV_ROLE(dev->info.bcr >> 6) |
> +		 SIR_MAP_DEV_DA(dev->info.dyn_addr) |
> +		 SIR_MAP_DEV_PL(dev->info.max_ibi_len) |
> +		 SIR_MAP_DEV_ACK;
> +
> +	if (dev->info.bcr & I3C_BCR_MAX_DATA_SPEED_LIM)
> +		sircfg |= SIR_MAP_DEV_SLOW;
> +
> +	sirmap |= SIR_MAP_DEV_CONF(data->ibi, sircfg);
> +	writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> +

Where is i3c_master_enec_locked() called?

> +	return 0;
> +}
> +
>  static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> @@ -1502,6 +1720,39 @@ static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
>  	i3c_generic_ibi_free_pool(data->ibi_pool);
>  }
>  
> +static int cdns_i3c_master_disable_mastership_events(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	unsigned long flags;
> +	u32 sirmap;
> +	int ret;
> +
> +	ret = i3c_master_disec_locked(m, dev->info.dyn_addr,
> +				      I3C_CCC_EVENT_MR);
> +	if (ret)
> +		return ret;
> +
> +	if (data->ibi < 0)
> +		return -ENOENT;
> +
> +	if (master->ibi.slots[data->ibi]->ibi->handler)
> +		return 0;
> +
> +	spin_lock_irqsave(&master->ibi.lock, flags);
> +	sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
> +	sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
> +	sirmap |= SIR_MAP_DEV_CONF(data->ibi,
> +				   SIR_MAP_DEV_DA(I3C_BROADCAST_ADDR));
> +	writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> +
> +	cdns_i3c_master_free_ibi(dev);

Looks like you're also disabling regular IBIs here, is that really
what you want?

> +
> +	return ret;
> +}
> +
>  static void cdns_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
>  					     struct i3c_ibi_slot *slot)
>  {
> @@ -1529,6 +1780,10 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
>  	.request_ibi = cdns_i3c_master_request_ibi,
>  	.free_ibi = cdns_i3c_master_free_ibi,
>  	.recycle_ibi_slot = cdns_i3c_master_recycle_ibi_slot,
> +	.request_mastership = cdns_i3c_sec_master_request_mastership,
> +	.update_devs = cdns_i3c_master_update_devs,
> +	.enable_mr_events = cdns_i3c_master_enable_mastership_events,
> +	.disable_mr_events = cdns_i3c_master_disable_mastership_events
>  };
>  
>  static void cdns_i3c_master_hj(struct work_struct *work)
> @@ -1537,13 +1792,31 @@ static void cdns_i3c_master_hj(struct work_struct *work)
>  						      struct cdns_i3c_master,
>  						      hj_work);
>  
> -	i3c_master_do_daa(&master->base);
> +	if (!master->base.secondary)
> +		i3c_master_do_daa(&master->base);
> +}
> +
> +static void cdns_i3c_master_mastership_handover(struct work_struct *work)
> +{
> +	struct cdns_i3c_master *master = container_of(work,
> +						      struct cdns_i3c_master,
> +						      mastership.handover_work);
> +	struct i3c_dev_desc *dev;
> +	u32 ibir = master->mastership.ibir;
> +
> +	dev = cdns_i3c_get_ibi_device(master, ibir);
> +	if (!dev)
> +		return;
> +
> +	if (i3c_master_mastership_ack(&master->base, dev->info.dyn_addr))
> +		dev_err(&master->base.dev, "Mastership handover failed\n");
>  }
>  
>  static int cdns_i3c_master_probe(struct platform_device *pdev)
>  {
>  	struct cdns_i3c_master *master;
>  	struct resource *res;
> +	bool secondary = false;
>  	int ret, irq;
>  	u32 val;
>  
> @@ -1585,15 +1858,27 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&master->xferqueue.list);
>  
>  	INIT_WORK(&master->hj_work, cdns_i3c_master_hj);
> +	INIT_WORK(&master->mastership.handover_work,
> +		  cdns_i3c_master_mastership_handover);
> +	INIT_WORK(&master->mastership.takeover_work,
> +		  cdns_i3c_master_mastership_takeover);
> +	INIT_WORK(&master->mastership.request_work,
> +		  cdns_i3c_sec_master_mastership_request);
> +
>  	writel(0xffffffff, master->regs + MST_IDR);
>  	writel(0xffffffff, master->regs + SLV_IDR);
>  	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
>  			       dev_name(&pdev->dev), master);
> +

Please do not add blank lines between ret assignments and the following
ret check.

>  	if (ret)
>  		goto err_disable_sysclk;
>  
>  	platform_set_drvdata(pdev, master);
>  
> +	val = readl(master->regs + MST_STATUS0);
> +	if (!(val & MST_STATUS0_MASTER_MODE))
> +		secondary = true;
> +
>  	val = readl(master->regs + CONF_STATUS0);
>  
>  	/* Device ID0 is reserved to describe this master. */
> @@ -1609,6 +1894,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&master->ibi.lock);
>  	master->ibi.num_slots = CONF_STATUS1_IBI_HW_RES(val);
> +
>  	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
>  					 sizeof(*master->ibi.slots),
>  					 GFP_KERNEL);
> @@ -1617,13 +1903,19 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  
>  	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
>  	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
> -	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
> +
> +	if (!secondary)
> +		writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
>  
>  	ret = i3c_master_register(&master->base, &pdev->dev,
> -				  &cdns_i3c_master_ops, false);
> +				  &cdns_i3c_master_ops, secondary);
>  	if (ret)
>  		goto err_disable_sysclk;
>  
> +	if (secondary)
> +		writel(SLV_INT_EVENT_UP,
> +		       master->regs + SLV_IER);
> +
>  	return 0;
>  
>  err_disable_sysclk:
> @@ -1666,6 +1958,7 @@ static struct platform_driver cdns_i3c_master = {
>  module_platform_driver(cdns_i3c_master);
>  
>  MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
> +MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
>  MODULE_DESCRIPTION("Cadence I3C master driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:cdns-i3c-master");


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
