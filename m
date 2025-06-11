Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EBAC61CE7
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jun 2025 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZuqdvF2OyhmeFowGXosLlQV3rWwsOZg4ciTXp6Dpdvs=; b=j/xyJEpcnJ8KYO
	TPXxNQbzIUU7zVLh6QK2E0MRlY6SBbW5U7lHbz6etmGQICEUz6UzAbf37BP7hjaODUgH93gILpPlI
	qkAT0kpVYk13ZX529vEBF7wN+IVVOtH71/WmWAaqdu7eSRZTxcXqaejtHmwK0VJA7OiGA2gwbWf7J
	PYsmLTVMnaJC21c37ihUucXhcdYpC03nnK0XjZRt4XNuorM0hWdHk8JIndb9qvpixHXm7yBERjhKu
	s6MKQeacfBKFcEBuD3m1oV5nsbP+bhpFG1k+6OXasovZOjuuYCPr02CEhX3oLCWolMPQ0L07WqjhC
	Gbzopd3QejuoaUA4R1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPDhv-00000008rUu-21Y2;
	Wed, 11 Jun 2025 05:09:03 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCfG-00000008npF-1dfB
	for linux-i3c@lists.infradead.org;
	Wed, 11 Jun 2025 04:02:16 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 11 Jun
 2025 12:02:03 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 11 Jun 2025 12:02:03 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <aniketmaurya@google.com>, <billy_tsai@aspeedtech.com>,
	<jarkko.nikula@linux.intel.com>, <Shyam-sundar.S-k@amd.com>,
	<wsa+renesas@sang-engineering.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
	<elbadrym@google.com>, <romlem@google.com>
Subject: [PATCH] i3c: ast2600: Generate T-bits to terminate IBI storm
Date: Wed, 11 Jun 2025 12:02:03 +0800
Message-ID: <20250611040203.487734-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_210214_431435_7A2EB461 
X-CRM114-Status: GOOD (  13.35  )
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

Under certain conditions, such as when an IBI interrupt is received and
SDA remains high after the address phase, the I3C controller will enter
an infinite loop attempting to read data until a T-bit is detected.
This commit addresses the issue by generating a fake T-bit to terminate
the IBI storm when the received IBI data length exceeds the maximum
allowable IBI payload.
This issue cannot be resolved using the abort function, as it is
ineffective when the I3C FSM is in the Servicing IBI Transfer (0xE) or
Clock Extension (0x12) states.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/ast2600-i3c-master.c | 60 +++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c      | 14 ++++++
 drivers/i3c/master/dw-i3c-master.h      |  9 ++++
 3 files changed, 83 insertions(+)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index e05e83812c71..6ac0122474d0 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -33,11 +33,28 @@
 #define AST2600_I3CG_REG1_SA_EN			BIT(15)
 #define AST2600_I3CG_REG1_INST_ID_MASK		GENMASK(19, 16)
 #define AST2600_I3CG_REG1_INST_ID(x)		(((x) << 16) & AST2600_I3CG_REG1_INST_ID_MASK)
+#define AST2600_I3CG_REG1_SCL_SW_MODE_OE	BIT(20)
+#define AST2600_I3CG_REG1_SCL_OUT_SW_MODE_VAL	BIT(21)
+#define AST2600_I3CG_REG1_SCL_IN_SW_MODE_VAL	BIT(23)
+#define AST2600_I3CG_REG1_SDA_SW_MODE_OE	BIT(24)
+#define AST2600_I3CG_REG1_SDA_OUT_SW_MODE_VAL	BIT(25)
+#define AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL	BIT(27)
+#define AST2600_I3CG_REG1_SCL_IN_SW_MODE_EN	BIT(28)
+#define AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN	BIT(29)
+#define AST2600_I3CG_REG1_SCL_OUT_SW_MODE_EN	BIT(30)
+#define AST2600_I3CG_REG1_SDA_OUT_SW_MODE_EN	BIT(31)
 
 #define AST2600_DEFAULT_SDA_PULLUP_OHMS		2000
 
 #define DEV_ADDR_TABLE_IBI_PEC			BIT(11)
 
+#define IBI_QUEUE_STATUS		0x18
+#define PRESENT_STATE			0x54
+#define   CM_TFR_STS			GENMASK(13, 8)
+#define     CM_TFR_STS_MASTER_SERV_IBI	0xe
+#define   SDA_LINE_SIGNAL_LEVEL		BIT(1)
+#define   SCL_LINE_SIGNAL_LEVEL		BIT(0)
+
 struct ast2600_i3c {
 	struct dw_i3c_master dw;
 	struct regmap *global_regs;
@@ -117,9 +134,52 @@ static void ast2600_i3c_set_dat_ibi(struct dw_i3c_master *i3c,
 	}
 }
 
+static bool ast2600_i3c_fsm_exit_serv_ibi(struct dw_i3c_master *dw)
+{
+	u32 state;
+
+	/*
+	 * Clear the IBI queue to enable the hardware to generate SCL and
+	 * begin detecting the T-bit low to stop reading IBI data.
+	 */
+	readl(dw->regs + IBI_QUEUE_STATUS);
+	state = FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE));
+	if (state == CM_TFR_STS_MASTER_SERV_IBI)
+		return false;
+
+	return true;
+}
+
+static void ast2600_i3c_gen_tbits_in(struct dw_i3c_master *dw)
+{
+	struct ast2600_i3c *i3c = to_ast2600_i3c(dw);
+	bool is_idle;
+	int ret;
+
+	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
+			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL,
+			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL);
+	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
+			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN,
+			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN);
+
+	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
+			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL, 0);
+	ret = readx_poll_timeout_atomic(ast2600_i3c_fsm_exit_serv_ibi, dw,
+					is_idle, is_idle, 0, 2000000);
+	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
+			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN, 0);
+	if (ret)
+		dev_err(&dw->base.dev,
+			"Failed to exit the I3C fsm from %lx(MASTER_SERV_IBI): %d",
+			FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE)),
+			ret);
+}
+
 static const struct dw_i3c_platform_ops ast2600_i3c_ops = {
 	.init = ast2600_i3c_init,
 	.set_dat_ibi = ast2600_i3c_set_dat_ibi,
+	.gen_tbits_in = ast2600_i3c_gen_tbits_in,
 };
 
 static int ast2600_i3c_probe(struct platform_device *pdev)
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c15..380e6a29c7b8 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -158,6 +158,14 @@
 #define DATA_BUFFER_STATUS_LEVEL_TX(x)	((x) & GENMASK(7, 0))
 
 #define PRESENT_STATE			0x54
+#define   CM_TFR_ST_STS			GENMASK(21, 16)
+#define     CM_TFR_ST_STS_HALT		0x13
+#define   CM_TFR_STS			GENMASK(13, 8)
+#define     CM_TFR_STS_MASTER_SERV_IBI	0xe
+#define     CM_TFR_STS_MASTER_HALT	0xf
+#define     CM_TFR_STS_SLAVE_HALT	0x6
+#define   SDA_LINE_SIGNAL_LEVEL		BIT(1)
+#define   SCL_LINE_SIGNAL_LEVEL		BIT(0)
 #define CCC_DEVICE_STATUS		0x58
 #define DEVICE_ADDR_TABLE_POINTER	0x5c
 #define DEVICE_ADDR_TABLE_DEPTH(x)	(((x) & GENMASK(31, 16)) >> 16)
@@ -1393,6 +1401,8 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	unsigned long flags;
 	u8 addr, len;
 	int idx;
+	bool terminate_ibi = false;
+	u32 state;
 
 	addr = IBI_QUEUE_IBI_ADDR(status);
 	len = IBI_QUEUE_STATUS_DATA_LEN(status);
@@ -1435,6 +1445,7 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 		dev_dbg_ratelimited(&master->base.dev,
 				    "IBI payload len %d greater than max %d\n",
 				    len, dev->ibi->max_payload_len);
+		terminate_ibi = true;
 		goto err_drain;
 	}
 
@@ -1450,6 +1461,9 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 
 err_drain:
 	dw_i3c_master_drain_ibi_queue(master, len);
+	state = FIELD_GET(CM_TFR_STS, readl(master->regs + PRESENT_STATE));
+	if (terminate_ibi && state == CM_TFR_STS_MASTER_SERV_IBI)
+		master->platform_ops->gen_tbits_in(master);
 
 	spin_unlock_irqrestore(&master->devs_lock, flags);
 }
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..1da485e42e74 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -89,6 +89,15 @@ struct dw_i3c_platform_ops {
 	 */
 	void (*set_dat_ibi)(struct dw_i3c_master *i3c,
 			    struct i3c_dev_desc *dev, bool enable, u32 *reg);
+	/*
+	 * Gerenating the fake t-bit (SDA low) to stop the IBI storm when the received
+	 * data length of IBI is larger than the maximum IBI payload.
+	 *
+	 * When an IBI is received and SDA remains high after the address phase, the i3c
+	 * controller may enter an infinite loop while trying to read data until the t-bit
+	 * appears
+	 */
+	void (*gen_tbits_in)(struct dw_i3c_master *i3c);
 };
 
 extern int dw_i3c_common_probe(struct dw_i3c_master *master,
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
