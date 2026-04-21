Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1C7F94CA0
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPxMD9+ru5Y58EtDZWcUV6IzBTP59ousrt5H608owGE=; b=CRecf68D1RrGBV
	42dIQU55Wj7cAn5GrnQBAHJm6zDjS6+iucESWIURKa7Cbhu4rNfW8mZnZM7SGhGN2DE+hJbnggnIU
	TaG1MMt3KOkRbcrsx2ofrQ7G0aMBlFOj4RRYKyPiDRKORMOMNuMiKkJff6++SV+xnCPkYeK4F1VKj
	3pVBacK0T7dSD5VesS2BhkGQMvp711dxXxxGaJHP+HXsIHNu+o9O6icUn77ug106w5OBq8oahKyyz
	VRNnsnthIyiWC1gf9O4tazlc8H+eu6dq3EF+5PUuMRbWXjBnI7FlNwiQXcO2NYf30PasgZ3z61QcZ
	GIZm2IzEcCbpaVHE9bKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJT-00000008zbw-2D3e;
	Tue, 21 Apr 2026 17:55:07 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJR-00000008zV1-3vwa
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794106; x=1808330106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NpzaIw6a5NBg7J1K6zUS8RFh74CZIrJVOLcdBA3XCo8=;
  b=IvvEHZ48OVP6PmOet4Q+aFm1XJRdO2q8CglzwiP1ikLE6P2IZv4Z4/Gc
   rAbNJIFEIWeFntnZBbwJK71GXfHwqzXNJ3pY9roUSwLkzYl7SUCT/2L3S
   OuK1S8YJnlVqssD1eFA/ahf4NT0nrFYnMmP63viyZ41uUdFjkQggvyhMo
   Ji9hfJ+st3xx9JmyC/uGlwPR+64MqUh2lcCz5MWNUq+1v7lCRqs2Tum/O
   J6O5mrXwX5nTm/HDuFw/GKGJ3O/JI1hoehwN3ZHXC8Ukzj9JHqxZS+A2e
   kDxJ2W5wmW924FXZ2AtuAh8IVpD8uyiqocr5GWAy/ZskHX5yeLZP7tZAH
   A==;
X-CSE-ConnectionGUID: nymQCrT1RRemUxMTlC+RjA==
X-CSE-MsgGUID: 6H9phnt9S/C32LeIgIBUiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651397"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:05 -0700
X-CSE-ConnectionGUID: npk/c1CnQc67XYomVlQGeQ==
X-CSE-MsgGUID: BDH4wLO0RVq7i7xycKk5iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227494950"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:04 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 10/16] i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
Date: Tue, 21 Apr 2026 20:54:29 +0300
Message-ID: <20260421175435.122094-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105506_027532_1ACD53DC 
X-CRM114-Status: GOOD (  14.83  )
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


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 18 +++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 42 insertions(+), 5 deletions(-)

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
index 699c6d523eed..41bbd912df7f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -597,6 +597,29 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	rh_reg_write(RING_OPERATION1, op1_val);
 }
 
+static bool hci_dma_requires_hc_abort_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	if (!(hci->quirks & HCI_QUIRK_DMA_REQUIRES_HC_ABORT))
+		return false;
+
+	reinit_completion(&rh->op_done);
+	mipi_i3c_hci_abort(hci);
+	wait_for_completion_timeout(&rh->op_done, HZ);
+	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
+
+	return true;
+}
+
+static void hci_dma_abort(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	if (hci_dma_requires_hc_abort_quirk(hci, rh))
+		return;
+
+	reinit_completion(&rh->op_done);
+	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
+	wait_for_completion_timeout(&rh->op_done, HZ);
+}
+
 static void hci_dma_abort_requires_pio_reset_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
 {
 	if ((hci->quirks & HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET) &&
@@ -630,9 +653,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		hci->enqueue_blocked = true;
 		spin_unlock_irq(&hci->lock);
 		/* stop the ring */
-		reinit_completion(&rh->op_done);
-		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
-		wait_for_completion_timeout(&rh->op_done, HZ);
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
