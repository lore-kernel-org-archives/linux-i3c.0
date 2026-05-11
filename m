Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A63CD37AC
	for <linux-i3c@archiver.kernel.org>; Mon, 11 May 2026 03:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CTP90J/hy44kpLFjjCH8yLUi89CgbwDXriswd/zuio=; b=Y9d5ZxVnLBRP4B
	2G9ul3cF0ySQYklRf0iqjvK/Gf1II2dDOWbm5OVkkC4Y7TX20zqIPb1B8ZQ782cF1lpk4qy9e6kfO
	n+htNocNfHTHSdP/M861No3o/dum5jgRBMXlCEd3Zakrh2Qg+Vkmf6imCIgAYhy75HithUE/6NXhC
	vnVOtE1N5g6Vy/N/nZmNmlP2+GsgCkziFLefQEVljD65RrHODON6FmGJqelI19+jlLIhWiQJ95FEt
	BHoD8tW/jAk+cWYnKLwrNqByf581beAZTibgvoJCPBsrftyqniNaJc9ry+Mzgj2iHOtfyXZwayd7f
	aWdjjj3DlhiqycAAfDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTv-0000000CBtn-34WG;
	Mon, 11 May 2026 03:38:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTs-0000000CBsX-3PyH
	for linux-i3c@lists.infradead.org;
	Mon, 11 May 2026 03:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B3D7440F7;
	Mon, 11 May 2026 03:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE8FC2BCB8;
	Mon, 11 May 2026 03:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778470735;
	bh=3454wlriFBYA1PmIAk/pGLH1G5fs1iNZBJZwMOMScAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ibSDnOdNyd2gnWmV+NNehOso6/U/BMH0iKY+X9yUw0n/PTQtILvN0NqQHiryo1Cef
	 /QeS1g9DlGjUeUjVysGmmVVS0pDrGepP++sa/OugY9+ru2vQV7gK9OzoSm82NpjX9C
	 Zg0KkhRQ5eciVL0vyNqKdlIWEHfNSnmevWqhkdbAh44hQlseQ7RAGAqAL15IMngXRr
	 Jqkii7e3pbR5YBVwqEcXswaw7bn8clwTbpKsDMp7W4sne0mzRTe+H89CA+TYn98cwP
	 1dYK+W27XFzuhtS1hqCVnXD098C5zxGBjwFdsyzjrqhsJrqoZ6tVVXVymtX9jHiiCn
	 pEimzSsud7jfg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] i3c: dw: Add apb reset support
Date: Mon, 11 May 2026 11:19:45 +0800
Message-ID: <20260511031945.3228-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511031945.3228-1-jszhang@kernel.org>
References: <20260511031945.3228-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_203856_960389_F57C2415 
X-CRM114-Status: GOOD (  10.40  )
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

Add support of apb reset which is to reset the APB interface.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 7 +++++++
 drivers/i3c/master/dw-i3c-master.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..9de54d584bc3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1591,6 +1591,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
+	master->apb_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+									       "apb_rst");
+	if (IS_ERR(master->apb_rst))
+		return PTR_ERR(master->apb_rst);
+
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
@@ -1765,6 +1770,7 @@ static int __maybe_unused dw_i3c_master_runtime_suspend(struct device *dev)
 	dw_i3c_master_disable(master);
 
 	reset_control_assert(master->core_rst);
+	reset_control_assert(master->apb_rst);
 	dw_i3c_master_disable_clks(master);
 	pinctrl_pm_select_sleep_state(dev);
 	return 0;
@@ -1777,6 +1783,7 @@ static int __maybe_unused dw_i3c_master_runtime_resume(struct device *dev)
 	pinctrl_pm_select_default_state(dev);
 	dw_i3c_master_enable_clks(master);
 	reset_control_deassert(master->core_rst);
+	reset_control_deassert(master->apb_rst);
 
 	dw_i3c_master_set_intr_regs(master);
 	dw_i3c_master_restore_timing_regs(master);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..a4ba60043288 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -37,6 +37,7 @@ struct dw_i3c_master {
 	struct dw_i3c_master_caps caps;
 	void __iomem *regs;
 	struct reset_control *core_rst;
+	struct reset_control *apb_rst;
 	struct clk *core_clk;
 	struct clk *pclk;
 	char version[5];
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
