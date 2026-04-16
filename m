Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E67F8D763
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfgaREcaN7HY7pgYI/z8LyO2M4lqhK2yHZATb3Hm6/4=; b=g1Y60UNLH4lAlx
	zO9RbkQqVWj4vdsVrIGHy1iijakc5GV44nNeFMf5JX8XZLxWLYP/AjgVYF03i4cVt5lgI1lZYcNd8
	I3nhr12XAA0iFJNzzf8W191tgdjwGY/aOp++asu4idBUXo9ONZ1sFzK6DM3w4DhFRVn+aL5VO9H14
	1V1InClpYqxb5LJdlo7e8AvxqZL+7FJtbdxKbRgRHXss7XrI3awlndLZ61ZbtLAG7G9SxEaNnLhnW
	16LCMUSnae3Trnh99nJ+/bD4YxNUAzep84g3BAdKZ9mpVMgUW50IQWUPFCI5jhN7UUY8QE/GdGQAo
	fQQA97jC/K+mLtwZmvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyF-00000002jp0-3kz5;
	Thu, 16 Apr 2026 17:57:43 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyC-00000002jix-3aDM
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362260; x=1807898260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hPGBhdF5ANvwsfFumbUBLcdUiqeLpp3UmhU2K1U2Lgc=;
  b=Ka+CAFTiVeDIh3Djj7+oMXFiMjc7OlOPj8OFkz4aFXqeZvcv+ODfbp4M
   /pV+b4Y88Z3pHlTFA7E+/R+ds9YOBS8thKrhXi4qptcsYw2Kxwh4db8jl
   wkxZXk5BkniIox1RNb95urPrg4vsWfTsulX6y/mV/XRnI/+l0y4JmvhLG
   +JGWP2G3lmgm8T2W7Kuu4XjD6izYYWOiOx3ZZoMxy2cAjgUYGltKK4GZh
   aMrs4UAGwwmNjl+CAMMF7oaZCEph1MqCMhQljrPWjkhQPr4D/S2f7zGiH
   abeCrvpR5R1rzr8v+YMWlAAraqu/snWULoUa6Zotv4L7MyTzZCmz42DW8
   g==;
X-CSE-ConnectionGUID: LsCGMeoTTwSyq01IP+Y8vw==
X-CSE-MsgGUID: VqfGH2PWRJmYgYKdrcRDqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778411"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778411"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:40 -0700
X-CSE-ConnectionGUID: 3cP0svejQkq82VNFs1mslg==
X-CSE-MsgGUID: TUV9eHPQR3KZndGOek/2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784640"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:38 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
Date: Thu, 16 Apr 2026 20:57:00 +0300
Message-ID: <20260416175704.41217-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105740_948438_5472E54E 
X-CRM114-Status: GOOD (  23.31  )
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

Handle internal I3C HCI errors when operating in DMA mode by adding a
simple recovery mechanism.

On detection of an internal controller error, mark recovery as needed and
attempt to restore operation by performing a software reset followed by
state restore.  To keep recovery straightforward on this unlikely error
path, all currently queued transfers are terminated and completed with an
error.

This allows the controller to resume operation after internal failures
rather than remaining permanently stuck.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd.h  |  6 ++
 drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 90 +++++++++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 4 files changed, 89 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
index b1bf87daa651..7bada7b4b2de 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
@@ -65,4 +65,10 @@ struct hci_cmd_ops {
 extern const struct hci_cmd_ops mipi_i3c_hci_cmd_v1;
 extern const struct hci_cmd_ops mipi_i3c_hci_cmd_v2;
 
+static inline void hci_cmd_set_resp_err(u32 *response, int resp_err)
+{
+	*response &= ~RESP_ERR_FIELD;
+	*response |= FIELD_PREP(RESP_ERR_FIELD, resp_err);
+}
+
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index f745805d3c99..89181a6a972d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -668,6 +668,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	if (val & INTR_HC_INTERNAL_ERR) {
 		dev_err(&hci->master.dev, "Host Controller Internal Error\n");
 		val &= ~INTR_HC_INTERNAL_ERR;
+		hci->recovery_needed = true;
 	}
 
 	if (val)
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index c2f48024f175..6811503c869e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/errno.h>
@@ -258,6 +259,10 @@ static void hci_dma_init_rh(struct i3c_hci *hci, struct hci_rh_data *rh, int i)
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
 
+	/*
+	 * Do not clear the entries of rh->src_xfers because the recovery uses
+	 * them.  In other cases they should be NULL anyway.
+	 */
 	rh->done_ptr = 0;
 	rh->ibi_chunk_ptr = 0;
 	rh->xfer_space = rh->xfer_entries;
@@ -362,7 +367,7 @@ static int hci_dma_init(struct i3c_hci *hci)
 		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
 					      &rh->resp_dma, GFP_KERNEL);
 		rh->src_xfers =
-			kmalloc_objs(*rh->src_xfers, rh->xfer_entries);
+			kzalloc_objs(*rh->src_xfers, rh->xfer_entries);
 		ret = -ENOMEM;
 		if (!rh->xfer || !rh->resp || !rh->src_xfers)
 			goto err_out;
@@ -572,13 +577,15 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 			hci_dma_unmap_xfer(hci, xfer, 1);
 			rh->src_xfers[done_ptr] = NULL;
 			xfer->ring_entry = -1;
-			xfer->response = resp;
 			if (tid != xfer->cmd_tid) {
 				dev_err(&hci->master.dev,
 					"response tid=%d when expecting %d\n",
 					tid, xfer->cmd_tid);
-				/* TODO: do something about it? */
+				hci->recovery_needed = true;
+				if (!RESP_STATUS(resp))
+					hci_cmd_set_resp_err(&resp, RESP_ERR_HC_TERMINATED);
 			}
+			xfer->response = resp;
 			if (xfer == xfer->completing_xfer || RESP_STATUS(resp))
 				complete(xfer->completing_xfer->completion);
 			if (RESP_STATUS(resp))
@@ -635,6 +642,58 @@ static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
 	}
 }
 
+static void hci_dma_error_out_rh(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	/*
+	 * The entries of rh->src_xfers are not cleared by
+	 * i3c_hci_reset_and_restore(), so can be used here.
+	 */
+	for (int i = 0; i < rh->xfer_entries; i++) {
+		struct hci_xfer *xfer = rh->src_xfers[i];
+
+		if (!xfer)
+			continue;
+		hci_dma_unmap_xfer(hci, xfer, 1);
+		rh->src_xfers[i] = NULL;
+		xfer->ring_entry = -1;
+		hci_cmd_set_resp_err(&xfer->response, RESP_ERR_HC_TERMINATED);
+		if (xfer == xfer->completing_xfer)
+			complete(xfer->completing_xfer->completion);
+	}
+}
+
+static void hci_dma_error_out_all(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+
+	for (int i = 0; i < rings->total; i++)
+		hci_dma_error_out_rh(hci, &rings->headers[i]);
+}
+
+static void hci_dma_recovery(struct i3c_hci *hci)
+{
+	int ret;
+
+	dev_err(&hci->master.dev, "Attempting to recover from internal errors\n");
+
+	for (int i = 0; i < 3; i++) {
+		ret = i3c_hci_reset_and_restore(hci);
+		if (!ret)
+			break;
+		dev_err(&hci->master.dev, "Reset and restore failed, error %d\n", ret);
+		/* Just in case the controller is busy, give it some time */
+		msleep(1000);
+	}
+
+	spin_lock_irq(&hci->lock);
+	hci_dma_error_out_all(hci);
+	hci_dma_unblock_enqueue(hci);
+	hci->recovery_needed = false;
+	spin_unlock_irq(&hci->lock);
+
+	dev_err(&hci->master.dev, "Recovery %s\n", ret ? "failed!" : "done");
+}
+
 static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 				 struct hci_xfer *xfer_list, int n)
 {
@@ -650,6 +709,16 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	ring_status = rh_reg_read(RING_STATUS);
 	if (ring_status & RING_STATUS_RUNNING) {
+		/*
+		 * The transfer may have already completed, especially
+		 * if recovery has just run.  Do nothing in that case.
+		 */
+		if (xfer_list->completing_xfer->ring_entry < 0 &&
+		    !hci->recovery_needed && !hci->enqueue_blocked &&
+		    ring_status == (RING_STATUS_ENABLED | RING_STATUS_RUNNING)) {
+			spin_unlock_irq(&hci->lock);
+			return false;
+		}
 		hci->enqueue_blocked = true;
 		spin_unlock_irq(&hci->lock);
 		/* stop the ring */
@@ -657,12 +726,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		spin_lock_irq(&hci->lock);
 		ring_status = rh_reg_read(RING_STATUS);
 		if (ring_status & RING_STATUS_RUNNING) {
-			/*
-			 * We're deep in it if ever this condition is ever met.
-			 * Hardware might still be writing to memory, etc.
-			 */
-			dev_crit(&hci->master.dev, "unable to abort the ring\n");
-			WARN_ON(1);
+			dev_err(&hci->master.dev, "Unable to abort the DMA ring\n");
+			hci->recovery_needed = true;
 		}
 	}
 
@@ -670,6 +735,13 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	hci_dma_xfer_done(hci, rh);
 
+	if (hci->recovery_needed) {
+		hci->enqueue_blocked = true;
+		spin_unlock_irq(&hci->lock);
+		hci_dma_recovery(hci);
+		return true;
+	}
+
 	for (i = 0; i < n; i++) {
 		struct hci_xfer *xfer = xfer_list + i;
 		int idx = xfer->ring_entry;
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 9b46453d6d4b..1344c469c2e2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -55,6 +55,7 @@ struct i3c_hci {
 	atomic_t next_cmd_tid;
 	bool irq_inactive;
 	bool enqueue_blocked;
+	bool recovery_needed;
 	wait_queue_head_t enqueue_wait_queue;
 	u32 caps;
 	unsigned int quirks;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
