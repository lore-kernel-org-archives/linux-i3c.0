Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF858C3271E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jul 2024 06:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kt8j1XSaHwDI/wUaC8a38ImiIKP/6lUmbNNTdNeOG/I=; b=2WahRNDvSF706r6q/jigoBBJIn
	udY8huBu9RAKUyvfcoxrj5g2A1nx6scp7DqlSqv1tK1SqPrTdrzflQL3+bPFY01/977mNhtiaW+2C
	Tx8HGaaP0eIklsMTklvx45fPnDGenz5KMlPUj2gzq8MjlLJXfqs2rpGDA8pC3W6r5yGXMMfnDGVoo
	1Wn92EMs8J68U4tr7xreVH1cXaPJTWVYxGxQAGXXf8N7SmsldhGCSAwgHcz3eKe5viNfG3IKIFCd3
	ZzCtfzHIuJGpO0wKlZxcrPE76fVeIkbUgrA9fdox27Ek0g+TphiS++Y49N/BOP7GSuZ8+VdRt/rQf
	9IXZFpKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhkf-00000002rRT-1qY2;
	Mon, 08 Jul 2024 06:21:29 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhkd-00000002rPM-19WX
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jul 2024 06:21:28 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e03a3aafc6eso5821102276.3
        for <linux-i3c@lists.infradead.org>; Sun, 07 Jul 2024 23:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720419686; x=1721024486; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BB+cdXL3sSGy9Qxqc/xCUd9m5f97Vr6+9inOlt8r8ns=;
        b=j5cyqZ0PNObK8ogw+GZwwg0sod4BsI3MbnPQRF/4Jvs9ySZoGFVrsjldMcbqaAIfpJ
         Sl5dYJn3YOUckPjtuTLPIc9h/u4GrXFcp7lpXJSCn4rfkfzfGOD23LLgixCWYkpEcJCM
         bdj3gX9N2j9EIPlyk9m0IXDUGrlqs1EtsJikkK+E5XtejpoZqIB11Ee3PCoiJyih/uLf
         RVSSbgsBaGFCw6pPqFzFiXBa2/RGTu4QTVIfvVEddUt7OpUnZD/3Urz48BJBWwCOu5u2
         hKGfnFk/Wl49gx2uJzKOUzMT7Yo6NdWooZXYKUs5HJIDAKBCNe+hAwyvv6wpN5bSJpFG
         AH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720419686; x=1721024486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BB+cdXL3sSGy9Qxqc/xCUd9m5f97Vr6+9inOlt8r8ns=;
        b=KG4/dT+2L3eJbCFCvgoFw+TJoCU0HydaHYcJhoUbiyasgKrxr2621A9palcWXF4Htt
         Jq67wSj9oCfkZR74NX5hjJdUUZIYttB8LCmqJLnuI0JosEXtrTx9+GsmrG6TxGRJtmi5
         yd4SBIS25ldoGNy+dhRmqjt1zCUgyx+bQu0zqpU/aMIgDBeVAzvRPjvnD6kPX3L9MuQn
         1cdSi4dlQkfP1AFAL+oLzRlot+bLb/XGahrJN690lySU9sshVTMQx17kZlL68d+0CPjy
         Q4SbHeUj8wCf/zleEEhUG18EjqFrWFjdymAVCIWKEMejJYT8Ea04nqnzJabZHv9/zNnI
         QP6A==
X-Gm-Message-State: AOJu0YzwIg6KgjarIuSkzJl9ebqAFu7y/fKcxbLWOyqv3jKySzUdjLde
	nrUlahDD0MTLwNvQzkOZrAwVTBxFRgFTmFt5M88gi9Ng4Wtmcpmms9Uv/0WZCYDRwSaTRE9tsGj
	X/z6QRWSwosD1sndtDwY0dYAt9g==
X-Google-Smtp-Source: AGHT+IGI+Y5RmB7MP/77m+CCpLnc7H12EsxH/k+T3+lVUmWTxfbGgLYw+uW29XFJU7udaD7+0BhiH8dbZLmljtJX6kM=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:18ca:b0:e02:b093:dc1f with
 SMTP id 3f1490d57ef6-e03c19598d4mr30530276.1.1720419685909; Sun, 07 Jul 2024
 23:21:25 -0700 (PDT)
Date: Mon,  8 Jul 2024 06:21:03 +0000
In-Reply-To: <20240708062103.3296587-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240708062103.3296587-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240708062103.3296587-4-aniketmaurya@google.com>
Subject: [PATCH 3/3] i3c: dw: Add power management support
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	vamshigajjela@google.com, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_232127_452892_60D50213 
X-CRM114-Status: GOOD (  24.25  )
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

Add support for runtime and system power management.
Handle clocks, resets, pads as part of suspend and resume.
Restore controller registers that could be lost due to suspend.
Finally add get and put calls appropriately in functions which
access controller : bus_init, do_daa, send_ccc_cmd, priv_xfers,
i2c_xfers, ibi and hot-join.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 225 ++++++++++++++++++++++++++---
 drivers/i3c/master/dw-i3c-master.h |   1 +
 2 files changed, 209 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index fadb58ac8b68..8d694672c110 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -17,7 +17,9 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
@@ -217,7 +219,7 @@
 #define I3C_BUS_THIGH_MAX_NS		41
 
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
-
+#define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
 struct dw_i3c_cmd {
 	u32 cmd_lo;
 	u32 cmd_hi;
@@ -650,29 +652,38 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	struct i3c_device_info info = { };
 	int ret;
 
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	ret = master->platform_ops->init(master);
 	if (ret)
-		return ret;
+		goto rpm_out;
 
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
 		ret = dw_i2c_clk_cfg(master);
 		if (ret)
-			return ret;
+			goto rpm_out;
 		fallthrough;
 	case I3C_BUS_MODE_PURE:
 		ret = dw_i3c_clk_cfg(master);
 		if (ret)
-			return ret;
+			goto rpm_out;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto rpm_out;
 	}
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
-		return ret;
+		goto rpm_out;
 
 	writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(ret),
 	       master->regs + DEVICE_ADDR);
@@ -682,12 +693,15 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 
 	ret = i3c_master_set_info(&master->base, &info);
 	if (ret)
-		return ret;
+		goto rpm_out;
 
 	dw_i3c_master_set_intr_regs(master);
 	dw_i3c_master_enable(master);
 
-	return 0;
+rpm_out:
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
+	return ret;
 }
 
 static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
@@ -789,11 +803,21 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	if (ccc->id == I3C_CCC_ENTDAA)
 		return -EINVAL;
 
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	if (ccc->rnw)
 		ret = dw_i3c_ccc_get(master, ccc);
 	else
 		ret = dw_i3c_ccc_set(master, ccc);
 
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
@@ -806,6 +830,14 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	u8 p, last_addr = 0;
 	int ret, pos;
 
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	olddevs = ~(master->free_pos);
 
 	/* Prepare DAT before launching DAA. */
@@ -814,8 +846,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 			continue;
 
 		ret = i3c_master_get_free_addr(m, last_addr + 1);
-		if (ret < 0)
-			return -ENOSPC;
+		if (ret < 0) {
+			ret = -ENOSPC;
+			goto rpm_out;
+		}
 
 		master->devs[pos].addr = ret;
 		p = even_parity(ret);
@@ -825,16 +859,21 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
 		       DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
+
+		ret = 0;
 	}
 
 	xfer = dw_i3c_master_alloc_xfer(master, 1);
-	if (!xfer)
-		return -ENOMEM;
+	if (!xfer) {
+		ret = -ENOMEM;
+		goto rpm_out;
+	}
 
 	pos = dw_i3c_master_get_free_pos(master);
 	if (pos < 0) {
 		dw_i3c_master_free_xfer(xfer);
-		return pos;
+		ret = pos;
+		goto rpm_out;
 	}
 	cmd = &xfer->cmds[0];
 	cmd->cmd_hi = 0x1;
@@ -859,7 +898,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 
 	dw_i3c_master_free_xfer(xfer);
 
-	return 0;
+rpm_out:
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
+	return ret;
 }
 
 static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
@@ -894,6 +936,14 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 	if (!xfer)
 		return -ENOMEM;
 
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	for (i = 0; i < i3c_nxfers; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
@@ -935,6 +985,8 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 	ret = xfer->ret;
 	dw_i3c_master_free_xfer(xfer);
 
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
@@ -1045,6 +1097,14 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	if (!xfer)
 		return -ENOMEM;
 
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	for (i = 0; i < i2c_nxfers; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
@@ -1075,6 +1135,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	ret = xfer->ret;
 	dw_i3c_master_free_xfer(xfer);
 
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
@@ -1217,6 +1279,15 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 static int dw_i3c_master_enable_hotjoin(struct i3c_master_controller *m)
 {
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, ret);
+		return ret;
+	}
 
 	dw_i3c_master_enable_sir_signal(master, true);
 	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_HOT_JOIN_NACK,
@@ -1232,6 +1303,8 @@ static int dw_i3c_master_disable_hotjoin(struct i3c_master_controller *m)
 	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_HOT_JOIN_NACK,
 	       master->regs + DEVICE_CTRL);
 
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
 	return 0;
 }
 
@@ -1242,12 +1315,23 @@ static int dw_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	int rc;
 
+	rc = pm_runtime_resume_and_get(master->dev);
+	if (rc < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, rc);
+		return rc;
+	}
+
 	dw_i3c_master_set_sir_enabled(master, dev, data->index, true);
 
 	rc = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 
-	if (rc)
+	if (rc) {
 		dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
+		pm_runtime_mark_last_busy(master->dev);
+		pm_runtime_put_autosuspend(master->dev);
+	}
 
 	return rc;
 }
@@ -1265,6 +1349,8 @@ static int dw_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
 
 	dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
 
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
 	return 0;
 }
 
@@ -1465,6 +1551,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (!master->platform_ops)
 		master->platform_ops = &dw_i3c_platform_ops_default;
 
+	master->dev = &pdev->dev;
+
 	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
@@ -1497,6 +1585,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 
 	platform_set_drvdata(pdev, master);
 
+	pm_runtime_set_autosuspend_delay(&pdev->dev, RPM_AUTOSUSPEND_TIMEOUT);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	/* Information regarding the FIFOs/QUEUEs depth */
 	ret = readl(master->regs + QUEUE_STATUS_LEVEL);
 	master->caps.cmdfifodepth = QUEUE_STATUS_LEVEL_CMD(ret);
@@ -1513,10 +1606,15 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
 	if (ret)
-		goto err_assert_rst;
+		goto err_disable_pm;
 
 	return 0;
 
+err_disable_pm:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
 err_assert_rst:
 	reset_control_assert(master->core_rst);
 
@@ -1528,7 +1626,9 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 {
 	i3c_master_unregister(&master->base);
 
-	reset_control_assert(master->core_rst);
+	pm_runtime_disable(master->dev);
+	pm_runtime_set_suspended(master->dev);
+	pm_runtime_dont_use_autosuspend(master->dev);
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
 
@@ -1552,6 +1652,96 @@ static void dw_i3c_remove(struct platform_device *pdev)
 	dw_i3c_common_remove(master);
 }
 
+static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
+{
+	u32 pos, reg_val;
+
+	writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(master->dev_addr),
+	       master->regs + DEVICE_ADDR);
+
+	for (pos = 0; pos < master->maxdevs; pos++) {
+		if (master->free_pos & BIT(pos))
+			continue;
+
+		if (master->devs[pos].is_i2c_addr)
+			reg_val = DEV_ADDR_TABLE_LEGACY_I2C_DEV |
+			       DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
+		else
+			reg_val = DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
+
+		writel(reg_val, master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
+	}
+}
+
+static void dw_i3c_master_restore_timing_regs(struct dw_i3c_master *master)
+{
+	writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
+	writel(master->bus_free_timing, master->regs + BUS_FREE_TIMING);
+	writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
+	writel(master->ext_lcnt_timing, master->regs + SCL_EXT_LCNT_TIMING);
+
+	if (master->i2c_slv_prsnt) {
+		writel(master->i2c_fmp_timing, master->regs + SCL_I2C_FMP_TIMING);
+		writel(master->i2c_fm_timing, master->regs + SCL_I2C_FM_TIMING);
+	}
+}
+
+static int dw_i3c_master_enable_clks(struct dw_i3c_master *master)
+{
+	int ret = 0;
+
+	ret = clk_prepare_enable(master->core_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(master->pclk);
+	if (ret) {
+		clk_disable_unprepare(master->core_clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static inline void dw_i3c_master_disable_clks(struct dw_i3c_master *master)
+{
+	clk_disable_unprepare(master->pclk);
+	clk_disable_unprepare(master->core_clk);
+}
+
+static int __maybe_unused dw_i3c_master_runtime_suspend(struct device *dev)
+{
+	struct dw_i3c_master *master = dev_get_drvdata(dev);
+
+	dw_i3c_master_disable(master);
+
+	reset_control_assert(master->core_rst);
+	dw_i3c_master_disable_clks(master);
+	pinctrl_pm_select_sleep_state(dev);
+	return 0;
+}
+
+static int __maybe_unused dw_i3c_master_runtime_resume(struct device *dev)
+{
+	struct dw_i3c_master *master = dev_get_drvdata(dev);
+
+	pinctrl_pm_select_default_state(dev);
+	dw_i3c_master_enable_clks(master);
+	reset_control_deassert(master->core_rst);
+
+	dw_i3c_master_set_intr_regs(master);
+	dw_i3c_master_restore_timing_regs(master);
+	dw_i3c_master_restore_addrs(master);
+
+	dw_i3c_master_enable(master);
+	return 0;
+}
+
+static const struct dev_pm_ops dw_i3c_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(dw_i3c_master_runtime_suspend, dw_i3c_master_runtime_resume, NULL)
+};
+
 static const struct of_device_id dw_i3c_master_of_match[] = {
 	{ .compatible = "snps,dw-i3c-master-1.00a", },
 	{},
@@ -1564,6 +1754,7 @@ static struct platform_driver dw_i3c_driver = {
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
+		.pm = &dw_i3c_pm_ops,
 	},
 };
 module_platform_driver(dw_i3c_driver);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index f23e9d5aca86..219ff815d3a7 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -25,6 +25,7 @@ struct dw_i3c_dat_entry {
 
 struct dw_i3c_master {
 	struct i3c_master_controller base;
+	struct device *dev;
 	u16 maxdevs;
 	u16 datstartaddr;
 	u32 free_pos;
-- 
2.45.2.803.g4e1b14247a-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
