Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B60CD98CF
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59txdtduy/RQ3YXk9d2hZ+OWW0XkK37PjZgwH0HqG3I=; b=vAOhVkjfYjz8AW
	L1kRI0BCl77f/5F95SMU0FIoH95VJXgrfANj+kpIsf2cUPrUQVTQbrEcb2fMJ2voKaqFTPP6MelA3
	HLEWatH29Ky2b+8gNHPjIm7We2wo6AoR8+V3M6e7/OAErGc7rDxY90HCf5DN2XpeLquQegDwfE3Bc
	aEUzQKizQ/Juxi35n3YDvQBHqt+KtNM29SlNHPlfl0UHfb8IaVMbVJNgy/OQnKF5g6G0JhGWCsx4z
	ieEREkqwJ3i4Wu+F2vQUkCv3bkFZ2+Pk91t9nKQPoJu21QLAckloBAyNtAGUE9zMmI0oDdxtwg1g8
	Whib5vDc8LNKotss4AzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4OE-0000000BCxs-3oJF;
	Fri, 12 Jun 2026 16:05:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4OE-0000000BCxW-1fop
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B45C43D0B;
	Fri, 12 Jun 2026 16:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C691D1F000E9;
	Fri, 12 Jun 2026 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280350;
	bh=W9i98gFE3kVi84YsLYvh5WlC51i5gG/5UO16JNAc3Bk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G/saKkqf24K2zO9R0mDU89BGbOrnReDhvE7oFS5r3+QYF+OSPgUFRYWdbtUSXD/1H
	 lfunn+GUe7Hi5AfP9790um5ElOSSTgDB6rwaPT/xx5eXN1IdZ7ti4cG9zjD/mexKtM
	 N6zO19n6rSppOHbP/3eeKKjOkAKkPWh5e2kBDM68PzXvN49fMxZ942M7aPkAtMZkLT
	 iNj9VLJo+OGI97EzQrX9fLtiUA9XJ2a7NVqYHPUYxP4vWPo3tW4VhqB/ePx9tu/fvG
	 rWS971Pfv4xbZW8cCGVnw4dQ0z1l4MDStbyuGFQ044F7nMLqi/p8LAwamO1h9Vg0qo
	 CK+1kP0C8VqRw==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 16/16] i3c: renesas: Add runtime PM support
Date: Fri, 12 Jun 2026 19:04:58 +0300
Message-ID: <20260612160458.3102106-17-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
References: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the SoCs where the Renesas I3C driver is enabled (RZ/G3S and RZ/G3E),
the clocks of the IP are managed through a clock PM domain. To keep the
I3C code simpler, the explicit clock handling was dropped along with the
addition of runtime PM support, in favor of the runtime PM APIs. Only the
code for getting tclk was preserved, as it is necessary to compute the
I3C clock rate.

All the APIs provided to the I3C subsystem through struct
i3c_master_controller_ops are guarded with runtime PM APIs to
enable/disable the controller at runtime.

As the Renesas I3C driver implements an asynchronous transmit model by
preparing a transfer and waiting for its completion through the ISR,
renesas_i3c_abort_xfer() was added to disable interrupts and clear any
pending IRQ status bits when there is no completion in the defined
timeout. Along with this, renesas_i3c_wait_xfer() return type was changed
to unsigned long.

Add runtime PM support for the Renesas I3C driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- renamed renesas_i3c_abort_xfer() from v3 to
  renesas_i3c_irqs_mask_and_clear(); along with it renamed local varibles
  abort_xfer to xfer_failed

Changes in v3:
- dropped the RPM resume/suspend in renesas_i3c_suspend() to read the
  DATBASn registers as the DATBASn register are not used on suspend/resume
  path anymore in this version

Changes in v2:
- dropped the runtime suspend/resume functions as for now, there will be
  no pinctrl sleep state described in DT
- do not synchronize the IRQs in renesas_i3c_abort_xfer() as some handlers
  may re-enable interrupts; instead just disable the interrupts and clean
  any status bits that the IRQ handlers are touching; with this the
  struct renesas_i3c::{irqs, num_irqs} and the associated code was removed
- dropped the renesas_i3c_dont_use_autosuspend() along with the
  devm_add_action_or_reset() call to set it since the same operation is
  done by the devres cleanup helper of devm_pm_runtime_enable()
- adjusted the renesas_i3c_suspend() with RPM calls to save the DATBAS
  registers
- use pm_runtime_resume_and_get() in renesas_i3c_resume() to avoid
  mixing gotos with cleanup helpers
- adjusted the patch description to reflect these changes

 drivers/i3c/master/renesas-i3c.c | 150 +++++++++++++++++++++++++------
 1 file changed, 122 insertions(+), 28 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 1bed2304b5ee..e0e75144440e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include "../internals.h"
@@ -199,8 +200,6 @@
 #define RENESAS_I3C_MAX_DEVS	8
 #define I2C_INIT_MSG		-1
 
-#define RENESAS_I3C_TCLK_IDX	1
-
 enum i3c_internal_state {
 	I3C_INTERNAL_STATE_DISABLED,
 	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
@@ -263,9 +262,10 @@ struct renesas_i3c_addr {
 
 struct renesas_i3c {
 	void __iomem *regs;
-	struct clk_bulk_data *clks;
+	struct clk *tclk;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	struct device *dev;
 	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
 	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
@@ -278,7 +278,6 @@ struct renesas_i3c {
 	u32 i3c_STDBR;
 	u32 extbr;
 	u16 maxdevs;
-	u8 num_clks;
 	u8 refclk_div;
 };
 
@@ -443,7 +442,24 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
 	}
 }
 
-static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
+static void renesas_i3c_irqs_mask_and_clear(struct renesas_i3c *i3c)
+{
+	guard(spinlock_irqsave)(&i3c->xferqueue.lock);
+
+	/* Disable all the interrupts */
+	renesas_writel(i3c->regs, BIE, 0);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear normal transfer status flags. */
+	renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0 | NTST_RSPQFF |
+					   NTST_TEF | NTST_TABTF);
+	/* Clear bus status flags. */
+	renesas_clear_bit(i3c->regs, BST, BST_NACKDF | BST_TENDF | BST_SPCNDDF);
+	/* Clear error flags. */
+	renesas_clear_bit(i3c->regs, BCTL, BCTL_ABT);
+}
+
+static unsigned long renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
 {
 	unsigned long time_left;
 
@@ -452,6 +468,8 @@ static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xf
 	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
 	if (!time_left)
 		renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	return time_left;
 }
 
 static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
@@ -485,6 +503,12 @@ static void renesas_i3c_bus_enable(struct i3c_master_controller *m, bool i3c_mod
 static int renesas_i3c_reset(struct renesas_i3c *i3c)
 {
 	u32 val;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	renesas_writel(i3c->regs, BCTL, 0);
 	renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
@@ -556,7 +580,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
+	i3c->rate = clk_get_rate(i3c->tclk);
 	if (!i3c->rate)
 		return -EINVAL;
 
@@ -627,6 +651,11 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		return ret;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
@@ -716,6 +745,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	u32 olddevs, newdevs;
 	u8 last_addr = 0, pos;
 	u8 first_i3c_pos = 0;
@@ -729,6 +759,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	cmd = xfer->cmds;
 	cmd->rx_count = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -777,7 +812,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
 		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_irqs_mask_and_clear(i3c);
 
 	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, first_i3c_pos);
 	/* Re-attach all the I3C devices on resume. */
@@ -865,6 +902,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	int ret, pos = 0;
 
 	if (ccc->id & I3C_CCC_DIRECT) {
@@ -882,6 +920,11 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	cmd->rnw = ccc->rnw;
 	cmd->cmd0 = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, true);
 
 	/* Calculate the command descriptor. */
@@ -916,7 +959,9 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 		}
 	}
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_irqs_mask_and_clear(i3c);
 
 	ret = xfer->ret;
 	if (ret)
@@ -931,7 +976,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int i;
+	unsigned long time_left;
+	bool xfer_failed = false;
+	int i, ret;
 
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
@@ -939,6 +986,11 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 
 	init_completion(&xfer->comp);
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -970,9 +1022,14 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 				renesas_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
 		}
 
-		renesas_i3c_wait_xfer(i3c, xfer);
+		time_left = renesas_i3c_wait_xfer(i3c, xfer);
+		if (!time_left)
+			xfer_failed = true;
 	}
 
+	if (xfer_failed)
+		renesas_i3c_irqs_mask_and_clear(i3c);
+
 	return 0;
 }
 
@@ -981,12 +1038,17 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data;
-	int pos;
+	int pos, ret;
 
 	pos = renesas_i3c_get_free_pos(i3c);
 	if (pos < 0)
 		return pos;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
@@ -1010,7 +1072,12 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_dev_desc *tmp_dev = i3c->addrs[data->index].i3c_dev;
-	int pos;
+	int pos, ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	pos = renesas_i3c_get_free_pos(i3c);
 
@@ -1040,8 +1107,12 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
+	int ret;
 
-	renesas_writel(i3c->regs, DATBAS(data->index), 0);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (!ret)
+		renesas_writel(i3c->regs, DATBAS(data->index), 0);
 
 	i3c_dev_set_master_data(dev, NULL);
 	i3c->addrs[data->index].addr = 0;
@@ -1058,7 +1129,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
 	u8 start_bit = CNDCTL_STCND;
-	int i;
+	unsigned long time_left;
+	bool xfer_failed = false;
+	int i, ret;
 
 	if (!i2c_nxfers)
 		return 0;
@@ -1071,6 +1144,11 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	xfer->is_i2c_xfer = true;
 	cmd = xfer->cmds;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, false);
 
 	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
@@ -1097,7 +1175,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 
 		renesas_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
 
-		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		time_left = wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		if (!time_left)
+			xfer_failed = true;
 
 		if (cmd->err)
 			break;
@@ -1106,6 +1186,10 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 	renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	if (xfer_failed)
+		renesas_i3c_irqs_mask_and_clear(i3c);
+
 	return cmd->err;
 }
 
@@ -1508,12 +1592,16 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (IS_ERR(i3c->regs))
 		return PTR_ERR(i3c->regs);
 
-	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
-	if (ret <= RENESAS_I3C_TCLK_IDX)
-		return dev_err_probe(&pdev->dev, ret < 0 ? ret : -EINVAL,
-				     "Failed to get clocks (need > %d, got %d)\n",
-				     RENESAS_I3C_TCLK_IDX, ret);
-	i3c->num_clks = ret;
+	i3c->tclk = devm_clk_get(&pdev->dev, "tclk");
+	if (IS_ERR(i3c->tclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tclk), "Failed to get tclk");
+
+	i3c->dev = &pdev->dev;
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
 	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
 	if (IS_ERR(i3c->tresetn))
@@ -1580,8 +1668,6 @@ static int renesas_i3c_suspend(struct device *dev)
 	if (ret)
 		goto err_mark_resumed;
 
-	clk_bulk_disable(i3c->num_clks, i3c->clks);
-
 	return 0;
 
 err_mark_resumed:
@@ -1603,13 +1689,13 @@ static int renesas_i3c_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
+	ret = renesas_i3c_reset(i3c);
 	if (ret)
 		goto err_resets_asserted;
 
-	ret = renesas_i3c_reset(i3c);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_clks_disable;
+		goto err_resets_asserted;
 
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
@@ -1632,15 +1718,23 @@ static int renesas_i3c_resume(struct device *dev)
 
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
+	pm_runtime_put_autosuspend(dev);
+
 	/*
 	 * I3C devices may have retained their dynamic address anyway. Do not
 	 * fail the resume because of DAA error.
 	 */
 	return 0;
 
-err_clks_disable:
-	clk_bulk_disable(i3c->num_clks, i3c->clks);
 err_resets_asserted:
+	/*
+	 * If this happens, there is no way to recover from this state without
+	 * reloading the driver. We want to avoid keeping the reset line
+	 * deasserted unnecessarily. The runtime paths will still work correctly
+	 * even if the IP registers are accessed while reset is asserted (e.g.
+	 * if a runtime path is triggered after a failed resume). Checked on
+	 * RZ/G3S.
+	 */
 	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
