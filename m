Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037A9F8D763
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLxfDRBOq5uEMNEOqz83zdd4pGOPHy+a5PSg35JOxJo=; b=Q9QWK5v/05dG21
	r2W1yH/F/iYHV5fJxEJlDPbjqQ6TFKNKh0HK0W1JiaUCBPcLkC2TonnJwK81YTOCWHk+aYPvZldI2
	lJkhNe1r0yxvQ7OWQJw+i7vRVC1y8GFLK8O7v+nMGhMINeUiKScYkD1WmnLdPcJdbjsPkCZlIb9Y5
	IVELqjehridqW/WRAoH859JYIrwLWkrCwHBzRWodJ9fSlmpxogaueu25FA9/ZQdUJrzUnP03aViY9
	mn9hKyrLYwzaYyL2v8FF7l7NIhIt7L7T5pBRWkbGIrdK3NOcXuEek5nL5ZIBqsfaWQWG8WBZTmJpi
	jhvq6t38ezGHRtAqWrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxx-00000002jed-1mbb;
	Thu, 16 Apr 2026 17:57:25 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxu-00000002jcH-0TSz
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362242; x=1807898242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wfG7OXmk6jxD8gytR4muq6DVuXJrOsNEGNsRvQWdBrw=;
  b=mdTwaHLf8l3fxPLo/PW6Q8mCK+M20KgdPtMAyp1ljulxAGGTVmmwGcpk
   I9ZpneSDPL2a3ZVDS+x10+STEkv8zMJU91J8Kt4uQJYXW0w6Zavat9VVI
   BVa+/K3v+VA+5wDD0T0yd/6HPGr22yY/VNzBvtwDS62GzLdTaHAGSHp8W
   k6muhnP+EGzvPsMsYU+rVuErXqiGqRRHkiXXSAaBlivXXZAUNWSLKsJgo
   L1IyIvs9mHtJYNX1XXyLVJUOVX0edq8R31R7nvl0zGGpRsOHZ5OeRADxk
   GtfKNqi2opPr1mzz726dwrJKVTsT2OojgDUJ26ky+z99scwpHcZh9XoU1
   A==;
X-CSE-ConnectionGUID: Xtpec8pVSlyQDwLdhEJikw==
X-CSE-MsgGUID: /P+dfUXuQY+95KlrQ17gcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778358"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:21 -0700
X-CSE-ConnectionGUID: GxLc2QaFToGsAxCIxgGlBg==
X-CSE-MsgGUID: VOi+i/kKQXWLGBoEX0v+1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784504"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:20 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/16] i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
Date: Thu, 16 Apr 2026 20:56:51 +0300
Message-ID: <20260416175704.41217-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105722_240592_AE3FD7E9 
X-CRM114-Status: GOOD (  15.65  )
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

Block the DMA enqueue path while a Ring abort is in progress or after an
error condition has been detected.

Previously, new transfers could be enqueued while the DMA Ring was being
aborted or while error handling was underway. This allowed enqueue and
error-recovery paths to run concurrently, potentially interfering with
each other and corrupting Ring state.

Introduce explicit enqueue blocking and a wait queue to serialize access:
enqueue operations now wait until abort or error handling has completed
before proceeding. Enqueue is unblocked once the Ring is safely restarted.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 25 +++++++++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index bb8f2d830b0d..5e1bc6d819cf 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -976,6 +976,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
 
 	spin_lock_init(&hci->lock);
 	mutex_init(&hci->control_mutex);
+	init_waitqueue_head(&hci->enqueue_wait_queue);
 
 	/*
 	 * Multi-bus instances share the same MMIO address range, but not
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 4cd32e3afa7b..314635e6e190 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -484,6 +484,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 
 	spin_lock_irq(&hci->lock);
 
+	while (unlikely(hci->enqueue_blocked)) {
+		spin_unlock_irq(&hci->lock);
+		wait_event(hci->enqueue_wait_queue, !READ_ONCE(hci->enqueue_blocked));
+		spin_lock_irq(&hci->lock);
+	}
+
 	if (n > rh->xfer_space) {
 		spin_unlock_irq(&hci->lock);
 		hci_dma_unmap_xfer(hci, xfer_list, n);
@@ -539,6 +545,14 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	return 0;
 }
 
+static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
+{
+	if (hci->enqueue_blocked) {
+		hci->enqueue_blocked = false;
+		wake_up_all(&hci->enqueue_wait_queue);
+	}
+}
+
 static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 				 struct hci_xfer *xfer_list, int n)
 {
@@ -550,12 +564,17 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	guard(mutex)(&hci->control_mutex);
 
+	spin_lock_irq(&hci->lock);
+
 	ring_status = rh_reg_read(RING_STATUS);
 	if (ring_status & RING_STATUS_RUNNING) {
+		hci->enqueue_blocked = true;
+		spin_unlock_irq(&hci->lock);
 		/* stop the ring */
 		reinit_completion(&rh->op_done);
 		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
 		wait_for_completion_timeout(&rh->op_done, HZ);
+		spin_lock_irq(&hci->lock);
 		ring_status = rh_reg_read(RING_STATUS);
 		if (ring_status & RING_STATUS_RUNNING) {
 			/*
@@ -567,8 +586,6 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		}
 	}
 
-	spin_lock_irq(&hci->lock);
-
 	for (i = 0; i < n; i++) {
 		struct hci_xfer *xfer = xfer_list + i;
 		int idx = xfer->ring_entry;
@@ -604,6 +621,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
 
+	hci_dma_unblock_enqueue(hci);
+
 	spin_unlock_irq(&hci->lock);
 
 	return did_unqueue;
@@ -647,6 +666,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 			}
 			if (xfer->completion)
 				complete(xfer->completion);
+			if (RESP_STATUS(resp))
+				hci->enqueue_blocked = true;
 		}
 
 		done_ptr = (done_ptr + 1) % rh->xfer_entries;
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f17f43494c1b..d630400ec945 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -54,6 +54,8 @@ struct i3c_hci {
 	struct mutex control_mutex;
 	atomic_t next_cmd_tid;
 	bool irq_inactive;
+	bool enqueue_blocked;
+	wait_queue_head_t enqueue_wait_queue;
 	u32 caps;
 	unsigned int quirks;
 	unsigned int DAT_entries;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
