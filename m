Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8240FCA0EFC
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Aug 2025 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3fTTv2I2QDE5R+jgT+nUHyDX5+s2fXHjW9Il2UqHDY=; b=V/M9i8iDVntabU
	Qnu5/6L/x22ToxWWiSlxtX46pXvzbPyK/3fb/W6UNVBNh6LYzU1TIG3OTo2fnNg6OgWAjr8kXF8w1
	kRBVsWhr7YoE5/3NOfYgxqY+JVTpIyOBeqa1yJbCqKJyQ2e7PIu8r/YFv3UGJHEezIgQ2/ZeuUSfa
	AAFX3HD8LPnxpAyS5u0wsmRF32+Mrnl22lhvq3JK2LUn+WDpJUHsenqiftDwMfsXZz7BsTzA9PzR3
	uCVKl62qUk8kej7ptO7NGaY2AoWxtnsxK3fAlnC6GZbORe0/tb2Pbrcz/ZINDZUCKG3QaSq0AzCk9
	AfNlF7g5pVFfjPZ/eMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohUB-0000000DUVe-18sm;
	Wed, 20 Aug 2025 12:00:11 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh5j-0000000DQkh-3C27
	for linux-i3c@lists.infradead.org;
	Wed, 20 Aug 2025 11:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755689696; x=1787225696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RvblUicc4Y4c/2zuYJKHX3Ps5eZF5/Bp0TmckQ69HU0=;
  b=kSlNjPJtfr7equ5UQ4eZVau2kyTmQRL7DDV0Fat5zXSY0gnqVAocyL53
   KsmSSXotJRARw2+s25Jj2qXcSHo2kj1+WV3Vb17YkjfN4z/YevmJUsNtc
   jcFzgPZL87L+/qzr8bFzAekm5GH4bikTjqVmnJzyclR7Lfd7C9PW9dcL1
   qNB+4PRXS5VPGUYnZtImhM5Lvhm+WnevevcYQ1uxUD0vznT9JPbJgieCD
   NOLB7tmODMbmYVD0b0ML/+YpM8rdwPtH3ENlrUwIE0NWT1VUGDK5/GBQK
   qUFJZv5exG2JKbMFKqwxHQTkfSE+Mk8unSuKecCHunCdibUsYvzrRYXFG
   g==;
X-CSE-ConnectionGUID: Tj3ch1rEQH2tVHjiMtmqKg==
X-CSE-MsgGUID: nb2Sx/EDQbCY/X44dt2ROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61590983"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61590983"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 04:34:56 -0700
X-CSE-ConnectionGUID: P2VLPKVQSdGE4X4Q4l4BRg==
X-CSE-MsgGUID: zDwWe7PCROa/lCSpi67jDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168016647"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2025 04:34:54 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 1/4] i3c: master: Add helpers for DMA mapping and bounce buffer handling
Date: Wed, 20 Aug 2025 14:34:44 +0300
Message-ID: <20250820113447.2502071-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_043455_880991_ADD43B7D 
X-CRM114-Status: GOOD (  15.11  )
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

Some I3C controllers such as MIPI I3C HCI may pad the last DWORD (32-bit)
with stale data from the RX FIFO in DMA transfers if the receive length
is not DWORD aligned and when the device DMA is IOMMU mapped.

In such a case, a properly sized bounce buffer is required in order to
avoid possible data corruption. In a review discussion, proposal was to
have a common helpers in I3C core for DMA mapping and bounce buffer
handling.

Drivers may use the helper i3c_master_dma_map_single() to map a buffer
for a DMA transfer. It internally allocates a bounce buffer if buffer is
not DMA'able or when the driver requires it for a transfer.

Helper i3c_master_dma_unmap_single() does the needed cleanups and
data copying from the bounce buffer.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master.c       | 73 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h | 26 ++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2ef898a8fd80..edc0e7c8c047 100644
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
@@ -1727,6 +1728,78 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
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
+	struct i3c_dma *dma_xfer __free(kfree) = NULL;
+	void *bounce __free(kfree) = NULL;
+	void *dma_buf = buf;
+
+	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
+	if (!dma_xfer)
+		return NULL;
+
+	dma_xfer->dev = dev;
+	dma_xfer->buf = buf;
+	dma_xfer->dir = dir;
+	dma_xfer->len = len;
+	dma_xfer->map_len = len;
+
+	if (is_vmalloc_addr(buf))
+		need_bounce = true;
+
+	if (need_bounce) {
+		dma_xfer->map_len = ALIGN(len, cache_line_size());
+		if (dir == DMA_FROM_DEVICE)
+			bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
+		else
+			bounce = kmemdup(buf, dma_xfer->map_len, GFP_KERNEL);
+		if (!bounce)
+			return NULL;
+		dma_buf = bounce;
+	}
+
+	dma_xfer->addr = dma_map_single(dev, dma_buf, dma_xfer->map_len, dir);
+	if (dma_mapping_error(dev, dma_xfer->addr))
+		return NULL;
+
+	dma_xfer->bounce_buf = no_free_ptr(bounce);
+	return no_free_ptr(dma_xfer);
+}
+EXPORT_SYMBOL_GPL(i3c_master_dma_map_single);
+
+/**
+ * i3c_master_dma_unmap_single() - Unmap buffer after DMA
+ * @dma_xfer: DMA transfer and mapping descriptor
+ *
+ * Unmap buffer and cleanup DMA transfer descriptor.
+ */
+void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer)
+{
+	dma_unmap_single(dma_xfer->dev, dma_xfer->addr,
+			 dma_xfer->map_len, dma_xfer->dir);
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
index 043f5c7ff398..80a621034ad0 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -558,6 +558,26 @@ struct i3c_master_controller {
 #define i3c_bus_for_each_i3cdev(bus, dev)				\
 	list_for_each_entry(dev, &(bus)->devs.i3c, common.node)
 
+/**
+ * struct i3c_dma - DMA transfer and mapping descriptor
+ * @dev: device object of a device doing DMA
+ * @buf: destination/source buffer for DMA
+ * @len: length of transfer
+ * @map_len: length of DMA mapping
+ * @addr: mapped DMA address for a Host Controller Driver
+ * @dir: DMA direction
+ * @bounce_buf: an allocated bounce buffer if transfer needs it or NULL
+ */
+struct i3c_dma {
+	struct device *dev;
+	void *buf;
+	size_t len;
+	size_t map_len;
+	dma_addr_t addr;
+	enum dma_data_direction dir;
+	void *bounce_buf;
+};
+
 int i3c_master_do_i2c_xfers(struct i3c_master_controller *master,
 			    const struct i2c_msg *xfers,
 			    int nxfers);
@@ -575,6 +595,12 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
+struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
+					  size_t len, bool dma_safe,
+					  enum dma_data_direction dir);
+void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
+DEFINE_FREE(i3c_master_dma_unmap_single, void *,
+	    if (_T) i3c_master_dma_unmap_single(_T))
 
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
