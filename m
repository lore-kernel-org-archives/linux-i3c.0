Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8134ECAC59A
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZr+rnynornckrAGfYGan0ZIOxwIGsGcXzun4+Rn/NU=; b=4zhl0cTpTwu6Rr
	GMudTGi1UGI08RX7OO2QFI0XfjP7aRYCIF4S3Hl+3HfSkGpHZsqPIo1J3UDzSlaVWz1i2LOlkAT7H
	oseflqgiTAPGt+i5UJ2RcE5uphe8i4zfW5opdHQTWeYwgJvhuPZiebm7SQotbbvQNrE8ICE1Bv2Iy
	i7HCsHXo+pBU4YgpePq03ZxeLV3jmb2LVFERnL1Kmtk4GiiN2kVHxIGt0fAlI1Mwm+ui0/7RR6r7M
	pwsxfOsgDKi29MHuo4OjUedxv/GTv2R9VFDEJJYB9jsr+pgVxHZV2q1HLOnaBGpmEuIEtubLmEixY
	+TIaOyrgY4kcf4Y/z3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBMH-0000000GwjH-1Abb;
	Thu, 18 Sep 2025 09:55:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBME-0000000GwhJ-1G5C
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 09:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758189318; x=1789725318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4SY4L670TJgPKQAU5EDjQSQZtr3mz6KwQpF7XwYu4Yc=;
  b=eiEpgiprwbB952G1mWJa+pa/yDIkWOp+phIjjwI4s+gZerhQiIXa30KG
   wJzSkuokl+vaciE2HH2dBB9KLG4WlOsVn/IZ0IJF8ZW6gqa1N9tUkih/q
   Xs85bT+kAxMJ9OJ5oL6da5MNVhM1qS2pADSjj5M98o/vtou2XLnN+q8XJ
   CElEOeDHuR3neHgAvML+8qcvoGS+8+fGiA/zkTG4u5xTXVnAx88J/dRMI
   rUrZd2iXMyo2GxKoQ9VXhEulsHxn8dMNjAOF3wTdcEfvyxB93/9WyM5ZY
   FrwS/nn1aEO50QZyTErG/Z1Z0FZlmcUzrlMGSxvW8Jl9+ayWE2yJ2pebZ
   Q==;
X-CSE-ConnectionGUID: jSMfuw15TJGzquobHcasUg==
X-CSE-MsgGUID: KQynU7MpQvaYijX37AGwbA==
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="46088881"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 02:55:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 02:54:47 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 02:54:43 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <balamanikandan.gunasundar@microchip.com>,
	<nicolas.ferre@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 2/4] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
Date: Thu, 18 Sep 2025 15:24:27 +0530
Message-ID: <20250918095429.232710-3-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918095429.232710-1-durai.manickamkr@microchip.com>
References: <20250918095429.232710-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_025518_400447_40F0DFDC 
X-CRM114-Status: GOOD (  21.25  )
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

Add support for microchip sama7d65 SoC I3C HCI master only IP.
Features tested and supported :
           Standard CCC commands.
           I3C SDR mode private transfers in PIO mode.
           I2C transfers in PIO mode.
           Pure bus mode and mixed bus mode.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 drivers/i3c/master/mipi-i3c-hci/Makefile      |  3 +-
 drivers/i3c/master/mipi-i3c-hci/core.c        | 28 ++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h         | 12 ++++++
 .../i3c/master/mipi-i3c-hci/hci_quirks_mchp.c | 43 +++++++++++++++++++
 4 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks_mchp.c

diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
index e3d3ef757035..f463afc4566a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/Makefile
+++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci.o
 mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
 					   cmd_v1.o cmd_v2.o \
 					   dat_v1.o dct_v1.o \
-					   hci_quirks.o
+					   hci_quirks.o \
+					   hci_quirks_mchp.o
 obj-$(CONFIG_MIPI_I3C_HCI_PCI)		+= mipi-i3c-hci-pci.o
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 60f1175f1f37..cb0673d62c03 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
@@ -651,6 +652,9 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	hci->DAT_regs = offset ? hci->base_regs + offset : NULL;
 	hci->DAT_entries = FIELD_GET(DAT_TABLE_SIZE, regval);
 	hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval) ? 0 : 8;
+	/* Microchip SAMA7D65 SoC doesnot support DAT entry size bits in the DAT section offset register */
+	if (hci->quirks & MCHP_HCI_QUIRK_SAMA7D65)
+		hci->DAT_entry_size = 8;
 	if (size_in_dwords)
 		hci->DAT_entries = 4 * hci->DAT_entries / hci->DAT_entry_size;
 	dev_info(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
@@ -661,6 +665,9 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	hci->DCT_regs = offset ? hci->base_regs + offset : NULL;
 	hci->DCT_entries = FIELD_GET(DCT_TABLE_SIZE, regval);
 	hci->DCT_entry_size = FIELD_GET(DCT_ENTRY_SIZE, regval) ? 0 : 16;
+	/* Microchip SAMA7D65 SoC doesnot support DCT entry size bits in the DCT section offset register */
+	if (hci->quirks & MCHP_HCI_QUIRK_SAMA7D65)
+		hci->DCT_entry_size = 16;
 	if (size_in_dwords)
 		hci->DCT_entries = 4 * hci->DCT_entries / hci->DCT_entry_size;
 	dev_info(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
@@ -753,6 +760,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (hci->quirks & HCI_QUIRK_PIO_MODE)
 		hci->RHS_regs = NULL;
 
+	/* Microchip SAMA7d65 SoC supports only PIO mode */
+	if (hci->quirks & MCHP_HCI_QUIRK_PIO_MODE)
+		hci->RHS_regs = NULL;
+
 	/* Try activating DMA operations first */
 	if (hci->RHS_regs) {
 		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
@@ -788,6 +799,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
 		amd_set_od_pp_timing(hci);
 
+	/* Configure OD and PP timings for Microchip platforms */
+	if (hci->quirks & MCHP_HCI_QUIRK_OD_PP_TIMING)
+		mchp_set_od_pp_timing(hci);
+
 	return 0;
 }
 
@@ -803,6 +818,16 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (IS_ERR(hci->base_regs))
 		return PTR_ERR(hci->base_regs);
 
+#if defined(CONFIG_SOC_SAMA7D65)
+	hci->gclk = devm_clk_get_enabled(&pdev->dev, "gclk");
+	if (IS_ERR(hci->gclk))
+		return PTR_ERR(hci->gclk);
+
+	hci->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(hci->pclk))
+		return PTR_ERR(hci->pclk);
+#endif
+
 	platform_set_drvdata(pdev, hci);
 	/* temporary for dev_printk's, to be replaced in i3c_master_register */
 	hci->master.dev.init_name = dev_name(&pdev->dev);
@@ -836,6 +861,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
 
 static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 	{ .compatible = "mipi-i3c-hci", },
+	{ .compatible = "mchp,sama7d65-i3c-hci",
+	  .data = (void *)(MCHP_HCI_QUIRK_PIO_MODE | MCHP_HCI_QUIRK_OD_PP_TIMING |
+			   MCHP_HCI_QUIRK_RESP_BUF_THLD | MCHP_HCI_QUIRK_SAMA7D65) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 69ea1d10414b..e57f8d85402c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -37,6 +37,10 @@ struct hci_cmd_ops;
 /* Our main structure */
 struct i3c_hci {
 	struct i3c_master_controller master;
+#if defined(CONFIG_SOC_SAMA7D65)
+	struct clk *gclk;
+	struct clk *pclk;
+#endif
 	void __iomem *base_regs;
 	void __iomem *DAT_regs;
 	void __iomem *DCT_regs;
@@ -144,6 +148,12 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
 
+/* list of quirks for Microchip platforms */
+#define MCHP_HCI_QUIRK_PIO_MODE		BIT(2)  /* Set PIO mode */
+#define MCHP_HCI_QUIRK_OD_PP_TIMING	BIT(3)  /* Set OD and PP timings */
+#define MCHP_HCI_QUIRK_RESP_BUF_THLD	BIT(4)  /* Set resp buf thld to 0 */
+#define MCHP_HCI_QUIRK_SAMA7D65		BIT(5)  /* Set SAMA7D65 SoC specific features */
+
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
@@ -151,5 +161,7 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 void amd_set_od_pp_timing(struct i3c_hci *hci);
 void amd_set_resp_buf_thld(struct i3c_hci *hci);
+void mchp_set_od_pp_timing(struct i3c_hci *hci);
+void mchp_set_resp_buf_thld(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks_mchp.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks_mchp.c
new file mode 100644
index 000000000000..f2e54e6643c0
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks_mchp.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Microchip Technology Inc. and its subsidiaries
+ *
+ * Authors: Durai Manickam KR <durai.manickamkr@microchip.com>
+ *
+ * Microchip I3C HCI Quirks
+ */
+
+#include <linux/i3c/master.h>
+#include "hci.h"
+
+/* Timing registers */
+#define MCHP_HCI_SCL_I3C_OD_TIMING          0x214
+#define MCHP_HCI_SCL_I3C_PP_TIMING          0x218
+#define MCHP_HCI_SDA_HOLD_SWITCH_DLY_TIMING 0x230
+
+/* Timing values to configure 9MHz frequency */
+#define MCHP_SCL_I3C_OD_TIMING          0x00cf00cf
+#define MCHP_SCL_I3C_PP_TIMING          0x00160016
+
+#define MCHP_QUEUE_THLD_CTRL                0xD0
+
+void mchp_set_od_pp_timing(struct i3c_hci *hci)
+{
+	u32 data;
+
+	reg_write(MCHP_HCI_SCL_I3C_OD_TIMING, MCHP_SCL_I3C_OD_TIMING);
+	reg_write(MCHP_HCI_SCL_I3C_PP_TIMING, MCHP_SCL_I3C_PP_TIMING);
+	data = reg_read(MCHP_HCI_SDA_HOLD_SWITCH_DLY_TIMING);
+	/* Configure maximum TX hold time */
+	data |= W0_MASK(18, 16);
+	reg_write(MCHP_HCI_SDA_HOLD_SWITCH_DLY_TIMING, data);
+}
+
+void mchp_set_resp_buf_thld(struct i3c_hci *hci)
+{
+	u32 data;
+
+	data = reg_read(MCHP_QUEUE_THLD_CTRL);
+	data = data & ~W0_MASK(15, 8);
+	reg_write(MCHP_QUEUE_THLD_CTRL, data);
+}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
