Return-Path: <SRS0=pqjR=ZU=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B7DC432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 01:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EBBE2158A
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 01:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i6QOULgS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Gt3LAbqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EBBE2158A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rjAszHTKkCFkn17z4XuLzLuTR7sBChaJuAZE1rltQ/U=; b=i6QOULgSKhWSlgaO4lFT18PlrX
	LJ/8piO92YbKKrz2SUFNmFY775cJgRXOIHgYsrCCdKlslIboH+6y31kOHQSLaXFJM47vRgljU2nWp
	FjBi+PQbDQt8a/8ztrikPUT0U/k1+4MfFOatOjenAkMftIOrCTQYGXbHCN0YDxkZwJ6TQ2z6VtYkt
	QtnCgW+ArnIHfx83WbBjPqDg3E4x9WVd2SmzVhhQWubHgRvLp2Kqfqxtbq+001tgX+Bpj9J4+uG0t
	a5PLazxHNAbIDFhOWMqpe+ct12sfKCtvxvFyQo+0j7v48ozuevPr0XjYL9Y2NGJuHLhnv5Noz7pfQ
	OQXsm6dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia8P0-000240-DF; Thu, 28 Nov 2019 01:15:26 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia8Ov-00022C-OZ
 for linux-i3c@lists.infradead.org; Thu, 28 Nov 2019 01:15:25 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8BD6FC00AE;
 Thu, 28 Nov 2019 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574903719; bh=68sHXjx/pwFVUkRfu3EYfWPcGrI5ZeEguL+cPDtfOvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Gt3LAbqafvFp0JOkErjNxzLsszVrQHpy4FgObQGlFKYbVSzV38XtyuG9FyLhcaBts
 7Yq8IgF5wZdTY33soF0Cs2lsJWnPxLgJBl3oIynZlB/418pbKs5JFggGXQXKyGCqO9
 04KnkEORv7unWmV+Ry5yt/ijnDi/sZW8Vd6fHLfr40IprWJKkS3B1dtAlsFEAbDxSq
 Q0v9UeEMkyBu8OZlugii/ONPP/OJXWNqE+yMy0KpiOx9Nvn6XrSs1Y40WuIGpQww2B
 90vKks5yom80z60ZLAMb15kCyVwiLNjU8GZV1VcD8OpmwdVHRGFShOTxoKuKwKLILR
 btUbXLy48iNOg==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id EDA50A0066;
 Thu, 28 Nov 2019 01:15:16 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id A3304701A;
 Thu, 28 Nov 2019 02:15:16 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [RFC 2/2] i3c: dw: add preliminary support for sec master
Date: Thu, 28 Nov 2019 02:15:12 +0100
Message-Id: <dc9ade5e527d519a358ccf76eefdd8df82b84c82.1574897246.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574897246.git.vitor.soares@synopsys.com>
References: <cover.1574897246.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1574897246.git.vitor.soares@synopsys.com>
References: <cover.1574897246.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_171521_870838_8E879A66 
X-CRM114-Status: GOOD (  15.96  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: pgaj@cadence.com, Joao.Pinto@synopsys.com,
 Vitor Soares <Vitor.Soares@synopsys.com>, bbrezillon@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The preliminary support of sec master aims to provide all the logic of
secondary master feature only for testing purposes assuming the controller has
support for it and ignoring all necessary verifications.

Key points on secondary master support:
  - if secondary master receives MR enable or Defslvs CCC it will try to
  get bus ownership for eitheir for device initializations or master
  registation. The request is only made if both conditions are met.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master/dw-i3c-master.c | 619 +++++++++++++++++++++++++++++++++----
 1 file changed, 563 insertions(+), 56 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index b0ff0e1..7099f5f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -24,7 +24,8 @@
 #define DEVICE_CTRL			0x0
 #define DEV_CTRL_ENABLE			BIT(31)
 #define DEV_CTRL_RESUME			BIT(30)
-#define DEV_CTRL_HOT_JOIN_NACK		BIT(8)
+#define ADAPTIVE_I2C_I3C		BIT(27)
+#define DEV_CTRL_HJ_NACK		BIT(8)
 #define DEV_CTRL_I2C_SLAVE_PRESENT	BIT(7)
 
 #define DEVICE_ADDR			0x4
@@ -74,7 +75,17 @@
 
 #define RX_TX_DATA_PORT			0x14
 #define IBI_QUEUE_STATUS		0x18
+#define IBI_QUEUE_IBI_ID(x)		(((x) & GENMASK(15, 8)) >> 8)
+#define IBI_QUEUE_IBI_ADDR(x)		((x) >> 1)
+#define IBI_TYPE_HJ(x)			\
+	(IBI_QUEUE_IBI_ADDR((x)) == I3C_HOT_JOIN_ADDR && !((x) & BIT(0)))
+#define IBI_TYPE_MR(x)			\
+	(IBI_QUEUE_IBI_ADDR((x)) != I3C_HOT_JOIN_ADDR && !((x) & BIT(0)))
+#define IBI_TYPE_SIR(x)			\
+	(IBI_QUEUE_IBI_ADDR((x)) != I3C_HOT_JOIN_ADDR && ((x) & BIT(0)))
+
 #define QUEUE_THLD_CTRL			0x1c
+#define QUEUE_THLD_CTRL_IBI_STS_MASK	GENMASK(31, 24)
 #define QUEUE_THLD_CTRL_RESP_BUF_MASK	GENMASK(15, 8)
 #define QUEUE_THLD_CTRL_RESP_BUF(x)	(((x) - 1) << 8)
 
@@ -85,6 +96,8 @@
 #define IBI_MR_REQ_REJECT		0x2C
 #define IBI_SIR_REQ_REJECT		0x30
 #define IBI_REQ_REJECT_ALL		GENMASK(31, 0)
+#define IBI_SIR_REQ_ID(x)		((((x) & GENMASK(6, 5)) >> 5) + \
+					((x) & GENMASK(4, 0)))
 
 #define RESET_CTRL			0x34
 #define RESET_CTRL_IBI_QUEUE		BIT(5)
@@ -95,6 +108,12 @@
 #define RESET_CTRL_SOFT			BIT(0)
 
 #define SLV_EVENT_CTRL			0x38
+#define SLV_EVENT_MWL_UPDATED		BIT(7)
+#define SLV_EVENT_MRL_UPDATED		BIT(6)
+#define SLV_EVENT_HJ_INTR_REQ		BIT(3)
+#define SLV_EVENT_MASTER_INTR_REQ	BIT(1)
+#define SLV_EVENT_SLAVE_INTR_REQ	BIT(0)
+
 #define INTR_STATUS			0x3c
 #define INTR_STATUS_EN			0x40
 #define INTR_SIGNAL_EN			0x44
@@ -126,8 +145,15 @@
 					INTR_TX_THLD_STAT |		\
 					INTR_RX_THLD_STAT)
 
-#define INTR_MASTER_MASK		(INTR_TRANSFER_ERR_STAT |	\
-					 INTR_RESP_READY_STAT)
+#define INTR_MASTER_MASK		(INTR_BUSOWNER_UPDATE_STAT |	\
+					 INTR_TRANSFER_ERR_STAT |	\
+					 INTR_RESP_READY_STAT |		\
+					 INTR_IBI_THLD_STAT)
+
+#define INTR_SLAVE_MASK			(INTR_BUSOWNER_UPDATE_STAT |	\
+					 INTR_DEFSLV_STAT |		\
+					 INTR_TRANSFER_ERR_STAT |	\
+					 INTR_CCC_UPDATED_STAT)
 
 #define QUEUE_STATUS_LEVEL		0x4c
 #define QUEUE_STATUS_IBI_STATUS_CNT(x)	(((x) & GENMASK(28, 24)) >> 24)
@@ -140,20 +166,34 @@
 
 #define PRESENT_STATE			0x54
 #define CCC_DEVICE_STATUS		0x58
-#define DEVICE_ADDR_TABLE_POINTER	0x5c
-#define DEVICE_ADDR_TABLE_DEPTH(x)	(((x) & GENMASK(31, 16)) >> 16)
-#define DEVICE_ADDR_TABLE_ADDR(x)	((x) & GENMASK(7, 0))
+#define DEV_ADDR_TABLE_POINTER		0x5c
+#define DEV_ADDR_TABLE_DEPTH(x)		(((x) & GENMASK(31, 16)) >> 16)
+#define DEV_ADDR_TABLE_ADDR(x)		((x) & GENMASK(15, 0))
 
 #define DEV_CHAR_TABLE_POINTER		0x60
+#define DEV_CHAR_TABLE_RST_INDEX	(~GENMASK(24, 19))
+#define DEV_CHAR_TABLE_DEPTH(x)		(((x) & GENMASK(18, 12)) >> 12)
+#define DEV_CHAR_TABLE_ADDR(x)		((x) & GENMASK(11, 0))
+
 #define VENDOR_SPECIFIC_REG_POINTER	0x6c
 #define SLV_PID_VALUE			0x74
 #define SLV_CHAR_CTRL			0x78
+#define SLV_CHAR_CTRL_HDR_CAP(x)	(((x) & GENMASK(23, 16)) >> 16)
+#define SLV_CHAR_CTRL_DCR(x)		(((x) & GENMASK(15, 8)) >> 8)
+#define SLV_CHAR_CTRL_BCR(x)		((x) & GENMASK(7, 0))
+
 #define SLV_MAX_LEN			0x7c
 #define MAX_READ_TURNAROUND		0x80
 #define MAX_DATA_SPEED			0x84
 #define SLV_DEBUG_STATUS		0x88
+
 #define SLV_INTR_REQ			0x8c
+#define SLV_INTR_REQ_MIR		BIT(3)
+#define SLV_INTR_REQ_SIR		BIT(0)
+
 #define DEVICE_CTRL_EXTENDED		0xb0
+#define DEV_OP_MODE_SLAVE	BIT(0)
+
 #define SCL_I3C_OD_TIMING		0xb4
 #define SCL_I3C_PP_TIMING		0xb8
 #define SCL_I3C_TIMING_HCNT(x)		(((x) << 16) & GENMASK(23, 16))
@@ -176,9 +216,12 @@
 
 #define SCL_EXT_TERMN_LCNT_TIMING	0xcc
 #define BUS_FREE_TIMING			0xd4
+#define BUS_IBI_FREE(x)			(((x) << 16) & GENMASK(31, 16))
 #define BUS_I3C_MST_FREE(x)		((x) & GENMASK(15, 0))
 
 #define BUS_IDLE_TIMING			0xd8
+#define BUS_IDLE_TIME(x)		((x) & GENMASK(19, 0))
+
 #define I3C_VER_ID			0xe0
 #define I3C_VER_TYPE			0xe4
 #define EXTENDED_CAPABILITY		0xe8
@@ -189,8 +232,16 @@
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
 
+#define DEV_CHAR_TABLE_LOC(start, idx, loc) \
+	((start) + ((idx) << 4) + ((loc) << 2))
+
+#define SEC_DEV_CHAR_TABLE_LOC(start, idx) \
+	((start) + ((idx) << 2))
+
 #define MAX_DEVS 32
 
+#define I3C_BUS_AVAIL_TIME_NS		1000
+#define I3C_BUS_IDLE_TIME_NS		1000000
 #define I3C_BUS_SDR1_SCL_RATE		8000000
 #define I3C_BUS_SDR2_SCL_RATE		6000000
 #define I3C_BUS_SDR3_SCL_RATE		4000000
@@ -201,7 +252,18 @@
 
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 
+struct dw_i3c_defslvs_dct {
+	u8 static_addr;
+	u8 bcr;
+	u8 dcr_lvr;
+	u8 dyn_addr;
+};
+
 struct dw_i3c_master_caps {
+	u16 datstartaddr;
+	u16 datdepth;
+	u16 dctstartaddr;
+	u8 dctdepth;
 	u8 cmdfifodepth;
 	u8 datafifodepth;
 };
@@ -224,16 +286,32 @@ struct dw_i3c_xfer {
 	struct dw_i3c_cmd cmds[0];
 };
 
+enum type {
+	REQUEST = 1,
+	DELIVER,
+	HANDOFF,
+	TAKEOVER,
+};
+
 struct dw_i3c_master {
 	struct i3c_master_controller base;
-	u16 maxdevs;
-	u16 datstartaddr;
+	struct work_struct hj_work;
+	enum i3c_dr_mode dr_mode;
+	struct {
+		struct work_struct mr_work;
+		enum type type;
+		u8 addr;
+	} mastership;
 	u32 free_pos;
 	struct {
 		struct list_head list;
 		struct dw_i3c_xfer *cur;
 		spinlock_t lock;
 	} xferqueue;
+	struct {
+		struct i3c_dev_desc *slots[MAX_DEVS];
+		spinlock_t lock; /* spinlock for ibi handling */
+	} ibi;
 	struct dw_i3c_master_caps caps;
 	void __iomem *regs;
 	struct reset_control *core_rst;
@@ -244,7 +322,9 @@ struct dw_i3c_master {
 };
 
 struct dw_i3c_i2c_dev_data {
+	struct i3c_generic_ibi_pool *ibi_pool;
 	u8 index;
+	s8 ibi;
 };
 
 static u8 even_parity(u8 p)
@@ -276,6 +356,7 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_SETMRL(true):
 	case I3C_CCC_SETMRL(false):
 	case I3C_CCC_ENTHDR(0):
+	case I3C_CCC_DEFSLVS:
 	case I3C_CCC_SETDASA:
 	case I3C_CCC_SETNEWDA:
 	case I3C_CCC_GETMWL:
@@ -283,6 +364,7 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETPID:
 	case I3C_CCC_GETBCR:
 	case I3C_CCC_GETDCR:
+	case I3C_CCC_GETACCMST:
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
@@ -314,7 +396,7 @@ static int dw_i3c_master_get_addr_pos(struct dw_i3c_master *master, u8 addr)
 {
 	int pos;
 
-	for (pos = 0; pos < master->maxdevs; pos++) {
+	for (pos = 0; pos < master->caps.datdepth; pos++) {
 		if (addr == master->addrs[pos])
 			return pos;
 	}
@@ -324,12 +406,37 @@ static int dw_i3c_master_get_addr_pos(struct dw_i3c_master *master, u8 addr)
 
 static int dw_i3c_master_get_free_pos(struct dw_i3c_master *master)
 {
-	if (!(master->free_pos & GENMASK(master->maxdevs - 1, 0)))
+	if (!(master->free_pos & GENMASK(master->caps.datdepth - 1, 0)))
 		return -ENOSPC;
 
 	return ffs(master->free_pos) - 1;
 }
 
+static void
+dw_i3c_master_add_defslvs(struct dw_i3c_master *master, int ndevs)
+{
+	struct i3c_ccc_dev_desc defslvs;
+	struct dw_i3c_defslvs_dct dct;
+	u32 *ptr = (u32 *)&dct;
+	int i;
+
+	for (i = 0; i < ndevs; i++) {
+		*ptr = readl(master->regs +
+			SEC_DEV_CHAR_TABLE_LOC(master->caps.dctstartaddr, i));
+
+		defslvs.dyn_addr = dct.dyn_addr >> 1;
+		if (dct.dyn_addr)
+			defslvs.dcr = dct.dcr_lvr;
+		else
+			defslvs.lvr = dct.dcr_lvr;
+
+		defslvs.bcr = dct.bcr;
+		defslvs.static_addr = dct.static_addr >> 1;
+
+		defslvs_populate_i3c_bus(&master->base, defslvs);
+	}
+}
+
 static void dw_i3c_master_wr_tx_fifo(struct dw_i3c_master *master,
 				     const u8 *bytes, int nbytes)
 {
@@ -539,7 +646,8 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
 
 	if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
-		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
+		writel(readl(master->regs + BUS_FREE_TIMING) |
+		       BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
 
 	lcnt = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period);
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
@@ -582,7 +690,8 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 		     SCL_I2C_FM_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I2C_FM_TIMING);
 
-	writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
+	writel(readl(master->regs + BUS_FREE_TIMING) |
+	       BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
 	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_I2C_SLAVE_PRESENT,
 	       master->regs + DEVICE_CTRL);
 
@@ -594,9 +703,11 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = { };
-	u32 thld_ctrl;
+	u32 thld_ctrl, char_ctrl;
 	int ret;
 
+	dw_i3c_master_disable(master);
+
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
@@ -613,38 +724,43 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 		return -EINVAL;
 	}
 
-	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
-	thld_ctrl &= ~QUEUE_THLD_CTRL_RESP_BUF_MASK;
-	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
+	if (!m->secondary) {
+		thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
+		thld_ctrl &= ~QUEUE_THLD_CTRL_RESP_BUF_MASK &
+			     ~QUEUE_THLD_CTRL_IBI_STS_MASK;
+		writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
 
-	thld_ctrl = readl(master->regs + DATA_BUFFER_THLD_CTRL);
-	thld_ctrl &= ~DATA_BUFFER_THLD_CTRL_RX_BUF;
-	writel(thld_ctrl, master->regs + DATA_BUFFER_THLD_CTRL);
+		thld_ctrl = readl(master->regs + DATA_BUFFER_THLD_CTRL);
+		thld_ctrl &= ~DATA_BUFFER_THLD_CTRL_RX_BUF;
+		writel(thld_ctrl, master->regs + DATA_BUFFER_THLD_CTRL);
 
-	writel(INTR_ALL, master->regs + INTR_STATUS);
-	writel(INTR_MASTER_MASK, master->regs + INTR_STATUS_EN);
-	writel(INTR_MASTER_MASK, master->regs + INTR_SIGNAL_EN);
+		writel(INTR_ALL, master->regs + INTR_STATUS);
+		writel(INTR_MASTER_MASK, master->regs + INTR_STATUS_EN);
+		writel(INTR_MASTER_MASK, master->regs + INTR_SIGNAL_EN);
 
-	ret = i3c_master_get_free_addr(m, 0);
-	if (ret < 0)
-		return ret;
+		ret = i3c_master_get_free_addr(m, 0);
+		if (ret < 0)
+			return ret;
 
-	writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(ret),
-	       master->regs + DEVICE_ADDR);
+		writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(ret),
+		       master->regs + DEVICE_ADDR);
+	}
+
+	if (!(readl(master->regs + DEVICE_ADDR) & DEV_ADDR_DYNAMIC_ADDR_VALID))
+		return -EINVAL;
 
 	memset(&info, 0, sizeof(info));
-	info.dyn_addr = ret;
+	char_ctrl = readl(master->regs + SLV_CHAR_CTRL);
+	info.hdr_cap = SLV_CHAR_CTRL_HDR_CAP(char_ctrl);
+	info.dcr = SLV_CHAR_CTRL_DCR(char_ctrl);
+	info.bcr = SLV_CHAR_CTRL_BCR(char_ctrl);
+	info.dyn_addr = readl(master->regs + DEVICE_ADDR) >> 16 & GENMASK(6, 0);
 
 	ret = i3c_master_set_info(&master->base, &info);
 	if (ret)
 		return ret;
 
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_SIR_REQ_REJECT);
-	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
-
-	/* For now don't support Hot-Join */
-	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_HOT_JOIN_NACK,
-	       master->regs + DEVICE_CTRL);
 
 	dw_i3c_master_enable(master);
 
@@ -770,7 +886,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	olddevs = ~(master->free_pos);
 
 	/* Prepare DAT before launching DAA. */
-	for (pos = 0; pos < master->maxdevs; pos++) {
+	for (pos = 0; pos < master->caps.datdepth; pos++) {
 		if (olddevs & BIT(pos))
 			continue;
 
@@ -785,7 +901,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
-		       DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
+		       DEV_ADDR_TABLE_LOC(master->caps.datstartaddr, pos));
 	}
 
 	xfer = dw_i3c_master_alloc_xfer(master, 1);
@@ -795,7 +911,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	pos = dw_i3c_master_get_free_pos(master);
 	cmd = &xfer->cmds[0];
 	cmd->cmd_hi = 0x1;
-	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
+	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->caps.datdepth - pos) |
 		      COMMAND_PORT_DEV_INDEX(pos) |
 		      COMMAND_PORT_CMD(I3C_CCC_ENTDAA) |
 		      COMMAND_PORT_ADDR_ASSGN_CMD |
@@ -806,20 +922,20 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
-	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
+	newdevs = GENMASK(master->caps.datdepth - cmd->rx_len - 1, 0);
 	newdevs &= ~olddevs;
 
-	for (pos = 0; pos < master->maxdevs; pos++) {
+	for (pos = 0; pos < master->caps.datdepth; pos++) {
 		if (newdevs & BIT(pos))
 			i3c_master_add_i3c_dev_locked(m, master->addrs[pos]);
 	}
 
 	dw_i3c_master_free_xfer(xfer);
 
-	i3c_master_disec_locked(m, I3C_BROADCAST_ADDR,
+	i3c_master_defslvs_locked(&master->base);
+	i3c_master_enec_locked(m, I3C_BROADCAST_ADDR,
 				I3C_CCC_EVENT_HJ |
-				I3C_CCC_EVENT_MR |
-				I3C_CCC_EVENT_SIR);
+				I3C_CCC_EVENT_MR);
 
 	return 0;
 }
@@ -899,10 +1015,27 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	int pos;
+
+	pos = dw_i3c_master_get_free_pos(master);
+
+	if (data->index > pos && pos > 0) {
+		writel(0,
+		       master->regs +
+		       DEV_ADDR_TABLE_LOC(master->caps.datstartaddr,
+					  data->index));
+
+		master->addrs[data->index] = 0;
+		master->free_pos |= BIT(data->index);
+
+		data->index = pos;
+		master->addrs[pos] = dev->info.dyn_addr;
+		master->free_pos &= ~BIT(pos);
+	}
 
 	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
 	       master->regs +
-	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
+	       DEV_ADDR_TABLE_LOC(master->caps.datstartaddr, data->index));
 
 	master->addrs[data->index] = dev->info.dyn_addr;
 
@@ -931,7 +1064,7 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
 
 	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->addrs[pos]),
 	       master->regs +
-	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
+	       DEV_ADDR_TABLE_LOC(master->caps.datstartaddr, data->index));
 
 	return 0;
 }
@@ -944,7 +1077,7 @@ static void dw_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
 
 	writel(0,
 	       master->regs +
-	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
+	       DEV_ADDR_TABLE_LOC(master->caps.datstartaddr, data->index));
 
 	i3c_dev_set_master_data(dev, NULL);
 	master->addrs[data->index] = 0;
@@ -1040,7 +1173,7 @@ static int dw_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	writel(DEV_ADDR_TABLE_LEGACY_I2C_DEV |
 	       DEV_ADDR_TABLE_STATIC_ADDR(dev->addr),
 	       master->regs +
-	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
+	       DEV_ADDR_TABLE_LOC(master->caps.datstartaddr, data->index));
 
 	return 0;
 }
@@ -1053,7 +1186,7 @@ static void dw_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
 
 	writel(0,
 	       master->regs +
-	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
+	       DEV_ADDR_TABLE_LOC(master->caps.datstartaddr, data->index));
 
 	i2c_dev_set_master_data(dev, NULL);
 	master->addrs[data->index] = 0;
@@ -1061,7 +1194,153 @@ static void dw_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
 	kfree(data);
 }
 
-static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
+static void dw_i3c_master_handle_sir(struct dw_i3c_master *master, u8 addr)
+{
+	struct dw_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *dev;
+	struct i3c_ibi_slot *slot;
+	int pos;
+
+	pos = dw_i3c_master_get_addr_pos(master, addr);
+	if (pos < 0)
+		return;
+
+	dev = master->ibi.slots[pos];
+
+	spin_lock(&master->ibi.lock);
+	data = i3c_dev_get_master_data(dev);
+	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
+	if (!slot) {
+		spin_unlock(&master->ibi.lock);
+		return;
+	}
+	i3c_master_queue_ibi(dev, slot);
+	spin_unlock(&master->ibi.lock);
+}
+
+static void dw_i3c_master_demux_ibis(struct dw_i3c_master *master)
+{
+	u32 nibis;
+	int i;
+
+	nibis = readl(master->regs + QUEUE_STATUS_LEVEL);
+	nibis = QUEUE_STATUS_IBI_BUF_BLR(nibis);
+
+	for (i = 0; i < nibis; i++) {
+		u32 ibir = readl(master->regs + IBI_QUEUE_STATUS);
+		u8 id = IBI_QUEUE_IBI_ID(ibir);
+
+		if (IBI_TYPE_HJ(id))
+			queue_work(master->base.wq, &master->hj_work);
+		else if (IBI_TYPE_SIR(id))
+			dw_i3c_master_handle_sir(master,
+						 IBI_QUEUE_IBI_ADDR(id));
+		else if (IBI_TYPE_MR(id)) {
+			master->mastership.addr = IBI_QUEUE_IBI_ADDR(id);
+			master->mastership.type = DELIVER;
+			queue_work(master->base.wq,
+				   &master->mastership.mr_work);
+		}
+	}
+}
+
+static void dw_i3c_master_bus_handoff(struct dw_i3c_master *master)
+{
+	u32 thld_ctrl;
+
+	writel(RESET_CTRL_RX_FIFO | RESET_CTRL_TX_FIFO |
+	       RESET_CTRL_RESP_QUEUE | RESET_CTRL_CMD_QUEUE,
+	       master->regs + RESET_CTRL);
+
+	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
+	thld_ctrl &= ~QUEUE_THLD_CTRL_RESP_BUF_MASK;
+	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
+
+	writel(INTR_ALL, master->regs + INTR_STATUS);
+	writel(INTR_SLAVE_MASK, master->regs + INTR_STATUS_EN);
+	writel(INTR_SLAVE_MASK, master->regs + INTR_SIGNAL_EN);
+
+	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_RESUME,
+	       master->regs + DEVICE_CTRL);
+
+	master->mastership.type = HANDOFF;
+	queue_work(master->base.wq, &master->mastership.mr_work);
+}
+
+static void dw_i3c_sec_master_bus_takeover(struct dw_i3c_master *master)
+{
+	u32 thld_ctrl;
+
+	writel(RESET_CTRL_RX_FIFO | RESET_CTRL_TX_FIFO |
+	       RESET_CTRL_RESP_QUEUE | RESET_CTRL_CMD_QUEUE,
+	       master->regs + RESET_CTRL);
+
+	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
+	thld_ctrl &= ~QUEUE_THLD_CTRL_RESP_BUF_MASK &
+		     ~QUEUE_THLD_CTRL_IBI_STS_MASK;
+	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
+
+	thld_ctrl = readl(master->regs + DATA_BUFFER_THLD_CTRL);
+	thld_ctrl &= ~DATA_BUFFER_THLD_CTRL_RX_BUF;
+	writel(thld_ctrl, master->regs + DATA_BUFFER_THLD_CTRL);
+
+	writel(INTR_ALL, master->regs + INTR_STATUS);
+	writel(INTR_MASTER_MASK, master->regs + INTR_STATUS_EN);
+	writel(INTR_MASTER_MASK, master->regs + INTR_SIGNAL_EN);
+
+	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_RESUME,
+	       master->regs + DEVICE_CTRL);
+
+	master->mastership.type = TAKEOVER;
+	queue_work(master->base.wq, &master->mastership.mr_work);
+}
+
+static void
+dw_i3c_sec_master_irq_handler(struct dw_i3c_master *master, u32 status)
+{
+	bool do_mr = false;
+	u32 ret;
+
+	if (status & INTR_TRANSFER_ERR_STAT)
+		writel(INTR_TRANSFER_ERR_STAT, master->regs + INTR_STATUS);
+
+	if (status & INTR_DEFSLV_STAT) {
+		ret = readl(master->regs + RESPONSE_QUEUE_PORT);
+		dw_i3c_master_add_defslvs(master, RESPONSE_PORT_DATA_LEN(ret));
+		writel(INTR_DEFSLV_STAT, master->regs + INTR_STATUS);
+		do_mr = true;
+	}
+
+	if (status & INTR_CCC_UPDATED_STAT) {
+		do_mr = true;
+		writel(INTR_CCC_UPDATED_STAT, master->regs + INTR_STATUS);
+	}
+
+	if (status & INTR_BUSOWNER_UPDATE_STAT) {
+		dw_i3c_master_bus_handoff(master);
+		writel(INTR_BUSOWNER_UPDATE_STAT, master->regs + INTR_STATUS);
+	}
+
+	if (!list_empty(&master->base.defslvs) && do_mr &&
+	    (readl(master->regs + SLV_EVENT_CTRL) & SLV_EVENT_MASTER_INTR_REQ)) {
+		master->mastership.type = REQUEST;
+		queue_work(master->base.wq, &master->mastership.mr_work);
+	}
+}
+
+static void
+dw_i3c_master_irq_handler(struct dw_i3c_master *master, u32 status)
+{
+	if (status & INTR_IBI_THLD_STAT)
+		dw_i3c_master_demux_ibis(master);
+
+	if (status & INTR_BUSOWNER_UPDATE_STAT) {
+		dw_i3c_sec_master_bus_takeover(master);
+		writel(INTR_BUSOWNER_UPDATE_STAT, master->regs + INTR_STATUS);
+	}
+}
+
+static irqreturn_t dw_i3c_irq_handler(int irq, void *dev_id)
 {
 	struct dw_i3c_master *master = dev_id;
 	u32 status;
@@ -1079,9 +1358,143 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 		writel(INTR_TRANSFER_ERR_STAT, master->regs + INTR_STATUS);
 	spin_unlock(&master->xferqueue.lock);
 
+	if (readl(master->regs + DEVICE_CTRL_EXTENDED) & DEV_OP_MODE_SLAVE)
+		dw_i3c_sec_master_irq_handler(master, status);
+	else
+		dw_i3c_master_irq_handler(master, status);
+
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long flags;
+	u32 sirmap;
+	int ret;
+
+	ret = i3c_master_disec_locked(m, dev->info.dyn_addr,
+				      I3C_CCC_EVENT_SIR);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	sirmap = readl(master->regs + IBI_SIR_REQ_REJECT);
+	sirmap |= BIT(data->ibi);
+	writel(sirmap, master->regs + IBI_SIR_REQ_REJECT);
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	return ret;
+}
+
+static int dw_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long flags;
+	u32 sirmap;
+	int ret;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	sirmap = readl(master->regs + IBI_SIR_REQ_REJECT);
+	sirmap &= ~BIT(data->ibi);
+	writel(sirmap, master->regs + IBI_SIR_REQ_REJECT);
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr,
+				     I3C_CCC_EVENT_SIR);
+	if (ret) {
+		spin_lock_irqsave(&master->ibi.lock, flags);
+		sirmap = readl(master->regs + IBI_SIR_REQ_REJECT);
+		sirmap |= BIT(data->ibi);
+		writel(sirmap, master->regs + IBI_SIR_REQ_REJECT);
+		spin_unlock_irqrestore(&master->ibi.lock, flags);
+	}
+
+	return ret;
+}
+
+static int dw_i3c_master_request_ibi(struct i3c_dev_desc *dev,
+				     const struct i3c_ibi_setup *req)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long flags;
+
+	if (req->max_payload_len > 0)
+		return -ENOTSUPP;
+
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool))
+		return PTR_ERR(data->ibi_pool);
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	data->ibi = IBI_SIR_REQ_ID(dev->info.dyn_addr);
+	master->ibi.slots[data->index] = dev;
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	return 0;
+}
+
+static void dw_i3c_master_free_ibi(struct i3c_dev_desc *dev)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long flags;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	master->ibi.slots[data->index] = NULL;
+	data->ibi = -1;
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	i3c_generic_ibi_free_pool(data->ibi_pool);
+}
+
+static void dw_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
+					   struct i3c_ibi_slot *slot)
+{
+	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
+}
+
+static int
+dw_i3c_sec_master_request_mastership(struct i3c_master_controller *m)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	u32 status;
+	int ret;
+
+	if (!m->secondary)
+		return -EINVAL;
+
+	if (!(readl(master->regs + DEVICE_ADDR) & DEV_ADDR_DYNAMIC_ADDR_VALID))
+		return -EINVAL;
+
+	if (!(readl(master->regs + SLV_EVENT_CTRL) & SLV_EVENT_MASTER_INTR_REQ))
+		return -EINVAL;
+
+	writel(readl(master->regs + SLV_INTR_REQ) |
+	       SLV_INTR_REQ_MIR, master->regs + SLV_INTR_REQ);
+
+	ret = readl_poll_timeout(master->regs + SLV_INTR_REQ, status,
+				 ((status & BIT(8)) && !(status & BIT(9))),
+				 100, 1000000);
+
+	return ret;
+}
+
+static int
+dw_i3c_master_deliver_mastership(struct i3c_master_controller *m, u8 addr)
+{
+	return i3c_master_getaccmst_locked(m, addr);
+}
+
 static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.bus_init = dw_i3c_master_bus_init,
 	.bus_cleanup = dw_i3c_master_bus_cleanup,
@@ -1095,12 +1508,74 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
 	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
+	.enable_ibi = dw_i3c_master_enable_ibi,
+	.disable_ibi = dw_i3c_master_disable_ibi,
+	.request_ibi = dw_i3c_master_request_ibi,
+	.free_ibi = dw_i3c_master_free_ibi,
+	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
+	.request_mastership = dw_i3c_sec_master_request_mastership,
+	.deliver_mastership = dw_i3c_master_deliver_mastership,
 };
 
+static void dw_i3c_master_hj(struct work_struct *work)
+{
+	struct dw_i3c_master *master = container_of(work, struct dw_i3c_master,
+						    hj_work);
+
+	i3c_master_do_daa(&master->base);
+}
+
+static void dw_i3c_master_mr(struct work_struct *work)
+{
+	struct dw_i3c_master *master = container_of(work,
+						   struct dw_i3c_master,
+						   mastership.mr_work);
+
+	switch (master->mastership.type) {
+	case REQUEST:
+		i3c_sec_master_request_mastership(&master->base);
+		break;
+	case DELIVER:
+		i3c_master_deliver_mastership(&master->base,
+					      master->mastership.addr);
+		break;
+	case HANDOFF:
+		i3c_master_switch_operation_mode(&master->base, true);
+		break;
+	case TAKEOVER:
+		i3c_master_switch_operation_mode(&master->base, false);
+		break;
+	default:
+		break;
+	}
+}
+
+static int dw_i3c_sec_master_init(struct dw_i3c_master *master)
+{
+	u32 ret;
+
+	ret = readl(master->regs + QUEUE_THLD_CTRL);
+	ret &= ~QUEUE_THLD_CTRL_RESP_BUF_MASK;
+	writel(ret, master->regs + QUEUE_THLD_CTRL);
+
+	writel(INTR_SLAVE_MASK, master->regs + INTR_STATUS_EN);
+	writel(INTR_SLAVE_MASK, master->regs + INTR_SIGNAL_EN);
+
+	writel(ADAPTIVE_I2C_I3C, master->regs + DEVICE_CTRL);
+	writel(DEV_OP_MODE_SLAVE, master->regs + DEVICE_CTRL_EXTENDED);
+
+	dw_i3c_master_enable(master);
+
+	return 0;
+}
+
 static int dw_i3c_probe(struct platform_device *pdev)
 {
+	unsigned long core_rate, core_period;
 	struct dw_i3c_master *master;
 	struct resource *res;
+	u16 avail_timing;
+	u32 idle_timing;
 	int ret, irq;
 
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
@@ -1127,13 +1602,16 @@ static int dw_i3c_probe(struct platform_device *pdev)
 
 	reset_control_deassert(master->core_rst);
 
+	spin_lock_init(&master->ibi.lock);
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
+	INIT_WORK(&master->hj_work, dw_i3c_master_hj);
+	INIT_WORK(&master->mastership.mr_work, dw_i3c_master_mr);
 
 	writel(INTR_ALL, master->regs + INTR_STATUS);
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(&pdev->dev, irq,
-			       dw_i3c_master_irq_handler, 0,
+			       dw_i3c_irq_handler, 0,
 			       dev_name(&pdev->dev), master);
 	if (ret)
 		goto err_assert_rst;
@@ -1147,15 +1625,44 @@ static int dw_i3c_probe(struct platform_device *pdev)
 	ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
 	master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
 
-	ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
-	master->datstartaddr = ret;
-	master->maxdevs = ret >> 16;
-	master->free_pos = GENMASK(master->maxdevs - 1, 0);
+	ret = readl(master->regs + DEV_ADDR_TABLE_POINTER);
+	master->caps.datstartaddr = DEV_ADDR_TABLE_ADDR(ret);
+	master->caps.datdepth = DEV_ADDR_TABLE_DEPTH(ret);
 
-	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &dw_mipi_i3c_ops, false);
-	if (ret)
-		goto err_assert_rst;
+	ret = readl(master->regs + DEV_CHAR_TABLE_POINTER);
+	master->caps.dctstartaddr = DEV_CHAR_TABLE_ADDR(ret);
+	master->caps.dctdepth = DEV_CHAR_TABLE_DEPTH(ret);
+
+	master->free_pos = GENMASK(master->caps.datdepth - 1, 0);
+
+	core_rate = clk_get_rate(master->core_clk);
+	if (!core_rate)
+		return -EINVAL;
+
+	core_period = DIV_ROUND_UP(1000000000, core_rate);
+
+	avail_timing = DIV_ROUND_UP(I3C_BUS_AVAIL_TIME_NS, core_period);
+	writel(readl(master->regs + BUS_FREE_TIMING) |
+	       BUS_IBI_FREE(avail_timing), master->regs + BUS_FREE_TIMING);
+
+	idle_timing = DIV_ROUND_UP(I3C_BUS_IDLE_TIME_NS, core_period);
+	writel(readl(master->regs + BUS_IDLE_TIMING) |
+	       BUS_IDLE_TIME(idle_timing), master->regs + BUS_IDLE_TIMING);
+
+	master->dr_mode = i3c_get_dr_mode(&pdev->dev);
+
+	if (master->dr_mode == I3C_DR_MODE_MASTER) {
+		if (i3c_master_register(&master->base, &pdev->dev,
+					&dw_mipi_i3c_ops, false))
+			goto err_assert_rst;
+	} else {
+		if (dw_i3c_sec_master_init(master))
+			goto err_assert_rst;
+
+		if (i3c_master_register(&master->base, &pdev->dev,
+					&dw_mipi_i3c_ops, true))
+			goto err_assert_rst;
+	}
 
 	return 0;
 
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
