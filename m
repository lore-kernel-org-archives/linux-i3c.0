Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB13F01804
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvdbp37425IEfXZ1cXPEnxcRASmMBBfjbz6PfOv7X80=; b=ESQgyf1PMZqAS8
	E7ZFo9iJUQjtwpkaZbNO69Wkt5bxDZuQaqNvALtLu45LCEtVADUslsylbGHofkrhChZH38g7/MIaN
	qdoonfHolqc2MzIIuK9I3PGs9bJHGA984ywDyHb+4813G6/u0rW6ugQou2Yjyvtpa0WldWN8HbrhU
	nJZVBfkXKU7UPOFJdf1krnDxRvzF5WQVqEPgz2NK5lvxtWHYpjSAi603XUIcBE0yTeeoNTLb0N8/K
	WSdit/s9WL9LycK1ed5E8KnpRviOrasjZjaeb0GlOsKSBVAsVFYg6nQ/+bo02jFSgF0qo8lBYRWi3
	NV8XsQvy2dUycPNrILHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYj-000000039AM-1XQ7;
	Fri, 06 Mar 2026 07:25:17 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYg-0000000395H-45zi
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781915; x=1804317915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ygd82bK1KmpZAhcFis/1tuFnLbmVLYzVgeGiiyJU3Uc=;
  b=VWdQkBwyQ/Ots+0AMbXoINMD6ZPVUUgXB8Rr/pkD/e6oIjg2opmgrjGe
   yylAXIWtTSaqcHS4mYQkL/+sAHVd6dSifWl6qg4lCLhi4RsWywxWKEmtG
   h/lwX7NwN9MqrkUmH6kbDcFRZgj4LiPcs5CZS8AqyT1t9K3Rgcn6dYAVD
   7ZImwrrSMxIXUOxsGH1Q/lke3KDeFa5FQ5TmV7M+M5IW61JCRJY6azqWF
   czRVMMe+msFNRKff/oR2k/LPEf2k9mIRNL6q5p8Q7M5OBZLz8XFXf7PJ0
   GSc/mLlprd356ZJgZg5RzPBR1eWHH0zMkIu0DKvxuSeXB1yqpO0VsyAZ/
   Q==;
X-CSE-ConnectionGUID: P5ywMFl5QWSSLJtmol9bzQ==
X-CSE-MsgGUID: hcMBro88Q/KJBpKPsJl3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461339"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:15 -0800
X-CSE-ConnectionGUID: jihYj41OTR+TBSIBdSzcJA==
X-CSE-MsgGUID: wAaVXk7BR0inYxm94ub+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419928"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:13 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 07/14] i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and interrupt handler
Date: Fri,  6 Mar 2026 09:24:44 +0200
Message-ID: <20260306072451.11131-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232515_030909_35D3E64F 
X-CRM114-Status: GOOD (  16.80  )
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

The DMA ring bookkeeping in the MIPI I3C HCI driver is updated from two
contexts: the DMA ring dequeue path (hci_dma_dequeue_xfer()) and the
interrupt handler (hci_dma_xfer_done()).  Both modify the ring's
in-flight transfer state - specifically rh->src_xfers[] and
xfer->ring_entry - but without any serialization.  This allows the two
paths to race, potentially leading to inconsistent ring state.

Serialize access to the shared ring state by extending the existing
spinlock to cover the DMA dequeue path and the entire interrupt handler.
Since the core IRQ handler now holds this lock, remove the per-function
locking from the PIO and DMA sub-handlers.

Additionally, clear the completed entry in rh->src_xfers[] in
hci_dma_xfer_done() so it cannot be matched or completed again.

Finally, place the ring restart sequence under the same lock in
hci_dma_dequeue_xfer() to avoid concurrent enqueue or completion
operations while the ring state is being modified.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Now uses unified spinlock (as per earlier patch "i3c: mipi-i3c-hci:
	Consolidate spinlocks") and extends coverage to the entire interrupt
	handler


 drivers/i3c/master/mipi-i3c-hci/core.c |  2 ++
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 11 +++++------
 drivers/i3c/master/mipi-i3c-hci/pio.c  |  6 +-----
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 061e84a5c412..adf35b7fa498 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -567,6 +567,8 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	irqreturn_t result = IRQ_NONE;
 	u32 val;
 
+	guard(spinlock)(&hci->lock);
+
 	/*
 	 * The IRQ can be shared, so the handler may be called when the IRQ is
 	 * due to a different device. That could happen when runtime suspended,
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index f7d411e5e11f..d7840ff69e59 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -560,6 +560,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		WARN_ON(1);
 	}
 
+	spin_lock_irq(&hci->lock);
+
 	for (i = 0; i < n; i++) {
 		struct hci_xfer *xfer = xfer_list + i;
 		int idx = xfer->ring_entry;
@@ -593,6 +595,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	/* restart the ring */
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
 
+	spin_unlock_irq(&hci->lock);
+
 	return did_unqueue;
 }
 
@@ -618,6 +622,7 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 			dev_dbg(&hci->master.dev, "orphaned ring entry");
 		} else {
 			hci_dma_unmap_xfer(hci, xfer, 1);
+			rh->src_xfers[done_ptr] = NULL;
 			xfer->ring_entry = -1;
 			xfer->response = resp;
 			if (tid != xfer->cmd_tid) {
@@ -635,14 +640,11 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 		done_cnt += 1;
 	}
 
-	/* take care to update the software dequeue pointer atomically */
-	spin_lock(&hci->lock);
 	rh->xfer_space += done_cnt;
 	op1_val = rh_reg_read(RING_OPERATION1);
 	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
 	rh_reg_write(RING_OPERATION1, op1_val);
-	spin_unlock(&hci->lock);
 }
 
 static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
@@ -822,13 +824,10 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 	i3c_master_queue_ibi(dev, slot);
 
 done:
-	/* take care to update the ibi dequeue pointer atomically */
-	spin_lock(&hci->lock);
 	op1_val = rh_reg_read(RING_OPERATION1);
 	op1_val &= ~RING_OP1_IBI_DEQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
 	rh_reg_write(RING_OPERATION1, op1_val);
-	spin_unlock(&hci->lock);
 
 	/* update the chunk pointer */
 	rh->ibi_chunk_ptr += ibi_chunks;
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 02866c2237fa..8f48a81e65ab 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -1014,15 +1014,12 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
 	struct hci_pio_data *pio = hci->io_data;
 	u32 status;
 
-	spin_lock(&hci->lock);
 	status = pio_reg_read(INTR_STATUS);
 	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
 		status, pio->enabled_irqs);
 	status &= pio->enabled_irqs | STAT_LATENCY_WARNINGS;
-	if (!status) {
-		spin_unlock(&hci->lock);
+	if (!status)
 		return false;
-	}
 
 	if (status & STAT_IBI_STATUS_THLD)
 		hci_pio_process_ibi(hci, pio);
@@ -1056,7 +1053,6 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
 	pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
 	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
 		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
-	spin_unlock(&hci->lock);
 	return true;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
