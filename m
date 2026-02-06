Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81814EE208C
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Feb 2026 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jPzl74uHyf36zymT22llm0DpTZvzqdho7P/lq5MIf00=; b=N42jSocz1Xo443
	ERo/kuWWOO3MS/DA9H9uDJ6zHhP6SoRPyGPC1CIdXst6+2B2gwTsUTeC7Ps3PbXgzH+Vq55z+WdrM
	0QO8AgH56CLC7k3ZQvyn/UNobc5xzMfX4prnHefLJXlfEcyK7OloqLiWVK5pSpcY7eDvQEsJi9Bpr
	75ysUCu4pM4mbf9mYkrC6E7NldDVTNdCiWDGwHTLk5AsG9e36WVn/Leot22niRV1adwJShlKjKTcm
	Qu6bXPzICsGIq8Hf1lK3PLRgScZrRL52dUJ9jlgk2paI7s7/ptfxDrppiMwxXWBBQJEW9cqv7PM2P
	m8wu1eJ1X1SPP4+5BUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKWl-0000000BH7p-144W;
	Fri, 06 Feb 2026 12:01:35 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKWi-0000000BH71-15Av
	for linux-i3c@lists.infradead.org;
	Fri, 06 Feb 2026 12:01:33 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4963B1A2585;
	Fri,  6 Feb 2026 13:01:27 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3BED71A073A;
	Fri,  6 Feb 2026 13:01:27 +0100 (CET)
Received: from lsv15573.swis.ro-buh01.nxp.com (lsv15573.swis.ro-buh01.nxp.com [10.172.0.77])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 31A75202AB;
	Fri,  6 Feb 2026 13:01:25 +0100 (CET)
From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
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
	shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: [PATCH v5 1/5] i3c: master: Expose the APIs to support I3C hub
Date: Fri,  6 Feb 2026 14:01:17 +0200
Message-Id: <20260206120121.856471-1-aman.kumarpandey@nxp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_040132_566585_B74211F3 
X-CRM114-Status: GOOD (  20.75  )
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

Expose i3c_master_send_ccc_cmd(), i3c_master_supports_ccc_cmd(),
i3c_master_reattach_i3c_dev(), i3c_master_direct_attach_i3c_dev(),
and i3c_master_direct_detach_i3c_dev() to support I3C hub.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

---
Changes in v5: 
 - No change

Changes in v4:
 - Updated I3C master to handle hub support
---
---
 drivers/i3c/master.c       | 123 ++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/master.h |  11 ++++
 2 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f606c871648..c92152ff795f 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1544,8 +1544,76 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
-				       u8 old_dyn_addr)
+/**
+ * i3c_master_direct_attach_i3c_dev() - attach an I3C device to a master
+ * @master: I3C master controller to attach the device to
+ * @dev: I3C device descriptor representing the device
+ *
+ * This function attaches an I3C device to its master controller once the
+ * device has a valid address on the bus. Devices without
+ * an assigned address are ignored. The master device itself is never
+ * attached through this bus.
+ *
+ * Return: 0 on success, or a negative error code if the attach operation
+ *         fails in the master controller driver.
+ */
+int i3c_master_direct_attach_i3c_dev(struct i3c_master_controller *master,
+				     struct i3c_dev_desc *dev)
+{
+	int ret = 0;
+
+	/*
+	 * We don't attach devices to the controller until they are
+	 * addressable on the bus.
+	 */
+
+	if (!dev->info.static_addr && !dev->info.dyn_addr)
+		return 0;
+
+	/* Do not attach the master device itself. */
+	if (master->this != dev && master->ops->attach_i3c_dev)
+		ret = master->ops->attach_i3c_dev(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev);
+
+/**
+ * i3c_master_direct_detach_i3c_dev - Detach an I3C device from its master
+ * @dev: I3C device descriptor to be detached
+ *
+ * This function detaches an I3C device from its master controller.
+ * It ensures that the master itself is not detached. If the device is not
+ * the master and the master controller provides a detach operation,
+ * the detach callback is invoked to perform the actual removal.
+ */
+void i3c_master_direct_detach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	/* Do not detach the master device itself. */
+	if (master->this != dev && master->ops->detach_i3c_dev)
+		master->ops->detach_i3c_dev(dev);
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev);
+
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
@@ -1569,6 +1637,7 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev);
 
 static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
 {
@@ -1692,6 +1761,56 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+/**
+ * i3c_master_supports_ccc_cmd() - check CCC command support
+ * @master: I3C master controller
+ * @cmd: CCC command to verify
+ *
+ * This function verifies whether the given I3C master controller supports
+ * the specified Common Command Code (CCC).
+ *
+ * Return: 0 if the CCC command is supported and executed successfully,
+ *         -EINVAL if arguments are invalid,
+ *         -EOPNOTSUPP if the master does not support CCC commands,
+ *         or another negative error code from the master's operation.
+ */
+int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				const struct i3c_ccc_cmd *cmd)
+{
+	if (!cmd || !master)
+		return -EINVAL;
+
+	if (!master->ops->supports_ccc_cmd)
+		return -EOPNOTSUPP;
+
+	return master->ops->supports_ccc_cmd(master, cmd);
+}
+EXPORT_SYMBOL_GPL(i3c_master_supports_ccc_cmd);
+
+/**
+ * i3c_master_send_ccc_cmd() - send a CCC command
+ * @master: I3C master controller issuing the command
+ * @cmd: CCC command to be sent
+ *
+ * This function sends a Common Command Code (CCC) command to devices on the
+ * I3C bus. It acquires the bus maintenance lock, executes the command, and
+ * then releases the lock to ensure safe access to the bus.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
+			    struct i3c_ccc_cmd *cmd)
+{
+	int ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+	ret = i3c_master_send_ccc_cmd_locked(master, cmd);
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_send_ccc_cmd);
+
 /**
  * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
  * @master: master doing the DAA
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 58d01ed4cce7..b059da7777d7 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -602,6 +602,17 @@ void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
 DEFINE_FREE(i3c_master_dma_unmap_single, void *,
 	    if (_T) i3c_master_dma_unmap_single(_T))
 
+int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
+			    struct i3c_ccc_cmd *cmd);
+
+int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				const struct i3c_ccc_cmd *cmd);
+
+int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
+				u8 old_dyn_addr);
+int i3c_master_direct_attach_i3c_dev(struct i3c_master_controller *master,
+				     struct i3c_dev_desc *dev);
+void i3c_master_direct_detach_i3c_dev(struct i3c_dev_desc *dev);
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
