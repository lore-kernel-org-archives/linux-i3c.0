Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FB2F8D763
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBH+5e/MT+V4p2j3CrUNJxZVOdtNC3aUE4UeU1sTmqw=; b=CndPRei5pCiNVI
	sWyUVVOrfGoDLXzHkshftkSrYCHVbWRXnczfdeWQLoI3Eq92mz3wDC1/nYrNrn6tPQLa/kKI309c/
	sDxPlMox+eDs9LeQSsSMMh0rDD8IVeltMZHMNEC7bQ7Z8S6jmR25ECBVkE/wSnogJyRWdMNVj3P/h
	9VX2cf7tz5Ja4I6V7nW5xN7UvvLcFAmQf+LLunGifN3YiTejOsnugjzuhXlktwH8RMDuWq4ZpmsHc
	KSdP7G29hTuOWsjhN7HZgoDuppHr1guDwfaC8ExA9PT8NOeBHz2HKCW2isL008rM/TrN9hl67NDnu
	QK521B7WEJx4jzhMwYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyA-00000002jlu-1hSt;
	Thu, 16 Apr 2026 17:57:38 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQy7-00000002jix-3koE
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362255; x=1807898255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SDInP5kmRV4X6ueJaKAhBzqDcQrTaa7HiTKL00OQ0ic=;
  b=OpSVCCg4pq6p8FWcW8P6rLy8EVCwv6S6IMGn2qXqQGGt0+ZKKyhW3FLA
   po2Zq7MJ7EDEcJ6nKqk/4f9MCiLaAxn4z0MJIoVuu4hPkj/i0uuysCncW
   X2bwrQat2ouinlb5bm9QbuUeaujf5e2a9gv00BQaq7jst+cVmqhhmk+Mq
   QPbB6QLM+uXqDv5E1v2OwuZb+gFXO+mgkJW0QkI1avBJ0tud2vUyL6FMg
   S9Fhh7a9Uwz2Hsl65m7ouz/JJwXeaw0jexeUyh1hUGXl+s3LpiiV45/sj
   p1oGfRBEJhSVpu9mNZJjz7GzbATjfFY7rbvE2aCKXPkCnjQdJ3bzvIvS2
   A==;
X-CSE-ConnectionGUID: 737O0KIDQpahvDBuqZCVng==
X-CSE-MsgGUID: wKCrfYlgSk+ud2CkI5x2rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778403"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778403"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:35 -0700
X-CSE-ConnectionGUID: f0SzCdIlTuuiYO6GmfGQ+Q==
X-CSE-MsgGUID: sy6qUCKhQsWkV7HuYtf+KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784612"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:34 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/16] i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
Date: Thu, 16 Apr 2026 20:56:58 +0300
Message-ID: <20260416175704.41217-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105735_967270_D668D8FD 
X-CRM114-Status: GOOD (  14.45  )
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
 drivers/i3c/master/mipi-i3c-hci/core.c | 18 +++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 84fb03e918b0..4c4e87a9b352 100644
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
@@ -1056,7 +1069,8 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
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
index 26533d3cc8bf..c2f48024f175 100644
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
index 352effc468d9..d542d03dc629 100644
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
