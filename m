Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4835CA5FFC
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Oct 2026 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJhcb7jsiOcrbtyDwpED2akh2AeiNZ3vk2C1XL6T+9Y=; b=vkKZtM0fWXeURD
	qGfRylBDfkS+WRviD48TW52Vbv1Gdzao4Svdcj7uvI4UUe4Avw0Q08f3z++dM6LJ6qaC4Bwado5Gn
	68OtLYYmzFn9PCkMZOcYUVsUw1Wua45lPY0BLaXX65jhbBLz5OD30PgzLIIYJywcl8K6DxQgbXxEF
	0ApzliPABKxkMtJ4YLHNtLpqLMJYb6qeVDzBgMa8av4UhePY1Vka5adSM6Gkr9EH6HdtookKx8A7g
	8Smcc4+bK9KGoFfYgIgVvsnfMixwOAd9PtPutjBurI3un6JBZt2KYdm8Snb3aZmiIFS5PiTUc6cgm
	XR9qcws04ViGxmFKucXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkre-0000000GmX4-1pEI;
	Mon, 05 Oct 2026 15:44:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkrc-0000000GmWG-1eqW
	for linux-i3c@lists.infradead.org;
	Mon, 05 Oct 2026 15:44:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3D6160A6F;
	Mon,  5 Oct 2026 15:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C561F00898;
	Mon,  5 Oct 2026 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215067;
	bh=7hyLYn6tCkgJyNXU7MXe+iYtTTDsCEiqgJg8WdmotO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LozdkpxG0SXOgB3Kwr5/4iSuZJv+03oo+PodjuZ1TrzeSIibYTGIqYkDiGVP5V8g7
	 4lRKCZlUawiA85WxBN2UlG+p3nTrCfRxnquK4j2aJA/eJrIZXRBi+jJRwg7KcHtTeq
	 V7aQNBnUtEoIPjxOG/UWxs64+9rqAWPFWiMOGYw6n04Nb0ugQ6/rXuoKvHk9Z2tMR7
	 lx1sHCLMDzjAhDqkZ26/CR7FMirZjqRirp/A3RcvCgQVD0B9tPkv8yTeLFo89GGCLt
	 j/Qf1T/udONS4NcZxTepxzFhIWaAaVxpRy8NqmX2KOZvf5CtfjADSSKcXRCB6jqmYr
	 kJE7vGRUVSf7w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] i3c: dw: switch to array-based exclusive reset control
Date: Mon,  5 Oct 2026 23:24:24 +0800
Message-ID: <20261005152425.25319-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261005152425.25319-1-jszhang@kernel.org>
References: <20261005152425.25319-1-jszhang@kernel.org>
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

The Synopsys DesignWare I3C master controller can have multiple reset
lines, such as a core reset and APB reset.

Refactor the driver to use devm_reset_control_array_get_exclusive()
instead of a single named reset handle. This automatically manages all
resets allocated to the device node sequentially.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/dw-i3c-master.c | 24 ++++++++++++++++++------
 drivers/i3c/master/dw-i3c-master.h |  2 +-
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4563d8761ba0..1c6c870f5bb3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1657,6 +1657,11 @@ static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
 	.set_dat_ibi = dw_i3c_platform_set_dat_ibi_nop,
 };
 
+static void dw_i3c_resets_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
 int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
@@ -1696,10 +1701,17 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
-										NULL);
-	if (IS_ERR(master->core_rst))
-		return PTR_ERR(master->core_rst);
+	master->resets = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
+	if (IS_ERR(master->resets))
+		return PTR_ERR(master->resets);
+
+	ret = reset_control_deassert(master->resets);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, dw_i3c_resets_assert, master->resets);
+	if (ret)
+		return ret;
 
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
@@ -1873,7 +1885,7 @@ static int __maybe_unused dw_i3c_master_runtime_suspend(struct device *dev)
 
 	dw_i3c_master_disable(master);
 
-	reset_control_assert(master->core_rst);
+	reset_control_assert(master->resets);
 	dw_i3c_master_disable_clks(master);
 	pinctrl_pm_select_sleep_state(dev);
 	return 0;
@@ -1885,7 +1897,7 @@ static int __maybe_unused dw_i3c_master_runtime_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 	dw_i3c_master_enable_clks(master);
-	reset_control_deassert(master->core_rst);
+	reset_control_deassert(master->resets);
 
 	dw_i3c_master_set_intr_regs(master);
 	dw_i3c_master_restore_timing_regs(master);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 17ad817d1f8e..f5b4491b247a 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -36,7 +36,7 @@ struct dw_i3c_master {
 	} xferqueue;
 	struct dw_i3c_master_caps caps;
 	void __iomem *regs;
-	struct reset_control *core_rst;
+	struct reset_control *resets;
 	struct clk *core_clk;
 	struct clk *pclk;
 	char version[5];
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
