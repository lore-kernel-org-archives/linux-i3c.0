Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E868DC5B543
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1vZO51HAZUqWus1QAb1MZTdhYP1DoAnHiQa96uSt+60=; b=R8bIWY1Rdc7OKZ
	4kpBq4wr7KmjNTrvmK10cB8gWqOyDCFKqequv/mgZp8uMvK4/o8Zd7m2B6Lo2JcB/YE8rcE6LCTJH
	z+e+rsRWoNx4J9V6lfOR8tLF98ru+X+UJPwa9gGew3Oo4iTSRfPWUF3kAXRcQriArjpikW5MM3QXu
	4l9bKfrs5sUWK3AZQHI2itJkwvzBV3bkJv1xid1T5YcXWL/EoHNIc7jAsdfJEhdd/rnQym11H9gd6
	QqPVNQ0S2deIHOnEXulCatXIGv6S00DYapdi1AnsT8m6LXLdTHAYIpGuOr/N8yNLijBFhz6rx3Kgk
	9vynjtmR5wxSkTIbq19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnhD-0000000DONq-2yJy;
	Wed, 04 Jun 2025 12:58:19 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMneK-0000000DO0i-2H5T
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 12:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749041720; x=1780577720;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/n5F4SsTknQU57L3dN0Vv8chQrTokzMcNE++b5uwgY8=;
  b=JUP0O1pIrjiBu6h5LXgPEPnHCh2fEDav8HzTcssMqJ/c5maieQS+2s80
   4igE2rW+oJjgL5TTmFon0XeUpqNvk1ggLmxziCaAnHAPM4P+XcVE7/1Ds
   xtkNKdHVgxQvKohDzQushaqkfoBSno+4V3ayUDaHjC9lOu1Cr0zKCZdYg
   Iud81tdZcLEVSjMh43d4qSClPk8eAfYfdsCGL2BrJLjuZxhZKDx/PINZB
   boH0rYLllfjEDG7ck3+vl49G/r+D7mDkEMOr4yQnks9jgzTVWUG4n6ks6
   yhTkSmP2p/PeYolT0L9UO57OEQNzoeyj1K2T88NHYXWhz8cv38TLV4Hpr
   Q==;
X-CSE-ConnectionGUID: oaoCRzyuSLyhYH4zZWJq3Q==
X-CSE-MsgGUID: Nw0USAPQRLOEtbTrd7b4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50361423"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="50361423"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:55:19 -0700
X-CSE-ConnectionGUID: SenRFk0YR0ibOtrmh50vEg==
X-CSE-MsgGUID: kS8+GjGaSqeOO6qXFCRR+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="146153480"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Jun 2025 05:55:18 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic to all DMA transfers
Date: Wed,  4 Jun 2025 15:55:11 +0300
Message-ID: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_055520_590560_1E61F9DD 
X-CRM114-Status: GOOD (  17.32  )
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

Move DMA bounce buffer code for I3C private transfers to be generic for
all DMA transfers, and round up the receive bounce buffer size to a
multiple of DWORDs.

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
using a local bounce buffer.

To prepare for the device DMA being IOMMU mapped and to address the
above issue, implement a local, properly sized bounce buffer for all
DMA transfers. For now, allocate it only when the buffer is in the
vmalloc() area to avoid unnecessary copying with CCC commands and
DMA-safe I2C transfers.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index bc4538694540..24c5e7d5b439 100644
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
index 491dfe70b660..0311c84f5b4e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -339,6 +339,44 @@ static int hci_dma_init(struct i3c_hci *hci)
 	return ret;
 }
 
+static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
+					 struct hci_xfer *xfer)
+{
+	if (!is_vmalloc_addr(xfer->data))
+		return xfer->data;
+
+	if (xfer->rnw)
+		/*
+		 * Round up the receive bounce buffer length to a multiple of
+		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
+		 * transfers may corrupt the last DWORD when transfer length is
+		 * not a multiple of DWORDs. This was observed when the device
+		 * DMA is IOMMU mapped or when an I3C target device returns
+		 * less data than requested. Latter case is less severe and
+		 * does not exceed the requested number of bytes, assuming the
+		 * device DMA is not IOMMU mapped.
+		 */
+		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
+					   GFP_KERNEL);
+	else
+		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
+					   GFP_KERNEL);
+
+	return xfer->bounce_buf;
+}
+
+static void hci_dma_free_safe_xfer_buf(struct i3c_hci *hci,
+				       struct hci_xfer *xfer)
+{
+	if (xfer->bounce_buf == NULL)
+		return;
+
+	if (xfer->rnw)
+		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
+
+	kfree(xfer->bounce_buf);
+}
+
 static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 			       struct hci_xfer *xfer_list, unsigned int n)
 {
@@ -352,6 +390,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 		dma_unmap_single(&hci->master.dev,
 				 xfer->data_dma, xfer->data_len,
 				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+		hci_dma_free_safe_xfer_buf(hci, xfer);
 	}
 }
 
@@ -391,7 +430,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 
 		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
 		if (xfer->data) {
-			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
+			buf = hci_dma_alloc_safe_xfer_buf(hci, xfer);
+			if (buf == NULL) {
+				hci_dma_unmap_xfer(hci, xfer_list, i);
+				return -ENOMEM;
+			}
+
 			xfer->data_dma =
 				dma_map_single(&hci->master.dev,
 					       buf,
@@ -401,6 +445,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 						  DMA_TO_DEVICE);
 			if (dma_mapping_error(&hci->master.dev,
 					      xfer->data_dma)) {
+				hci_dma_free_safe_xfer_buf(hci, xfer);
 				hci_dma_unmap_xfer(hci, xfer_list, i);
 				return -ENOMEM;
 			}
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
