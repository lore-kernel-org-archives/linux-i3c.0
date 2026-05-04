Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00772FF885A
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaWO+dX1zAwRYCjSseFoFyrl+7fa2W8Db9FHYqneLKQ=; b=4psq0dzpV8E1Dq
	46M9ZCQ+q1kYNXWy0b71EMFx/JhmMBUq+FAzm8k1W/n9VpyTj6R1srBxnaZQIsIZivUiEq67vL9g5
	r5iRW0ErAWX+xxBJU0IeT1uAzcc51T7Fsa2SsuDRsx90yZZgB6f0oJi35WTN2B2TvVRYUUGoIbFM8
	CFdqwMx8BUnnGriQnKF0Bs+Uc+6ZniGKyU4IYWhstQX9jLcV7fmaMiLzRDreEyQ37oFCT1/hKpQwA
	s7FBYSlwUpDxdjpEuZKJc5/kGjQHTKIEMgi0NeQZdN1PnW3DHCIbd+uGDMsIaKAA/vkbPsuxka6L9
	I1tWuRzuKnePKzUJbsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZG-0000000D3XX-2rRq;
	Mon, 04 May 2026 11:34:30 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZE-0000000D3HH-1smu
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894468; x=1809430468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mHhmQ3j/Sr7TdwoSpfXodUmINy6WgkAlXwFNdu1DWk4=;
  b=FkinHyhlze//4DY6NXli1awJTXdkuf+LB6esKkSZHdr4jS5xhOSkCIUR
   /VdY86mE0XnIoA7d3wJBIZsWWQy+4iVYsSm8J+CoLWdZNzm8ezjvL9gKz
   y6aN4LXuY0GJ/lLRirTHG0hDq2uw0KdplWajW72YQLOozHryHMP773jkI
   H7Tzx6v+CBXrLTC5dOHGXrVZN1in6z+sfODSDIVCTUGfJ5LQgyaqg2hmI
   9dvb9nX0kCXyfWmee1hThD6+nPVVTq1IbwtkDGGcKKnQ2LLmjH/85hqt/
   aPDcJpqJT/HfwpCQ88+YQqdCsvShJggZz/RIIaQlUHv8avfeeXuqF6kiG
   g==;
X-CSE-ConnectionGUID: 22N/Ng6lRNCNcPUfA4+nxg==
X-CSE-MsgGUID: vEmI0Mp1R0Cnisi+/H2IAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315290"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315290"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:28 -0700
X-CSE-ConnectionGUID: ImkaXy50Q4WBzAJcjFRcuQ==
X-CSE-MsgGUID: eYnDCwwySt2zi9ngmxElxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478318"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:27 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 14/16] i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
Date: Mon,  4 May 2026 14:33:50 +0300
Message-ID: <20260504113352.38490-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043428_507381_BBF1B611 
X-CRM114-Status: GOOD (  19.92  )
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

Transfer timeouts are currently measured from the point where a transfer
list is queued to the controller.  This can cause transfers to time out
before they have actually started, if earlier queued transfers consume
the timeout interval.

Fix this by recording when a transfer reaches the head of the queue and
adjusting the timeout calculation to start from that point.  The existing
low-overhead completion-based timeout mechanism is preserved, but care is
taken to ensure the transfer start time is consistently recorded for both
PIO and DMA paths.

This prevents premature timeouts while retaining efficient timeout
handling.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	None

Changes in V2:
	Do not flag the next transfer as started when there is an error
	which halts the controller
	Instead flag it started at the end of hci_dma_dequeue_xfer()
	Use hci_start_xfer() in pio.c


 drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 19 ++++++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 11 +++++++++++
 drivers/i3c/master/mipi-i3c-hci/pio.c  |  1 +
 4 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 69dcf5dad3a5..2866d599612a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -275,13 +275,30 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
 {
 	struct completion *done = xfer[n - 1].completion;
 	unsigned long timeout = xfer[n - 1].timeout;
+	unsigned long remaining_timeout = timeout;
+	long time_taken;
+	bool started;
 	int ret;
 
+	xfer[0].started = false;
+
 	ret = hci->io->queue_xfer(hci, xfer, n);
 	if (ret)
 		return ret;
 
-	if (!wait_for_completion_timeout(done, timeout)) {
+	while (!wait_for_completion_timeout(done, remaining_timeout)) {
+		scoped_guard(spinlock_irqsave, &hci->lock) {
+			started = xfer[0].started;
+			time_taken = jiffies - xfer[0].start_time;
+		}
+		/* Keep waiting if xfer has not started */
+		if (!started)
+			continue;
+		/* Recalculate timeout based on actual start time */
+		if (time_taken < timeout) {
+			remaining_timeout = timeout - time_taken;
+			continue;
+		}
 		if (hci->io->dequeue_xfer(hci, xfer, n)) {
 			dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
 			return -ETIMEDOUT;
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 90fa621c9d56..6440302c63ca 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -543,6 +543,9 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 		enqueue_ptr = (enqueue_ptr + 1) % rh->xfer_entries;
 	}
 
+	if (rh->xfer_space == rh->xfer_entries)
+		hci_start_xfer(xfer_list);
+
 	rh->xfer_space -= n;
 
 	op1_val &= ~RING_OP1_CR_ENQ_PTR;
@@ -558,6 +561,7 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	u32 op1_val, op2_val, resp, *ring_resp;
 	unsigned int tid, done_ptr = rh->done_ptr;
 	unsigned int done_cnt = 0;
+	bool start_next = false;
 	struct hci_xfer *xfer;
 
 	for (;;) {
@@ -588,8 +592,14 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 			xfer->response = resp;
 			if (xfer == xfer->final_xfer || RESP_STATUS(resp))
 				complete(xfer->final_xfer->completion);
-			if (RESP_STATUS(resp))
+			else
+				hci_start_xfer(xfer);
+			if (RESP_STATUS(resp)) {
 				hci->enqueue_blocked = true;
+				start_next = false;
+			} else {
+				start_next = true;
+			}
 		}
 
 		done_ptr = (done_ptr + 1) % rh->xfer_entries;
@@ -598,6 +608,10 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	}
 
 	rh->xfer_space += done_cnt;
+	if (start_next && rh->xfer_space < rh->xfer_entries) {
+		xfer = rh->src_xfers[done_ptr];
+		hci_start_xfer(xfer);
+	}
 	op1_val = rh_reg_read(RING_OPERATION1);
 	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
@@ -818,6 +832,9 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	hci_dma_unblock_enqueue(hci);
 
+	if (rh->xfer_space < rh->xfer_entries)
+		hci_start_xfer(rh->src_xfers[rh->done_ptr]);
+
 	spin_unlock_irq(&hci->lock);
 
 	wait_for_completion_timeout(&rh->op_done, HZ);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 4bf2c66c97b4..243d7a67f6f6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -11,6 +11,7 @@
 #define HCI_H
 
 #include <linux/io.h>
+#include <linux/jiffies.h>
 
 /* 32-bit word aware bit and mask macros */
 #define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
@@ -88,11 +89,13 @@ struct hci_xfer {
 	u32 cmd_desc[4];
 	u32 response;
 	bool rnw;
+	bool started;
 	void *data;
 	unsigned int data_len;
 	unsigned int cmd_tid;
 	struct completion *completion;
 	unsigned long timeout;
+	unsigned long start_time;
 	union {
 		struct {
 			/* PIO specific */
@@ -123,6 +126,14 @@ static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
 	kfree(xfer);
 }
 
+static inline void hci_start_xfer(struct hci_xfer *xfer)
+{
+	if (!xfer->started) {
+		xfer->started = true;
+		xfer->start_time = jiffies;
+	}
+}
+
 /* This abstracts PIO vs DMA operations */
 struct hci_io_ops {
 	bool (*irq_handler)(struct i3c_hci *hci);
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 8f48a81e65ab..6b8cc5f2b4d2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -605,6 +605,7 @@ static bool hci_pio_process_cmd(struct i3c_hci *hci, struct hci_pio_data *pio)
 		 * Finally send the command.
 		 */
 		hci_pio_write_cmd(hci, pio->curr_xfer);
+		hci_start_xfer(pio->curr_xfer);
 		/*
 		 * And move on.
 		 */
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
