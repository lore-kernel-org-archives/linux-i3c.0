Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CCBCCFA02
	for <linux-i3c@archiver.kernel.org>; Sun,  2 Nov 2025 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N4Z07vV42VV0jbZLxBdTP8IAcnE4UogXV6YGv5sESSQ=; b=2anuJe3x6XQkWB
	IwFemK6nsS3p1DWV8T4ZHKgHXuVICP/95aNfOAxSvV/+oS1pufSkDSXnGt+V2XAkz6SyoVCrt8m9p
	c45S0H+1xAlKsC0ObFL7Vc4rWR3WE0EUUmqqH+7kBFxTnAiqZs/Rr3RCYfK1WmL47/Q/5u3p5pFxn
	+GUeA0vq1LLV/vK38JEZDtEVaWlIglkovXPfMlTk9QT+of3wh5Q9kpeAfWT3RDWWd174Ai8orn+AG
	73G76zA0Zsbwhfn//UjZaBwwnzuop8NZZ0p9PL1DxClpw3OXxs8stqj2yRYrKW60aqs2/QWDr2kJl
	qBkwO8YUPDb7nIF3oEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVCD-00000008SrR-1uoz;
	Sun, 02 Nov 2025 10:20:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVCC-00000008SrK-0eEi
	for linux-i3c@lists.infradead.org;
	Sun, 02 Nov 2025 10:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07E2460055;
	Sun,  2 Nov 2025 10:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91418C4CEF7;
	Sun,  2 Nov 2025 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762078821;
	bh=uMx1a1jzdRa9DPHduAtpXTqZk23q5LRqreUcRszHpT4=;
	h=From:To:Cc:Subject:Date:From;
	b=lL3/YZrYCN9s1ZsczQRekScth3/rnBPBjLr6fle2j8tAtaH3d9AHtQgGj1xBfl9Zf
	 9mDg8w1ZXFk4mLZv9WdYsqlTXfxNOYG/LsB7JhqYQOqJuoBRp6m0YQc62mpcNX2FT0
	 JGTXwFMBnw9JMxem1KQEoaYyQJDZaL6GT8dBMZjnQ+CamQy6pYdH4tZ1cUvMKKqE/p
	 l9dJFPp57E2sgky5U2QaKhmte/pharKwqN4rjGTuW0uGVLXpHmqVi9ry/W4bosTI6j
	 1du1Ei//Xtrccj73q7H1Vs2Qc+gWnqohyZq3sw+wiyaUgbVoVtSfL8ePc+S/hb6fgO
	 rLDnjEN7Of7OA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: dw: Add apb reset support
Date: Sun,  2 Nov 2025 18:02:37 +0800
Message-ID: <20251102100237.9451-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
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

Add support of apb reset which is to reset the APB interface.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 9 +++++++++
 drivers/i3c/master/dw-i3c-master.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9ceedf09c3b6..ca2863d2b2b7 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1558,7 +1558,13 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
+	master->apb_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
+								    "apb_rst");
+	if (IS_ERR(master->apb_rst))
+		return PTR_ERR(master->apb_rst);
+
 	reset_control_deassert(master->core_rst);
+	reset_control_deassert(master->apb_rst);
 
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
@@ -1607,6 +1613,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 
 err_assert_rst:
 	reset_control_assert(master->core_rst);
+	reset_control_assert(master->apb_rst);
 
 	return ret;
 }
@@ -1711,6 +1718,7 @@ static int __maybe_unused dw_i3c_master_runtime_suspend(struct device *dev)
 	dw_i3c_master_disable(master);
 
 	reset_control_assert(master->core_rst);
+	reset_control_assert(master->apb_rst);
 	dw_i3c_master_disable_clks(master);
 	pinctrl_pm_select_sleep_state(dev);
 	return 0;
@@ -1723,6 +1731,7 @@ static int __maybe_unused dw_i3c_master_runtime_resume(struct device *dev)
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
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
