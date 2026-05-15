Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC2CCD4F25
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upvBybPc6RdW61SfHm/pDGZdg3OuSSb1JMMyauGtueA=; b=TSJzeUfLXVL/GI
	XE/jgrpH4KPQwxwqGntsDoVoFAIsT79fLfEYwLyIt8jECUcICkkSamgupkjfnSwVezPEnTPbHFlEv
	rO8wnQ18lpHCIsbYEJmCSn9draiRI4WwtgMiVHfxdlpMP6w3tu6fTJhQiieHXu7PKXjdQn4AfLV5X
	Z4lgkhhqW5kuDyL9T6GYq+lSrAlZbWvhxqNAV/0O6v5IWLp+cBikOK8UJrE+sXZWdkk8HffhizlU4
	j4vRE58n59Vsq3N4Dez3qJYlbVbo8daSudnQrj7lXLPPXhpGY3fIKp9nWxpdRkrssv0GnU54EPrgt
	thz2FT8kH2QJa4WkBqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNK-00000008rWm-1HJG;
	Fri, 15 May 2026 16:26:58 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNH-00000008rJ2-0wtJ
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862416; x=1810398416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CXtKYMmKwEbkIY3ho/VVIr8S1aiko+WAbN4B3AgFKK8=;
  b=i8kVpuHHxGXlGNiNFnUDCr8cAMUntmNICSfpUh/AA1nkDzwaL4cv1hUS
   bWIAluicLbVdpSSon/Dz/K5j7UR55Zr7dht+H9AxQqqVYltTP2TygvLsF
   So8Fk+uiZpDBoZru0/ROxC4ACnhpDFDwqmtFsk8QmxTbKw5mqCfc/mLVg
   oJAKmM3G+cuUKTxaEW3KN9lJA6KAjSyjOrAkz4j9tsxA0SXUAAijtA2yP
   i/kLNFzF6Hai4G9GvyysFBirWCCih3YTfBOiVjI3DtzGgnyxsbmxZ47TD
   YdqVjZzBCWi4h3zwjGVdQ7UIthWXKOvcwMyXW0kkU9RvuYoPQdP87iJv6
   w==;
X-CSE-ConnectionGUID: UUeSmoBSR+62p7TQbKRyqg==
X-CSE-MsgGUID: Z/5UsbYcSSKPc2OkL2oKJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785283"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785283"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:55 -0700
X-CSE-ConnectionGUID: IJ7FUVXESmqpu9GzVplgYA==
X-CSE-MsgGUID: 0aes11l6RRWebuu6NBYNrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857255"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:54 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 11/17] i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
Date: Fri, 15 May 2026 19:26:15 +0300
Message-ID: <20260515162621.57719-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092655_334364_F341A920 
X-CRM114-Status: GOOD (  14.67  )
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

DMA rings can be aborted either per-ring via RING_CONTROL or globally
via HC_CONTROL_ABORT. The driver currently relies on the per-ring
mechanism.

Some Intel I3C HCI controllers require HC_CONTROL_ABORT to be asserted
before a DMA ring abort is effective.  This behavior is non-standard.
Introduce a controller quirk to select the required abort method and
enable it for Intel LPSS I3C controllers.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V4:

	Factor out hci_dma_abort() into a preceding patch
	Make hci_dma_requires_hc_abort_quirk() return void and
	move quirk check to caller

Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 18 ++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 17 +++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 770235ad6b25..8274c84b16be 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -231,7 +231,20 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 
 void mipi_i3c_hci_resume(struct i3c_hci *hci)
 {
-	reg_set(HC_CONTROL, HC_CONTROL_RESUME);
+	u32 reg = reg_read(HC_CONTROL);
+
+	reg |= HC_CONTROL_RESUME;
+	reg &= ~HC_CONTROL_ABORT;
+	reg_write(HC_CONTROL, reg);
+}
+
+void mipi_i3c_hci_abort(struct i3c_hci *hci)
+{
+	u32 reg = reg_read(HC_CONTROL);
+
+	reg &= ~HC_CONTROL_RESUME; /* Do not set resume */
+	reg |= HC_CONTROL_ABORT;
+	reg_write(HC_CONTROL, reg);
 }
 
 /* located here rather than pio.c because needed bits are in core reg space */
@@ -1053,7 +1066,8 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
 	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
 				    HCI_QUIRK_RPM_IBI_ALLOWED |
 				    HCI_QUIRK_RPM_PARENT_MANAGED |
-				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET },
+				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
+				    HCI_QUIRK_DMA_REQUIRES_HC_ABORT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index f2d33068b8df..f9023cb3c5a2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -597,8 +597,21 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	rh_reg_write(RING_OPERATION1, op1_val);
 }
 
-static void hci_dma_abort(struct hci_rh_data *rh)
+static void hci_dma_requires_hc_abort_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
 {
+	reinit_completion(&rh->op_done);
+	mipi_i3c_hci_abort(hci);
+	wait_for_completion_timeout(&rh->op_done, HZ);
+	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
+}
+
+static void hci_dma_abort(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	if (hci->quirks & HCI_QUIRK_DMA_REQUIRES_HC_ABORT) {
+		hci_dma_requires_hc_abort_quirk(hci, rh);
+		return;
+	}
+
 	reinit_completion(&rh->op_done);
 	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
 	wait_for_completion_timeout(&rh->op_done, HZ);
@@ -630,7 +643,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		hci->enqueue_blocked = true;
 		spin_unlock_irq(&hci->lock);
 		/* stop the ring */
-		hci_dma_abort(rh);
+		hci_dma_abort(hci, rh);
 		spin_lock_irq(&hci->lock);
 		ring_status = rh_reg_read(RING_STATUS);
 		if (ring_status & RING_STATUS_RUNNING) {
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 01237b12d32e..97c31a315a6e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -157,9 +157,11 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
 #define HCI_QUIRK_RPM_PARENT_MANAGED	BIT(7)  /* Runtime PM managed by parent device */
 #define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
+#define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
+void mipi_i3c_hci_abort(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
