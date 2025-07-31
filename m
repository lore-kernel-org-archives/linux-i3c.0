Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF24C87FCA
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Jul 2025 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwjpKGWr2EWfN96qmoMGLqFKh5ZATeR5YB5V7QXnNno=; b=U44VZcfqXsJ/2U
	bZYocf8ZQ2raHKNOCP4cdo13NXBYg5r0v7hdArmtfYwSUrvBowM6Jmz6+fw6En/kGA8fvqwnbrzh5
	XGiCKz/fBX/GtkWKYUpcZWSDZJ3l3YQNFQrHk3uAYnOYx/Ey6DPhocLGyAfj2YIlU33Ho6lWIaW9f
	r8po5lQIiQ7NjXHp6vUItSwSo8Wnwax7TqtwugY0vyJtmOD/qIF68HbFrIbCJIUBa6gsrOd8rMJlN
	vYrgISqlTwQzAtYZBaQsqNTDYnGYcGrHDIxKhIBzUY2AmK9XTuaQfGdCOJRQHcTl+CgVYW43dqKLe
	DpSA+YIv4ITAbPeWKqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUgI-00000003tVK-2kF0;
	Thu, 31 Jul 2025 14:54:54 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU3A-00000003nfk-1YWQ
	for linux-i3c@lists.infradead.org;
	Thu, 31 Jul 2025 14:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753971268; x=1785507268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xBeT0oXGGQF8q3smSscyBbxm7zRkpz+viKTSyDlwq0s=;
  b=huIEgT3X/rEFOVw2jf75UEfe597wMTzP7mi6ZH7OmAnBS8SZJ7vJKZxz
   kTMeHfGOePJoWSXSRQ53FpoOPqGqrSppxgQKS6IhXopZg2f2TIxTkrQ8Z
   WdJGWpJUHiDl3L4horHNrv5Ld8liqhgzms8ruf+xsBpgcL8X1gyVqC4wz
   YgOqff/ussy05lSiUMTirRxErRnz+2z3U17cJlkVgPs1VOYIYtJzsazwo
   XF8q6fJgISLwkxsScz7fDqtkP7Esdh5FWm38lslsLj/Ap0hm1878KemH1
   Z3vrArEfdPyjrHW807fgHMSn2ZAmbn0g0Pz+mRS3pF6LjqmUMC2iJiD+P
   Q==;
X-CSE-ConnectionGUID: Slova6QAQUykBmU3tWg0BA==
X-CSE-MsgGUID: ZQLuFUoQSDCmanoVsnp6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66990763"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="66990763"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 07:14:28 -0700
X-CSE-ConnectionGUID: zx0EWY+STCmqWT/zPK+JpA==
X-CSE-MsgGUID: S7S4ZAQ8TiSymgqA5Dvy/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="167451869"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2025 07:14:26 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA mapping and bounce buffering
Date: Thu, 31 Jul 2025 17:14:18 +0300
Message-ID: <20250731141420.422525-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_071428_422127_D5DA0CCB 
X-CRM114-Status: GOOD (  17.75  )
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
length is not a multiple of DWORDs, the last DWORD is padded with stale
data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.

A similar issue, though less severe, occurs when an I3C target returns
less data than requested. In this case, the padding does not exceed the
requested number of bytes, assuming the device DMA is not IOMMU mapped.

Therefore, all I3C private transfer, CCC command payload and I2C
transfer receive buffers must be properly sized for the DMA being IOMMU
mapped. Even if those buffers are already DMA safe, their size may not
be, and I don't have a clear idea how to guarantee this other than
using a bounce buffer.

To prepare for the device DMA being IOMMU mapped and to address the
above issue, use helpers from I3C core for DMA mapping/unmapping and
bounce buffering for all DMA transfers.

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
index 491dfe70b660..669d026646b4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -349,9 +349,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 		xfer = xfer_list + i;
 		if (!xfer->data)
 			continue;
-		dma_unmap_single(&hci->master.dev,
-				 xfer->data_dma, xfer->data_len,
-				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+		i3c_master_dma_unmap_single(&hci->master.dev, xfer->dma);
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
