Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FD1CA0EED
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Aug 2025 21:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+40cIqJR//X7XeSFIqbw0UmvsJK2BYEVcW7GzGoKD8=; b=mwAfGsNBfU6gXs
	WjcB4zGzui4COPDXA2phrxZTcKaXDVsB/d2Ozp7SJuLEvG1KT1nGtn+19Cfnmr7jngn0yQLzLE5qO
	82h3SXMikPhhNqaEfOPuyO26bTwa4qpwdyo0mRzWl0mfd6ey7dmqNXI5r5CDSo82c8byMwdRpWXtt
	d65dbA5Di5ncmtBdGANIqoxWu44zsm2tmz7E/2Z9sXI78D11XlcjjWMJTaU6EEu5Dn369ymph8Q/e
	ZnCRupqh55m1KRTURZHWkMknKlqymB2gbCBOseJ3UTbQaBEjJwxRtfWUURD/DWSGviOoexVhh5odK
	oMBU19BOXphkNieRKl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZcR-00000003Yn4-2XQI;
	Fri, 22 Aug 2025 21:48:19 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPRr-00000002FxJ-2zmr
	for linux-i3c@lists.infradead.org;
	Fri, 22 Aug 2025 10:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755860203; x=1787396203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5o7y82sgmTWMQK169yHshBu9q9H1uOFQfUEYABFmo9c=;
  b=SeRkRTeTu9+jTyKjNalNW4izs4iLQsQhQ6rmTRRL6ysxh7wqnKA8L3Nn
   nvL2z01VeflkOoYe2ht8Z9zet4ctGm0gekYYPVC4+GdpBQizZHYNjBCyi
   D9aTu/RGDqd3ybLjErAgpbvNEuVA+JJX1CH4UQ9MFR0kaR8ov5cS9/AKS
   3/iAFvctmqi4lPofEG8EsGWhgqFnQULn75YvdBO2I91n62GKPUoPmdY+P
   lBU0NANw90q2vvzaKTkfobDOdUATwsxZA/dYuSlYvpKggBecYGYJjFpof
   4KIeGr9VXcBkZxLp+ROy36XBFNMzHOD23u2FqGGNqcOdmaNfTEQ5uZNBB
   Q==;
X-CSE-ConnectionGUID: goTVOenbReKTfsyj7cU0yA==
X-CSE-MsgGUID: Xkoyt1nITL+ZWj8hRkdWnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83581120"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="83581120"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 03:56:36 -0700
X-CSE-ConnectionGUID: Dob+Y3ysTxKGatvURAqU8g==
X-CSE-MsgGUID: 4liRhJhQTt2ClspgX0y52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169079962"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2025 03:56:35 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v4 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA mapping and bounce buffering
Date: Fri, 22 Aug 2025 13:56:28 +0300
Message-ID: <20250822105630.2820009-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
References: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_035643_769773_AA88EEE5 
X-CRM114-Status: GOOD (  16.78  )
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

So far only I3C private and I2C transfers have required a bounce buffer
for DMA transfers when buffer is not DMA'able.

It was observed that when the device DMA is IOMMU mapped and the receive
length is not a multiple of DWORDs (32-bit), the last DWORD is padded
with stale data from the RX FIFO, corrupting 1-3 bytes beyond the
expected data.

A similar issue, though less severe, occurs when an I3C target returns
less data than requested. In this case, the padding does not exceed the
requested number of bytes, assuming the device DMA is not IOMMU mapped.

Therefore, all I3C private transfer, CCC command payload and I2C
transfer receive buffers must be properly sized for the DMA being IOMMU
mapped. Even if those buffers are already DMA safe, their size may not
be DWORD aligned.

To prepare for the device DMA being IOMMU mapped and to address the
above issue, use helpers from I3C core for DMA mapping and bounce
buffering for all DMA transfers.

For now, require bounce buffer only when the buffer is in the
vmalloc() area to avoid unnecessary copying with CCC commands and
DMA-safe I2C transfers.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 34 --------------------------
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++-----------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +--
 3 files changed, 12 insertions(+), 52 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 60f1175f1f37..b2977b6ac9f7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
 	return hci->cmd->perform_daa(hci);
 }
 
-static int i3c_hci_alloc_safe_xfer_buf(struct i3c_hci *hci,
-				       struct hci_xfer *xfer)
-{
-	if (hci->io != &mipi_i3c_hci_dma ||
-	    xfer->data == NULL || !is_vmalloc_addr(xfer->data))
-		return 0;
-
-	if (xfer->rnw)
-		xfer->bounce_buf = kzalloc(xfer->data_len, GFP_KERNEL);
-	else
-		xfer->bounce_buf = kmemdup(xfer->data,
-					   xfer->data_len, GFP_KERNEL);
-
-	return xfer->bounce_buf == NULL ? -ENOMEM : 0;
-}
-
-static void i3c_hci_free_safe_xfer_buf(struct i3c_hci *hci,
-				       struct hci_xfer *xfer)
-{
-	if (hci->io != &mipi_i3c_hci_dma || xfer->bounce_buf == NULL)
-		return;
-
-	if (xfer->rnw)
-		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
-
-	kfree(xfer->bounce_buf);
-}
-
 static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 			      struct i3c_priv_xfer *i3c_xfers,
 			      int nxfers)
@@ -333,9 +305,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 		}
 		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
 		xfer[i].cmd_desc[0] |= CMD_0_ROC;
-		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
-		if (ret)
-			goto out;
 	}
 	last = i - 1;
 	xfer[last].cmd_desc[0] |= CMD_0_TOC;
@@ -359,9 +328,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 	}
 
 out:
-	for (i = 0; i < nxfers; i++)
-		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
-
 	hci_free_xfer(xfer, nxfers);
 	return ret;
 }
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 491dfe70b660..351851859f02 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -349,9 +349,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 		xfer = xfer_list + i;
 		if (!xfer->data)
 			continue;
-		dma_unmap_single(&hci->master.dev,
-				 xfer->data_dma, xfer->data_len,
-				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+		i3c_master_dma_unmap_single(xfer->dma);
 	}
 }
 
@@ -362,7 +360,6 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	struct hci_rh_data *rh;
 	unsigned int i, ring, enqueue_ptr;
 	u32 op1_val, op2_val;
-	void *buf;
 
 	/* For now we only use ring 0 */
 	ring = 0;
@@ -373,6 +370,8 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	for (i = 0; i < n; i++) {
 		struct hci_xfer *xfer = xfer_list + i;
 		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
+		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
+							  DMA_TO_DEVICE;
 
 		/* store cmd descriptor */
 		*ring_data++ = xfer->cmd_desc[0];
@@ -391,21 +390,17 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 
 		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
 		if (xfer->data) {
-			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
-			xfer->data_dma =
-				dma_map_single(&hci->master.dev,
-					       buf,
-					       xfer->data_len,
-					       xfer->rnw ?
-						  DMA_FROM_DEVICE :
-						  DMA_TO_DEVICE);
-			if (dma_mapping_error(&hci->master.dev,
-					      xfer->data_dma)) {
+			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
+							      xfer->data,
+							      xfer->data_len,
+							      false,
+							      dir);
+			if (!xfer->dma) {
 				hci_dma_unmap_xfer(hci, xfer_list, i);
 				return -ENOMEM;
 			}
-			*ring_data++ = lower_32_bits(xfer->data_dma);
-			*ring_data++ = upper_32_bits(xfer->data_dma);
+			*ring_data++ = lower_32_bits(xfer->dma->addr);
+			*ring_data++ = upper_32_bits(xfer->dma->addr);
 		} else {
 			*ring_data++ = 0;
 			*ring_data++ = 0;
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 69ea1d10414b..33bc4906df1f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -94,8 +94,7 @@ struct hci_xfer {
 		};
 		struct {
 			/* DMA specific */
-			dma_addr_t data_dma;
-			void *bounce_buf;
+			struct i3c_dma *dma;
 			int ring_number;
 			int ring_entry;
 		};
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
