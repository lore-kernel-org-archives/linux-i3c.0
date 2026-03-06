Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB868F01801
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DF1GHxlHjirw/LrOvU9xhQLnZVgT5rUZ2TxiPl5x7+k=; b=W8SoYgG1Ez0vKy
	Z50T/wP1fuczTnewRM9xkgdm/jUMvcUHBfTUxKRZzLiKjHKN6elCXd0h7XLQib/2cMJZGYjpxASmg
	iU5X2Niv5ahU88m2L65IlMJgqIjQ83696SiaePFgWV4h6XhBTJQTNLFXCBggVd2H6LgrRRCGeA9aS
	4/bTIAhSl6b56g6P1DKYmZDzk6ukmasuGMD+jbLUeLKgIQ9RQKfjTyJo4bX+0N9jZpCf3LA6lV2qU
	hcmL0z9DAM3+Cdp67zWGIOlQiP++nJCwBA7FyBO9cDJornEQQPwXCvtQP/cP9p6dyQq5jSnYwlmOd
	UqqCVyZtjubRfCMZz6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYf-0000000397G-1VmR;
	Fri, 06 Mar 2026 07:25:13 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYb-0000000395H-3aNW
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781910; x=1804317910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6xNovjcmbDuwlQl1OvsMBHWPsq2gdktuYyM8lNtPack=;
  b=FDSSswnwKJRq7MRi9llTl9yfOIjP1EY6Vxh90wtrsG4WTd2HlmsT4JaY
   76zLwt8PztTPzKNHORvebx3NjD97mhRKal/CmE+hZlBVKyIKXsa+tBtEB
   1eAGWpJZUOUjFqrOzc2o9dlkJFWqhWWvGmP3smTQmpvQPEKqBRBEbKzxR
   3sExFqr53l7VpnpvE4G37Ked9X7vzumv2npWBoezJ4XcW7My3aVbVGHqM
   WEw1u3SrMI/pXBrDGnR6iF/qBOOUkd78+YlifLAK1YxQMQZToexi8lRBl
   8mmTSqPsG6s7ZONKaNSyiv+q1kBZxgynjSlyxb1OiCNacZGHQm9bvLoKh
   g==;
X-CSE-ConnectionGUID: o8zBjhjNR0mc+oTwVe5zIQ==
X-CSE-MsgGUID: WdI1SNvDRnOmyBmRgpl7AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461324"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:10 -0800
X-CSE-ConnectionGUID: nO2PWQVsTqGPhjE/GeFIfw==
X-CSE-MsgGUID: G3BZ2FMNS8yz7vINcw3sYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419899"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:08 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 04/14] i3c: mipi-i3c-hci: Consolidate spinlocks
Date: Fri,  6 Mar 2026 09:24:41 +0200
Message-ID: <20260306072451.11131-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232509_924438_2E6B6628 
X-CRM114-Status: GOOD (  13.70  )
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

The MIPI I3C HCI driver currently uses separate spinlocks for different
contexts (PIO vs. DMA rings).  This split is unnecessary and complicates
upcoming fixes.  The driver does not support concurrent PIO and DMA
operation, and it only supports a single DMA ring, so a single lock is
sufficient for all paths.

Introduce a unified spinlock in struct i3c_hci, switch both PIO and DMA
code to use it, and remove the per-context locks.

No functional change is intended in this patch.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c |  2 ++
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 14 ++++++--------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 drivers/i3c/master/mipi-i3c-hci/pio.c  | 16 +++++++---------
 4 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 4877a321edf9..faf5eae2409f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -926,6 +926,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (!hci)
 		return -ENOMEM;
 
+	spin_lock_init(&hci->lock);
+
 	/*
 	 * Multi-bus instances share the same MMIO address range, but not
 	 * necessarily in separate contiguous sub-ranges. To avoid overlapping
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index ba451f026386..2442cedd5c2a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -131,7 +131,6 @@ struct hci_rh_data {
 	unsigned int xfer_struct_sz, resp_struct_sz, ibi_status_sz, ibi_chunk_sz;
 	unsigned int done_ptr, ibi_chunk_ptr;
 	struct hci_xfer **src_xfers;
-	spinlock_t lock;
 	struct completion op_done;
 };
 
@@ -344,7 +343,6 @@ static int hci_dma_init(struct i3c_hci *hci)
 			goto err_out;
 		rh = &rings->headers[i];
 		rh->regs = hci->base_regs + offset;
-		spin_lock_init(&rh->lock);
 		init_completion(&rh->op_done);
 
 		rh->xfer_entries = XFER_RING_ENTRIES;
@@ -534,12 +532,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	}
 
 	/* take care to update the hardware enqueue pointer atomically */
-	spin_lock_irq(&rh->lock);
+	spin_lock_irq(&hci->lock);
 	op1_val = rh_reg_read(RING_OPERATION1);
 	op1_val &= ~RING_OP1_CR_ENQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_CR_ENQ_PTR, enqueue_ptr);
 	rh_reg_write(RING_OPERATION1, op1_val);
-	spin_unlock_irq(&rh->lock);
+	spin_unlock_irq(&hci->lock);
 
 	return 0;
 }
@@ -637,12 +635,12 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	}
 
 	/* take care to update the software dequeue pointer atomically */
-	spin_lock(&rh->lock);
+	spin_lock(&hci->lock);
 	op1_val = rh_reg_read(RING_OPERATION1);
 	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
 	rh_reg_write(RING_OPERATION1, op1_val);
-	spin_unlock(&rh->lock);
+	spin_unlock(&hci->lock);
 }
 
 static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
@@ -823,12 +821,12 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 
 done:
 	/* take care to update the ibi dequeue pointer atomically */
-	spin_lock(&rh->lock);
+	spin_lock(&hci->lock);
 	op1_val = rh_reg_read(RING_OPERATION1);
 	op1_val &= ~RING_OP1_IBI_DEQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
 	rh_reg_write(RING_OPERATION1, op1_val);
-	spin_unlock(&rh->lock);
+	spin_unlock(&hci->lock);
 
 	/* update the chunk pointer */
 	rh->ibi_chunk_ptr += ibi_chunks;
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 337b7ab1cb06..f1dd502c071f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -50,6 +50,7 @@ struct i3c_hci {
 	const struct hci_io_ops *io;
 	void *io_data;
 	const struct hci_cmd_ops *cmd;
+	spinlock_t lock;
 	atomic_t next_cmd_tid;
 	bool irq_inactive;
 	u32 caps;
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index f8825ac81408..02866c2237fa 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -123,7 +123,6 @@ struct hci_pio_ibi_data {
 };
 
 struct hci_pio_data {
-	spinlock_t lock;
 	struct hci_xfer *curr_xfer, *xfer_queue;
 	struct hci_xfer *curr_rx, *rx_queue;
 	struct hci_xfer *curr_tx, *tx_queue;
@@ -212,7 +211,6 @@ static int hci_pio_init(struct i3c_hci *hci)
 		return -ENOMEM;
 
 	hci->io_data = pio;
-	spin_lock_init(&pio->lock);
 
 	__hci_pio_init(hci, &size_val);
 
@@ -631,7 +629,7 @@ static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
 		xfer[i].data_left = xfer[i].data_len;
 	}
 
-	spin_lock_irq(&pio->lock);
+	spin_lock_irq(&hci->lock);
 	prev_queue_tail = pio->xfer_queue;
 	pio->xfer_queue = &xfer[n - 1];
 	if (pio->curr_xfer) {
@@ -645,7 +643,7 @@ static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
 			pio_reg_read(INTR_STATUS),
 			pio_reg_read(INTR_SIGNAL_ENABLE));
 	}
-	spin_unlock_irq(&pio->lock);
+	spin_unlock_irq(&hci->lock);
 	return 0;
 }
 
@@ -716,14 +714,14 @@ static bool hci_pio_dequeue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int
 	struct hci_pio_data *pio = hci->io_data;
 	int ret;
 
-	spin_lock_irq(&pio->lock);
+	spin_lock_irq(&hci->lock);
 	dev_dbg(&hci->master.dev, "n=%d status=%#x/%#x", n,
 		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
 	dev_dbg(&hci->master.dev, "main_status = %#x/%#x",
 		readl(hci->base_regs + 0x20), readl(hci->base_regs + 0x28));
 
 	ret = hci_pio_dequeue_xfer_common(hci, pio, xfer, n);
-	spin_unlock_irq(&pio->lock);
+	spin_unlock_irq(&hci->lock);
 	return ret;
 }
 
@@ -1016,13 +1014,13 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
 	struct hci_pio_data *pio = hci->io_data;
 	u32 status;
 
-	spin_lock(&pio->lock);
+	spin_lock(&hci->lock);
 	status = pio_reg_read(INTR_STATUS);
 	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
 		status, pio->enabled_irqs);
 	status &= pio->enabled_irqs | STAT_LATENCY_WARNINGS;
 	if (!status) {
-		spin_unlock(&pio->lock);
+		spin_unlock(&hci->lock);
 		return false;
 	}
 
@@ -1058,7 +1056,7 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
 	pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
 	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
 		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
-	spin_unlock(&pio->lock);
+	spin_unlock(&hci->lock);
 	return true;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
