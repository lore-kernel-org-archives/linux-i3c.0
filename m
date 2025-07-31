Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96911C87FCC
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Jul 2025 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lVe71TrHTDiQu17EU+Jt9e2zZB7Z7wQo67ffjOHxrSI=; b=d9CY7sWe7VNgR6
	qzGYwmHkLB5HYYQyV/n+9LL+BC2FyD4Ps0ZaCJ/vmz9zI6JciTNt1NRz1BJ71aS7r2PRf5mF7cRNk
	j3aS7a6Qh6OeA0GC/2CvvUYODLBmqtXPnIoZCEQA/W5wJv7LASY6L9nDU4l2MJT+QfbX1esLy/kLU
	RX0jcZUolJODXa8JTU7Pqq8nVkN+o1VFH+V9T6AaOCTsoF2/pdnnJTegqwbY0+UMLfwtTPc3vZ5KL
	KKDU9KiZZTpgh7OZCSfkYl4gSqy5S/i6Purp8tCNDmyAFF+qA+d711eOc8Nm33erj4upHQ54nhWTg
	v3UK9CzrXP9469FDefmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUgI-00000003tVD-1Uod;
	Thu, 31 Jul 2025 14:54:54 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU39-00000003nfT-1adA
	for linux-i3c@lists.infradead.org;
	Thu, 31 Jul 2025 14:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753971267; x=1785507267;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/fsMwPLrOntS/Kz4ow8t8gc+3e046FImQ16rlrSSWPw=;
  b=RMDq1eNDRkEpHWLKjG3IFxoLXtMcr47f54UwaKJu+nLBZxwcdrellX0n
   WMRVPlo1udE/VRZWM5jI07d7fA2xtn2FUfIaM2UdQqFgaXMZpI8YIf/WE
   KUvCKb9VlD9gHEmalgbNfTRvvImNJFaKadfxcNMAvFwdpf68yQB+kSn+z
   n+7oH2rUbziZ7z3FiokTgqnHx8hI0p8BVF3M2QYofvHMH111EP9i5RHih
   gXam44D0Lw46W+yGVLe/ntaKtBGK4rCzzg1fi0IBsnry7Z7tjEeGGt/5S
   h1Wmlcmek2itKnqa2nVQ2y6L2W1npy6qJHKWFGqDkvLZHUv0AGDjgynXQ
   w==;
X-CSE-ConnectionGUID: ePFNUGOlTCOqsA5s5JM5zw==
X-CSE-MsgGUID: EpOkEiy+THGJSNsfIx9usQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66990760"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="66990760"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 07:14:26 -0700
X-CSE-ConnectionGUID: OKZzbdi6RU6W6lv0mDjTuA==
X-CSE-MsgGUID: TJEEvDVrR3+p33FaECin7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="167451862"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2025 07:14:25 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/4] i3c: master: Add helpers for DMA mapping and bounce buffer handling
Date: Thu, 31 Jul 2025 17:14:17 +0300
Message-ID: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_071427_460627_6F1647C3 
X-CRM114-Status: GOOD (  13.07  )
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

Add helpers for I3C host controller drivers for DMA mapping/unmapping
and bounce buffer handling. A bounce buffer is allocated if the buffer
is not DMA'able or when the driver requires it for a transfer.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master.c       | 74 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h | 20 +++++++++++
 2 files changed, 94 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2ef898a8fd80..a1daf18ea707 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -8,6 +8,7 @@
 #include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
@@ -1727,6 +1728,79 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 }
 EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
+/**
+ * i3c_master_dma_map_single() - Map buffer for single DMA transfer
+ * @dev: device object of a device doing DMA
+ * @buf: destination/source buffer for DMA
+ * @len: length of transfer
+ * @need_bounce: true if buffer is not DMA safe and need a bounce buffer
+ * @dir: DMA direction
+ *
+ * Map buffer for a DMA transfer and allocate a bounce buffer if required.
+ *
+ * Return: I3C DMA transfer descriptor or NULL in case of error.
+ */
+struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
+	size_t len, bool need_bounce, enum dma_data_direction dir)
+{
+	struct i3c_dma *dma_xfer;
+	void *dma_buf = buf;
+
+	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
+	if (!dma_xfer)
+		return NULL;
+
+	dma_xfer->buf = buf;
+	dma_xfer->dir = dir;
+	dma_xfer->len = len;
+	if (is_vmalloc_addr(buf))
+		need_bounce = true;
+
+	if (need_bounce) {
+		if (dir == DMA_FROM_DEVICE)
+			dma_buf = kzalloc(ALIGN(len, cache_line_size()),
+						GFP_KERNEL);
+		else
+			dma_buf = kmemdup(buf, len, GFP_KERNEL);
+		if (!dma_buf)
+			goto err_alloc;
+
+		dma_xfer->bounce_buf = dma_buf;
+	}
+
+	dma_xfer->addr = dma_map_single(dev, dma_buf, len, dir);
+	if (dma_mapping_error(dev, dma_xfer->addr))
+		goto err_map;
+
+	return dma_xfer;
+err_map:
+	kfree(dma_xfer->bounce_buf);
+err_alloc:
+	kfree(dma_xfer);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(i3c_master_dma_map_single);
+
+/**
+ * i3c_master_dma_unmap_single() - Unmap buffer after DMA
+ * @dev: device object of a device doing DMA
+ * @dma_xfer: DMA transfer and mapping descriptor
+ *
+ * Unmap buffer and cleanup DMA transfer descriptor.
+ */
+void i3c_master_dma_unmap_single(struct device *dev, struct i3c_dma *dma_xfer)
+{
+	dma_unmap_single(dev, dma_xfer->addr, dma_xfer->len, dma_xfer->dir);
+	if (dma_xfer->bounce_buf) {
+		if (dma_xfer->dir == DMA_FROM_DEVICE)
+			memcpy(dma_xfer->buf, dma_xfer->bounce_buf,
+			       dma_xfer->len);
+		kfree(dma_xfer->bounce_buf);
+	}
+	kfree(dma_xfer);
+}
+EXPORT_SYMBOL_GPL(i3c_master_dma_unmap_single);
+
 /**
  * i3c_master_set_info() - set master device information
  * @master: master used to send frames on the bus
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 043f5c7ff398..e39350b1038e 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -558,6 +558,22 @@ struct i3c_master_controller {
 #define i3c_bus_for_each_i3cdev(bus, dev)				\
 	list_for_each_entry(dev, &(bus)->devs.i3c, common.node)
 
+/**
+ * struct i3c_dma - DMA transfer and mapping descriptor
+ * @buf: destination/source buffer for DMA
+ * @len: length of transfer
+ * @addr: mapped DMA address for a Host Controller Driver
+ * @dir: DMA direction
+ * @bounce_buf: an allocated bounce buffer if transfer needs it or NULL
+ */
+struct i3c_dma {
+	void *buf;
+	size_t len;
+	dma_addr_t addr;
+	enum dma_data_direction dir;
+	void *bounce_buf;
+};
+
 int i3c_master_do_i2c_xfers(struct i3c_master_controller *master,
 			    const struct i2c_msg *xfers,
 			    int nxfers);
@@ -575,6 +591,10 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
+struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
+					  size_t len, bool dma_safe,
+					  enum dma_data_direction dir);
+void i3c_master_dma_unmap_single(struct device *dev, struct i3c_dma *dma_xfer);
 
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
