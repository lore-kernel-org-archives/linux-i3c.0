Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AA4C77B62
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZ7FhD7/+OWKiIHUMY3RTo6aRMtR1nEQlJXQ2R1fyOc=; b=FBzHr4LZCDwNSk
	9Yx4UN9lA7pNr2u8RZUgEpd7mBiT//mHdZZu8A2QVJWbp6skC44X9R92EXlQMornxdrWUpXLHF98+
	EK5scaHrxMY04w4zNGrgjSwuwGbX5nvxEhc19M6i7gaF+WbRBWL+TH2U+kOohu5VGAs1YxVrAIsuv
	mW8oDxL/VCtdeY6MuCoW1xqGa8qnDgwiW1H7k4Myl7462ynZHdvHhp4v50cOu6A51XVB3GDuucbTK
	DozK/qIfNMUcXJxzGjkCUCDYMjrS+P9W8YP/bVJ1w/KzkAQwSHwwPc99bZKrKVvc1/lQkajvKlvHG
	caQ5GJoHX8fITWz/67ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmhi-002taA-0w;
	Thu, 30 Mar 2023 07:28:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmcI-002szW-0W
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:22:41 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 699D420127; Thu, 30 Mar 2023 15:22:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680160951;
	bh=HHehfwPuEfHSLZnH+cmY4Exs5tTvTS8DAc2AZDWJ8fI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NVmLJ27zYS1YAkt+35b6+NKejS3HtnTLK6+1RrjLcxPUvSsm6ABfY5tFElrOKjXNo
	 eV+ZmyDpLP83UcKhPNQeMD1zxfVomIcqgQH/0wUQHyB2S2a3YS5Npf+TsDfldCfyje
	 F1Jy3LS+D1JfEtMyyqhUHFd+J3mJ8hBDYz8D5siKMLQRAizOejIqlJz4hpf6d1AAYo
	 MsI817ie2268ilws2WrQVVCCF+eOnjlhLRXWVmx5jcFiNG/1gR8ZacSCrzjg4kfgsx
	 sTaIrPZFDE+HKahklVEKlMVCVu7A9LY194TnosxRIRY53KCZIo8FKf0+uVQl9r2T/Y
	 bBvOdks+RtJ3g==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/3] i3c: dw: Add infrastructure for platform-specific implementations
Date: Thu, 30 Mar 2023 15:22:17 +0800
Message-Id: <e4151c0427d1b8d7eccfb857650a759d17a516c0.1680160851.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680160851.git.jk@codeconstruct.com.au>
References: <cover.1680160851.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_002238_599479_2EC7322A 
X-CRM114-Status: GOOD (  22.40  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 00:28:12 -0700
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

The dw i3c core can be integrated into various SoC devices. Platforms
that use this core may need a little configuration that is specific to
that platform.

Add some infrastructure to allow platform-specific behaviour: common
probe/remove functions, a set of platform hook operations, and a pointer
for platform-specific data in struct dw_i3c_master. Move the common api
into a new (i3c local) header file.

Platforms will provide their own struct platform_driver, which allocates
struct dw_i3c_master, does any platform-specific probe behaviour, and
calls into the common probe.

A future change will add new platform support that uses this
infrastructure.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - structure for platform implementations as separate platform_drivers,
   to be implemented in separate source files
 - provide default ops rather than null checks
---
 drivers/i3c/master/dw-i3c-master.c | 76 +++++++++++++++++-------------
 drivers/i3c/master/dw-i3c-master.h | 55 +++++++++++++++++++++
 2 files changed, 98 insertions(+), 33 deletions(-)
 create mode 100644 drivers/i3c/master/dw-i3c-master.h

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1c146a39e1bd..9fc03108a5db 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -21,6 +21,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "dw-i3c-master.h"
+
 #define DEVICE_CTRL			0x0
 #define DEV_CTRL_ENABLE			BIT(31)
 #define DEV_CTRL_RESUME			BIT(30)
@@ -189,8 +191,6 @@
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
 
-#define MAX_DEVS 32
-
 #define I3C_BUS_SDR1_SCL_RATE		8000000
 #define I3C_BUS_SDR2_SCL_RATE		6000000
 #define I3C_BUS_SDR3_SCL_RATE		4000000
@@ -201,11 +201,6 @@
 
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 
-struct dw_i3c_master_caps {
-	u8 cmdfifodepth;
-	u8 datafifodepth;
-};
-
 struct dw_i3c_cmd {
 	u32 cmd_lo;
 	u32 cmd_hi;
@@ -224,25 +219,6 @@ struct dw_i3c_xfer {
 	struct dw_i3c_cmd cmds[];
 };
 
-struct dw_i3c_master {
-	struct i3c_master_controller base;
-	u16 maxdevs;
-	u16 datstartaddr;
-	u32 free_pos;
-	struct {
-		struct list_head list;
-		struct dw_i3c_xfer *cur;
-		spinlock_t lock;
-	} xferqueue;
-	struct dw_i3c_master_caps caps;
-	void __iomem *regs;
-	struct reset_control *core_rst;
-	struct clk *core_clk;
-	char version[5];
-	char type[5];
-	u8 addrs[MAX_DEVS];
-};
-
 struct dw_i3c_i2c_dev_data {
 	u8 index;
 };
@@ -602,6 +578,10 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	u32 thld_ctrl;
 	int ret;
 
+	ret = master->platform_ops->init(master);
+	if (ret)
+		return ret;
+
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
@@ -1124,14 +1104,23 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
 };
 
-static int dw_i3c_probe(struct platform_device *pdev)
+/* default platform ops implementations */
+static int dw_i3c_platform_init_nop(struct dw_i3c_master *i3c)
+{
+	return 0;
+}
+
+static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
+	.init = dw_i3c_platform_init_nop,
+};
+
+int dw_i3c_common_probe(struct dw_i3c_master *master,
+			struct platform_device *pdev)
 {
-	struct dw_i3c_master *master;
 	int ret, irq;
 
-	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
-	if (!master)
-		return -ENOMEM;
+	if (!master->platform_ops)
+		master->platform_ops = &dw_i3c_platform_ops_default;
 
 	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
@@ -1192,10 +1181,10 @@ static int dw_i3c_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
 
-static int dw_i3c_remove(struct platform_device *pdev)
+int dw_i3c_common_remove(struct dw_i3c_master *master)
 {
-	struct dw_i3c_master *master = platform_get_drvdata(pdev);
 	int ret;
 
 	ret = i3c_master_unregister(&master->base);
@@ -1208,6 +1197,27 @@ static int dw_i3c_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
+
+/* base platform implementation */
+
+static int dw_i3c_probe(struct platform_device *pdev)
+{
+	struct dw_i3c_master *master;
+
+	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return -ENOMEM;
+
+	return dw_i3c_common_probe(master, pdev);
+}
+
+static int dw_i3c_remove(struct platform_device *pdev)
+{
+	struct dw_i3c_master *master = platform_get_drvdata(pdev);
+
+	return dw_i3c_common_remove(master);
+}
 
 static const struct of_device_id dw_i3c_master_of_match[] = {
 	{ .compatible = "snps,dw-i3c-master-1.00a", },
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
new file mode 100644
index 000000000000..9f1e48211aa4
--- /dev/null
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 Code Construct
+ *
+ * Author: Jeremy Kerr <jk@codeconstruct.com.au>
+ */
+
+#include <linux/clk.h>
+#include <linux/i3c/master.h>
+#include <linux/reset.h>
+#include <linux/types.h>
+
+#define DW_I3C_MAX_DEVS 32
+
+struct dw_i3c_master_caps {
+	u8 cmdfifodepth;
+	u8 datafifodepth;
+};
+
+struct dw_i3c_master {
+	struct i3c_master_controller base;
+	u16 maxdevs;
+	u16 datstartaddr;
+	u32 free_pos;
+	struct {
+		struct list_head list;
+		struct dw_i3c_xfer *cur;
+		spinlock_t lock;
+	} xferqueue;
+	struct dw_i3c_master_caps caps;
+	void __iomem *regs;
+	struct reset_control *core_rst;
+	struct clk *core_clk;
+	char version[5];
+	char type[5];
+	u8 addrs[DW_I3C_MAX_DEVS];
+
+	/* platform-specific data */
+	const struct dw_i3c_platform_ops *platform_ops;
+	void *platform_data;
+};
+
+struct dw_i3c_platform_ops {
+	/*
+	 * Called on early bus init: the i3c has been set up, but before any
+	 * transactions have taken place. Platform implementations may use to
+	 * perform actual device enabling with the i3c core ready.
+	 */
+	int (*init)(struct dw_i3c_master *i3c);
+};
+
+extern int dw_i3c_common_probe(struct dw_i3c_master *master,
+			       struct platform_device *pdev);
+extern int dw_i3c_common_remove(struct dw_i3c_master *master);
+
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
