Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7A6C02195
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Feb 2025 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QxpoVhqOoX+rKiTypAO8Ic8zn4OCtvMpr8rQYLgI48=; b=ZWL2k+mo3yapyG
	/fXPhbffYgEd/CrjQPe9H8IVF3j+9Wb9lcNjlKTHKFGEDIH1+2ssRWEIXVUdJEKQBwdyiwVmwk0g3
	poG+HApkUonpJRJGvCMu2oUDnoiwTRP2lJX8J80EaX4DHdBqJCaDOsL8+g4C9yzVs4kNjwuMWkR8T
	Df01vP2qhX4TG/igIW6lFNNevuoFmvY5SxcIphizomhyBm7wxFlbBJ1atmZgGEtnbhf/NEHchu4G3
	Hka1d9GGonrGd22osovfeRtbrRSBUhPQLS9zOjncjAjIbnnAW1Jo41VskGn7ThWFkDyBjLNNZ0c3t
	bOzd6Z4hBL8y8eAYRGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texu4-0000000FmTr-0Y1M;
	Mon, 03 Feb 2025 14:58:24 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texr7-0000000Flqp-1Olm
	for linux-i3c@lists.infradead.org;
	Mon, 03 Feb 2025 14:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738594521; x=1770130521;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cwzgOLB6nUlEjfbXRv2WUSyWyLEmV2Ql7jXr14bMdBg=;
  b=l7Zhnmxt4Ss/7rbnPw4nj3NXfHmoHYCtcApae1o+g4OoguQYvzJ6FNj9
   FBGB288GQweeqacUMGOadZ9MnZSj6o3wFS8tTvYDegk4wepTzPA6oWOP0
   ARLsYrqUjmpYGPC9toHxfNY6mOZc/rEVsYh8J/oD1CYsa1JFywhOcyRxO
   kzuv06tRyv9MHDAaoGSGh65v4Tmoixq2k61FBax4yb42curH08FCmn4wt
   L9+nBkeaz4j7EenCULomYLlph9+yVzB1TVAM7N+VQnjvoWWWm1TEhr5dU
   c0LnhTGRtbtaf3/3ywvZ2f1UwfLFByok7YWTw9MrMC6OYbOdILGPild2f
   w==;
X-CSE-ConnectionGUID: 4pkng33RQ66NsfBAS6UO/Q==
X-CSE-MsgGUID: 0i2xBzM4RnafBJ+to9yx0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26690750"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="26690750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:55:20 -0800
X-CSE-ConnectionGUID: DUNdnsttQjCzXjELif4H4g==
X-CSE-MsgGUID: ulR+gQpTTki6ab6OhIjLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147521037"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.153])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2025 06:55:19 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Subject: [PATCH] i3c: mipi-i3c-hci: Use physical device pointer with DMA API
Date: Mon,  3 Feb 2025 16:55:12 +0200
Message-ID: <20250203145513.141466-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_065521_383973_A6D84590 
X-CRM114-Status: GOOD (  16.64  )
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

DMA transfer faults on Intel hardware when the IOMMU is enabled and
driver initialization will fail when attempting to do the first transfer:

	DMAR: DRHD: handling fault status reg 2
	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry
	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62

Reason for this is that the IOMMU setup is done for the physical devices
only and not for the virtual I3C Controller device object.

Therefore use the pointer to a physical device object with the DMA API.

Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 45 ++++++++++++++++++---------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 491dfe70b660..57c044b5264b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -14,6 +14,7 @@
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/io.h>
+#include <linux/pci.h>
 
 #include "hci.h"
 #include "cmd.h"
@@ -138,6 +139,7 @@ struct hci_rh_data {
 };
 
 struct hci_rings_data {
+	struct device *sysdev;
 	unsigned int total;
 	struct hci_rh_data headers[] __counted_by(total);
 };
@@ -165,20 +167,20 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 		rh_reg_write(IBI_SETUP, 0);
 
 		if (rh->xfer)
-			dma_free_coherent(&hci->master.dev,
+			dma_free_coherent(rings->sysdev,
 					  rh->xfer_struct_sz * rh->xfer_entries,
 					  rh->xfer, rh->xfer_dma);
 		if (rh->resp)
-			dma_free_coherent(&hci->master.dev,
+			dma_free_coherent(rings->sysdev,
 					  rh->resp_struct_sz * rh->xfer_entries,
 					  rh->resp, rh->resp_dma);
 		kfree(rh->src_xfers);
 		if (rh->ibi_status)
-			dma_free_coherent(&hci->master.dev,
+			dma_free_coherent(rings->sysdev,
 					  rh->ibi_status_sz * rh->ibi_status_entries,
 					  rh->ibi_status, rh->ibi_status_dma);
 		if (rh->ibi_data_dma)
-			dma_unmap_single(&hci->master.dev, rh->ibi_data_dma,
+			dma_unmap_single(rings->sysdev, rh->ibi_data_dma,
 					 rh->ibi_chunk_sz * rh->ibi_chunks_total,
 					 DMA_FROM_DEVICE);
 		kfree(rh->ibi_data);
@@ -194,11 +196,23 @@ static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
 	struct hci_rh_data *rh;
+	struct device *sysdev;
 	u32 regval;
 	unsigned int i, nr_rings, xfers_sz, resps_sz;
 	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
 	int ret;
 
+	/*
+	 * Set pointer to a physical device that does DMA and has IOMMU setup
+	 * done for it in case of enabled IOMMU and use it with the DMA API.
+	 * Here such device is either
+	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
+	 * grandparent (PCI enumeration).
+	 */
+	sysdev = hci->master.dev.parent;
+	if (sysdev->parent && dev_is_pci(sysdev->parent))
+		sysdev = sysdev->parent;
+
 	regval = rhs_reg_read(CONTROL);
 	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
 	dev_info(&hci->master.dev, "%d DMA rings available\n", nr_rings);
@@ -213,6 +227,7 @@ static int hci_dma_init(struct i3c_hci *hci)
 		return -ENOMEM;
 	hci->io_data = rings;
 	rings->total = nr_rings;
+	rings->sysdev = sysdev;
 
 	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
 	rhs_reg_write(CONTROL, regval);
@@ -239,9 +254,9 @@ static int hci_dma_init(struct i3c_hci *hci)
 		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
 		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
 
-		rh->xfer = dma_alloc_coherent(&hci->master.dev, xfers_sz,
+		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
 					      &rh->xfer_dma, GFP_KERNEL);
-		rh->resp = dma_alloc_coherent(&hci->master.dev, resps_sz,
+		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
 					      &rh->resp_dma, GFP_KERNEL);
 		rh->src_xfers =
 			kmalloc_array(rh->xfer_entries, sizeof(*rh->src_xfers),
@@ -295,16 +310,16 @@ static int hci_dma_init(struct i3c_hci *hci)
 		ibi_data_ring_sz = rh->ibi_chunk_sz * rh->ibi_chunks_total;
 
 		rh->ibi_status =
-			dma_alloc_coherent(&hci->master.dev, ibi_status_ring_sz,
+			dma_alloc_coherent(rings->sysdev, ibi_status_ring_sz,
 					   &rh->ibi_status_dma, GFP_KERNEL);
 		rh->ibi_data = kmalloc(ibi_data_ring_sz, GFP_KERNEL);
 		ret = -ENOMEM;
 		if (!rh->ibi_status || !rh->ibi_data)
 			goto err_out;
 		rh->ibi_data_dma =
-			dma_map_single(&hci->master.dev, rh->ibi_data,
+			dma_map_single(rings->sysdev, rh->ibi_data,
 				       ibi_data_ring_sz, DMA_FROM_DEVICE);
-		if (dma_mapping_error(&hci->master.dev, rh->ibi_data_dma)) {
+		if (dma_mapping_error(rings->sysdev, rh->ibi_data_dma)) {
 			rh->ibi_data_dma = 0;
 			ret = -ENOMEM;
 			goto err_out;
@@ -342,6 +357,7 @@ static int hci_dma_init(struct i3c_hci *hci)
 static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 			       struct hci_xfer *xfer_list, unsigned int n)
 {
+	struct hci_rings_data *rings = hci->io_data;
 	struct hci_xfer *xfer;
 	unsigned int i;
 
@@ -349,7 +365,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 		xfer = xfer_list + i;
 		if (!xfer->data)
 			continue;
-		dma_unmap_single(&hci->master.dev,
+		dma_unmap_single(rings->sysdev,
 				 xfer->data_dma, xfer->data_len,
 				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
 	}
@@ -393,13 +409,13 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 		if (xfer->data) {
 			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
 			xfer->data_dma =
-				dma_map_single(&hci->master.dev,
+				dma_map_single(rings->sysdev,
 					       buf,
 					       xfer->data_len,
 					       xfer->rnw ?
 						  DMA_FROM_DEVICE :
 						  DMA_TO_DEVICE);
-			if (dma_mapping_error(&hci->master.dev,
+			if (dma_mapping_error(rings->sysdev,
 					      xfer->data_dma)) {
 				hci_dma_unmap_xfer(hci, xfer_list, i);
 				return -ENOMEM;
@@ -586,6 +602,7 @@ static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
 
 static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 {
+	struct hci_rings_data *rings = hci->io_data;
 	struct i3c_dev_desc *dev;
 	struct i3c_hci_dev_data *dev_data;
 	struct hci_dma_dev_ibi_data *dev_ibi;
@@ -696,7 +713,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 			* rh->ibi_chunk_sz;
 	if (first_part > ibi_size)
 		first_part = ibi_size;
-	dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
+	dma_sync_single_for_cpu(rings->sysdev, ring_ibi_data_dma,
 				first_part, DMA_FROM_DEVICE);
 	memcpy(slot->data, ring_ibi_data, first_part);
 
@@ -705,7 +722,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 		/* we wrap back to the start and copy remaining data */
 		ring_ibi_data = rh->ibi_data;
 		ring_ibi_data_dma = rh->ibi_data_dma;
-		dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
+		dma_sync_single_for_cpu(rings->sysdev, ring_ibi_data_dma,
 					ibi_size - first_part, DMA_FROM_DEVICE);
 		memcpy(slot->data + first_part, ring_ibi_data,
 		       ibi_size - first_part);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
