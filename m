Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E64606A330
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 06:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=skZ6KGyh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0OG1t4wrD0oCGWd5dn9V4VHy04sXTnaUjSFrwpZlJ0A=; b=skZ6KGyh/ozz2AITFRi1TVT816
	sOD4Prd3sXjzU1D1rvUR76suZhm/mtocSmXEnp6EJ9Wlssow2woH5Hsxzd0J8nWDN3zFIgbCE7TMi
	jf352kpoPUp2y2Pq8lwKXXwWhS59OXMlMGyZj+aIQ+40vxf0lUO37O0VzKhnEyd/fTDK2T/fuIrHz
	XrJqWsnh1rKdj5G/maKlkSJXW6bcygbB1NEUIbtJXu+v1dZk1OCn9QKL0XGyca4S2Z+93L9HTIe1c
	UIWiVstgnHEMUZtApPFwQkFKTr7jIcITtEInMFGb4HJd8csSXEe5MrE9rzzwvLfwpawlEK7ZRmcXa
	p4qyQHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpuW-0000000F5jM-2Zv0;
	Fri, 27 Nov 2026 06:58:20 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpuU-0000000F5j0-3TxU
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 06:58:20 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 27 Nov
 2026 14:58:16 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 27 Nov 2026 14:58:16 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 27 Nov 2026 14:58:15 +0800
Subject: [PATCH v2] i3c: master: mark OF bus child nodes OF_POPULATED to
 avoid legacy I2C rescan
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261127-i3c-master-of-populated-v2-1-c52095d00218@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAAYqCWsC/4WNQQ6CMBBFr0Jm7Rg6CARX3sOwKO0gkwht2ko0h
 LtbuYDL95L//gaRg3CEa7FB4FWiuCUDnQowk14ejGIzA5XUKEUtSmVw1jFxQDeid/711IktEo9
 la2gY2ksFee0Dj/I+yvc+8yQxufA5jlb1s/+bq0KF1FnSja7rsjM3HT2zTWyms3Ez9Pu+fwFG/
 VRgwwAAAA==
X-Change-ID: 20261127-i3c-master-of-populated-2ef07c2bb743
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Peter Yin <peteryin.openbmc@gmail.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795762696; l=6039;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=xY5ZfoNHCn0aTxv+yky7pXKjzC/vhosSIilqhNBKimc=;
 b=2tKXCBdJQRK7HHXTH711lmTSeGEbyHLwF3LspHhh2+F5wlk8xzfkltR4bWR/mCNu5y4N7wfJp
 oni3Jk9XurNCz+nEZCJCQ90ox5tggushBOCG/V3p2mpHqcO2UNbI0yk
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_225818_880572_B2745505 
X-CRM114-Status: GOOD (  16.11  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit f26ecaa0f0ab ("i3c: master: dw-i3c: Fix missing of_node for
virtual I2C adapter") made the DesignWare I3C master's virtual legacy
I2C adapter reuse the I3C bus platform device's of_node, so consumers
can resolve the adapter by phandle. i2c_register_adapter() reacts to
any adapter with a non-NULL of_node by unconditionally calling
of_i2c_register_devices(), which walks every child of that node and
requires a "compatible" property to build a modalias.

The I3C core already owns and fully parses every child of the bus node
via fwnode_populate_i3c_bus()/i3c_master_add_of_dev(), for both native
I3C devices (no "compatible" needed per the i3c.yaml binding) and
legacy-I2C-under-I3C devices (registered explicitly through
master->boardinfo.i2c in i3c_master_i2c_adapter_init()). Since neither
path marks the node OF_POPULATED, the generic of_i2c_register_devices()
walk that now runs afterwards treats every child as unclaimed:

 - native I3C-only nodes have no "compatible", so of_i2c_get_board_info()
   fails the modalias lookup and logs "of_i2c: modalias failure" /
   "Failed to create I2C device" noise for a device that is already
   correctly registered on the I3C bus.

 - legacy-I2C nodes do have "compatible", so of_i2c_register_devices()
   silently creates a duplicate i2c_client for the same address that
   i3c_master_i2c_adapter_init() also registers from boardinfo.i2c.

Mark each OF bus child OF_POPULATED once i3c_master_add_of_dev() has
accounted for it. ACPI-described children are left untouched, since
OF_POPULATED and of_i2c_register_devices() only apply to the
devicetree case. fwnode_populate_i3c_bus() always runs before the I2C
adapter is registered, so of_i2c_register_devices() sees the flag
already set and skips these nodes entirely, without disturbing the
of_node propagation from f26ecaa0f0ab.

OF_POPULATED is a property of the device_node itself, which outlives
this master's registration. fwnode_depopulate_i3c_bus() is the
counterpart that clears the flag again, called from
i3c_master_bus_cleanup() (shared by the registration error path and
i3c_master_unregister()) and from fwnode_populate_i3c_bus()'s own
error path. Without it, the nodes stay claimed after this master is
unbound or fails to register, and a later re-probe or rebind finds
them already marked and silently skips creating their devices.

Fixes: f26ecaa0f0ab ("i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter")
Cc: stable@vger.kernel.org
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Also clear OF_POPULATED again on teardown and on a mid-loop probe
  failure (fwnode_depopulate_i3c_bus(), called from
  i3c_master_bus_cleanup() and from fwnode_populate_i3c_bus()'s own
  error path), so unregister/rebind and a failed probe do not leave OF
  bus children permanently marked.
- Link to v1: https://lore.kernel.org/r/20261127-i3c-master-of-populated-v1-1-29d2a6a5509c@aspeedtech.com
---
 drivers/i3c/master.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 01e05bad8661..e85307678fdc 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2667,6 +2667,8 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	return ret;
 }
 
+static void fwnode_depopulate_i3c_bus(struct i3c_master_controller *master);
+
 static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
 {
 	if (master->ops->bus_cleanup) {
@@ -2681,6 +2683,7 @@ static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
 		}
 	}
 
+	fwnode_depopulate_i3c_bus(master);
 	i3c_master_detach_free_devs(master);
 }
 
@@ -3353,15 +3356,29 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 		return 0;
 
 	fwnode_for_each_available_child_node_scoped(fwnode, child) {
-		if (is_of_node(child))
+		if (is_of_node(child)) {
 			ret = i3c_master_add_of_dev(master, child);
-		else if (is_acpi_device_node(child))
-			ret = i3c_master_add_acpi_dev(master, child);
-		else
-			continue;
+			if (ret) {
+				fwnode_depopulate_i3c_bus(master);
+				return ret;
+			}
 
-		if (ret)
-			return ret;
+			/*
+			 * Claim the node so that i2c_register_adapter(),
+			 * called later for the legacy I2C adapter sharing
+			 * this same of_node, does not also run
+			 * of_i2c_register_devices() on it: every child here
+			 * is already fully accounted for, whether it ends up
+			 * I3C or legacy-I2C boardinfo.
+			 */
+			of_node_set_flag(to_of_node(child), OF_POPULATED);
+		} else if (is_acpi_device_node(child)) {
+			ret = i3c_master_add_acpi_dev(master, child);
+			if (ret) {
+				fwnode_depopulate_i3c_bus(master);
+				return ret;
+			}
+		}
 	}
 
 	/*
@@ -3378,6 +3395,26 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 	return 0;
 }
 
+/*
+ * Counterpart to fwnode_populate_i3c_bus(): drop the OF_POPULATED claim on
+ * every OF bus child so a later re-probe of this master, or the legacy I2C
+ * adapter's of_i2c_register_devices() walk on a different master sharing
+ * the same of_node, does not find these nodes permanently locked out.
+ * ACPI-described children were never marked, so they are skipped here too.
+ */
+static void fwnode_depopulate_i3c_bus(struct i3c_master_controller *master)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(&master->dev);
+
+	if (!fwnode)
+		return;
+
+	fwnode_for_each_available_child_node_scoped(fwnode, child) {
+		if (is_of_node(child))
+			of_node_clear_flag(to_of_node(child), OF_POPULATED);
+	}
+}
+
 static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 				       struct i2c_msg *xfers, int nxfers)
 {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261127-i3c-master-of-populated-2ef07c2bb743

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
