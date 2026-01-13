Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E40FD29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZks3oOF3ispAuF6k9AUL/gTYij9hwPaAx1UgoA35Tw=; b=P/uvK0wSlDyGNM
	S/ecS5B1VTfEeTFXoe6+GOSOSuDABVTulNJ4TR6BzMeDfaqcleWoFwQxPAgbjngopIOC6lNB4unLt
	Mks9oYaZBuAKxRsu0aAePvPmkGlsAxeAVrDwDN6WzW8Bz253ydHJCpu6QOTVJJPpgS0lTctkEa7t3
	TWwz5JBkEoONZrkRriNOd4Vr9lwrPiy5TxY41xGSgPCktUdZoi/SC2rzMaTcv59Hz5+2K6YvM4PBS
	WqAcAJELg8+xhCUtlzEeYLbIhkM2YOxC5lHL30xqbNVPGEWRal6cPzyNjiTcJ5Wp3Pf7j3YEXdNWT
	umSQ3+tLY8npe2dSmytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYok-00000006eiA-3JLl;
	Tue, 13 Jan 2026 07:27:54 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoi-00000006ean-1rPX
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289273; x=1799825273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EEsUJ9S50KN7uExXLIN0n7OLjM/OXtQjpXOTQZe+JqY=;
  b=BipuvOyjBpEqt1ptxIC42m83RRGxUeykhS5af1pnBVV2rnI0hwnFGR5v
   MtPtdnrdt9DWfNQ+5QUwTdZp9JXdbEbozRgNeL9lgqB9ZHGWLDEl3apgU
   GJeIbRIz09P1J8uSHEV962+onGlxEmBjKGr+bZ4fvD+zQ/z0mZ87lQLgl
   +Xi9DJg6ADbjDfeOJQyefk7SYuwptbGKMOaFYo6VVza3T5FORwWPr37xs
   LHY841teZKT5YVCcK/OT8hmNgQmAU76aG2HgDVv5LEnv5E6KtP+ro00nI
   r4AVrrcP1pCEp9e/U8JLhgFTR46+Xx+KCxdEXKJJ3TWlPOjeIXfGQApZh
   g==;
X-CSE-ConnectionGUID: K+7g3CitRhaIW47DNy8YSg==
X-CSE-MsgGUID: q2uyFKG5R9qj11B0qkeyyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625518"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:53 -0800
X-CSE-ConnectionGUID: +pDFEnzqQvqmTvcKD+Zg/g==
X-CSE-MsgGUID: LDbA6pM5R2W0veQ7xbs6Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021357"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:51 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 16/21] i3c: mipi-i3c-hci: Factor out core initialization into helper
Date: Tue, 13 Jan 2026 09:26:57 +0200
Message-ID: <20260113072702.16268-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232752_520003_FFC93223 
X-CRM114-Status: GOOD (  15.88  )
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

Prepare for future reuse.  Move core initialization logic from
i3c_hci_init() into a dedicated helper function,
i3c_hci_reset_and_init().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Move I/O mode setting if I/O mode already selected, to a
	separate patch

Changes in V2:

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c | 142 +++++++++++++------------
 1 file changed, 75 insertions(+), 67 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 569c8584045a..8b8e3952d41d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -639,6 +639,80 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
 	return 0;
 }
 
+static int i3c_hci_reset_and_init(struct i3c_hci *hci)
+{
+	u32 regval;
+	int ret;
+
+	ret = i3c_hci_software_reset(hci);
+	if (ret)
+		return -ENXIO;
+
+	/* Disable all interrupts */
+	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	/*
+	 * Only allow bit 31:10 signal updates because
+	 * Bit 0:9 are reserved in IP version >= 0.8
+	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
+	 */
+	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
+
+	/* Make sure our data ordering fits the host's */
+	regval = reg_read(HC_CONTROL);
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
+		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
+			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
+			reg_write(HC_CONTROL, regval);
+			regval = reg_read(HC_CONTROL);
+			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
+				dev_err(&hci->master.dev, "cannot set BE mode\n");
+				return -EOPNOTSUPP;
+			}
+		}
+	} else {
+		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
+			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
+			reg_write(HC_CONTROL, regval);
+			regval = reg_read(HC_CONTROL);
+			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
+				dev_err(&hci->master.dev, "cannot clear BE mode\n");
+				return -EOPNOTSUPP;
+			}
+		}
+	}
+
+	/* Try activating DMA operations first */
+	if (hci->RHS_regs) {
+		ret = i3c_hci_set_io_mode(hci, true);
+		if (!ret) {
+			hci->io = &mipi_i3c_hci_dma;
+			dev_dbg(&hci->master.dev, "Using DMA\n");
+		}
+	}
+
+	/* If no DMA, try PIO */
+	if (!hci->io && hci->PIO_regs) {
+		ret = i3c_hci_set_io_mode(hci, false);
+		if (!ret) {
+			hci->io = &mipi_i3c_hci_pio;
+			dev_dbg(&hci->master.dev, "Using PIO\n");
+		}
+	}
+
+	if (!hci->io) {
+		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
+		ret = ret ?: -EINVAL;
+	}
+	if (ret)
+		return ret;
+
+	/* Configure OD and PP timings for AMD platforms */
+	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
+		amd_set_od_pp_timing(hci);
+
+	return 0;
+}
+
 static int i3c_hci_init(struct i3c_hci *hci)
 {
 	bool size_in_dwords;
@@ -708,43 +782,6 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (ret)
 		return ret;
 
-	ret = i3c_hci_software_reset(hci);
-	if (ret)
-		return -ENXIO;
-
-	/* Disable all interrupts */
-	reg_write(INTR_SIGNAL_ENABLE, 0x0);
-	/*
-	 * Only allow bit 31:10 signal updates because
-	 * Bit 0:9 are reserved in IP version >= 0.8
-	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
-	 */
-	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
-
-	/* Make sure our data ordering fits the host's */
-	regval = reg_read(HC_CONTROL);
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
-		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
-			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
-			reg_write(HC_CONTROL, regval);
-			regval = reg_read(HC_CONTROL);
-			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
-				dev_err(&hci->master.dev, "cannot set BE mode\n");
-				return -EOPNOTSUPP;
-			}
-		}
-	} else {
-		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
-			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
-			reg_write(HC_CONTROL, regval);
-			regval = reg_read(HC_CONTROL);
-			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
-				dev_err(&hci->master.dev, "cannot clear BE mode\n");
-				return -EOPNOTSUPP;
-			}
-		}
-	}
-
 	/* Select our command descriptor model */
 	switch (FIELD_GET(HC_CAP_CMD_SIZE, hci->caps)) {
 	case 0:
@@ -762,36 +799,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (hci->quirks & HCI_QUIRK_PIO_MODE)
 		hci->RHS_regs = NULL;
 
-	/* Try activating DMA operations first */
-	if (hci->RHS_regs) {
-		ret = i3c_hci_set_io_mode(hci, true);
-		if (!ret) {
-			hci->io = &mipi_i3c_hci_dma;
-			dev_dbg(&hci->master.dev, "Using DMA\n");
-		}
-	}
-
-	/* If no DMA, try PIO */
-	if (!hci->io && hci->PIO_regs) {
-		ret = i3c_hci_set_io_mode(hci, false);
-		if (!ret) {
-			hci->io = &mipi_i3c_hci_pio;
-			dev_dbg(&hci->master.dev, "Using PIO\n");
-		}
-	}
-
-	if (!hci->io) {
-		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
-		if (!ret)
-			ret = -EINVAL;
-		return ret;
-	}
-
-	/* Configure OD and PP timings for AMD platforms */
-	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
-		amd_set_od_pp_timing(hci);
-
-	return 0;
+	return i3c_hci_reset_and_init(hci);
 }
 
 static int i3c_hci_probe(struct platform_device *pdev)
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
