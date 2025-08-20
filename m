Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD28DCA0EFE
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Aug 2025 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ff3abkcDnqhXYKIBC/iuBwds0sodky+XHXBSnKN+Ox0=; b=491ZxOFekuQ2Nu
	PyBu0ItAB4IDoFJIxE1V068UObvzH3+hIcwgrh4H2cJ1Cr4B2r+Xz/DKY+4W78eL79y/VD83xz0iY
	ddMgZsOVcKVFKnv9Vd3eJw4ry+198vLhajdDZrAAyEiwk42Kz8E/5tVqzfC/2IW3KEtlUni1hpHwg
	egpfLKx7W/YqWArMYYiEcHJgjLii6YZeV5J3bTq49NUow/ktVm0gvRQ5oZPJkGUs5AbEYGl47M8pG
	5IQ9/cmUO4pwlTn13TgEbKoqbVfWgIRSkrOSEXoAwQ/6IaoflVaDQhWvi7x4IdlYxbroF+eKIut05
	QHcC6BbPkBFDwis1ikog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohUB-0000000DUVq-2YQP;
	Wed, 20 Aug 2025 12:00:11 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh5m-0000000DQkh-3PgV
	for linux-i3c@lists.infradead.org;
	Wed, 20 Aug 2025 11:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755689699; x=1787225699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fudOwyodVoIIhoUDjux5TzDe06wdeNPBWF2ompz0yoo=;
  b=GIPBPTQUMzABg+KIgAQz2I8hRNRsI7dA0pKN9uh2r5q/7vneqXPFcyrU
   EzZHyelvqb31phy5BjhfWFnQEZaOMG1uq1XfCaQJb0wguqSTKtraU8vh0
   1MPVTOZSF6uB7qKfl7PguZXLZS1jVCcZXMfNkAnI6iDydDB8NuR1z0Oe5
   M29i3YuNOWxrqPvmRoa5x23zPDMpVF3RceWBt+EiEohGD72ck4K6/ril4
   TWhJHxpz4JbjLUYAdq7uPUl6OZDnIXSz5+hUtzIaR+xFxiYdKpDr6yAD9
   6Fdyt/AxgxyBTYM76ZVf2Wno6WdxXEXow9OYpTiWE2vh+ubjFNLmiv6BP
   Q==;
X-CSE-ConnectionGUID: SCVUiHPrQT2LSKYHUTWoLA==
X-CSE-MsgGUID: nKnkaORQQm+tF9ArigqSfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61590991"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61590991"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 04:34:59 -0700
X-CSE-ConnectionGUID: kvTT6bmcRZGPIswSkjreyg==
X-CSE-MsgGUID: vyHS7utTT+mLcSCySFN0yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168016655"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2025 04:34:57 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Subject: [PATCH v3 3/4] i3c: mipi-i3c-hci: Use physical device pointer with DMA API
Date: Wed, 20 Aug 2025 14:34:46 +0300
Message-ID: <20250820113447.2502071-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_043458_939956_0F8AC095 
X-CRM114-Status: GOOD (  19.37  )
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
	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry is clear
 	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62

Reason for this is that the IOMMU setup is done for the physical devices
only and not for the virtual I3C Controller device object.

Therefore use the pointer to a physical device object with the DMA API.

Due to a data corruption observation when the device DMA is IOMMU
mapped, a properly sized receive bounce buffer is required if transfer
length is not a multiple of DWORDs.

Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 46 +++++++++++++++++++--------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 351851859f02..09688ada4912 100644
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
@@ -372,6 +387,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
 		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
 							  DMA_TO_DEVICE;
+		bool need_bounce;
 
 		/* store cmd descriptor */
 		*ring_data++ = xfer->cmd_desc[0];
@@ -390,10 +406,13 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 
 		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
 		if (xfer->data) {
-			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
+			need_bounce = device_iommu_mapped(rings->sysdev) &&
+				      xfer->rnw &&
+				      xfer->data_len != ALIGN(xfer->data_len, 4);
+			xfer->dma = i3c_master_dma_map_single(rings->sysdev,
 							      xfer->data,
 							      xfer->data_len,
-							      false,
+							      need_bounce,
 							      dir);
 			if (!xfer->dma) {
 				hci_dma_unmap_xfer(hci, xfer_list, i);
@@ -581,6 +600,7 @@ static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
 
 static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 {
+	struct hci_rings_data *rings = hci->io_data;
 	struct i3c_dev_desc *dev;
 	struct i3c_hci_dev_data *dev_data;
 	struct hci_dma_dev_ibi_data *dev_ibi;
@@ -691,7 +711,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 			* rh->ibi_chunk_sz;
 	if (first_part > ibi_size)
 		first_part = ibi_size;
-	dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
+	dma_sync_single_for_cpu(rings->sysdev, ring_ibi_data_dma,
 				first_part, DMA_FROM_DEVICE);
 	memcpy(slot->data, ring_ibi_data, first_part);
 
@@ -700,7 +720,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
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
