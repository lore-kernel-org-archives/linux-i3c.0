Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969A7C77B6E
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeQ4XEOWUmYT1lV5fS2LNpb/rbwUEz1CAZtB87Tgdgk=; b=HYNacfYDJeWbn6
	coJhlNFGmCE15bkyK6zGFm9VF6xp0O7V3ImRoN1/5HCbvOmB7/YEVtLt6eE2ggwz7DxhOC+SKlhzg
	FWNsLP87+U3zAsTnAjsgm06hYg8rbAl1Eb629uh4xQAnYxU2l2gdsQpvNPC/M9qWnc3Dd3jRRmUaH
	AwxG2I/MYB+nFI4FNooeOCHnG8V5BRcAJHv6M+tMlNmmUXXwJz8DbCF8mmj+w0V6+RmqlhzPzYdV0
	Hxb32M/ziP0TvbR0iEnyKuiaCTc9SOr+QN1XeXAkBwcgUoXSHuw28UsA+6iiHkDNeJSayKzonLHhp
	BBKvyuwtZetM1SwJQiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phscv-003vUf-0o;
	Thu, 30 Mar 2023 13:47:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn3b-002yjz-2t
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:50:54 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 40954202A3; Thu, 30 Mar 2023 15:50:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680162650;
	bh=Gn/xs8u2oPEHNBLcAXMZNNbhKiMeKG5elXkUUuBrH2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eUYgnZeCXZ+WLuyeSnhYVk2SbULDsRk8+5rdJJ+2eNLquu1Y/gaKLAXSGjj8VkShb
	 qX9h1ymoI88KYSaGd9tel3t+ND2zktsUmhLEuulGOBiD9k1pSapnhg88fIgSUtULE/
	 i/mU5FTvERx+HliMYKDtBSIjVbAgzQXNvwwIVT0//cXmtwXkNCZfHcBF3E8SwmdlZJ
	 qBZMeIRZUUMG/9H0gfNd9eLVpO6qt5U4Yhh0+f6e7AUF/JtxZvYUgnESakaeb8Limt
	 MywSWv8rO/13Pl+H24VXpvpAVhzY7RtTDq/IKxwTPY0mWHG6Z1L/EpsGaRbltrS8v/
	 tsHW3KSZW0tOw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 3/5] i3c: dw: Add support for in-band interrupts
Date: Thu, 30 Mar 2023 15:50:34 +0800
Message-Id: <79daeefd7ccb7c935d0c159149df21a6c9a73ffa.1680161823.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680161823.git.jk@codeconstruct.com.au>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005052_329638_35E46D4D 
X-CRM114-Status: GOOD (  24.58  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:47:39 -0700
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

This change adds support for receiving and dequeueing i3c IBIs.

By setting struct dw_i3c_master->ibi_capable before probe, a platform
implementation can select the IBI-enabled version of the i3c_master_ops,
enabling the global IBI infrastrcture for that controller.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 281 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h |  11 ++
 2 files changed, 289 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index a086d9c5ff35..c49c5fa01a26 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -76,7 +76,22 @@
 
 #define RX_TX_DATA_PORT			0x14
 #define IBI_QUEUE_STATUS		0x18
+#define IBI_QUEUE_STATUS_IBI_ID(x)	(((x) & GENMASK(15, 8)) >> 8)
+#define IBI_QUEUE_STATUS_DATA_LEN(x)	((x) & GENMASK(7, 0))
+#define IBI_QUEUE_IBI_ADDR(x)		(IBI_QUEUE_STATUS_IBI_ID(x) >> 1)
+#define IBI_QUEUE_IBI_RNW(x)		(IBI_QUEUE_STATUS_IBI_ID(x) & BIT(0))
+#define IBI_TYPE_MR(x)                                                         \
+	((IBI_QUEUE_IBI_ADDR(x) != I3C_HOT_JOIN_ADDR) && !IBI_QUEUE_IBI_RNW(x))
+#define IBI_TYPE_HJ(x)                                                         \
+	((IBI_QUEUE_IBI_ADDR(x) == I3C_HOT_JOIN_ADDR) && !IBI_QUEUE_IBI_RNW(x))
+#define IBI_TYPE_SIRQ(x)                                                        \
+	((IBI_QUEUE_IBI_ADDR(x) != I3C_HOT_JOIN_ADDR) && IBI_QUEUE_IBI_RNW(x))
+
 #define QUEUE_THLD_CTRL			0x1c
+#define QUEUE_THLD_CTRL_IBI_STAT_MASK	GENMASK(31, 24)
+#define QUEUE_THLD_CTRL_IBI_STAT(x)	(((x) - 1) << 24)
+#define QUEUE_THLD_CTRL_IBI_DATA_MASK	GENMASK(20, 16)
+#define QUEUE_THLD_CTRL_IBI_DATA(x)	((x) << 16)
 #define QUEUE_THLD_CTRL_RESP_BUF_MASK	GENMASK(15, 8)
 #define QUEUE_THLD_CTRL_RESP_BUF(x)	(((x) - 1) << 8)
 
@@ -186,6 +201,8 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
+#define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
@@ -221,6 +238,7 @@ struct dw_i3c_xfer {
 
 struct dw_i3c_i2c_dev_data {
 	u8 index;
+	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
 static u8 even_parity(u8 p)
@@ -336,6 +354,12 @@ static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
 	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
 }
 
+static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
+					u8 *bytes, int nbytes)
+{
+	return dw_i3c_master_read_fifo(master, IBI_QUEUE_STATUS, bytes, nbytes);
+}
+
 static struct dw_i3c_xfer *
 dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
 {
@@ -605,7 +629,11 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	}
 
 	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
-	thld_ctrl &= ~QUEUE_THLD_CTRL_RESP_BUF_MASK;
+	thld_ctrl &= ~(QUEUE_THLD_CTRL_RESP_BUF_MASK |
+		       QUEUE_THLD_CTRL_IBI_STAT_MASK |
+		       QUEUE_THLD_CTRL_IBI_STAT_MASK);
+	thld_ctrl |= QUEUE_THLD_CTRL_IBI_STAT(1) |
+		QUEUE_THLD_CTRL_IBI_DATA(31);
 	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
 
 	thld_ctrl = readl(master->regs + DATA_BUFFER_THLD_CTRL);
@@ -1074,6 +1102,226 @@ static void dw_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
 	kfree(data);
 }
 
+static int dw_i3c_master_request_ibi(struct i3c_dev_desc *dev,
+				     const struct i3c_ibi_setup *req)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long flags;
+
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool))
+		return PTR_ERR(data->ibi_pool);
+
+	spin_lock_irqsave(&master->devs_lock, flags);
+	master->devs[data->index].ibi_dev = dev;
+	spin_unlock_irqrestore(&master->devs_lock, flags);
+
+	return 0;
+}
+
+static void dw_i3c_master_free_ibi(struct i3c_dev_desc *dev)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long flags;
+
+	spin_lock_irqsave(&master->devs_lock, flags);
+	master->devs[data->index].ibi_dev = NULL;
+	spin_unlock_irqrestore(&master->devs_lock, flags);
+
+	i3c_generic_ibi_free_pool(data->ibi_pool);
+	data->ibi_pool = NULL;
+}
+
+static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
+					  struct i3c_dev_desc *dev,
+					  u8 idx, bool enable)
+{
+	unsigned long flags;
+	u32 dat_entry, reg;
+	bool global;
+
+	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
+
+	spin_lock_irqsave(&master->devs_lock, flags);
+	reg = readl(master->regs + dat_entry);
+	if (enable) {
+		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
+		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
+			reg |= DEV_ADDR_TABLE_IBI_MDB;
+	} else {
+		reg |= DEV_ADDR_TABLE_SIR_REJECT;
+	}
+	writel(reg, master->regs + dat_entry);
+
+	reg = readl(master->regs + IBI_SIR_REQ_REJECT);
+	if (enable) {
+		global = reg == 0xffffffff;
+		reg &= ~BIT(idx);
+	} else {
+		global = reg == 0;
+		reg |= BIT(idx);
+	}
+	writel(reg, master->regs + IBI_SIR_REQ_REJECT);
+
+	if (global) {
+		reg = readl(master->regs + INTR_STATUS_EN);
+		reg &= ~INTR_IBI_THLD_STAT;
+		if (enable)
+			reg |= INTR_IBI_THLD_STAT;
+		writel(reg, master->regs + INTR_STATUS_EN);
+
+		reg = readl(master->regs + INTR_SIGNAL_EN);
+		reg &= ~INTR_IBI_THLD_STAT;
+		if (enable)
+			reg |= INTR_IBI_THLD_STAT;
+		writel(reg, master->regs + INTR_SIGNAL_EN);
+	}
+
+	spin_unlock_irqrestore(&master->devs_lock, flags);
+}
+
+static int dw_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	int rc;
+
+	dw_i3c_master_set_sir_enabled(master, dev, data->index, true);
+
+	rc = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+
+	if (rc)
+		dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
+
+	return rc;
+}
+
+static int dw_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	int rc;
+
+	rc = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	if (rc)
+		return rc;
+
+	dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
+
+	return 0;
+}
+
+static void dw_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
+					   struct i3c_ibi_slot *slot)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
+}
+
+static void dw_i3c_master_drain_ibi_queue(struct dw_i3c_master *master,
+					  int len)
+{
+	int i;
+
+	for (i = 0; i < DIV_ROUND_UP(len, 4); i++)
+		readl(master->regs + IBI_QUEUE_STATUS);
+}
+
+static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
+					 u32 status)
+{
+	struct dw_i3c_i2c_dev_data *data;
+	struct i3c_ibi_slot *slot;
+	struct i3c_dev_desc *dev;
+	unsigned long flags;
+	u8 addr, len;
+	int idx;
+
+	addr = IBI_QUEUE_IBI_ADDR(status);
+	len = IBI_QUEUE_STATUS_DATA_LEN(status);
+
+	spin_lock_irqsave(&master->devs_lock, flags);
+	idx = dw_i3c_master_get_addr_pos(master, addr);
+	if (idx < 0) {
+		dev_dbg_ratelimited(&master->base.dev,
+			 "IBI from unknown addr 0x%x\n", addr);
+		goto err_drain;
+	}
+
+	dev = master->devs[idx].ibi_dev;
+	if (!dev || !dev->ibi) {
+		dev_dbg_ratelimited(&master->base.dev,
+			 "IBI from non-requested dev idx %d\n", idx);
+		goto err_drain;
+	}
+
+	data = i3c_dev_get_master_data(dev);
+	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
+	if (!slot) {
+		dev_dbg_ratelimited(&master->base.dev,
+				    "No IBI slots available\n");
+		goto err_drain;
+	}
+
+	if (dev->ibi->max_payload_len < len) {
+		dev_dbg_ratelimited(&master->base.dev,
+				    "IBI payload len %d greater than max %d\n",
+				    len, dev->ibi->max_payload_len);
+		goto err_drain;
+	}
+
+	if (len) {
+		dw_i3c_master_read_ibi_fifo(master, slot->data, len);
+		slot->len = len;
+	}
+	i3c_master_queue_ibi(dev, slot);
+
+	spin_unlock_irqrestore(&master->devs_lock, flags);
+
+	return;
+
+err_drain:
+	dw_i3c_master_drain_ibi_queue(master, len);
+
+	spin_unlock_irqrestore(&master->devs_lock, flags);
+}
+
+/* "ibis": referring to In-Band Interrupts, and not
+ * https://en.wikipedia.org/wiki/Australian_white_ibis. The latter should
+ * not be handled.
+ */
+static void dw_i3c_master_irq_handle_ibis(struct dw_i3c_master *master)
+{
+	unsigned int i, len, n_ibis;
+	u32 reg;
+
+	reg = readl(master->regs + QUEUE_STATUS_LEVEL);
+	n_ibis = QUEUE_STATUS_IBI_STATUS_CNT(reg);
+	if (!n_ibis)
+		return;
+
+	for (i = 0; i < n_ibis; i++) {
+		reg = readl(master->regs + IBI_QUEUE_STATUS);
+
+		if (IBI_TYPE_SIRQ(reg)) {
+			dw_i3c_master_handle_ibi_sir(master, reg);
+		} else {
+			len = IBI_QUEUE_STATUS_DATA_LEN(reg);
+			dev_info(&master->base.dev,
+				 "unsupported IBI type 0x%lx len %d\n",
+				 IBI_QUEUE_STATUS_IBI_ID(reg), len);
+			dw_i3c_master_drain_ibi_queue(master, len);
+		}
+	}
+}
+
 static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 {
 	struct dw_i3c_master *master = dev_id;
@@ -1092,6 +1340,9 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 		writel(INTR_TRANSFER_ERR_STAT, master->regs + INTR_STATUS);
 	spin_unlock(&master->xferqueue.lock);
 
+	if (status & INTR_IBI_THLD_STAT)
+		dw_i3c_master_irq_handle_ibis(master);
+
 	return IRQ_HANDLED;
 }
 
@@ -1110,6 +1361,26 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
 };
 
+static const struct i3c_master_controller_ops dw_mipi_i3c_ibi_ops = {
+	.bus_init = dw_i3c_master_bus_init,
+	.bus_cleanup = dw_i3c_master_bus_cleanup,
+	.attach_i3c_dev = dw_i3c_master_attach_i3c_dev,
+	.reattach_i3c_dev = dw_i3c_master_reattach_i3c_dev,
+	.detach_i3c_dev = dw_i3c_master_detach_i3c_dev,
+	.do_daa = dw_i3c_master_daa,
+	.supports_ccc_cmd = dw_i3c_master_supports_ccc_cmd,
+	.send_ccc_cmd = dw_i3c_master_send_ccc_cmd,
+	.priv_xfers = dw_i3c_master_priv_xfers,
+	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
+	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
+	.i2c_xfers = dw_i3c_master_i2c_xfers,
+	.request_ibi = dw_i3c_master_request_ibi,
+	.free_ibi = dw_i3c_master_free_ibi,
+	.enable_ibi = dw_i3c_master_enable_ibi,
+	.disable_ibi = dw_i3c_master_disable_ibi,
+	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
+};
+
 /* default platform ops implementations */
 static int dw_i3c_platform_init_nop(struct dw_i3c_master *i3c)
 {
@@ -1123,6 +1394,7 @@ static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
 int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
+	const struct i3c_master_controller_ops *ops;
 	int ret, irq;
 
 	if (!master->platform_ops)
@@ -1172,8 +1444,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
-	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &dw_mipi_i3c_ops, false);
+	ops = &dw_mipi_i3c_ops;
+	if (master->ibi_capable)
+		ops = &dw_mipi_i3c_ibi_ops;
+
+	ret = i3c_master_register(&master->base, &pdev->dev, ops, false);
 	if (ret)
 		goto err_assert_rst;
 
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index dd0b77e2c66a..0096942649a3 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -19,6 +19,7 @@ struct dw_i3c_master_caps {
 
 struct dw_i3c_dat_entry {
 	u8 addr;
+	struct i3c_dev_desc *ibi_dev;
 };
 
 struct dw_i3c_master {
@@ -37,12 +38,22 @@ struct dw_i3c_master {
 	struct clk *core_clk;
 	char version[5];
 	char type[5];
+	bool ibi_capable;
 
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
+	 *
+	 * Locking: the devs array may be referenced in IRQ context while
+	 * processing an IBI. However, IBIs (for a specific device, which
+	 * implies a specific DAT entry) can only happen while interrupts are
+	 * requested for that device, which is serialised against other
+	 * insertions/removals from the array by the global i3c infrastructure.
+	 * So, devs_lock protects against concurrent updates to devs->ibi_dev
+	 * between request_ibi/free_ibi and the IBI irq event.
 	 */
 	struct dw_i3c_dat_entry devs[DW_I3C_MAX_DEVS];
+	spinlock_t devs_lock;
 
 	/* platform-specific data */
 	const struct dw_i3c_platform_ops *platform_ops;
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
