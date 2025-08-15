Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65CACA0EE4
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Aug 2025 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpEyF/YvGw98OrqmqQkITiaSRbnNjNQezBLekmTGTwA=; b=ERIKHYPhyGqzW2
	WqloTCZRRDD6GPOPgSOGXmysXfAWzEUrg/X43/cL2KldhURQlJjrwjtk7vWIFNEy6tvLay6wXq343
	rXbh7lYcqeQte4ZJPHpGHYXJS11P/VyFQ4upGazSKCnQRkoD+3Cryswop8KMjbsALZUjJriX8Hfwe
	Fqvk9d3u9U//RyERYMplc9gGHYcwVPUyUxGPI36CDQSLHRLHYRi4xfy0z2wfl3W6dxKzQdldURTLd
	UTMwgkSsEhtRU+kG2ge0tzqmcEkPKP4ENLo+cvijU/9gB2H//XmP89r2c3l2NSUp6CHbbt0YksIwu
	fgKqxcsJTClyQk4DnHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx43-00000002wSd-229a;
	Fri, 15 Aug 2025 16:13:59 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvAq-00000002gdH-0yvC
	for linux-i3c@lists.infradead.org;
	Fri, 15 Aug 2025 14:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755267172; x=1786803172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TbS2/ivnw74lqyomCAZkIJXy7nybAfmWO6zdZgl/GoE=;
  b=e+WB6L5S2BLSkZGtG14VMlu+GqTr2PbUTZhSxrdoMI2nKGXvQGjLCLrB
   APVZzrY2fMFNWtoeB5JvkYuvmcSc1YygOswgghaDxlmGVs4sUv2i8/FZP
   mIyNLbFOEVIsbR0ACW55WtXPecNY1VulJw67RzPB/BxQVxROCLj3U8wdT
   v1lzCuSkQh88P2Rs5UmOfd4AMk7c8RUIHLxItdcS7pNT7fZG1ovtcdpwI
   dceCJB1IHa2QRjakm5OU7yOvcIKRSdPBFv0uqhdnvnL2yWdkmgYWui00y
   o+iqfTw9YhzBIrbSkYrz5e8Hs3YYY5r5THsR6m7haTYIgbCYldKdlKaqJ
   Q==;
X-CSE-ConnectionGUID: aXiG3bwtTz6B5eB1pPBN2g==
X-CSE-MsgGUID: i83zHtoRTm6a8svKd2Ucuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68292237"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68292237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 07:12:47 -0700
X-CSE-ConnectionGUID: HATTichFQViEh67S1xWn9w==
X-CSE-MsgGUID: VdfeyWEcR4OadDzAoUjzoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171474971"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.50])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2025 07:12:46 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 1/4] i3c: master: Add helpers for DMA mapping and bounce buffer handling
Date: Fri, 15 Aug 2025 17:12:39 +0300
Message-ID: <20250815141242.2013767-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_071252_315646_0C02E0EA 
X-CRM114-Status: GOOD (  14.83  )
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
 drivers/i3c/master.c       | 69 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h | 26 ++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2ef898a8fd80..497bff57248a 100644
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
@@ -1727,6 +1728,74 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
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
+	struct i3c_dma *d __free(kfree) = dma_xfer;
+	void *bounce __free(kfree) = d->bounce_buf;
+
+	dma_unmap_single(d->dev, d->addr, d->map_len, d->dir);
+	if (bounce && d->dir == DMA_FROM_DEVICE)
+		memcpy(d->buf, bounce, d->len);
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
