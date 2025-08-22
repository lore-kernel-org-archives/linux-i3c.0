Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B49CA0EEB
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Aug 2025 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7+bG+jNrJelBb/QYOSfEpzeA88muTQ2xgnrfitH6Fk=; b=YWPObQ1F1HUtqc
	LiWQ7JDgn1wbS2qZtKi1K9Ajht7kH9r+WJsF5oMoDUD2EJA6j9TXnr9i7G5H8sEiBkM3HReVatWdd
	bn/4K0fKlbVylG7pfmztOy2rHkjjgHU60FiAt+Y2zPcyfrtbbrC58LzrViCnLlfqOWjXo+G0XNyOT
	SBGHmhdpubKeiAf/rFwHc9eIhVeBqoeydQZ79cQuPsBYmEmRvp5U6krRD4KzH5tSZryjiv9PzRjcw
	Au2CWS+shnwvCPvXnycWUh7vEKO134vGrVHL6Mn5sAGUjd451XQb46sc81YkXTdjRmSBF4iVNq7Ty
	jUl0rRlkKomM6hkCl9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZcP-00000003Yk7-1KhY;
	Fri, 22 Aug 2025 21:48:17 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPRr-00000002Fwy-2mIV
	for linux-i3c@lists.infradead.org;
	Fri, 22 Aug 2025 10:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755860203; x=1787396203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ee95Dz1PrjxtL5oNaV5mvWpnZN2W4P/tILIMnF1BK8k=;
  b=KFNGRsFCjaD86AjT865SBYpqGa2yXPJ4yHXM/Nqz3Z3MYqb9jZ4oGlyo
   gYkruZZxYz78SwpLz/Xe7fAbo77P4nAiTGHkjs71oj9z0vk8jXrsPMJZ9
   x7akSPYMUE5fAiwJP5Lu+ECAn5FwF5wOvPeCFVTZKYScOMQzJqHPYE4+z
   KUP+PM2DSls9EayDLcoLqwx9V7ea59Q5vjhyCRxey6yuMJTwJBYeSIIql
   K87xyoDR+/59CtcnEAwrpAstzsIHg8Nzsfi1Bpm1+0/mRJAWcqLbNIPG+
   1D6+AF0HQ2VROOqWYQY0aRB40+u+DM3mnSlwOLtw7ybbRtNOsUQvm5p05
   Q==;
X-CSE-ConnectionGUID: 6l0gwh2wTIGzwmWmwa8FnA==
X-CSE-MsgGUID: iPIJ4w6BRd+i5jAukXYa5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83581117"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="83581117"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 03:56:35 -0700
X-CSE-ConnectionGUID: 8j8GjbHDTNOuW59dd3gxdQ==
X-CSE-MsgGUID: m3MCP3VXRzmguzZEx3D3/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169079960"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2025 03:56:34 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v4 1/4] i3c: master: Add helpers for DMA mapping and bounce buffer handling
Date: Fri, 22 Aug 2025 13:56:27 +0300
Message-ID: <20250822105630.2820009-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
References: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_035643_711084_A5949192 
X-CRM114-Status: GOOD (  15.68  )
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
 drivers/i3c/master.c       | 74 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h | 26 ++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2ef898a8fd80..033d06cabca2 100644
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
+ * @force_bounce: true, force to use a bounce buffer,
+ *                false, function will auto check is a bounce buffer required
+ * @dir: DMA direction
+ *
+ * Map buffer for a DMA transfer and allocate a bounce buffer if required.
+ *
+ * Return: I3C DMA transfer descriptor or NULL in case of error.
+ */
+struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
+	size_t len, bool force_bounce, enum dma_data_direction dir)
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
+		force_bounce = true;
+
+	if (force_bounce) {
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
index 043f5c7ff398..c52a82dd79a6 100644
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
+					  size_t len, bool force_bounce,
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
