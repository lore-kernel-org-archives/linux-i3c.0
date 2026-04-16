Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8354F8D766
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBTmxtpNOmhwpi5MBoB91DckKbO7GY9wpvdekY+ALSg=; b=X010EgK1ZA/pJB
	RM1NFd2QJc6diaNPyCIDmTSt/KGpc2RxOeZTXSujCf0ddOhcqrQr/xwT/QW02iNC4/lvbhcueQX1X
	MAUs6qCGG8VqPwXIZztngMQA6UbfY3D5yf6t1kEwzQl8IMi/mqauwnTvA5fNt4gA3u41/tKbDfdPQ
	VHMUQe2pTsUkmRyt68c+kfBrtSkaXeqFqJFjSnPV6k61aslgHYUOkx6lYPEW1NaGxIgXfYAXivurM
	T65/OFZ+Tjty6FlmE3Cr1o/Mtm1S7H99tOEJ+RxDYZGxl7Ypz30bCUSm9msh+4pywWSEdphHNL8lX
	LTOhN5QFjlIl961mcL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyI-00000002jqz-2r22;
	Thu, 16 Apr 2026 17:57:46 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyG-00000002jpJ-2MXi
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362264; x=1807898264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MkmkegX1joGZSOYw2fciVIWnerXHbNVycIKCWl9lUTU=;
  b=Mzl+pbl9fnlAxtw22ZUtJddcqAHHKjRKlzluXNzzpAxI4b2syLGnu2cL
   8Ub0GY7sQ1QxwJUUsKnImAOVhsgr6KAp6LwqDYs3rBXkYBzi5QDWkC3VL
   EU38SSxqUiqYl3nS8NZcVkZVED1Ky0KmQ6lQXzQAFh0PRJcWlscPbbF/q
   M4NvGptkFMHrakcs7BeSJGrVCT+Ltjoxh5flgVR+xmetRBDRXsBtAe84b
   gdFQqnsD6wQZwRj/IxmAlxBa6++I1E2K+DBFc5CJ5XeuD5EDk41917KiH
   cV0cSB/DF9xR9aznXIFIr3Ljg/8tnGxy8bzx0BiHJI/VPyIaraP+BYoFm
   Q==;
X-CSE-ConnectionGUID: kkirU1L8QlKUThJlBTJsSQ==
X-CSE-MsgGUID: f2gUA6fZQKi1aQDt7IOnxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778423"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778423"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:44 -0700
X-CSE-ConnectionGUID: oWHDSDuVQgClZFERoMv0Vg==
X-CSE-MsgGUID: 8JnowKm/R1+X7IoCAhTEDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784659"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:43 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
Date: Thu, 16 Apr 2026 20:57:02 +0300
Message-ID: <20260416175704.41217-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105744_649637_4964DD61 
X-CRM114-Status: GOOD (  17.05  )
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
 drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  9 +++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 11 +++++++++++
 drivers/i3c/master/mipi-i3c-hci/pio.c  |  3 +++
 4 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 89181a6a972d..7f3e70bfffc1 100644
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
index 053e487b6257..527c282e0734 100644
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
@@ -588,6 +591,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 			xfer->response = resp;
 			if (xfer == xfer->completing_xfer || RESP_STATUS(resp))
 				complete(xfer->completing_xfer->completion);
+			else
+				hci_start_xfer(xfer);
 			if (RESP_STATUS(resp))
 				hci->enqueue_blocked = true;
 		}
@@ -598,6 +603,10 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	}
 
 	rh->xfer_space += done_cnt;
+	if (rh->xfer_space < rh->xfer_entries) {
+		xfer = rh->src_xfers[done_ptr];
+		hci_start_xfer(xfer);
+	}
 	op1_val = rh_reg_read(RING_OPERATION1);
 	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 1344c469c2e2..ecf2dcc0b004 100644
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
index 8f48a81e65ab..d4779c17d433 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -605,6 +605,9 @@ static bool hci_pio_process_cmd(struct i3c_hci *hci, struct hci_pio_data *pio)
 		 * Finally send the command.
 		 */
 		hci_pio_write_cmd(hci, pio->curr_xfer);
+
+		pio->curr_xfer->start_time = jiffies;
+		pio->curr_xfer->started = true;
 		/*
 		 * And move on.
 		 */
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
