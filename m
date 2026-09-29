Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96184C9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pNOaUmN53vabwi5L1P+P4WBKD32/KHJ0rGC8iX0qSE=; b=lRi5jUauBjXgOl
	pGxWZEyjdW309GUaUcAJJEheRtbnnAuQAGr7Ad/a+wPSDQyuMv3/z3+P4ue088loPNzMOzgyiEL9Q
	H1yS19zztcJsr26xEvat3lxkBf7CRUh3oWCdxSBT3MbNyG4NG2D05N8Q0d6YfKTm5Jvg8vTboOgLo
	j6yR7cq39M56lgMU+4jfB9VRLkJUg/YjPILRTlT5PAG2XPb/BoMVvzSKZCAEbQWR6wsRBWUIN3h7x
	g0bu5dgGLHGR1Ow3aNjkFOwbZ8M2W75N2JIoOYgsdqH+/o1L2vNqovg3VLl0u2YtrmjOijXR3g8aU
	u3uGjEADuGsIU6HZ3zng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQX-00000002Snv-1C6B;
	Tue, 29 Sep 2026 06:34:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQR-00000002SlR-3U7e;
	Tue, 29 Sep 2026 06:34:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 923D44099F;
	Tue, 29 Sep 2026 06:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F211F00893;
	Tue, 29 Sep 2026 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663691;
	bh=+bgvhx+iNJqLGuHfNN4D1vVvbWmzHanZN0EWQocVqr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RLQTXz1ITGYxNI9eJeEDaA971P+RD5CZ8/xv+1R2g0gtikE9xaqECWlOakkYXyghn
	 ero6A+z5tG86q6G7R47Y3U57/sFK09xCQ62oxAQINz6nnx8JHmJL73nyjx1K4fepTu
	 tWVbcGQcWmKsTTdtFzxmyPHTLkhR5pu6DkodfgexrKFY59fuyNA0WnxoACwgl3T0zb
	 koZYcdwXu+eIUDneEUj4k5qgc5OwzIdjVl3/oU4yqyJUcNcGfKU1LTYgOKTkmzxuh5
	 ykiNJyRaZRM+Wg2Tfu3PoaqfoPkB1iA+2YpjO1LSkkMASP2I9M50h2/oyWsOqh2F+a
	 IAdcUCktu7DLw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/20] i3c: dw: switch to array-based exclusive reset control
Date: Tue, 29 Sep 2026 14:14:02 +0800
Message-ID: <20260929061417.20733-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
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
