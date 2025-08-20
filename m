Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90762CA0FE1
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Aug 2025 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+40cIqJR//X7XeSFIqbw0UmvsJK2BYEVcW7GzGoKD8=; b=mf6p5K5fgjkyJe
	bXiZb/xwl1JWnsPGhgF7LezLDFUMXZIWjh6sz2p7YW9x5eA1Lxb8mI/GQpcuodrdW93e2gXgFcJRO
	ECaTwRy/dmKE3aAbz+CSix4KOtkQ/EyMuy2xA4+kpjZ1r0FPjf8VecsTmnRTFTaGjy+Hfe8weOnvZ
	nhzGfotR/ogDQhb1b+rvXNFGoDyNOL1fNd7jSM2v6eUch9MBJ7mnGOnrHZOiNCE2d22L+Mbeeg2C9
	d1bUyjKGMpRJt+oxyoqGP87IHKz8j2DbUP1/MIRh1TJoUn5y4MaKIJ0Bs9WlgvSIK95DugPgj0wcx
	VRVnNxoGDHUAakPzOeFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohUC-0000000DUWL-1J62;
	Wed, 20 Aug 2025 12:00:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh5r-0000000DQoh-1jSF
	for linux-i3c@bombadil.infradead.org;
	Wed, 20 Aug 2025 11:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eMrMSKRf9p0bjQmCMuiZICXpvp2BM/uM69KX/oq8aF8=; b=csMZftEHHYNviUZaVK+ms9aZNz
	M3jzWQoE8WZgub48VM1SF3e/pnt470JcsbOHZ4JrB3T8KEQYpGZA6cgjhXwyDmGX+NSsGHnvBDMjv
	2uqiWlwd6ynFEoILK0UHneHEw556xaqvjJakQ7e14nVtT/NDmC+95s0tXOgZKlxX5kBUdOVLRuveL
	xJqmwNTn317TpsUx4QBc3zFmLWW3RZagOzVptzPtvsd3l2K7UF5mDZh+huOukzw9z7hDOarqSxMtv
	e97I+sBDj6/N4ThDs5Awr/NC3X3AqAhSEIapqhgpGc0NYq4Fqq1so75tSeNPFlAsHIlqik5yda8LK
	1rK7Y5lQ==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh5n-00000000JMZ-44yi
	for linux-i3c@lists.infradead.org;
	Wed, 20 Aug 2025 11:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755689701; x=1787225701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5o7y82sgmTWMQK169yHshBu9q9H1uOFQfUEYABFmo9c=;
  b=U7cUGoYCzt6fqm7sE/GtFWYp2MixSbve0MjjHcKimKo/Ks03LOPn0Q3c
   ov88wK3cnpkUAIJgG+9Oz08UhaLo2kDDviQGEQLPF1le4+JWzCXowy8wy
   O+tevVc/3G8EyLSpsnK3WOnrHYdb8O85xcGHVtDOGdBzEUQy0sJY+UR4y
   qMuZu/d64giXt12WipI+IeyQna2Kez8NgtN45qaWzHjLhlePi5Zt54L61
   Zg4G46Kw0tmog5AFuuZlboKF5a9aA8SCWZ8+fTFFwCk7AQudxPY55QvMz
   7odjIOcPRdA+qCB650WyjjnqRA/z+17wlse6WRvAgStZDQlGAIXk9GE8G
   g==;
X-CSE-ConnectionGUID: VTmoz5UeQ0ab2vUnlWyojA==
X-CSE-MsgGUID: aM3fz+f+Tm2nDRxqEKiS7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61590987"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61590987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 04:34:57 -0700
X-CSE-ConnectionGUID: 1u05cBdvRrCSgSvB4SoUBg==
X-CSE-MsgGUID: kf3doRAuTRyfC6kzPGFIMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168016648"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2025 04:34:55 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA mapping and bounce buffering
Date: Wed, 20 Aug 2025 14:34:45 +0300
Message-ID: <20250820113447.2502071-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_123500_470297_A3FB0E05 
X-CRM114-Status: GOOD (  16.59  )
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
