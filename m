Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3451AC47BE1
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROyoXebE/CF2ft8cl2eM5gBfaRD6cCQS53x0qWupzF8=; b=nI/9TPzFfA45mL
	R0bjebJt33jV5IH5lTXrMdCz+MQmdF+tnm1cNgfjxK0f0m2zKJRy5pvmSAe7JnE6aUizlr7bQJlCz
	s5bOrr9/E70lGhF+/yfUBFY1LZQ2qMPMszT9E59Ykeq2jANQZBLbAhy3vhdF+VhIm7+bNA2SMQks0
	7dwkePEKTdXnuQGYcA/M1NaYxz0n9KyvIdeBJskmnJEeVp7xf1rVYwRCvNocLCDElXlt1b6+CvRyr
	yKDfmGg42dH+Fwc7R4r/x/yiPipgEiInVR0gy/2GVJ2BPHI+VfuIXu0ryOEFhbb0gGFiqe04zWNww
	6hlC9xQ+gwSCmcjlcLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAq-0000000DWQH-42hn;
	Tue, 06 Jan 2026 16:44:48 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAo-0000000DWNZ-3701
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717887; x=1799253887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x3wBqzkZzz9ohkIEz89hy1QymVKZas33vaIKebw/otk=;
  b=C3J5WKxBzAChX64WI39ELqYaMAGRxRtreSTM99s4r4K4h2hF3aRQE7m7
   R41/pbyF/MpwlZtlhf7RLfVNX74U161TkZkMSi2T4eglYywQp54s3Xkyj
   9mB5SbjK1/qvzeQHHv9Os6QtFRj28NlVyQQurwvH0xIsLudyW92sTpZ92
   PxK1BaWjGWpeNKwSi0E2SGxaYqIhf/ja6Es+zaPmrOTUKXXoCBz2JSj9R
   KpzIs+fGOHZe3GeSGtiuGDFruesAGLYIfXVIgiDonOVZ8+e0rMHiRibjD
   sKhZqvRxuXDrTagDOJx7baiYwkzEpifpAbr9IxdDOa878s7cJHmO2Ex/h
   w==;
X-CSE-ConnectionGUID: ElmnFoVWSjOdwoZT7OGXhQ==
X-CSE-MsgGUID: /qhPDfrNQ4KWp4ef7daTww==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741825"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:47 -0800
X-CSE-ConnectionGUID: USGYwFcxRO6A2UtKjpNRjQ==
X-CSE-MsgGUID: xiDQPRfpTICy6Irs/SLrcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838024"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:45 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 03/11] i3c: mipi-i3c-hci: Quieten initialization messages
Date: Tue,  6 Jan 2026 18:44:08 +0200
Message-ID: <20260106164416.67074-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084446_857096_E006D2FB 
X-CRM114-Status: GOOD (  15.28  )
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

The copious initialization messages are at most useful only for debugging.
Change them from dev_info() or dev_notice() to dev_dbg().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Minor white space tweaks to fix alignment

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/core.c     | 18 +++----
 drivers/i3c/master/mipi-i3c-hci/dma.c      |  4 +-
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 55 ++++++++++------------
 drivers/i3c/master/mipi-i3c-hci/pio.c      | 16 +++----
 4 files changed, 45 insertions(+), 48 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 211321f73e02..07fb91a12593 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -597,8 +597,8 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval) ? 0 : 8;
 	if (size_in_dwords)
 		hci->DAT_entries = 4 * hci->DAT_entries / hci->DAT_entry_size;
-	dev_info(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
-		 hci->DAT_entries, hci->DAT_entry_size, offset);
+	dev_dbg(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
+		hci->DAT_entries, hci->DAT_entry_size, offset);
 
 	regval = reg_read(DCT_SECTION);
 	offset = FIELD_GET(DCT_TABLE_OFFSET, regval);
@@ -607,23 +607,23 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	hci->DCT_entry_size = FIELD_GET(DCT_ENTRY_SIZE, regval) ? 0 : 16;
 	if (size_in_dwords)
 		hci->DCT_entries = 4 * hci->DCT_entries / hci->DCT_entry_size;
-	dev_info(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
-		 hci->DCT_entries, hci->DCT_entry_size, offset);
+	dev_dbg(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
+		hci->DCT_entries, hci->DCT_entry_size, offset);
 
 	regval = reg_read(RING_HEADERS_SECTION);
 	offset = FIELD_GET(RING_HEADERS_OFFSET, regval);
 	hci->RHS_regs = offset ? hci->base_regs + offset : NULL;
-	dev_info(&hci->master.dev, "Ring Headers at offset %#x\n", offset);
+	dev_dbg(&hci->master.dev, "Ring Headers at offset %#x\n", offset);
 
 	regval = reg_read(PIO_SECTION);
 	offset = FIELD_GET(PIO_REGS_OFFSET, regval);
 	hci->PIO_regs = offset ? hci->base_regs + offset : NULL;
-	dev_info(&hci->master.dev, "PIO section at offset %#x\n", offset);
+	dev_dbg(&hci->master.dev, "PIO section at offset %#x\n", offset);
 
 	regval = reg_read(EXT_CAPS_SECTION);
 	offset = FIELD_GET(EXT_CAPS_OFFSET, regval);
 	hci->EXTCAPS_regs = offset ? hci->base_regs + offset : NULL;
-	dev_info(&hci->master.dev, "Extended Caps at offset %#x\n", offset);
+	dev_dbg(&hci->master.dev, "Extended Caps at offset %#x\n", offset);
 
 	ret = i3c_hci_parse_ext_caps(hci);
 	if (ret)
@@ -705,7 +705,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 			ret = -EIO;
 		} else {
 			hci->io = &mipi_i3c_hci_dma;
-			dev_info(&hci->master.dev, "Using DMA\n");
+			dev_dbg(&hci->master.dev, "Using DMA\n");
 		}
 	}
 
@@ -717,7 +717,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 			ret = -EIO;
 		} else {
 			hci->io = &mipi_i3c_hci_pio;
-			dev_info(&hci->master.dev, "Using PIO\n");
+			dev_dbg(&hci->master.dev, "Using PIO\n");
 		}
 	}
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index f20db2899989..0f6bbe184e85 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -212,7 +212,7 @@ static int hci_dma_init(struct i3c_hci *hci)
 
 	regval = rhs_reg_read(CONTROL);
 	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
-	dev_info(&hci->master.dev, "%d DMA rings available\n", nr_rings);
+	dev_dbg(&hci->master.dev, "%d DMA rings available\n", nr_rings);
 	if (unlikely(nr_rings > 8)) {
 		dev_err(&hci->master.dev, "number of rings should be <= 8\n");
 		nr_rings = 8;
@@ -232,7 +232,7 @@ static int hci_dma_init(struct i3c_hci *hci)
 	for (i = 0; i < rings->total; i++) {
 		u32 offset = rhs_reg_read(RHn_OFFSET(i));
 
-		dev_info(&hci->master.dev, "Ring %d at offset %#x\n", i, offset);
+		dev_dbg(&hci->master.dev, "Ring %d at offset %#x\n", i, offset);
 		ret = -EINVAL;
 		if (!offset)
 			goto err_out;
diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
index 024bccf23fd0..77840fd4aa51 100644
--- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
@@ -26,9 +26,9 @@ static int hci_extcap_hardware_id(struct i3c_hci *hci, void __iomem *base)
 	hci->vendor_version_id	= readl(base + 0x08);
 	hci->vendor_product_id	= readl(base + 0x0c);
 
-	dev_info(&hci->master.dev, "vendor MIPI ID: %#x\n", hci->vendor_mipi_id);
-	dev_info(&hci->master.dev, "vendor version ID: %#x\n", hci->vendor_version_id);
-	dev_info(&hci->master.dev, "vendor product ID: %#x\n", hci->vendor_product_id);
+	dev_dbg(&hci->master.dev, "vendor MIPI ID: %#x\n", hci->vendor_mipi_id);
+	dev_dbg(&hci->master.dev, "vendor version ID: %#x\n", hci->vendor_version_id);
+	dev_dbg(&hci->master.dev, "vendor product ID: %#x\n", hci->vendor_product_id);
 
 	/* ought to go in a table if this grows too much */
 	switch (hci->vendor_mipi_id) {
@@ -48,7 +48,7 @@ static int hci_extcap_master_config(struct i3c_hci *hci, void __iomem *base)
 	static const char * const functionality[] = {
 		"(unknown)", "master only", "target only",
 		"primary/secondary master" };
-	dev_info(&hci->master.dev, "operation mode: %s\n", functionality[operation_mode]);
+	dev_dbg(&hci->master.dev, "operation mode: %s\n", functionality[operation_mode]);
 	if (operation_mode & 0x1)
 		return 0;
 	dev_err(&hci->master.dev, "only master mode is currently supported\n");
@@ -60,7 +60,7 @@ static int hci_extcap_multi_bus(struct i3c_hci *hci, void __iomem *base)
 	u32 bus_instance = readl(base + 0x04);
 	unsigned int count = FIELD_GET(GENMASK(3, 0), bus_instance);
 
-	dev_info(&hci->master.dev, "%d bus instances\n", count);
+	dev_dbg(&hci->master.dev, "%d bus instances\n", count);
 	return 0;
 }
 
@@ -70,8 +70,7 @@ static int hci_extcap_xfer_modes(struct i3c_hci *hci, void __iomem *base)
 	u32 entries = FIELD_GET(CAP_HEADER_LENGTH, header) - 1;
 	unsigned int index;
 
-	dev_info(&hci->master.dev, "transfer mode table has %d entries\n",
-		 entries);
+	dev_dbg(&hci->master.dev, "transfer mode table has %d entries\n", entries);
 	base += 4;  /* skip header */
 	for (index = 0; index < entries; index++) {
 		u32 mode_entry = readl(base);
@@ -94,7 +93,7 @@ static int hci_extcap_xfer_rates(struct i3c_hci *hci, void __iomem *base)
 
 	base += 4;  /* skip header */
 
-	dev_info(&hci->master.dev, "available data rates:\n");
+	dev_dbg(&hci->master.dev, "available data rates:\n");
 	for (index = 0; index < entries; index++) {
 		rate_entry = readl(base);
 		dev_dbg(&hci->master.dev, "entry %d: 0x%08x",
@@ -102,12 +101,12 @@ static int hci_extcap_xfer_rates(struct i3c_hci *hci, void __iomem *base)
 		rate = FIELD_GET(XFERRATE_ACTUAL_RATE_KHZ, rate_entry);
 		rate_id = FIELD_GET(XFERRATE_RATE_ID, rate_entry);
 		mode_id = FIELD_GET(XFERRATE_MODE_ID, rate_entry);
-		dev_info(&hci->master.dev, "rate %d for %s = %d kHz\n",
-			 rate_id,
-			 mode_id == XFERRATE_MODE_I3C ? "I3C" :
-			 mode_id == XFERRATE_MODE_I2C ? "I2C" :
-			 "unknown mode",
-			 rate);
+		dev_dbg(&hci->master.dev, "rate %d for %s = %d kHz\n",
+			rate_id,
+			mode_id == XFERRATE_MODE_I3C ? "I3C" :
+			mode_id == XFERRATE_MODE_I2C ? "I2C" :
+			"unknown mode",
+			rate);
 		base += 4;
 	}
 
@@ -121,8 +120,8 @@ static int hci_extcap_auto_command(struct i3c_hci *hci, void __iomem *base)
 	u32 autocmd_ext_config = readl(base + 0x08);
 	unsigned int count = FIELD_GET(GENMASK(3, 0), autocmd_ext_config);
 
-	dev_info(&hci->master.dev, "%d/%d active auto-command entries\n",
-		 count, max_count);
+	dev_dbg(&hci->master.dev, "%d/%d active auto-command entries\n",
+		count, max_count);
 	/* remember auto-command register location for later use */
 	hci->AUTOCMD_regs = base;
 	return 0;
@@ -130,46 +129,46 @@ static int hci_extcap_auto_command(struct i3c_hci *hci, void __iomem *base)
 
 static int hci_extcap_debug(struct i3c_hci *hci, void __iomem *base)
 {
-	dev_info(&hci->master.dev, "debug registers present\n");
+	dev_dbg(&hci->master.dev, "debug registers present\n");
 	hci->DEBUG_regs = base;
 	return 0;
 }
 
 static int hci_extcap_scheduled_cmd(struct i3c_hci *hci, void __iomem *base)
 {
-	dev_info(&hci->master.dev, "scheduled commands available\n");
+	dev_dbg(&hci->master.dev, "scheduled commands available\n");
 	/* hci->schedcmd_regs = base; */
 	return 0;
 }
 
 static int hci_extcap_non_curr_master(struct i3c_hci *hci, void __iomem *base)
 {
-	dev_info(&hci->master.dev, "Non-Current Master support available\n");
+	dev_dbg(&hci->master.dev, "Non-Current Master support available\n");
 	/* hci->NCM_regs = base; */
 	return 0;
 }
 
 static int hci_extcap_ccc_resp_conf(struct i3c_hci *hci, void __iomem *base)
 {
-	dev_info(&hci->master.dev, "CCC Response Configuration available\n");
+	dev_dbg(&hci->master.dev, "CCC Response Configuration available\n");
 	return 0;
 }
 
 static int hci_extcap_global_DAT(struct i3c_hci *hci, void __iomem *base)
 {
-	dev_info(&hci->master.dev, "Global DAT available\n");
+	dev_dbg(&hci->master.dev, "Global DAT available\n");
 	return 0;
 }
 
 static int hci_extcap_multilane(struct i3c_hci *hci, void __iomem *base)
 {
-	dev_info(&hci->master.dev, "Master Multi-Lane support available\n");
+	dev_dbg(&hci->master.dev, "Master Multi-Lane support available\n");
 	return 0;
 }
 
 static int hci_extcap_ncm_multilane(struct i3c_hci *hci, void __iomem *base)
 {
-	dev_info(&hci->master.dev, "NCM Multi-Lane support available\n");
+	dev_dbg(&hci->master.dev, "NCM Multi-Lane support available\n");
 	return 0;
 }
 
@@ -202,7 +201,7 @@ static const struct hci_ext_caps ext_capabilities[] = {
 static int hci_extcap_vendor_NXP(struct i3c_hci *hci, void __iomem *base)
 {
 	hci->vendor_data = (__force void *)base;
-	dev_info(&hci->master.dev, "Build Date Info = %#x\n", readl(base + 1*4));
+	dev_dbg(&hci->master.dev, "Build Date Info = %#x\n", readl(base + 1 * 4));
 	/* reset the FPGA */
 	writel(0xdeadbeef, base + 1*4);
 	return 0;
@@ -240,9 +239,8 @@ static int hci_extcap_vendor_specific(struct i3c_hci *hci, void __iomem *base,
 	}
 
 	if (!vendor_cap_entry) {
-		dev_notice(&hci->master.dev,
-			   "unknown ext_cap 0x%02x for vendor 0x%02x\n",
-			   cap_id, hci->vendor_mipi_id);
+		dev_dbg(&hci->master.dev, "unknown ext_cap 0x%02x for vendor 0x%02x\n",
+			cap_id, hci->vendor_mipi_id);
 		return 0;
 	}
 	if (cap_length < vendor_cap_entry->min_length) {
@@ -295,8 +293,7 @@ int i3c_hci_parse_ext_caps(struct i3c_hci *hci)
 			}
 		}
 		if (!cap_entry) {
-			dev_notice(&hci->master.dev,
-				   "unknown ext_cap 0x%02x\n", cap_id);
+			dev_dbg(&hci->master.dev, "unknown ext_cap 0x%02x\n", cap_id);
 		} else if (cap_length < cap_entry->min_length) {
 			dev_err(&hci->master.dev,
 				"ext_cap 0x%02x has size %d (expecting >= %d)\n",
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 142f3f79415b..109c6c5d83d6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -148,14 +148,14 @@ static int hci_pio_init(struct i3c_hci *hci)
 	spin_lock_init(&pio->lock);
 
 	size_val = pio_reg_read(QUEUE_SIZE);
-	dev_info(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
-		 FIELD_GET(CR_QUEUE_SIZE, size_val));
-	dev_info(&hci->master.dev, "IBI FIFO = %ld bytes\n",
-		 4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
-	dev_info(&hci->master.dev, "RX data FIFO = %d bytes\n",
-		 4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
-	dev_info(&hci->master.dev, "TX data FIFO = %d bytes\n",
-		 4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
+	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
+		FIELD_GET(CR_QUEUE_SIZE, size_val));
+	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
+		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
+	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
+		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
+	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
+		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
 
 	/*
 	 * Let's initialize data thresholds to half of the actual FIFO size.
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
