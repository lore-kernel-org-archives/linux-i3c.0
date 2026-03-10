Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC1DFCC9D2
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QINSH8rnPNcjJtZO6xVgqj5is0DKyxDLhN6/NMyzIoI=; b=qxgV97OxLtj7iY
	2MBpb6wab9pC38nfrvzHH7JcnoYxCyDLDnWmRCzxT6JjRYqeYEGRASDyCjwrzofQ0gIvi0Jd69Swx
	RT9MomElZFpPuVO4FtzzvwnjcOAg5b0B0/FhZI8JIksSypn1/U8RB8saq1qJHzxhm5aY7Wj2kQzOc
	/MdLwuX2tqrHPO/q0g1KNgXJBtGHRM/cAy1qzUJP38EAXKzr+HCmdxilVQGKif8/fmpTaGZSlpdb/
	8ntC2LCa3lA/Bu7Zi1QMJVp7d1G6jrdmjem3n6yVSjJkUVPlfHtVFG9mgLLq9HxO0hl6H655LLyuh
	58buCP9W5tP+ku6Sue6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzr29-00000008p5l-21qP;
	Tue, 10 Mar 2026 06:57:37 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzr26-00000008p4l-1xcM
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 06:57:35 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DBA62201F02;
	Tue, 10 Mar 2026 07:57:30 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B04ED201F1D;
	Tue, 10 Mar 2026 07:57:30 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 63D6A18000B0;
	Tue, 10 Mar 2026 14:57:29 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: [PATCH v6 1/7] i3c: master: Expose the APIs to support I3C hub
Date: Tue, 10 Mar 2026 12:27:21 +0530
Message-Id: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_235734_805142_9DBF872F 
X-CRM114-Status: GOOD (  17.47  )
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

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Expose the below APIs to support I3C hub.

1) i3c_dev_enable_ibi_locked()
2) i3c_dev_disable_ibi_locked()
3) i3c_dev_request_ibi_locked()
4) i3c_dev_free_ibi_locked()
5) i3c_master_reattach_i3c_dev()

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

---
Changes in v6:
 - Split the patch into two parts:
        1) expose the existing API
        2) add new APIs.

Changes in v5:
 - No change

Changes in v4:
 - Updated I3C master to handle hub support
---
---
 drivers/i3c/master.c       | 70 ++++++++++++++++++++++++++++++++++++--
 include/linux/i3c/master.h |  2 ++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2..886637757c26 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1619,8 +1619,23 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
-				       u8 old_dyn_addr)
+/**
+ * i3c_master_reattach_i3c_dev() - reattach an I3C device with a new address
+ * @dev: I3C device descriptor to reattach
+ * @old_dyn_addr: previous dynamic address of the device
+ *
+ * This function reattaches an existing I3C device to the bus when its dynamic
+ * address has changed. It updates the bus address slot status accordingly:
+ * - Marks the new dynamic address as occupied by an I3C device.
+ * - Frees the old dynamic address slot if applicable.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * Return: 0 on success, or a negative error code if reattachment fails
+ *         (e.g. -EBUSY if the new address slot is not free).
+ */
+int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
+				u8 old_dyn_addr)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
 	int ret;
@@ -1644,6 +1659,7 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev);
 
 static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
 {
@@ -3168,6 +3184,16 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
 	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
 }
 
+/**
+ * i3c_dev_disable_ibi() - Disable IBIs coming from a specific device
+ * @dev: device on which IBIs should be disabled
+ *
+ * This function disable IBIs coming from a specific device and wait for
+ * all pending IBIs to be processed.
+ *
+ * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
+ * Return: 0 in case of success, a negative error core otherwise.
+ */
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master;
@@ -3189,7 +3215,22 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);
 
+/**
+ * i3c_dev_enable_ibi_locked() - Enable IBIs from a specific device (lock held)
+ * @dev: device on which IBIs should be enabled
+ *
+ * This function enable IBIs coming from a specific device and wait for
+ * all pending IBIs to be processed. This should be called on a device
+ * where i3c_device_request_ibi() has succeeded.
+ *
+ * Note that IBIs from this device might be received before this function
+ * returns to its caller.
+ *
+ * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
+ * Return: 0 on success, or a negative error code on failure.
+ */
 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
@@ -3204,7 +3245,20 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_locked);
 
+/**
+ * i3c_dev_request_ibi() - Request an IBI
+ * @dev: device for which we should enable IBIs
+ * @req: setup requested for this IBI
+ *
+ * This function is responsible for pre-allocating all resources needed to
+ * process IBIs coming from @dev. When this function returns, the IBI is not
+ * enabled until i3c_device_enable_ibi() is called.
+ *
+ * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
+ * Return: 0 in case of success, a negative error core otherwise.
+ */
 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 			       const struct i3c_ibi_setup *req)
 {
@@ -3243,7 +3297,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i3c_dev_request_ibi_locked);
 
+/**
+ * i3c_dev_free_ibi() - Free all resources needed for IBI handling
+ * @dev: device on which you want to release IBI resources
+ *
+ * This function is responsible for de-allocating resources previously
+ * allocated by i3c_device_request_ibi(). It should be called after disabling
+ * IBIs with i3c_device_disable_ibi().
+ *
+ * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
+ */
 void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
@@ -3274,6 +3339,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 	kfree(dev->ibi);
 	dev->ibi = NULL;
 }
+EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
 
 static int __init i3c_init(void)
 {
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 592b646f6134..aeccec171e64 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -613,6 +613,8 @@ void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
 DEFINE_FREE(i3c_master_dma_unmap_single, void *,
 	    if (_T) i3c_master_dma_unmap_single(_T))
 
+int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
+				u8 old_dyn_addr);
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
