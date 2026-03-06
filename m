Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BA3F01807
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpHVrhWnjpF/MXi8SQgEYVXwE4TQM9PLwvJg6y193Dc=; b=giPLB+3PgPZvmt
	siXIRnoiI0APSs8o6w9wJxP5+dGOgFbhL/fJO2c592+hNFmbCMI+Me7nmk5KbAh28Au6w4t33MYJJ
	vguufTFxkU56pqjEjvxv9/OV/RkffN/qEBh0cgEc7TyTADjYEbWqh+wamYddfWKqylFfSiu6w1NaN
	fLPtmbMQFWHljilFpfyesdhws/79+ATP2pfnVZHxuoJ6lp3Ie1c/zUVFnyhuxOvKu16aKJONFD4E7
	sef//yE7mng6p8OGRdnGeVVfqpQ/T/gCn/mqH9hEB1K+xyHSlmODW92SgZQSfvVC3eOMT8gjojRjU
	UmU/AJU8quNNY4Qpln5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYr-000000039Gj-3wSw;
	Fri, 06 Mar 2026 07:25:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYp-000000039Ei-3ZEL
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781924; x=1804317924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XpkC2gWaMQhW4yECN5P86Tu0ZafYT7OnZhymJlHx1BY=;
  b=FBFYsVJF4LDaZtVEbRpjG8/7MeLFpQn8P2wT8260+ujREGEwZOkOdsmB
   gVqF+x31bV8320Rktq2UxdWWFZBqkoPgXmRQT/zCvjAODBJCsbWvXRdNm
   mrVMmLGbp9mRIIhLU4+kSlelhwonzU4GaqnEwmr5COc7+oQI79NK2dojM
   X16ONFaR2Tvd1Txqs4exkvgEOpx7XPE5vDwke5MO2KdQ4S46P7wGQkzqW
   2eCqdiv0+Lp+iabkVWDKDKW2ZwRcEvk36IjLl38fzkWJqJma4g2s7UBc+
   G9HNXUtMZMinwQsxIiV+nywdQY6ni9ZLTj3mUEpmyCyHN+d9mSE8EPsXE
   g==;
X-CSE-ConnectionGUID: o+wsaEysQoaYxledKS3J1w==
X-CSE-MsgGUID: 6k/3e6J+TgysnS+HipFReg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461357"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461357"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:24 -0800
X-CSE-ConnectionGUID: g5XZwcYrRjqQUxEUPRx9Lg==
X-CSE-MsgGUID: lj1DTB6wT1qP/Ar7i2XLSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419969"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:21 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 12/14] i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
Date: Fri,  6 Mar 2026 09:24:49 +0200
Message-ID: <20260306072451.11131-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232523_906040_B2C20791 
X-CRM114-Status: GOOD (  16.34  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++----
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 31 +++++++-------------------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 3 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 4a80671536f0..b98952d12d7c 100644
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
index 41b83f07fdab..e487ef52f6b4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -609,6 +609,11 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
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
@@ -870,29 +875,8 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
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
@@ -908,6 +892,7 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
 	.cleanup		= hci_dma_cleanup,
 	.queue_xfer		= hci_dma_queue_xfer,
 	.dequeue_xfer		= hci_dma_dequeue_xfer,
+	.handle_error		= hci_dma_handle_error,
 	.irq_handler		= hci_dma_irq_handler,
 	.request_ibi		= hci_dma_request_ibi,
 	.free_ibi		= hci_dma_free_ibi,
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 850016e3d4fe..9ac9d0e342f4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -123,6 +123,7 @@ struct hci_io_ops {
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
