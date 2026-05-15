Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F0CD4F47
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Bt1EPS6G9oaAJXqYs6CkwuNMU77Rf8oN+WguAxNxuQ=; b=QUaQH+0yNwn0IO
	v7iPkGmQR5rLd+SDAd1TJE7Qhkf6QhIRk9HIzszgr+8VU5WRybuGidJm6sw3Pb7iaLHpFIsxG/mYG
	6IoABmk0E4qqrIz68fR6HlrXkEGBElz9+4IlLW68KRSk4X6VVmfuw9MoV0wJ59k+RZ0jBuLanUv+j
	kTSUBW1SWG0e8sxEpnt4zXMG3EAxgO+ORMc0e0u0+i7ZFrL0umviCoAXpjgusVAlVsrq7AzgIYBxv
	UU3+xeETbAv0KJ2Vef6XBzxUsWm+8M1N/WA9PrMCG54Lr/cPDOXm1X3NJplBzNCC8fdkYG5qCWhva
	NiSCqAHMgORzpSowophQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN5-00000008rLR-3QXf;
	Fri, 15 May 2026 16:26:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN2-00000008rJT-3XQ8
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862401; x=1810398401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p14xCUTELcWuRMCXox69iS/zsIC4SjMMl8Z1ckiUQeQ=;
  b=O0bKd/wJtX6oHIXfy3O+rFQnZ6FnN4vOC6YPR15g9XSWRv4ZYb+XeMnl
   B2ypL/SxAPx/4Wrc2MaMwwainUvfdMnbdngJDQ/u/lCpnTRDaTKE9z6U9
   Zw66AybNd9S27HxpfoKCsusDiix0bPG9rEQRwKEjxTpD9RsDjjlAg9045
   uPkRKhmUCIeKITZGm+f5qAvCh0Yhu8hnp97vbXZLk+mNNokQnCu7nLnb/
   2QR0aONx7+kYzQOlY2K6rwkKOvVBJLeLAAIVBpVQwbEeBnwv59x3Xx0q1
   UrZK6THBr84Wq1rNhbw9UjKIIg59EnS7P3IovqiCnsGzIS0KRUOnqE+EV
   A==;
X-CSE-ConnectionGUID: NOfZY8KnQpmSb5oqUAnAhg==
X-CSE-MsgGUID: qATMD7OSSY6fyRSyLPs2cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785232"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:40 -0700
X-CSE-ConnectionGUID: Ezo+T/V3T9SkpwJQY3JicQ==
X-CSE-MsgGUID: FfdLkxCrQrmSmr3gqoKZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857148"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:38 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 03/17] i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
Date: Fri, 15 May 2026 19:26:07 +0300
Message-ID: <20260515162621.57719-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092640_929035_3AA3F90A 
X-CRM114-Status: GOOD (  17.00  )
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

Note, there is only 1 ring bundle configured, and a transfer error causes
the controller to halt ring (bundle) operation, so there is only ever 1
outstanding error at a time.  Furthermore, a later patch ensures that only
the currently active transfer list can time out.  Consequently, the DMA
queue will not be unblocked while there are outstanding transfer errors or
timeouts.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	None

Changes in V2:

	Improve commit message


 drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 25 +++++++++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index afb0764b5e1f..44617eb3a3f1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -973,6 +973,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
 
 	spin_lock_init(&hci->lock);
 	mutex_init(&hci->control_mutex);
+	init_waitqueue_head(&hci->enqueue_wait_queue);
 
 	/*
 	 * Multi-bus instances share the same MMIO address range, but not
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index bdffdd8b8923..c3da6eab8eae 100644
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
