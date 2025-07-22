Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C3FC83F27
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 19:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0wDvodPpN64cjHBtTKmrpuROC/rRhEMPSDkgLatKjs=; b=e85L0rT9CXEu8H
	t5uy7wVvYgaM2rMwxHUaFtcUiMSbaF26/Ug5KPAXAP10ZI8CICzBjvVPC9dbtJe5eqZDOz86NeAfE
	z6O+sxqUpwAJ1eB5RZpF3MFUifwNN+k39BuGEosp5CHu+Ikvt1VKDlnYtf+T7Df3inQrMvE5XoE68
	uoMwzx0/NqsqV5GlzGmfCOax5ay/pE2fVfSMIp8pBluK4L11ccGVJW1anFiuCnRayeuk+cKuk+6Ja
	nt8JMcRPevDele/Klk4MJl9lnTprXtzI6qqqsFONK2zTZanMFStuwo32a05hwpcpT42YAF54veOrL
	I8G7czwQ4GmUTnRFLyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueILM-00000003JgC-3dyy;
	Tue, 22 Jul 2025 19:08:04 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueILK-00000003Jf6-1G4A
	for linux-i3c@lists.infradead.org;
	Tue, 22 Jul 2025 19:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=MrYnKem5kBdDFJRMSEYYExcoB2hFdEsaJsl6kGez6Zo=; b=hbOMrg
	zdgZdgkYbyOhURXpdHYbl2dTOTjKP/S6z8jdkeRHvOQ62At1nec9HGZMxDh5rtn4
	LdMBzM9qxuZNFJhX2FJfNL8HY+MX/P7NGtZCxEXImEF+p2CT/xwHYxVbN0ZRDklr
	aqY/Sig9npDrK0UcGtUE+8PYxS9xpUK25ZY38+oncUQS8QFxv0dMol04g7Y1wjpp
	gxgzv5fLsMTYMvoQo9u8zvgzXy9JwTELmABo+3VNa2HnDEZxH4BUk0KXDZeDt+vt
	dR8hun6pMNGAl9SR9mvVzi4xX4l8QTL8jIekoYepHcSh2UnDYVaoo4kwwG+RVk2P
	QP7aUk7r5XqVx3yA==
Received: (qmail 1427044 invoked from network); 22 Jul 2025 21:08:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:08:00 +0200
X-UD-Smtp-Session: l3s3148p1@ag2LT4k6gKIgAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v4 1/4] i3c: Standardize defines for specification parameters
Date: Tue, 22 Jul 2025 21:07:43 +0200
Message-ID: <20250722190749.6264-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_120802_617829_2CABE559 
X-CRM114-Status: GOOD (  14.82  )
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

Align existing defines to follow the consistent pattern:
I3C_BUS_<PARAM>_<MAX|MIN|TYP>_<UNIT>. Prepare the codebase for adding
new parameters and help avoid duplication.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v3:
* Reworded commit message
* added version of spec and chapter number to the comment

I added the chapter number to the main comment because it is applicable
for all the values here and the next patch. I thought it doesn't make
sense to repeat it all over for each value.

 drivers/i3c/master.c               | 12 ++++++------
 drivers/i3c/master/dw-i3c-master.c |  4 ++--
 include/linux/i3c/master.h         |  9 +++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ffb734d378e2..6a2594dc29e6 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -728,12 +728,12 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 	switch (i3cbus->mode) {
 	case I3C_BUS_MODE_PURE:
 		if (!i3cbus->scl_rate.i3c)
-			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
+			i3cbus->scl_rate.i3c = I3C_BUS_I3C_SCL_TYP_RATE;
 		break;
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
 		if (!i3cbus->scl_rate.i3c)
-			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
+			i3cbus->scl_rate.i3c = I3C_BUS_I3C_SCL_TYP_RATE;
 		if (!i3cbus->scl_rate.i2c)
 			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
 		break;
@@ -755,8 +755,8 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 	 * I3C/I2C frequency may have been overridden, check that user-provided
 	 * values are not exceeding max possible frequency.
 	 */
-	if (i3cbus->scl_rate.i3c > I3C_BUS_MAX_I3C_SCL_RATE ||
-	    i3cbus->scl_rate.i2c > I3C_BUS_I2C_FM_PLUS_SCL_RATE)
+	if (i3cbus->scl_rate.i3c > I3C_BUS_I3C_SCL_MAX_RATE ||
+	    i3cbus->scl_rate.i2c > I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE)
 		return -EINVAL;
 
 	return 0;
@@ -2786,7 +2786,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 			const struct i3c_master_controller_ops *ops,
 			bool secondary)
 {
-	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
+	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
 	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
 	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
 	struct i2c_dev_boardinfo *i2cbi;
@@ -2845,7 +2845,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 		}
 
 		if (i2cbi->lvr & I3C_LVR_I2C_FM_MODE)
-			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
+			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_MAX_RATE;
 	}
 
 	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 91429d94a866..dc234efa046d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -622,14 +622,14 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	core_period = DIV_ROUND_UP(1000000000, core_rate);
 
 	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FMP_TLOW_MIN_NS, core_period);
-	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_PLUS_SCL_RATE) - lcnt;
+	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE) - lcnt;
 	scl_timing = SCL_I2C_FMP_TIMING_HCNT(hcnt) |
 		     SCL_I2C_FMP_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I2C_FMP_TIMING);
 	master->i2c_fmp_timing = scl_timing;
 
 	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FM_TLOW_MIN_NS, core_period);
-	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_RATE) - lcnt;
+	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_MAX_RATE) - lcnt;
 	scl_timing = SCL_I2C_FM_TIMING_HCNT(hcnt) |
 		     SCL_I2C_FM_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I2C_FM_TIMING);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c67922ece617..7dfcbe530515 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -249,10 +249,11 @@ struct i3c_device {
  */
 #define I3C_BUS_MAX_DEVS		11
 
-#define I3C_BUS_MAX_I3C_SCL_RATE	12900000
-#define I3C_BUS_TYP_I3C_SCL_RATE	12500000
-#define I3C_BUS_I2C_FM_PLUS_SCL_RATE	1000000
-#define I3C_BUS_I2C_FM_SCL_RATE		400000
+/* Taken from the I3C Spec V1.1.1, chapter 6.2. "Timing specification" */
+#define I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE	1000000
+#define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
+#define I3C_BUS_I3C_SCL_MAX_RATE	12900000
+#define I3C_BUS_I3C_SCL_TYP_RATE	12500000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
 
 /**
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
