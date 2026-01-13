Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7E2D29DE4
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTx30uEBZDNuHCc+pLP/m2mN7QrTv8zrAlujecQgPvQ=; b=pK47vSFtHr0/e4
	fCoxFSEEVGa8hCgGkovOsEwOn5pgLjyIJjVSs4knD/V89kZHU0zgvdxfSxACGqAFVcQTZkIIwPyQw
	QuxfdJhZNlwtjIezgBI+SRzGKh3VJCyOon4UJ83u0snxSLMXvBI9fddLsmWP82THXQ1QAyH994Ba6
	hZ07tXk7z2zEs7Z0hB3bSOGpMHqaLHJ+ZisTe1B7prr2OIrrUDVJTkkSE+8fGC7y8PZ3MXL4L+Qay
	vdG0Yi0yqIXtNj+7K0hiR49QFwU+6ou/kwQax8TP0NHm2LFQmrkZFCJqNgcz03DA0VdORSXp0MLno
	oKTlUzChNy4njBNU+37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoi-00000006egK-1Gug;
	Tue, 13 Jan 2026 07:27:52 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYog-00000006ean-1Vmd
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289271; x=1799825271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zvezr7OM8CFrX0qYhhSh2ql7rxcK6gaUOVLs1rXGmoQ=;
  b=IKc2Qh6/kfcK0NMTXntfILIwRmu8GMN5+E8TZzFDcat8Xc05yWBwdxD+
   /lC7IrlMvLNvBQMTB23/zElb2K6z/r8W7W/1l3wTaHXk4UGRoUUhIjaiG
   UKKCFrXKODtViqUAnUjGmPuTdhSP75WKMb7MX4j6fcbt3+myDecM2pZWf
   I7v4GsTdlzutp5yc603vnH/WXkarH92X1tqpekAbF9G4Kmx3AAexS5YM4
   FvLnu1gfmc3ZSCLbP/Helty9m8ambDYWLGDToWzK7k8S872L+B4VYWSy/
   XhA1nEhH58cnnVYV1ZKmqacDHfL5mCfNvIRVLVaXBsJHqBgfP/0BTLbq9
   g==;
X-CSE-ConnectionGUID: SGrtl1SISva0DOGxlAKFBQ==
X-CSE-MsgGUID: AMAgFNVmSDGoLAJezJpXVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625513"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:51 -0800
X-CSE-ConnectionGUID: Pr9Bnun7SJeaYG+kL6DUgg==
X-CSE-MsgGUID: Blv8LNmaRXiatWTMpRdqWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021351"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:49 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 15/21] i3c: mipi-i3c-hci: Factor out IO mode setting into helper
Date: Tue, 13 Jan 2026 09:26:56 +0200
Message-ID: <20260113072702.16268-16-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232750_438820_FD5636CF 
X-CRM114-Status: GOOD (  11.73  )
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

Prepare for future reuse.  Move the IO mode setting logic from
i3c_hci_init() into a dedicated helper function, i3c_hci_set_io_mode().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c | 45 ++++++++++++++++++--------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 3b0609cb7da7..569c8584045a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -613,9 +613,35 @@ static int i3c_hci_software_reset(struct i3c_hci *hci)
 	return 0;
 }
 
+static inline bool is_version_1_1_or_newer(struct i3c_hci *hci)
+{
+	return hci->version_major > 1 || (hci->version_major == 1 && hci->version_minor > 0);
+}
+
+static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
+{
+	bool pio_mode;
+
+	if (dma)
+		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
+	else
+		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
+
+	if (!is_version_1_1_or_newer(hci))
+		return 0;
+
+	pio_mode = reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE;
+	if ((dma && pio_mode) || (!dma && !pio_mode)) {
+		dev_err(&hci->master.dev, "%s mode is stuck\n", pio_mode ? "PIO" : "DMA");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int i3c_hci_init(struct i3c_hci *hci)
 {
-	bool size_in_dwords, mode_selector;
+	bool size_in_dwords;
 	u32 regval, offset;
 	int ret;
 
@@ -732,20 +758,14 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return -EINVAL;
 	}
 
-	mode_selector = hci->version_major > 1 ||
-				(hci->version_major == 1 && hci->version_minor > 0);
-
 	/* Quirk for HCI_QUIRK_PIO_MODE on AMD platforms */
 	if (hci->quirks & HCI_QUIRK_PIO_MODE)
 		hci->RHS_regs = NULL;
 
 	/* Try activating DMA operations first */
 	if (hci->RHS_regs) {
-		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
-		if (mode_selector && (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
-			dev_err(&hci->master.dev, "PIO mode is stuck\n");
-			ret = -EIO;
-		} else {
+		ret = i3c_hci_set_io_mode(hci, true);
+		if (!ret) {
 			hci->io = &mipi_i3c_hci_dma;
 			dev_dbg(&hci->master.dev, "Using DMA\n");
 		}
@@ -753,11 +773,8 @@ static int i3c_hci_init(struct i3c_hci *hci)
 
 	/* If no DMA, try PIO */
 	if (!hci->io && hci->PIO_regs) {
-		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
-		if (mode_selector && !(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
-			dev_err(&hci->master.dev, "DMA mode is stuck\n");
-			ret = -EIO;
-		} else {
+		ret = i3c_hci_set_io_mode(hci, false);
+		if (!ret) {
 			hci->io = &mipi_i3c_hci_pio;
 			dev_dbg(&hci->master.dev, "Using PIO\n");
 		}
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
