Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A23FC77B7F
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Jun 2025 14:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPSeU7HJQGXCFJxZFmvu+oFj6RwujPNc4Mmh+2cVcoY=; b=Ok9qwg/1V0rB8t
	aNg4fpNx8zM3WIitFznRjFUqK4VFVAoe/0zFVRIz19qW6IEGT1YsQxtI2TA2JNwfTIKmJrmxnegqJ
	A9j84oX7DeIjY7YDp+DGIyiwcKPIdZTcu7q+VYNZmHfICelO/9Bd32MeJCiYbl+cO/CMz3PqDWlqw
	aU6cR3VKpdczhCOF0Gq6ilsbATGPV+dZl1GbM3JrUwyXqsfyo6mUwbpMWrxn4TaK/RqPG5Phd9Njh
	NJ36ouXHM5sufdqiqyoiAQWRfRea5hBTbfjCcXglTK/auCpQtZ7CQ1i+4WKT5MBmqOEUc2qvAB7LH
	cjU36WhjQE+GVFUMU7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9xq-0000000EtrS-0lzl;
	Fri, 27 Jun 2025 14:22:02 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9tD-0000000EsUt-4C5C
	for linux-i3c@lists.infradead.org;
	Fri, 27 Jun 2025 14:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751033836; x=1782569836;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=cIz1BHWmqk7uJ/QF6bfCsa9kOfcqoNVZpfTEPRHzO5w=;
  b=KxKPLUTWVzGwQEKqAZgUKzvFzRIXG5sIAgr0wQDFiNY1hubyUeuEslA0
   2fmskOiFBoyIQwc2n/z4iqhNUCOcc6LMtmiOIxocufe4zIq8eLBSJucHH
   TaIVZ8SMdzk4NQSYp4LxQu85FAjgkJxwhCobeKc4HCvglFHjIOlTkwSFu
   auQF2TreodXxnjpDffng1W7eIpZ4bMapx+VLvzBngZREW90tRyWCRtXfa
   hmuEDJDFx5rpk28Gwhjhy5MSj+OlapDwlRbhhdIwoedtvfL3y0zrnQDaN
   Iwlsx/IJHLAUPqWR2s1k7l/F8kChm9xTKeUX0fM+zfM6fiGyr5b9WpxvZ
   w==;
X-CSE-ConnectionGUID: hyk92lovQZSYgHkgPDb7xQ==
X-CSE-MsgGUID: ps3IWadlSEmFvP5S58o4Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52467066"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="52467066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:17:15 -0700
X-CSE-ConnectionGUID: ASJz96rJSnmry6gn06B+rg==
X-CSE-MsgGUID: rAM0KT+tRHOGldGerKs57w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="190006979"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Jun 2025 07:17:14 -0700
Message-ID: <9559d18b-43d3-4f74-8b9d-a5f2c32a3f36@linux.intel.com>
Date: Fri, 27 Jun 2025 17:17:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic to
 all DMA transfers
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
 <bc599310-9287-4023-a204-682771574528@linux.intel.com>
 <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
 <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
 <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
 <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
 <aEb38qRGQ5AIqy7R@lizhi-Precision-Tower-5810>
 <ebc6a6f1-0c9f-4ea7-8af1-585fce6ad9c6@linux.intel.com>
 <aEhmfNObvH5Dm4+W@lizhi-Precision-Tower-5810>
 <aFGFNdM+F9SUQIgi@lizhi-Precision-Tower-5810>
 <8a3b32df-b687-47be-ae4b-99008d000542@linux.intel.com>
Content-Language: en-US
In-Reply-To: <8a3b32df-b687-47be-ae4b-99008d000542@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_071716_064224_CBC04A43 
X-CRM114-Status: GOOD (  27.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Frank

On 6/19/25 4:37 PM, Jarkko Nikula wrote:
> Hi
> 
> On 6/17/25 6:09 PM, Frank Li wrote:
>>> Thanks, I finially understand the problem you faced. I think other 
>>> master
>>> controller face similar issue if they use dma. Let me think more. If 
>>> alloc
>>> buffer size is not align to cache line, swtlib will bounce again.
>>>
>>> rough idea i3c core layer provide an i3c_(un)map_api to do that.
>>
Unfortunately I run out of time before vacation to have a clean and 
tested patchset about your idea but wanted to share work in progress 
diff below. Which is not actually a standalone but goes on top of this 
patchset.

I have mixed feeling does this yet bring enough value to the I3C core or 
does it make sense to wait for another I3C driver using DMA to see 
better common needs.

But I'm open for your comments and will continue after vacation :-)

---
  drivers/i3c/master.c                  | 74 ++++++++++++++++++++++++
  drivers/i3c/master/mipi-i3c-hci/dma.c | 82 +++++----------------------
  drivers/i3c/master/mipi-i3c-hci/hci.h |  3 +-
  include/linux/i3c/master.h            | 20 +++++++
  4 files changed, 110 insertions(+), 69 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index fd81871609d9..fa2532dcf62a 100644
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
@@ -1727,6 +1728,79 @@ int i3c_master_do_daa(struct 
i3c_master_controller *master)
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
+ * Unmap buffer and cleanup DMA transfer descriptor
+ */
+void i3c_master_dma_unmap_single(struct device *dev, struct i3c_dma 
*dma_xfer)
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
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c 
b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 20e1b405244e..af1c9c97fb3d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -354,50 +354,6 @@ static int hci_dma_init(struct i3c_hci *hci)
  	return ret;
  }

-static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
-					 struct hci_xfer *xfer)
-{
-	struct hci_rings_data *rings = hci->io_data;
-
-	if (!is_vmalloc_addr(xfer->data) &&
-	    (!device_iommu_mapped(rings->sysdev) ||
-	     !xfer->rnw ||
-	     xfer->data_len == ALIGN(xfer->data_len, 4)))
-		/* Bounce buffer not required for this transfer */
-		return xfer->data;
-
-	if (xfer->rnw)
-		/*
-		 * Round up the receive bounce buffer length to a multiple of
-		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
-		 * transfers may corrupt the last DWORD when transfer length is
-		 * not a multiple of DWORDs. This was observed when the device
-		 * DMA is IOMMU mapped or when an I3C target device returns
-		 * less data than requested. Latter case is less severe and
-		 * does not exceed the requested number of bytes, assuming the
-		 * device DMA is not IOMMU mapped.
-		 */
-		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
-					   GFP_KERNEL);
-	else
-		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
-					   GFP_KERNEL);
-
-	return xfer->bounce_buf;
-}
-
-static void hci_dma_free_safe_xfer_buf(struct i3c_hci *hci,
-				       struct hci_xfer *xfer)
-{
-	if (xfer->bounce_buf == NULL)
-		return;
-
-	if (xfer->rnw)
-		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
-
-	kfree(xfer->bounce_buf);
-}
-
  static void hci_dma_unmap_xfer(struct i3c_hci *hci,
  			       struct hci_xfer *xfer_list, unsigned int n)
  {
@@ -409,10 +365,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
  		xfer = xfer_list + i;
  		if (!xfer->data)
  			continue;
-		dma_unmap_single(rings->sysdev,
-				 xfer->data_dma, xfer->data_len,
-				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
-		hci_dma_free_safe_xfer_buf(hci, xfer);
+		i3c_master_dma_unmap_single(rings->sysdev, xfer->dma);
  	}
  }

@@ -423,7 +376,6 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
  	struct hci_rh_data *rh;
  	unsigned int i, ring, enqueue_ptr;
  	u32 op1_val, op2_val;
-	void *buf;

  	/* For now we only use ring 0 */
  	ring = 0;
@@ -434,6 +386,9 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
  	for (i = 0; i < n; i++) {
  		struct hci_xfer *xfer = xfer_list + i;
  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
+		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
+							  DMA_TO_DEVICE;
+		bool need_bounce;

  		/* store cmd descriptor */
  		*ring_data++ = xfer->cmd_desc[0];
@@ -452,27 +407,20 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,

  		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
  		if (xfer->data) {
-			buf = hci_dma_alloc_safe_xfer_buf(hci, xfer);
-			if (buf == NULL) {
-				hci_dma_unmap_xfer(hci, xfer_list, i);
-				return -ENOMEM;
-			}
-
-			xfer->data_dma =
-				dma_map_single(rings->sysdev,
-					       buf,
-					       xfer->data_len,
-					       xfer->rnw ?
-						  DMA_FROM_DEVICE :
-						  DMA_TO_DEVICE);
-			if (dma_mapping_error(rings->sysdev,
-					      xfer->data_dma)) {
-				hci_dma_free_safe_xfer_buf(hci, xfer);
+			need_bounce = device_iommu_mapped(rings->sysdev) &&
+				      xfer->rnw &&
+				      xfer->data_len != ALIGN(xfer->data_len, 4);
+			xfer->dma = i3c_master_dma_map_single(rings->sysdev,
+							      xfer->data,
+							      xfer->data_len,
+							      need_bounce,
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
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h 
b/drivers/i3c/master/mipi-i3c-hci/hci.h
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
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c67922ece617..76e8174eecb0 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -553,6 +553,22 @@ struct i3c_master_controller {
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
@@ -570,6 +586,10 @@ int i3c_master_get_free_addr(struct 
i3c_master_controller *master,
  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
  				  u8 addr);
  int i3c_master_do_daa(struct i3c_master_controller *master);
+struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
+					  size_t len, bool dma_safe,
+					  enum dma_data_direction dir);
+void i3c_master_dma_unmap_single(struct device *dev, struct i3c_dma 
*dma_xfer);

  int i3c_master_set_info(struct i3c_master_controller *master,
  			const struct i3c_device_info *info);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
