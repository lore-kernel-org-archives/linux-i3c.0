Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AFDFEFB59
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VryOinDtL/G0aimksa4fTKuWVf0oAkTGYk3h6Y3lLgA=; b=Lbg0BPOGjyiSmL
	D1pCIVd31URKymF5SgnE1zvONwzYdG5OkEcZpuBiyrZBv63NODancsfgt7YXZUpBPxaI+HWA6FbEX
	px7oc73bpjP1niW2qhfge6qPg+kPoftLZTaT1PH2uEcfDDEMsyCCZJhjE0QjdLycHq3G/SBsE/rEZ
	y0wer3eEXgb7Xqtb2m1zNt95PgSZxZXG47pbz/DAILd5qPkM5zxxcI9hHelD7ySqLEf12lIIuAH8D
	Qp/jE23DxEX/+t6A80R3qI35cWP7zfysI0mMvoDbTn1dEeniIObvOwxjHoglalINQ2YN/yODuZkk0
	GxBNbn6wL0z45d8wzieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZn-00000008TZt-3P6M;
	Fri, 27 Feb 2026 14:12:19 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZl-00000008TRS-0nka
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201537; x=1803737537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nClWZs1fFRplOaHhfJzVqmz3QJL3O/gDcwLwLre25pg=;
  b=HGMXz9xs+yMQ5xK/aykx2n+HLeI8Pr5VgmwEQCDZJZQj9KH3yOuqKqp+
   Sik7NFGa7al2IHRhGf5JF5nfwpoG3qJ8FmuV6FdvEeGh9ctOO7xXC4Ad4
   dx046qFQZjS1C1zkn/M47XujqhtKvnRb33bEMtzfmwaulm96saOm+Crmz
   T0uBVbQJf3k2hQIt2ekcMdJ4Omc+KiRhlSbnk4P+Yd0Z1paFdQZpJ/Scc
   +xrqX8k37swnbey3SQsiJZVXl9HbxyX+e5e9pCuo2G5QSZdkRnlMGeLeb
   Yus97TjKOHV6CPhCIqsdZL6J9eBqZP/b573f1qdRZ/OIGaqwru2WXY5Po
   A==;
X-CSE-ConnectionGUID: 6IZ9Nuq7TI6Kr+FnaqX8mQ==
X-CSE-MsgGUID: me0i8wOFT4u90l1ZUVFJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750051"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750051"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:17 -0800
X-CSE-ConnectionGUID: JfSH2thbQlmIY66luSEOxg==
X-CSE-MsgGUID: KC+BeiG+QpWwcBHTammosA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015762"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:16 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 10/12] i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
Date: Fri, 27 Feb 2026 16:11:47 +0200
Message-ID: <20260227141149.184980-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061217_242904_2DB43C75 
X-CRM114-Status: GOOD (  16.58  )
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

The DMA ring halts whenever a transfer encounters an error. The interrupt
handler previously attempted to detect this situation and restart the ring
if a transfer completed at the same time. However, this restart logic runs
entirely in interrupt context and is inherently racy: it interacts with
other paths manipulating the ring state, and fully serializing it within
the interrupt handler is not practical.

Move this error-recovery logic out of the interrupt handler and into the
transfer-processing path (i3c_hci_process_xfer()), where serialization and
state management are already controlled. Introduce a new optional I/O-ops
callback, handle_error(), invoked when a completed transfer reports an
error. For DMA operation, the implementation simply calls the existing
dequeue function, which safely aborts and restarts the ring when needed.

This removes the fragile ring-restart logic from the interrupt handler and
centralizes error handling where proper sequencing can be ensured.

Fixes: ccdb2e0e3b00d ("i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++----
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 31 +++++++-------------------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 3 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 9cfe12fb9a0e..741f543aae68 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -223,10 +223,21 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
 	if (ret)
 		return ret;
 
-	if (!wait_for_completion_timeout(done, timeout) &&
-	    hci->io->dequeue_xfer(hci, xfer, n)) {
-		dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
-		return -ETIMEDOUT;
+	if (!wait_for_completion_timeout(done, timeout)) {
+		if (hci->io->dequeue_xfer(hci, xfer, n)) {
+			dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
+			return -ETIMEDOUT;
+		}
+		return 0;
+	}
+
+	if (hci->io->handle_error) {
+		bool error = false;
+
+		for (int i = 0; i < n && !error; i++)
+			error = RESP_STATUS(xfer[i].response);
+		if (error)
+			return hci->io->handle_error(hci, xfer, n);
 	}
 
 	return 0;
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 323c5ead82a5..4951fd0a63ac 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -613,6 +613,11 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	return did_unqueue;
 }
 
+static int hci_dma_handle_error(struct i3c_hci *hci, struct hci_xfer *xfer_list, int n)
+{
+	return hci_dma_dequeue_xfer(hci, xfer_list, n) ? -EIO : 0;
+}
+
 static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 {
 	u32 op1_val, op2_val, resp, *ring_resp;
@@ -880,29 +885,8 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 			hci_dma_xfer_done(hci, rh);
 		if (status & INTR_RING_OP)
 			complete(&rh->op_done);
-
-		if (status & INTR_TRANSFER_ABORT) {
-			u32 ring_status;
-
-			dev_notice_ratelimited(&hci->master.dev,
-				"Ring %d: Transfer Aborted\n", i);
-			mipi_i3c_hci_resume(hci);
-			ring_status = rh_reg_read(RING_STATUS);
-			if (!(ring_status & RING_STATUS_RUNNING) &&
-			    status & INTR_TRANSFER_COMPLETION &&
-			    status & INTR_TRANSFER_ERR) {
-				/*
-				 * Ring stop followed by run is an Intel
-				 * specific required quirk after resuming the
-				 * halted controller. Do it only when the ring
-				 * is not in running state after a transfer
-				 * error.
-				 */
-				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
-				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
-							   RING_CTRL_RUN_STOP);
-			}
-		}
+		if (status & INTR_TRANSFER_ABORT)
+			dev_dbg(&hci->master.dev, "Ring %d: Transfer Aborted\n", i);
 		if (status & INTR_IBI_RING_FULL)
 			dev_err_ratelimited(&hci->master.dev,
 				"Ring %d: IBI Ring Full Condition\n", i);
@@ -918,6 +902,7 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
 	.cleanup		= hci_dma_cleanup,
 	.queue_xfer		= hci_dma_queue_xfer,
 	.dequeue_xfer		= hci_dma_dequeue_xfer,
+	.handle_error		= hci_dma_handle_error,
 	.irq_handler		= hci_dma_irq_handler,
 	.request_ibi		= hci_dma_request_ibi,
 	.free_ibi		= hci_dma_free_ibi,
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 6680b8640c5a..0f5e5bad9fb1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -121,6 +121,7 @@ struct hci_io_ops {
 	bool (*irq_handler)(struct i3c_hci *hci);
 	int (*queue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 	bool (*dequeue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
+	int (*handle_error)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 	int (*request_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
 			   const struct i3c_ibi_setup *req);
 	void (*free_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
