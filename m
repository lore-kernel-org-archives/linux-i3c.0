Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117CECD5BBF
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 06:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoSoHhAloiC3Xo97kZ8+p4G0GQlAtACDLLoxCuO/Kuk=; b=20oB63nm9Dqk/i
	KZUk+2itiou7Vds44WGJFrqKdZD0yit7NkPCdLpqfwx/m72Vid6xjjz7DCduNCroC7Ett2yvY0qsE
	8267EKgfI2z8B9UwyHCmr8Sn6CPiikdwFbUOaCTEMhqfNAF2gl2YnlCGV6RxktXP/24zSaACrMK9e
	Yra5OcdlQtpoSBh9gQsEHDN85cgSNFNbfp3/cBkapsMsHMzgZSj60kLaFYhVEdCGUXPwZWTagsNOd
	DJIPg/OnqPAOgiwpx6uNzCpiLnne/qrSKHFVal2lRLB95f5vvP2W+RfkhWqZKa06MGcuUBS0hDNj3
	TWydUkqV+l6j11jFlpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRP1D-0000000GRnE-3N9w;
	Mon, 25 May 2026 06:42:31 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRP18-0000000GRjl-2LBr
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 06:42:28 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 31BE91A2CD8;
	Mon, 25 May 2026 08:42:25 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E92C61A2CD6;
	Mon, 25 May 2026 08:42:24 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 977AD1800086;
	Mon, 25 May 2026 14:42:23 +0800 (+08)
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
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v10 3/9] i3c: master: Add APIs for I3C hub support
Date: Mon, 25 May 2026 12:12:03 +0530
Message-Id: <20260525064209.2263045-4-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_234226_859929_9AFA5B18 
X-CRM114-Status: GOOD (  20.18  )
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

Add helpers for attaching and detaching I3C devices and CCC helpers
to check CCC support and send CCC commands. These additions prepare
for I3C hub support.

The attach and detach helpers must be called with the bus lock held in
write mode.

1) i3c_master_direct_attach_i3c_dev_locked()
2) i3c_master_direct_detach_i3c_dev_locked()
3) i3c_master_send_ccc_cmd()
4) i3c_master_supports_ccc_cmd()

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

---
Changes in v10:
 - Rename i3c_master_direct_attach_i3c_dev and i3c_master_direct_detach_i3c_dev
   APIs to *_locked, as these APIs must be called with the bus lock held in
   write mode

Changes in v9:
 - No change

Changes in v8:
 - No change

Changes in v7:
 - Update commit message to clarify purpose (prepare for I3C hub support)

Changes in v6:
 - Split the patch into two parts:
        1) expose the existing API
        2) add new APIs.
---
---
 drivers/i3c/master.c       | 107 +++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |   7 +++
 2 files changed, 114 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0636e3e21758..4e659435df72 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1652,6 +1652,63 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
+/**
+ * i3c_master_direct_attach_i3c_dev_locked() - attach an I3C device to a master
+ * @master: I3C master controller to attach the device to
+ * @dev: I3C device descriptor representing the device
+ *
+ * This function attaches an I3C device to its master controller once the
+ * device has a valid address on the bus. Devices without an assigned address
+ * are ignored. The master device itself is never attached through this bus.
+ *
+ * Context: Caller must hold master->bus.lock in write mode.
+ *
+ * Return: 0 on success, or a negative error code if the attach operation
+ *         fails in the master controller driver.
+ */
+int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
+					    struct i3c_dev_desc *dev)
+{
+	int ret = 0;
+
+	/*
+	 * We don't attach devices to the controller until they are
+	 * addressable on the bus.
+	 */
+
+	if (!dev->info.static_addr && !dev->info.dyn_addr)
+		return -EINVAL;
+
+	/* Do not attach the master device itself. */
+	if (master->this != dev && master->ops->attach_i3c_dev)
+		ret = master->ops->attach_i3c_dev(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
+
+/**
+ * i3c_master_direct_detach_i3c_dev_locked() - Detach an I3C device from its
+ * master controller.
+ * @dev: I3C device descriptor to be detached
+ *
+ * This function detaches an I3C device from its master controller.
+ * It ensures that the master itself is not detached. If the device is not
+ * the master and the master controller provides a detach operation,
+ * the detach callback is invoked to perform the actual removal.
+ *
+ * Context: Caller must hold master->bus.lock in write mode.
+ */
+void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	/* Do not detach the master device itself. */
+	if (master->this != dev && master->ops->detach_i3c_dev)
+		master->ops->detach_i3c_dev(dev);
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);
+
 /**
  * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with a new address
  * @dev: I3C device descriptor to reattach
@@ -1816,6 +1873,56 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
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
  * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
  * @master: controller
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 355e9b3d9ae3..1829f2e08bfb 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -615,6 +615,13 @@ DEFINE_FREE(i3c_master_dma_unmap_single, void *,
 
 int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
 				       u8 old_dyn_addr);
+int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
+					    struct i3c_dev_desc *dev);
+void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev);
+int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
+			    struct i3c_ccc_cmd *cmd);
+int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				const struct i3c_ccc_cmd *cmd);
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
