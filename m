Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB90AEFCE38
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QPo7JBBbiOdYJ/Dut2ITIBbyQvt4Sh3LhDUj/uT+NM=; b=vN13afWSuj2Ph2
	+C55e746nLbSma0T12ySZLfpZcLBizIvKMtfo3gqJSujxS4yfcY15hh34nPeW92+KTNHq9xD1ADgz
	elQICKGP7migU/Wg+MWvi3vIsPYd5LSiyffRHT8dTwX9v/kWpdbrHPHeo2l1IS3n+E6Qp1yThEN6r
	i9i8jFxs47HW2NXEWT8fTNnePqnZaKC6nNwVtZ8nDzvmVDV6HMtcrRAr8Ub+t1QEr6mKS9QKuT1XN
	95nAmyDM8vd9IWxyaw8sjn2unNNk2ZG29lWwLKOzEU6b3yz1KclWH458JBmCRsuPzwjcVF7Wgx4VN
	pvwubtPP7x/SRWALW+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmm-00000000K3R-2S7m;
	Wed, 04 Mar 2026 18:17:28 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmk-00000000K1V-2dj7
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648247; x=1804184247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OM8FJ9J9Pv7+2J1fN3Q1Lv/UVWgjyUkjFUQW8oXAZ18=;
  b=YIM8LGfQEKuAYE9as4+8tMpGs4yFg7agd9jBx7bzP4zftIb1M/dVQy7R
   JnlloshYoaiYYWEgrlw+MVejYqpc9+32se7jeivc/oRGrHPcpPHu3BWkQ
   wfjzfXQyB6mxJtxvIveragA7qIFK90W8oQu4K+OveovFyCRrDWHdpM1WC
   1nGNPgVeCXPNUFGDFctV4FONOg3vA5MnzfsB9CnZM/f2nFNUbKZRlvrJ7
   td7n2HFBYcphTx3A74CBDY3JS3AX4tWNNbGh7/QgxgvwQxbbkerjxpWVM
   eYaBvRYzxWY3T/KPGcApAgvHVwFyNCilly+xqBR+qOJqsCdETRCRhwRwB
   A==;
X-CSE-ConnectionGUID: 2kebcdvcQfOUDKj2Rq/Yhg==
X-CSE-MsgGUID: kX18of/tRiaED1oYvEmnrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745888"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745888"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:27 -0800
X-CSE-ConnectionGUID: RAwNmKdDTj+6iiaS74ckLw==
X-CSE-MsgGUID: PW9tU+yGR3SXBbpz5L+04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656725"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:25 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 03/14] i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
Date: Wed,  4 Mar 2026 20:16:54 +0200
Message-ID: <20260304181706.143841-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101726_677643_8E127FDB 
X-CRM114-Status: GOOD (  15.71  )
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

Prepare for fixing a race in the DMA ring enqueue path when handling
parallel transfers.  Move all DMA mapping out of hci_dma_queue_xfer()
and into a new helper that performs the mapping up front.

This refactoring allows the upcoming fix to extend the spinlock coverage
around the enqueue operation without performing DMA mapping under the
spinlock.

No functional change is intended in this patch.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	New patch split out from "i3c: mipi-i3c-hci: Fix race in DMA ring
	enqueue for parallel xfers"


 drivers/i3c/master/mipi-i3c-hci/dma.c | 49 ++++++++++++++++++---------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index b903a2da1fd1..ba451f026386 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -439,6 +439,33 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 	}
 }
 
+static struct i3c_dma *hci_dma_map_xfer(struct device *dev, struct hci_xfer *xfer)
+{
+	enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	bool need_bounce = device_iommu_mapped(dev) && xfer->rnw && (xfer->data_len & 3);
+
+	return i3c_master_dma_map_single(dev, xfer->data, xfer->data_len, need_bounce, dir);
+}
+
+static int hci_dma_map_xfer_list(struct i3c_hci *hci, struct device *dev,
+				 struct hci_xfer *xfer_list, int n)
+{
+	for (int i = 0; i < n; i++) {
+		struct hci_xfer *xfer = xfer_list + i;
+
+		if (!xfer->data)
+			continue;
+
+		xfer->dma = hci_dma_map_xfer(dev, xfer);
+		if (!xfer->dma) {
+			hci_dma_unmap_xfer(hci, xfer_list, i);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
 static int hci_dma_queue_xfer(struct i3c_hci *hci,
 			      struct hci_xfer *xfer_list, int n)
 {
@@ -446,6 +473,11 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	struct hci_rh_data *rh;
 	unsigned int i, ring, enqueue_ptr;
 	u32 op1_val, op2_val;
+	int ret;
+
+	ret = hci_dma_map_xfer_list(hci, rings->sysdev, xfer_list, n);
+	if (ret)
+		return ret;
 
 	/* For now we only use ring 0 */
 	ring = 0;
@@ -456,9 +488,6 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	for (i = 0; i < n; i++) {
 		struct hci_xfer *xfer = xfer_list + i;
 		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
-		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
-							  DMA_TO_DEVICE;
-		bool need_bounce;
 
 		/* store cmd descriptor */
 		*ring_data++ = xfer->cmd_desc[0];
@@ -477,18 +506,6 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 
 		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
 		if (xfer->data) {
-			need_bounce = device_iommu_mapped(rings->sysdev) &&
-				      xfer->rnw &&
-				      xfer->data_len != ALIGN(xfer->data_len, 4);
-			xfer->dma = i3c_master_dma_map_single(rings->sysdev,
-							      xfer->data,
-							      xfer->data_len,
-							      need_bounce,
-							      dir);
-			if (!xfer->dma) {
-				hci_dma_unmap_xfer(hci, xfer_list, i);
-				return -ENOMEM;
-			}
 			*ring_data++ = lower_32_bits(xfer->dma->addr);
 			*ring_data++ = upper_32_bits(xfer->dma->addr);
 		} else {
@@ -511,7 +528,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 		op2_val = rh_reg_read(RING_OPERATION2);
 		if (enqueue_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val)) {
 			/* the ring is full */
-			hci_dma_unmap_xfer(hci, xfer_list, i + 1);
+			hci_dma_unmap_xfer(hci, xfer_list, n);
 			return -EBUSY;
 		}
 	}
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
