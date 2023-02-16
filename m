Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61645C61DA4
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M4zO3YMVzA/aub+YRS9k9JbcTEKWc6t88/JihpfnrMg=; b=ZviSk7TNkpJNGr
	8AkaBGhZvgYb0nacUTpiQaK5s5mWpm4+WYBsQttfHtvGLnlFNZIbdffw2cjB5TcBp83AH0najhrfc
	kEY8p073ehRJl3cRzxikhHTbAJlnJuPNs+gAMmswJoAxNVcyzOnmkSMGKHYNQ80izAX+TGs+Dvif4
	QzJ2gI5f8WQuaYWXpreSspQOfvVUB2lX9CnaloHKhRRsgElkZO9OvmFwEC9URNj1ZOxS+S+x3QrrS
	2xx9KunwGQGrVE8Vx0gP3LSf3FcwgDtxoyisWv3Qgjih6826VVm4DwlXiLvlVcHAsnbP1wh7ccdDK
	WOTnwBM4IA+9JDnr6dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSa7M-0099IG-Iv; Thu, 16 Feb 2023 08:59:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSXdh-008fde-Jx
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 06:21:10 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 76B4620075; Thu, 16 Feb 2023 14:20:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676528455;
	bh=tfLU2O8BolaYqby7LqUzhVc2It6YjDKfhjRkS/0T9/I=;
	h=From:To:Cc:Subject:Date;
	b=agUizBGEUsoIxA3E1LePUDkIE4bQ+11wDDLcYr2klhUuZ+2MfpwILbojt4GqudrqX
	 V/5H5KJ2TrGeyBus1xaBgRKOlAngsl2m/ekjxZNlTXsVhsJv5icxkzTQQk/5g/MFZs
	 WbVmf+HAqlUGU3ovGz4cwQdopIgQ+lrwTEKfMj4OO6gLddhT1vCe2X36VrMT/IHjwp
	 EoFQ6EExnItu7LHK3ZxsSXvSrA3GgSouFHyXB9DBkny5rUgsC7oWPCJ9d97n61RC56
	 W4ziPEj1YJlHc7+yts+CgBER5oTz5zUjKJoKOYumAtPj9SXBoW8OcwVX27iNzb5yE+
	 1tn/f195ymcng==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] i3c: dw: Use configured rate and bus mode for clock configuration
Date: Thu, 16 Feb 2023 14:20:40 +0800
Message-Id: <20230216062040.497815-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_222105_892437_DE97EA4A 
X-CRM114-Status: GOOD (  10.31  )
X-Mailman-Approved-At: Thu, 16 Feb 2023 00:59:51 -0800
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

We may have a non-typical i3c rate configured; use this (instead of
the fixed I3C_BUS_TYP_I3C_SCL_RATE) when calculating timing
characteristics. We can also expand the SCL high time based on the
presence/absence of i2c devices.

Also, since we now have bus->mode, use it to determine whether we se up
the BUS_FREE_TIMING register; rather than re-reading
DEV_CTRL_I2C_SLAVE_PRESENT from hardware.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 44 ++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 51a8608203de..d73d57362b3b 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -515,7 +515,8 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 	dw_i3c_master_start_xfer_locked(master);
 }
 
-static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
+static int dw_i3c_clk_cfg(struct dw_i3c_master *master, unsigned long i3c_rate,
+			  bool pure)
 {
 	unsigned long core_rate, core_period;
 	u32 scl_timing;
@@ -527,31 +528,45 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 
 	core_period = DIV_ROUND_UP(1000000000, core_rate);
 
-	hcnt = DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period) - 1;
-	if (hcnt < SCL_I3C_TIMING_CNT_MIN)
-		hcnt = SCL_I3C_TIMING_CNT_MIN;
+	/* 50% duty cycle */
+	hcnt = DIV_ROUND_UP(core_rate, i3c_rate * 2);
 
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_TYP_I3C_SCL_RATE) - hcnt;
-	if (lcnt < SCL_I3C_TIMING_CNT_MIN)
-		lcnt = SCL_I3C_TIMING_CNT_MIN;
+	/* In shared mode, we limit t_high, so that i3c SCL signalling is
+	 * rejected by the i2c devices' spike filter */
+	if (!pure)
+		hcnt = min_t(u8, hcnt,
+			     DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period)) - 1;
+
+	hcnt = max_t(u8, hcnt, SCL_I3C_TIMING_CNT_MIN);
+
+	lcnt = DIV_ROUND_UP(core_rate, i3c_rate) - hcnt;
+	lcnt = max_t(u8, lcnt, SCL_I3C_TIMING_CNT_MIN);
 
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
 
-	if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
+	if (pure)
 		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
 
-	lcnt = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period);
+	/* open drain mode requires a minimum of OD_MIN_NS */
+	lcnt = max_t(u8, lcnt, DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period));
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
+	/* Timings for lower SDRx rates where specified by device MXDS values;
+	 * we limit these to the global max rate provided, which also prevents
+	 * weird duty cycles */
+	lcnt = max_t(u8, lcnt,
+		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt);
 	scl_timing = SCL_EXT_LCNT_1(lcnt);
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt;
+	lcnt = max_t(u8, lcnt,
+		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt);
 	scl_timing |= SCL_EXT_LCNT_2(lcnt);
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt;
+	lcnt = max_t(u8, lcnt,
+		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt);
 	scl_timing |= SCL_EXT_LCNT_3(lcnt);
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
+	lcnt = max_t(u8, lcnt,
+		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt);
 	scl_timing |= SCL_EXT_LCNT_4(lcnt);
 	writel(scl_timing, master->regs + SCL_EXT_LCNT_TIMING);
 
@@ -605,7 +620,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 			return ret;
 		fallthrough;
 	case I3C_BUS_MODE_PURE:
-		ret = dw_i3c_clk_cfg(master);
+		ret = dw_i3c_clk_cfg(master, bus->scl_rate.i3c,
+				     bus->mode == I3C_BUS_MODE_PURE);
 		if (ret)
 			return ret;
 		break;
-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
