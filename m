Return-Path: <SRS0=Bw26=B5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF94C433E4
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2020 09:04:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 733C4207DE
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2020 09:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Qjuas19"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 733C4207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cqOjL05j2G/e5lrdnc6ayzqSmbLXBFvP6hvEO/JYyPU=; b=0Qjuas19nDqvLn1QVzjzwGTF8
	CnRMfgnBpGMlH1aIXWzEGT9BkWxV3uc7KygXsf7MlWe91IoOTSHJ+JGaSPWw9CaBAwduqYg4NMi7W
	KmCmd/JVxwjn7tOebrcQ4m67cVo5f8DOKjB0BaZyRn5sCEZkevufebWnVqHAe4j8dFq5i4LRKMpid
	OM3GK5Lsvz3vAo4bKUrp0d1OMtHIfD8bNTUCPAFffQJHGnlKTc/Fm5I32B4BilMV5n9SCV9yRXi3A
	aLoI5CWPvejbQjGtQRMoR+5doWuVkW16u1Ofvsra9462jyDtcyZRoH32ja4C5emtuL5IL5KON7duc
	8BxB8hcXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8K1Q-0000WF-Ul
	for linux-i3c@archiver.kernel.org; Wed, 19 Aug 2020 09:04:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8K1N-0000VD-Gu
 for linux-i3c@lists.infradead.org; Wed, 19 Aug 2020 09:04:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EC93C299766;
 Wed, 19 Aug 2020 10:04:35 +0100 (BST)
Date: Wed, 19 Aug 2020 11:04:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 3/4] i3c: master: svc: Add Silvaco I3C master driver
Message-ID: <20200819110432.0df68db9@collabora.com>
In-Reply-To: <20200812141312.3331-3-miquel.raynal@bootlin.com>
References: <20200812141312.3331-1-miquel.raynal@bootlin.com>
 <20200812141312.3331-3-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_050437_809658_A9B06F83 
X-CRM114-Status: GOOD (  30.40  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 12 Aug 2020 16:13:11 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:


> +
> +#define SVC_I3C_MAX_DEVS 32
> +
> +struct svc_i3c_cmd {
> +	u8 addr;
> +	bool rnw;
> +	u8 *in;
> +	const void *out;
> +	unsigned int len;
> +	unsigned int read_len;
> +	bool continued;
> +};
> +
> +struct svc_i3c_xfer {
> +	struct list_head node;
> +	struct completion comp;
> +	int ret;
> +	unsigned int type;
> +	unsigned int ncmds;
> +	struct svc_i3c_cmd cmds[];
> +};
> +
> +/**
> + * struct svc_i3c_master - Silvaco I3C Master structure
> + * @base: I3C master controller
> + * @dev: Corresponding device
> + * @regs: Memory mapping
> + * @free_slots: Bit array of available slots
> + * @addrs: Array containing the dynamic addresses of each attached device
> + * @descs: Array of descriptors, one per attached device
> + * @hj_work: Hot-join work
> + * @irq: Main interrupt
> + * @pclk: System clock
> + * @fclk: Fast clock (bus)
> + * @sclk: Slow clock (other events)
> + * @xferqueue: Transfer queue structure
> + * @xferqueue.list: List member
> + * @xferqueue.cur: Current ongoing transfer
> + * @xferqueue.lock: Queue lock
> + * @ibi: IBI structure
> + * @ibi.num_slots: Number of slots available in @ibi.slots
> + * @ibi.slots: Available IBI slots
> + * @ibi.lock: IBI lock
> + * @bus_lock: Bus lock
> + */
> +struct svc_i3c_master {
> +	struct i3c_master_controller base;
> +	struct device *dev;
> +	void __iomem *regs;
> +	u32 free_slots;
> +	u8 addrs[SVC_I3C_MAX_DEVS];
> +	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
> +	struct work_struct hj_work;
> +	int irq;
> +	struct clk *pclk;
> +	struct clk *fclk;
> +	struct clk *sclk;
> +	struct {
> +		struct list_head list;
> +		struct svc_i3c_xfer *cur;
> +		/* Prevent races between transfers */
> +		spinlock_t lock;
> +	} xferqueue;
> +	struct {
> +		unsigned int num_slots;
> +		struct i3c_dev_desc **slots;
> +		/* Prevent races within IBI handlers */
> +		spinlock_t lock;
> +	} ibi;
> +};
> +
> +/**
> + * struct svc_i3c_i3c_dev_data - Device specific data
> + * @index: Index in the master tables corresponding to this device
> + * @ibi: IBI slot index in the master structure
> + * @ibi_pool: IBI pool associated to this device
> + */
> +struct svc_i3c_i2c_dev_data {
> +	u8 index;
> +	int ibi;
> +	struct i3c_generic_ibi_pool *ibi_pool;
> +};
> +
> +static void svc_i3c_master_enable_interrupts(struct svc_i3c_master *master, u32 mask)
> +{
> +	writel(mask, master->regs + SVC_I3C_MINTSET);
> +}
> +
> +static void svc_i3c_master_disable_interrupts(struct svc_i3c_master *master)
> +{
> +	u32 mask = readl(master->regs + SVC_I3C_MINTSET);
> +
> +	writel(mask, master->regs + SVC_I3C_MINTCLR);
> +}
> +
> +static inline struct svc_i3c_master *
> +to_svc_i3c_master(struct i3c_master_controller *master)
> +{
> +	return container_of(master, struct svc_i3c_master, base);
> +}
> +
> +static void svc_i3c_master_hj(struct work_struct *work)
> +{
> +	struct svc_i3c_master *master;
> +
> +	master = container_of(work, struct svc_i3c_master, hj_work);
> +	i3c_master_do_daa(&master->base);
> +}
> +
> +static void svc_i3c_master_flush_fifo(struct svc_i3c_master *master)
> +{
> +	writel(SVC_I3C_MDATACTRL_FLUSHTB | SVC_I3C_MDATACTRL_FLUSHRB,
> +	       master->regs + SVC_I3C_MDATACTRL);
> +}
> +
> +static struct i3c_dev_desc *
> +svc_i3c_master_dev_from_addr(struct svc_i3c_master *master,
> +			     unsigned int ibiaddr)
> +{
> +	int i;
> +
> +	for (i = 0; i < SVC_I3C_MAX_DEVS; i++)
> +		if (master->addrs[i] == ibiaddr)
> +			break;
> +
> +	if (i == SVC_I3C_MAX_DEVS)
> +		return NULL;
> +
> +	return master->descs[i];
> +}
> +
> +static void svc_i3c_master_emit_stop(struct svc_i3c_master *master)
> +{
> +	writel(SVC_I3C_MCTRL_REQUEST_STOP, master->regs + SVC_I3C_MCTRL);
> +}
> +
> +static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
> +				     struct i3c_dev_desc *dev)
> +{
> +	struct svc_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	struct i3c_ibi_slot *slot;
> +	unsigned int count;
> +	u32 mdatactrl;
> +	int ret = 0;
> +	u8 *buf;
> +
> +	spin_lock(&master->ibi.lock);
> +
> +	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
> +	if (!slot) {
> +		ret = -ENOSPC;
> +		goto unlock;
> +	}
> +
> +	slot->len = 0;
> +	buf = slot->data;
> +	while (readl(master->regs + SVC_I3C_MSTATUS) & SVC_I3C_MINT_RXPEND) {
> +		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
> +		count = SVC_I3C_MDATACTRL_RXCOUNT(mdatactrl);
> +		readsl(master->regs + SVC_I3C_MRDATAB, buf, count);
> +		slot->len += count;
> +		buf += count;
> +	}

I don't think the while loop and i3c_generic_ibi_get_free_slot() call
have to be protected by the ibi lock (having an unbounded while loop in
a critical section makes me nervous).

We also discussed the race you have because IBIs and regular transfers
share the same RX FIFO, which you mentioned in your previous reply
already.

> +
> +	i3c_master_queue_ibi(dev, slot);
> +
> +unlock:
> +	spin_unlock(&master->ibi.lock);
> +	svc_i3c_master_emit_stop(master);
> +	svc_i3c_master_flush_fifo(master);

Flush FIFOs? Does it flush all remaining bytes present in the RX/TX
FIFOs? Are you sure that's appropriate?

> +
> +	return ret;
> +}
> +
> +static void svc_i3c_master_ack_ibi(struct svc_i3c_master *master,
> +				   bool mandatory_byte)
> +{
> +	unsigned int ibi_ack_nack;
> +
> +	ibi_ack_nack = SVC_I3C_MCTRL_REQUEST_IBI_ACKNACK;
> +	if (mandatory_byte)
> +		ibi_ack_nack |= SVC_I3C_MCTRL_IBIRESP_ACK_WITH_BYTE;


IIRC, some devices send more than one byte, does that mean you don't
support those?

> +	else
> +		ibi_ack_nack |= SVC_I3C_MCTRL_IBIRESP_ACK_WITHOUT_BYTE;
> +
> +	writel(ibi_ack_nack, master->regs + SVC_I3C_MCTRL);
> +}
> +
> +static void svc_i3c_master_nack_ibi(struct svc_i3c_master *master)
> +{
> +	writel(SVC_I3C_MCTRL_REQUEST_IBI_ACKNACK |
> +	       SVC_I3C_MCTRL_IBIRESP_NACK,
> +	       master->regs + SVC_I3C_MCTRL);
> +}
> +
> +static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
> +{
> +	struct svc_i3c_master *master = (struct svc_i3c_master *)dev_id;
> +	u32 active = readl(master->regs + SVC_I3C_MINTMASKED);
> +	u32 status = readl(master->regs + SVC_I3C_MSTATUS);
> +	unsigned int ibitype = SVC_I3C_MSTATUS_IBITYPE(status);
> +	unsigned int ibiaddr = SVC_I3C_MSTATUS_IBIADDR(status);
> +	struct i3c_dev_desc *dev;
> +	bool rdata;
> +
> +	if (active & SVC_I3C_MINT_SLVSTART) {
> +		writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
> +		writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
> +		       SVC_I3C_MCTRL_IBIRESP_MANUAL,
> +		       master->regs + SVC_I3C_MCTRL);

I would expect some kind of auto-ack/nack mechanism. Not sure what
happens when you do it manually, but if that blocks the bus waiting for
the interrupt handler to tell the I3C master what to do with IBI,
that's far from ideal.

> +		return IRQ_HANDLED;
> +	}
> +
> +	if (!(active & SVC_I3C_MINT_IBIWON))
> +		return IRQ_NONE;
> +
> +	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
> +
> +	switch (ibitype) {
> +	case SVC_I3C_MSTATUS_IBITYPE_IBI:
> +		dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
> +		if (WARN_ON(!dev)) {

I wouldn't WARN_ON() that. I wouldn't be surprised if some slaves send
IBIs without being allowed, and you're in an interrupt context. This
being said, you should probably trigger a DISEC on this device when
that happens.

> +			svc_i3c_master_nack_ibi(master);
> +			break;
> +		}
> +
> +		rdata = dev->info.bcr & I3C_BCR_IBI_PAYLOAD;
> +		svc_i3c_master_ack_ibi(master, rdata);
> +		if (rdata) {
> +			svc_i3c_master_disable_interrupts(master);
> +			return IRQ_WAKE_THREAD;
> +		}
> +
> +		break;
> +	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
> +		svc_i3c_master_nack_ibi(master);
> +		break;
> +	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
> +		svc_i3c_master_ack_ibi(master, false);
> +		queue_work(master->base.wq, &master->hj_work);
> +		break;
> +	default:
> +		return IRQ_NONE;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t svc_i3c_master_threaded_handler(int irq, void *dev_id)
> +{
> +	struct svc_i3c_master *master = (struct svc_i3c_master *)dev_id;
> +	u32 status = readl(master->regs + SVC_I3C_MSTATUS);
> +	unsigned int ibiaddr = SVC_I3C_MSTATUS_IBIADDR(status);
> +	struct i3c_dev_desc *dev;

Do you really need a threaded irq? We already have a workqueue per
master, maybe you can use it to schedule the IBI dequeuing?

> +
> +	dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
> +	if (WARN_ON(!dev)) {
> +		svc_i3c_master_emit_stop(master);
> +		svc_i3c_master_flush_fifo(master);
> +		return IRQ_HANDLED;
> +	}
> +
> +	svc_i3c_master_handle_ibi(master, dev);
> +	svc_i3c_master_enable_interrupts(master,
> +					 SVC_I3C_MINT_SLVSTART |
> +					 SVC_I3C_MINT_IBIWON);
> +
> +	return IRQ_HANDLED;
> +}
> +


> +
> +static int svc_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct svc_i3c_master *master = to_svc_i3c_master(m);
> +	struct svc_i3c_i2c_dev_data *data;
> +	int slot;
> +
> +	slot = svc_i3c_master_reserve_slot(master);
> +	if (slot < 0)
> +		return slot;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		svc_i3c_master_release_slot(master, slot);
> +		return -ENOMEM;
> +	}
> +
> +	data->ibi = -1;
> +	data->index = slot;
> +	master->addrs[slot] = dev->info.dyn_addr ? dev->info.dyn_addr :
> +						   dev->info.static_addr;
> +	master->descs[slot] = dev;
> +
> +	i3c_dev_set_master_data(dev, data);
> +
> +	return 0;
> +}
> +
> +static int svc_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> +					   u8 old_dyn_addr)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct svc_i3c_master *master = to_svc_i3c_master(m);
> +	struct svc_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	master->addrs[data->index] = dev->info.dyn_addr ? dev->info.dyn_addr :
> +							  dev->info.static_addr;
> +
> +	return 0;
> +}
> +
> +static void svc_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct svc_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct svc_i3c_master *master = to_svc_i3c_master(m);
> +
> +	svc_i3c_master_release_slot(master, data->index);
> +
> +	kfree(data);
> +}
> +
> +static int svc_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct svc_i3c_master *master = to_svc_i3c_master(m);
> +	struct svc_i3c_i2c_dev_data *data;
> +	int slot;
> +
> +	slot = svc_i3c_master_reserve_slot(master);
> +	if (slot < 0)
> +		return slot;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		svc_i3c_master_release_slot(master, slot);
> +		return -ENOMEM;
> +	}
> +
> +	data->index = slot;
> +	master->addrs[slot] = dev->addr;
> +
> +	i2c_dev_set_master_data(dev, data);
> +
> +	return 0;
> +}
> +
> +static void svc_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct svc_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct svc_i3c_master *master = to_svc_i3c_master(m);
> +
> +	svc_i3c_master_release_slot(master, data->index);
> +
> +	kfree(data);
> +}
> +
> +static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
> +					u8 *addrs, unsigned int *count)
> +{
> +	u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
> +	unsigned int dev_nb = 0, last_addr = 0;
> +	u32 reg;
> +	int ret, i;
> +
> +	while (true) {
> +		/* Enter/proceed with DAA */
> +		writel(SVC_I3C_MCTRL_REQUEST_PROC_DAA |
> +		       SVC_I3C_MCTRL_TYPE_I3C |
> +		       SVC_I3C_MCTRL_IBIRESP_MANUAL |
> +		       SVC_I3C_MCTRL_DIR(SVC_I3C_MCTRL_DIR_WRITE),
> +		       master->regs + SVC_I3C_MCTRL);
> +
> +		/*
> +		 * Either one slave will send its ID, or the assignment process
> +		 * is done.
> +		 */
> +		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> +					 reg & (SVC_I3C_MINT_RXPEND |
> +						SVC_I3C_MINT_MCTRLDONE),
> +					 1, 1000);

No interrupt for the DAA? I'm also curious about the RX FIFO size.
Looks like PIDs/BCRs/DCRs of attached devices go there. What happens if
it exceeds the size of the FIFO and you're not dequeuing things fast
enough?

> +		if (ret)
> +			return ret;
> +
> +		if (reg & SVC_I3C_MINT_RXPEND) {
> +			u8 datab;
> +
> +			/*
> +			 * We only care about the 48-bit provisional ID yet to
> +			 * be sure a device does not nack an address twice.
> +			 * Otherwise, we would just need to flush the RX FIFO.
> +			 */
> +			for (i = 0; i < 6; i++) {
> +				ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS,
> +							 reg,
> +							 reg & SVC_I3C_MINT_RXPEND,
> +							 0, 1000);
> +				if (ret)
> +					return ret;
> +
> +				datab = readl(master->regs + SVC_I3C_MRDATAB);
> +				prov_id[dev_nb] |= (u64)(datab) << (8 * (5 - i));

This calls for an svc_i3c_read_bytes() helper.

> +			}
> +
> +			/* We do not care about the BCR and DCR yet */
> +			for (i = 0; i < 2; i++) {
> +				ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS,
> +							 reg,
> +							 reg & SVC_I3C_MINT_RXPEND,
> +							 0, 1000);
> +				if (ret)
> +					return ret;
> +
> +				reg = readl(master->regs + SVC_I3C_MRDATAB);
> +			}
> +		} else if (SVC_I3C_MSTATUS_MCTRLDONE(reg)) {

Can't you have both SVC_I3C_MSTATUS_MCTRLDONE and SVC_I3C_MINT_RXPEND?
BTW, can we make the bit definitions consistent. You sometimes have:

#define FOO(x)	FIELD_GET(BIT(n), (x))

and sometimes

#define BAR	BIT(n)

which leads to inconsistencies in how you test presence of those bits:

'if (FOO(reg))' vs 'if (reg & BAR)'.

> +			if (SVC_I3C_MSTATUS_STATE_IDLE(reg) &&
> +			    SVC_I3C_MSTATUS_COMPLETE(reg)) {
> +				/*
> +				 * All devices received and acked they dynamic
> +				 * address, this is the natural end of the DAA
> +				 * procedure.
> +				 */
> +				break;
> +			} else if (SVC_I3C_MSTATUS_NACKED(reg)) {
> +				/*
> +				 * A slave device nacked the address, this is
> +				 * allowed only once, DAA will be stopped and
> +				 * then resumed. The same device is supposed to
> +				 * answer again immediately and shall ack the
> +				 * address this time.
> +				 */


I couldn't find where this is described in v1 of the spec. All I see is:

"
The Arbitration-winning Device shall acknowledge the assigned Dynamic
Address
"

> +				if (prov_id[dev_nb] == nacking_prov_id)
> +					return -EIO;
> +
> +				dev_nb--;
> +				nacking_prov_id = prov_id[dev_nb];
> +				svc_i3c_master_emit_stop(master);
> +
> +				continue;
> +			} else {
> +				return -EIO;
> +			}
> +		}
> +
> +		/* Wait for the slave to be ready to receive its address */
> +		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> +					 SVC_I3C_MSTATUS_MCTRLDONE(reg) &&
> +					 SVC_I3C_MSTATUS_STATE_DAA(reg) &&
> +					 SVC_I3C_MSTATUS_BETWEEN(reg),
> +					 0, 1000);
> +		if (ret)
> +			return ret;
> +
> +		/* Give the slave device a suitable dynamic address */
> +		ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
> +		if (ret < 0)
> +			return ret;
> +
> +		addrs[dev_nb] = ret;
> +
> +		writel(addrs[dev_nb], master->regs + SVC_I3C_MWDATAB);
> +		last_addr = addrs[dev_nb++];
> +	}
> +
> +	*count = dev_nb;
> +
> +	return 0;
> +}

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
