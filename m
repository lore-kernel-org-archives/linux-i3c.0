Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35C3C04FFE
	for <linux-i3c@archiver.kernel.org>; Mon, 29 Apr 2024 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SkckWBCrjOIsR2vAqj4MwFtUKeDNQsDA01J7aKSob9s=; b=JxbQ7DskYFj1yT
	taZpm5+RztlBn3fS81RxgaLUAmrB905URfp1WOWFwA3C2yOxEs+7q5cQJCpgYe7CFrmehdJlKbtCK
	kzVVwlfuafo/Ll4r6Xar8kiHBGLf1iB2S/KwexU5VVVsWA0hEkj54kqflrbVvnn3DEJb6yiR2xnxu
	8d8DGmgjCC8grMJGlyB9tVu81ii+oAR/vsDkIfDFSY2coz82PW2TgVDmXQ++j7BE6lg9ltDk6X/lw
	7hkfv1+P4tP1kW51NyQS0jYydyOk0iy7+hhE/lJLXrY/VKAZ2d4GMvY7/d7T3qhPBZzycKdRzlYLv
	qRWTrgmGgaTNVoJLTzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1LYw-00000001qar-3zwF;
	Mon, 29 Apr 2024 07:36:34 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1LYt-00000001qYL-3t8u
	for linux-i3c@lists.infradead.org;
	Mon, 29 Apr 2024 07:36:34 +0000
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 29 Apr
 2024 15:36:25 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Apr
 2024 15:36:25 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 29 Apr 2024 15:36:24 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <dylan_hung@aspeedtech.com>,
	<gustavoars@kernel.org>, <keescook@chromium.org>,
	<billy_tsai@aspeedtech.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] i3c: dw: Add hot-join support.
Date: Mon, 29 Apr 2024 15:36:24 +0800
Message-ID: <20240429073624.256830-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: Fail (TWMBX02.aspeed.com: domain of billy_tsai@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_003631_986296_C95014E8 
X-CRM114-Status: GOOD (  12.55  )
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

Add hot-join support for dw i3c master controller.
By default, the hot-join acknowledgment is disabled, and the hardware will
automatically send the DISEC CCC when it receives the hot-join request.
Users can use the sys entry to enable it.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/dw-i3c-master.c | 67 ++++++++++++++++++++++++------
 drivers/i3c/master/dw-i3c-master.h |  2 +
 2 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 276153e10f5a..0ec00e644bd4 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1136,6 +1136,23 @@ static void dw_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 	data->ibi_pool = NULL;
 }
 
+static void dw_i3c_master_enable_sir_signal(struct dw_i3c_master *master, bool enable)
+{
+	u32 reg;
+
+	reg = readl(master->regs + INTR_STATUS_EN);
+	reg &= ~INTR_IBI_THLD_STAT;
+	if (enable)
+		reg |= INTR_IBI_THLD_STAT;
+	writel(reg, master->regs + INTR_STATUS_EN);
+
+	reg = readl(master->regs + INTR_SIGNAL_EN);
+	reg &= ~INTR_IBI_THLD_STAT;
+	if (enable)
+		reg |= INTR_IBI_THLD_STAT;
+	writel(reg, master->regs + INTR_SIGNAL_EN);
+}
+
 static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 					  struct i3c_dev_desc *dev,
 					  u8 idx, bool enable)
@@ -1170,23 +1187,34 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 	}
 	writel(reg, master->regs + IBI_SIR_REQ_REJECT);
 
-	if (global) {
-		reg = readl(master->regs + INTR_STATUS_EN);
-		reg &= ~INTR_IBI_THLD_STAT;
-		if (enable)
-			reg |= INTR_IBI_THLD_STAT;
-		writel(reg, master->regs + INTR_STATUS_EN);
-
-		reg = readl(master->regs + INTR_SIGNAL_EN);
-		reg &= ~INTR_IBI_THLD_STAT;
-		if (enable)
-			reg |= INTR_IBI_THLD_STAT;
-		writel(reg, master->regs + INTR_SIGNAL_EN);
-	}
+	if (global)
+		dw_i3c_master_enable_sir_signal(master, enable);
+
 
 	spin_unlock_irqrestore(&master->devs_lock, flags);
 }
 
+static int dw_i3c_master_enable_hotjoin(struct i3c_master_controller *m)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+
+	dw_i3c_master_enable_sir_signal(master, true);
+	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_HOT_JOIN_NACK,
+	       master->regs + DEVICE_CTRL);
+
+	return 0;
+}
+
+static int dw_i3c_master_disable_hotjoin(struct i3c_master_controller *m)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+
+	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_HOT_JOIN_NACK,
+	       master->regs + DEVICE_CTRL);
+
+	return 0;
+}
+
 static int dw_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 {
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
@@ -1326,6 +1354,8 @@ static void dw_i3c_master_irq_handle_ibis(struct dw_i3c_master *master)
 
 		if (IBI_TYPE_SIRQ(reg)) {
 			dw_i3c_master_handle_ibi_sir(master, reg);
+		} else if (IBI_TYPE_HJ(reg)) {
+			queue_work(master->base.wq, &master->hj_work);
 		} else {
 			len = IBI_QUEUE_STATUS_DATA_LEN(reg);
 			dev_info(&master->base.dev,
@@ -1393,6 +1423,8 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ibi_ops = {
 	.enable_ibi = dw_i3c_master_enable_ibi,
 	.disable_ibi = dw_i3c_master_disable_ibi,
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
+	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
+	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
 };
 
 /* default platform ops implementations */
@@ -1412,6 +1444,14 @@ static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
 	.set_dat_ibi = dw_i3c_platform_set_dat_ibi_nop,
 };
 
+static void dw_i3c_hj_work(struct work_struct *work)
+{
+	struct dw_i3c_master *master =
+		container_of(work, typeof(*master), hj_work);
+
+	i3c_master_do_daa(&master->base);
+}
+
 int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
@@ -1469,6 +1509,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (master->ibi_capable)
 		ops = &dw_mipi_i3c_ibi_ops;
 
+	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
 	ret = i3c_master_register(&master->base, &pdev->dev, ops, false);
 	if (ret)
 		goto err_assert_rst;
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index ab862c5d15fe..4ab94aa72252 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -57,6 +57,8 @@ struct dw_i3c_master {
 
 	/* platform-specific data */
 	const struct dw_i3c_platform_ops *platform_ops;
+
+	struct work_struct hj_work;
 };
 
 struct dw_i3c_platform_ops {
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
