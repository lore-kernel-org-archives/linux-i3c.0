Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF41FF885A
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYirpOqjTS4N8u1zTJ5/OcTcac9W1OGcnxc/y56Y9XI=; b=EZuw2SK49en5nR
	HZsdwW/NrrF1NsA0xolQIhS0f8FrFI2MFGs+/iASHbc6XN5Ktp/V6txKPu0v7Qr05/YpeEjdj84bo
	7xnmzgGwJfIkB1zU3d+af71FTvltjhPASPvQ4Kd8McArjfNqF9uC+Wn9TiS2LpDT+U9A0js+QkQD9
	nu3TIxzLia8SZ0lw0I2QmITXQWynSBadENbEPYGUZ1kTGyCGdYH+MSwcAgfOwMvtPoW3GxAkX1R+2
	gg4ub5Efp5mwAN4KRgTp+2uPiQ9yhfAWjM+5/y1PO2Eq31O4W7UE/7inb373eRFTrFxqJNQZyz3se
	EuTl5NCY6KH2bzUAybhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYx-0000000D3JL-2MV0;
	Mon, 04 May 2026 11:34:11 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYu-0000000D3HH-41ia
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894449; x=1809430449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Whce9V9RaI6dgCU5/FM6GNfIrFeQa/gRLMY4ctqLAnU=;
  b=kDi8AV2iQ50/3xxz6MZCdmPcVTQpLttNLnnVYbNIm7qOzVT57rNXdHOt
   kG6DU6iFIBX0cIrz19GjDiBpb9LGY8QOsIBdlgSm7UZTeQzSdHzoIJrYA
   xD7FUaaRf8KTW3Wl0w2rrkvYF2jhBmxZ/1cn59Si+m4QaCwtE8IxRMuuX
   0dnPzQsi0pQcl+5DTZQx4hBWWZEo7ay3zgnrv/+5pQ9plMWFmm8Wf6gN4
   I9txvdIrPx0QnXYN73lwEtWCsq6bnLBRp7RzXfyVKm+hi/Ce+fZVx8g/D
   NhiKVb4Kl7In7aCi9ckx1jIos943xuQBjxhMev+vdgrhU99Sqo0x+Ezg9
   w==;
X-CSE-ConnectionGUID: 8hxaHkZURJKh8WtNoMd24g==
X-CSE-MsgGUID: Ztcp7dzEQFqsnHtjcK//pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315151"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315151"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:09 -0700
X-CSE-ConnectionGUID: hX45CL3DQRakdC0bjKpBRw==
X-CSE-MsgGUID: 3STxsx5vQ1Kov0bs7Efkqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478203"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:07 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 03/16] i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
Date: Mon,  4 May 2026 14:33:39 +0300
Message-ID: <20260504113352.38490-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043409_012554_67A43E5F 
X-CRM114-Status: GOOD (  17.52  )
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
---


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
