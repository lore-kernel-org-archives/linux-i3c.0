Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B32CD342C
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxbWHWabx20+zwhoZoMenjVMV8DpIsH+O1M0g5kSJEI=; b=VYWlQ4TDJWZtmy
	5mRzdYxWCR9sbLbkwsb9zfjluLoTNVXzftmH6yjSv1z2u6xbv1PQv1i7RFa7iMgEWqSmF21N7y3IV
	7dJSg7OYeeCUaP+/t2MENL06P4rEEXkKSHRlCsjgqYLa077YVbZk/LlZsETIcrfzk/1abquC4Lg1J
	u2EPPUR1rmKJtnqeFfEP6sfuQsaf0I/G4kfO0hPD39khvGKKMXjS0VQIjZzopeJY0LbtsSn7ztNyT
	lBmQTZ7qB36dnWbWN3R7FOt6UbPR+X8zizSak+QE7XJKLv/sziU4ieL3j73vfuIlZSqEKnq+ooHWY
	CuWm05n92KLpEZg7Nt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZD-0000000D3UK-202F;
	Mon, 04 May 2026 11:34:27 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZA-0000000D3HH-3Tct
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894465; x=1809430465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZZSZuEZZIkYK5l+87E82HMycK6FJWco0QGBxgxkqM28=;
  b=EmYPHQYR7w4KQm/LJcUFbParzaLWodNCLPgUvencTZ8gi4eSE4F/94wG
   qiclYlOAVPS4RKO6B5mduYiBW38CnxWYcILUAIKkmUDTFYvM8/+tcZWYy
   atSbxXwFkStzbC1YXboVQ6UBRnzsTilRtP3vFEXX0F/Dfq3NQ16ufExyw
   3NUSHaSBpBJINoj4/T6QZP5yf8sqnguOxCbUDaTGqz/XpwqQB7WzaolEg
   pbWRCUTe6NZ17dxzzkftKSBzDyFftweEugEBgxf5kEyrjDznI6P4I4OFd
   REdT9Q/Dpb2Yf4ioyCK/9k6Xxl6Z34iypEdf82o86gOMPWLyLwqybA73u
   w==;
X-CSE-ConnectionGUID: DAplHeN7TkiJOiMPTEoUqw==
X-CSE-MsgGUID: RoA2GbQxRqmO0jPYOqY8EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315226"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315226"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:25 -0700
X-CSE-ConnectionGUID: 47or7PDnSGmbgvlCA4zaLg==
X-CSE-MsgGUID: oOun2pbnTX+fwzVgR7f/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478296"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:23 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 12/16] i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
Date: Mon,  4 May 2026 14:33:48 +0300
Message-ID: <20260504113352.38490-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043424_880608_198C24C1 
X-CRM114-Status: GOOD (  24.03  )
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

Note, internal errors indicated by INTR_HC_INTERNAL_ERR, cause the
controller to stop.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	When erroring out transfers, ensure the final transfer of a
	transfer list is processed last

Changes in V2:

	Rename completing_xfer to final_xfer
	Add hci_dma_xfer_done() before checking for an already complete
	transfer
	Improve commit message


 drivers/i3c/master/mipi-i3c-hci/cmd.h  |  6 ++
 drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 93 +++++++++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 4 files changed, 92 insertions(+), 9 deletions(-)

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
index 12a0122fb709..69dcf5dad3a5 100644
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
index 41bbd912df7f..376062c0fcbf 100644
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
 			if (xfer == xfer->final_xfer || RESP_STATUS(resp))
 				complete(xfer->final_xfer->completion);
 			if (RESP_STATUS(resp))
@@ -635,6 +642,60 @@ static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
 	}
 }
 
+static void hci_dma_error_out_rh(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	/*
+	 * The entries of rh->src_xfers are not cleared by
+	 * i3c_hci_reset_and_restore(), so can be used here.  Do 2 passes so
+	 * that the final_xfer of an xfer list is always processed last.
+	 */
+	for (int pass = 0; pass < 2; pass++)
+		for (int i = 0; i < rh->xfer_entries; i++) {
+			struct hci_xfer *xfer = rh->src_xfers[i];
+
+			if (!xfer || (!pass && xfer == xfer->final_xfer))
+				continue;
+			hci_dma_unmap_xfer(hci, xfer, 1);
+			rh->src_xfers[i] = NULL;
+			xfer->ring_entry = -1;
+			hci_cmd_set_resp_err(&xfer->response, RESP_ERR_HC_TERMINATED);
+			if (xfer == xfer->final_xfer)
+				complete(xfer->final_xfer->completion);
+		}
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
@@ -650,6 +711,17 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	ring_status = rh_reg_read(RING_STATUS);
 	if (ring_status & RING_STATUS_RUNNING) {
+		/*
+		 * The transfer may have already completed, especially
+		 * if recovery has just run.  Do nothing in that case.
+		 */
+		hci_dma_xfer_done(hci, rh);
+		if (xfer_list->final_xfer->ring_entry < 0 &&
+		    !hci->recovery_needed && !hci->enqueue_blocked &&
+		    ring_status == (RING_STATUS_ENABLED | RING_STATUS_RUNNING)) {
+			spin_unlock_irq(&hci->lock);
+			return false;
+		}
 		hci->enqueue_blocked = true;
 		spin_unlock_irq(&hci->lock);
 		/* stop the ring */
@@ -657,12 +729,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
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
 
@@ -670,6 +738,13 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
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
index a3151c26827e..4bf2c66c97b4 100644
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
