Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2009AC44501
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CwX1TevFYdbJO9Ggdn5tQ80cEti3JYrenydCJrCL+k=; b=qnxCkJ2zX7l3Vh
	honFYWLydoqANBQMLbYmiVNNQ9ogOWHl8/2qSwehah4fA6FvZIHrOI+van3llLR3L1JIl0xww8UPJ
	wRz51ef29Q51JOjDKP6SbGuRwW5/A9UzoKzKYpOGxbCORlAtUK4cg7dh1MwdJGkHMWp2XwRSyfI2S
	dX26YJ+DXoDhPsqtXw8bW8+5wuahIhuYADKz06hsbyOTSDgFFokDhhTTZ+UfmEl96rSP6HBtPLuBk
	BZkydOX5BX5D/ZeoluBuxyAItw/3Stb8mINQ7SHDYqq4j7zwFM99FOFFt+BtULcAeKjX/O0AyIvE4
	y39zQhDkk77tT65lI6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMY-00000009Jzi-3hQf;
	Mon, 13 Jul 2026 13:06:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMW-00000009Jx8-2ugK
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f365afc5aso706186f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947979; x=1784552779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13ulA9xiGeZHoehEPfVqSD4E9lgwTJlF+km3jctT3S4=;
        b=AxRfrTHOSAv0NWK/i17ppqOkM+fWpxFvYYBFKvRW8QJ06YF5z21RHcQQX3NdIdYNIP
         K9j7JZrlOMc6XD2XRwdcYNhAA3q5KRQ5t+7gTeoqQ5Br4FPn9+faBGM8cYkI/RHmbjqB
         uXBNYaSXqWoVTrg0RzOMQMEJqj/9nBW6i/cbPKG9H0q+jpnS8bjgFM0vjFQnDCPU0aK8
         xO3L7Dgc4veCjLYsv55FMk2Bji2BpgWMFm8amE2Jcmnd0Kr4tkyZvNbBWxV1k9dFrsdw
         Awv7EMC/U4uzmCZIndj3CRGo77ijnVPRUrMqgglp7qqEKZDdizaJp4jy3GcBlPrwpgLq
         u0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947979; x=1784552779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13ulA9xiGeZHoehEPfVqSD4E9lgwTJlF+km3jctT3S4=;
        b=j/8O0hmji56WXlJcsim52gpBFGZ4tiI+sEEV5MIN7oZU5ZyfNrDbxG8pB9C7auxyuR
         /HDC/sl/T2htTRj7F4UtEkGyOgTfr0lrB/ETVC5aODtt+1uUE1be3ra7I+EV0dnmkzlb
         uV9d+f+q8eeFbjC/OGQw6EJN4e5ue0q7cD4Pi4u9xFCQEITmic+lzJLYBmAFJJ4dr5k9
         jIz+1Gp4hFNfNNARb0WRTngsfftX0jjmQA+e1BKAk8njlGXBqQKXyjZNsAzezVxRuYrP
         p9czq0KFXNmBIB5innQPLvzPZBY9tNgQb0/CZVBOjwkYGWLzrP7X7g3lII3KzcYovIvC
         +kgg==
X-Forwarded-Encrypted: i=1; AHgh+RrHWqrI1CXcFz2vRw4LpZhZ1JsT09Uh+hNOLj5892iuX+WNiX3KVsORcGbMOFFE5Xuzli9gfrcuhew=@lists.infradead.org
X-Gm-Message-State: AOJu0YxI/PZOzsOsfuucdO9a4WRvTQl2B2ml97FEeGVCvWU8XF1BpsxE
	naJp3QogoM7LMh+YIFCOYAxKutIj/1Z/Pedez7JJCnlZwioCIKhEkUVv3XKWl+U+JlQ=
X-Gm-Gg: AfdE7cmWmq4xmM4NV7WHlLl0/sNRtbEvos45POqEAH2KbfalMjz1baOss5CpklCSmCd
	ZnKpMRcLPIkohlkfKTsmO48hif+0JajSO+e9mJVUS878YnzFolTGn+xrqJp+f/7y/4lR3sI1IiR
	i20PBLJZ2A7B89qsPwVR0wWS9IwjfCSeZTHTmdCYeva19F6/lWfX2mNE6wjWTzxCAc8wUVc1cj+
	u1z1wqWVKeOZlxl8YlLhFQsZ4PihJqRzuow0BCNxCMjGluD3UKK0AY5a4cXZHUT85O2MZ0SfNqv
	Cye42F9mtaydsoQmgrNJ7UUKFbpN6E1kRjNxo7dHk4EDArKKjlrgZ9YAaciYd85Q+FkMJHipo/Y
	8RMiszrWJ95DucLqSRtyXtZxgv1Ak9wCfMlIoMe9LjAYhmgBsogTREg5J84xvbO40nggBHAjh2j
	f0nGhr2uFIdcTPPIQU6itdGcL17xDPD2tbvQwDy+VxLmvlEncT/BPm79E30tSNjzJ1bYokPTI+d
	dfzmcZevA==
X-Received: by 2002:a5d:5846:0:b0:47d:ef62:cae0 with SMTP id ffacd0b85a97d-47f2dcde19bmr9660430f8f.51.1783947979049;
        Mon, 13 Jul 2026 06:06:19 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:18 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 17/17] i3c: renesas: Add runtime PM support
Date: Mon, 13 Jul 2026 16:05:45 +0300
Message-ID: <20260713130545.568657-18-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060620_813808_0F4E9A1B 
X-CRM114-Status: GOOD (  25.56  )
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

Changes in v5:
- updated renesas_i3c_irqs_mask_and_clear() to use the
  renesas_i3c_irqs_mask_and_clear_locked() introduced in patch 1 from
  this series

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

 drivers/i3c/master/renesas-i3c.c | 140 ++++++++++++++++++++++++-------
 1 file changed, 112 insertions(+), 28 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 378baac71aef..1975c599ca43 100644
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
@@ -254,9 +253,10 @@ struct renesas_i3c_xferqueue {
 
 struct renesas_i3c {
 	void __iomem *regs;
-	struct clk_bulk_data *clks;
+	struct clk *tclk;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	struct device *dev;
 	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
@@ -269,7 +269,6 @@ struct renesas_i3c {
 	u32 i3c_STDBR;
 	u32 extbr;
 	u16 maxdevs;
-	u8 num_clks;
 	u8 refclk_div;
 };
 
@@ -449,7 +448,14 @@ static void renesas_i3c_irqs_mask_and_clear_locked(struct renesas_i3c *i3c)
 	renesas_readl(i3c->regs, BST);
 }
 
-static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
+static void renesas_i3c_irqs_mask_and_clear(struct renesas_i3c *i3c)
+{
+	guard(spinlock_irqsave)(&i3c->xferqueue.lock);
+
+	renesas_i3c_irqs_mask_and_clear_locked(i3c);
+}
+
+static unsigned long renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
 {
 	unsigned long time_left;
 
@@ -458,6 +464,8 @@ static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xf
 	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
 	if (!time_left)
 		renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	return time_left;
 }
 
 static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
@@ -491,6 +499,12 @@ static void renesas_i3c_bus_enable(struct i3c_master_controller *m, bool i3c_mod
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
@@ -562,7 +576,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
+	i3c->rate = clk_get_rate(i3c->tclk);
 	if (!i3c->rate)
 		return -EINVAL;
 
@@ -633,6 +647,11 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
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
@@ -655,6 +674,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	u32 olddevs, newdevs;
 	u8 last_addr = 0, pos;
 	int ret;
@@ -667,6 +687,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	cmd = xfer->cmds;
 	cmd->rx_count = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -701,7 +726,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
 		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_irqs_mask_and_clear(i3c);
 
 	if (cmd->rx_count >= i3c->maxdevs)
 		newdevs = 0;
@@ -767,6 +794,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	int ret, pos = 0;
 
 	if (ccc->id & I3C_CCC_DIRECT) {
@@ -784,6 +812,11 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	cmd->rnw = ccc->rnw;
 	cmd->cmd0 = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, true);
 
 	/* Calculate the command descriptor. */
@@ -818,7 +851,9 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 		}
 	}
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_irqs_mask_and_clear(i3c);
 
 	ret = xfer->ret;
 	if (ret)
@@ -833,7 +868,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int i;
+	unsigned long time_left;
+	bool xfer_failed = false;
+	int i, ret;
 
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
@@ -841,6 +878,11 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 
 	init_completion(&xfer->comp);
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -872,9 +914,14 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
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
 
@@ -883,12 +930,17 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
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
@@ -910,7 +962,12 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int pos;
+	int pos, ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	pos = renesas_i3c_get_free_pos(i3c);
 
@@ -938,8 +995,12 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
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
 	i3c->addrs[data->index] = 0;
@@ -955,7 +1016,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
 	u8 start_bit = CNDCTL_STCND;
-	int i;
+	unsigned long time_left;
+	bool xfer_failed = false;
+	int i, ret;
 
 	if (!i2c_nxfers)
 		return 0;
@@ -968,6 +1031,11 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	xfer->is_i2c_xfer = true;
 	cmd = xfer->cmds;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, false);
 
 	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
@@ -994,7 +1062,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 
 		renesas_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
 
-		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		time_left = wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		if (!time_left)
+			xfer_failed = true;
 
 		if (cmd->err)
 			break;
@@ -1003,6 +1073,10 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 	renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	if (xfer_failed)
+		renesas_i3c_irqs_mask_and_clear(i3c);
+
 	return cmd->err;
 }
 
@@ -1384,12 +1458,16 @@ static int renesas_i3c_probe(struct platform_device *pdev)
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
@@ -1456,8 +1534,6 @@ static int renesas_i3c_suspend(struct device *dev)
 	if (ret)
 		goto err_mark_resumed;
 
-	clk_bulk_disable(i3c->num_clks, i3c->clks);
-
 	return 0;
 
 err_mark_resumed:
@@ -1479,13 +1555,13 @@ static int renesas_i3c_resume(struct device *dev)
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
@@ -1504,15 +1580,23 @@ static int renesas_i3c_resume(struct device *dev)
 
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
