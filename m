Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F08CD8CB9
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jun 2026 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJBdMWMO0VBxwMiQvHRx9bQhcl9aI4JDBDCH44zLGZk=; b=gY60SrR8byIp1V
	YUii2gNc6MjvtlL7OGPWl09OZZjf+wxIrBDuQK86wQ2MbrFBsmGpKycYu5usjRDolieavX+Hys0Hi
	YcZ2TCXHn5G3dV2/yhaKsJRYTJLq1vk1/tjc0QNGGcrzjoRhGCfrWqc/us7bcQTNC1pdmG9rVle0S
	/QND6fR5PFtNPqPsC79z3IcIVQaVYoMGyTC9OjnhReDEv3wWwZFT/mk5pmaKkCAL/D/Z2XKEVANZ/
	05rLwwqFCmhPzCP0XeJlNJGhMwLkFmwHNht3Crsa3q29ZJLvdCWD2+o3hNzlZWcg+siIAriHRf+U/
	lhW1WtMZfpwRoz5wIHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDPH-00000006xe7-1ssN;
	Wed, 10 Jun 2026 07:31:23 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDPB-00000006xcz-34lD
	for linux-i3c@lists.infradead.org;
	Wed, 10 Jun 2026 07:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781076677; x=1812612677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k42iJN0x/JU2YmSQpr+aLwWp1U6k8l482wmBhkIL+bE=;
  b=igseiLqsgvdW2UM+mlBC40DbnsCMSV5L1aWk5AnTipKz7ATJSxRZv3f3
   nJNp7jYXITiQK4GkL3R/otZ3665UJit3xmyM6IB4+K7Mad06YZOzMAeX/
   KxyBJuxnJO+np4PIsoJ1tyOcRG/Bm4xOmwA47juC5Zjz01576hnXdHg7s
   1Os+yyGGJBddliowNFY5BQVHvpFiFCi2EoXPPAJR2gVtBMnq9x7Lko+hZ
   aD0/BbM30TKPeHlV6psT6jq+vXkCK54ZVpu1nRwuQdY3glmzhPPZZs9HC
   qjYA3X9RZjm+9rJOywweTia0OYrgxPMwo1jc/ep0Yv6gPDwSvcJGt5YWS
   w==;
X-CSE-ConnectionGUID: tNhHBmr2SDibh0w97ZqYzQ==
X-CSE-MsgGUID: SseueWPCQE6LmLuZqZ5v3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80878444"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80878444"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:21 -0700
X-CSE-ConnectionGUID: ro8YA2TZQqaG8Nejz3bpCQ==
X-CSE-MsgGUID: NLoaSMfbSc6TcezbdrvnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270103496"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 7/7] i3c: master: Reconcile dynamic addresses after DAA
Date: Wed, 10 Jun 2026 10:28:52 +0300
Message-ID: <20260610072852.36934-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260610072852.36934-1-adrian.hunter@intel.com>
References: <20260610072852.36934-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_003117_793188_94AAA433 
X-CRM114-Status: GOOD (  28.01  )
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

After Dynamic Address Assignment (DAA), there may be cases where
devices have been assigned dynamic addresses on the bus, but are not
successfully registered in the device model.  This can happen, for
example, if errors occur during device addition, leaving the bus state
and software state inconsistent.

Introduce a reconciliation step to resolve such inconsistencies.

Scan all address slots marked as I3C devices by the bus, and compare
them against the set of devices currently registered.  For any dynamic
address that is marked occupied but has no corresponding i3c_dev_desc,
probe for device presence using a GETSTATUS CCC.

Retry the probe (with exponential backoff delay) to handle transient NACK
conditions.  If a device responds, register it via
i3c_master_add_i3c_dev_locked().  Otherwise, free the address
slot so it may be reused in future DAA operations.

Note, i3c_master_add_i3c_dev_locked() may fail (again), in which case the
dynamic address remains marked as occupied.  A future DAA will try again.

This also handles a corner case where a device is assigned a dynamic
address but not successfully added, and subsequently loses that address
(e.g. due to power management).  If DAA is run again, the device may
receive a new dynamic address while the old one remains marked as
occupied.  Repeated occurrences of this scenario could eventually
exhaust the dynamic address space.  The reconciliation step ensures that
stale addresses are detected and freed, preventing address leakage.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Add comment about the source of I3C_DEV_PROBE_* macro values.
	Also account for static_addr in i3c_master_reconcile_dyn_addrs()

Changes in V2:

	Add bitmap.h include for bitmap_zero() etc.
	Re-base due to changes in previous patches.


 drivers/i3c/master.c | 119 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5021d25b718a..367e0d6d4a64 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/bitmap.h>
 #include <linux/bug.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -1613,6 +1615,57 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
 	return 0;
 }
 
+static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
+				       u8 addr, u16 *status)
+{
+	struct i3c_ccc_getstatus *getstatus;
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	getstatus = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*getstatus));
+	if (!getstatus)
+		return -ENOMEM;
+
+	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETSTATUS, &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	if (ret)
+		goto out;
+
+	if (dest.payload.len != sizeof(*getstatus)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	if (status)
+		*status = be16_to_cpu(getstatus->status);
+out:
+	i3c_ccc_cmd_dest_cleanup(&dest);
+
+	return ret;
+}
+
+/* Values are chosen to give the device plenty of opportunities to respond */
+#define I3C_DEV_PROBE_INITIAL_DELAY_US	20
+#define I3C_DEV_PROBE_DELAY_FACTOR	2
+#define I3C_DEV_PROBE_CNT		5
+
+static bool i3c_master_i3c_dev_present(struct i3c_master_controller *master, unsigned int addr)
+{
+	int delay = I3C_DEV_PROBE_INITIAL_DELAY_US;
+
+	for (int i = 0; i < I3C_DEV_PROBE_CNT; i++) {
+		if (i) {
+			fsleep(delay);
+			delay *= I3C_DEV_PROBE_DELAY_FACTOR;
+		}
+		if (!i3c_master_getstatus_locked(master, addr, NULL))
+			return true;
+	}
+
+	return false;
+}
+
 static void i3c_master_put_i3c_addrs(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
@@ -2256,22 +2309,25 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 }
 
 /**
- * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
+ * __i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
  * @master: master used to send frames on the bus
  * @addr: I3C slave dynamic address assigned to the device
+ * @probe: probe to see if the device is really present at @addr
  *
  * This function instantiates an I3C device object and adds it to the I3C device
  * list. All device information is retrieved using standard CCC commands.
  *
  * This function must be called with the bus lock held in write mode.
  */
-void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr)
+static void __i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
+					    u8 addr, bool probe)
 {
 	struct i3c_device_info info = { .dyn_addr = addr };
 	struct i3c_dev_desc *newdev, *olddev;
 	u8 old_dyn_addr = addr, expected_dyn_addr;
 	struct i3c_ibi_setup ibireq = { };
 	bool enable_ibi = false;
+	bool no_dev = false;
 	int ret;
 
 	newdev = i3c_master_alloc_i3c_dev(master, &info);
@@ -2284,6 +2340,18 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
 	if (ret)
 		goto err_free_dev;
 
+	/*
+	 * When a dynamic address is first assigned, there is no need to check
+	 * whether it is still assigned, however, if adding the device fails,
+	 * it will be attempted again later, at which point the address may
+	 * have been lost (e.g. due to power management), so for that case,
+	 * probe to see if the device is still present at the assigned address.
+	 */
+	if (probe && !i3c_master_i3c_dev_present(master, addr)) {
+		no_dev = true;
+		goto err_detach_dev;
+	}
+
 	ret = i3c_master_retrieve_dev_info(newdev);
 	if (ret)
 		goto err_detach_dev;
@@ -2401,6 +2469,8 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
 	i3c_master_free_i3c_dev(newdev);
 
 err_prevent_addr_reuse:
+	if (no_dev)
+		return;
 	/*
 	 * Although the device has not been added, the address has been
 	 * assigned. Prevent the address from being used again.
@@ -2410,8 +2480,48 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
 
 	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
 }
+
+/**
+ * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
+ * @master: master used to send frames on the bus
+ * @addr: I3C slave dynamic address assigned to the device
+ *
+ * This function instantiates an I3C device object and adds it to the
+ * I3C device list. All device information is automatically retrieved using
+ * standard CCC commands.
+ *
+ * This function must be called with the bus lock held in write mode.
+ */
+void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr)
+{
+	__i3c_master_add_i3c_dev_locked(master, addr, false);
+}
 EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 
+static void i3c_master_reconcile_dyn_addrs(struct i3c_master_controller *master)
+{
+	DECLARE_BITMAP(dev_dyn_addrs, I2C_MAX_ADDR + 1);
+	enum i3c_addr_slot_status status;
+	struct i3c_dev_desc *desc;
+
+	/* Mark all devices' dynamic and static addresses in the bitmap */
+	bitmap_zero(dev_dyn_addrs, I2C_MAX_ADDR + 1);
+	i3c_bus_for_each_i3cdev(&master->bus, desc) {
+		if (desc->info.static_addr)
+			__set_bit(desc->info.static_addr, dev_dyn_addrs);
+		__set_bit(desc->info.dyn_addr, dev_dyn_addrs);
+	}
+	/* Reconcile the bitmap with the bus address slot status */
+	for (unsigned int addr = 0; addr <= I2C_MAX_ADDR; addr++) {
+		status = i3c_bus_get_addr_slot_status(&master->bus, addr);
+		if (status != I3C_ADDR_SLOT_I3C_DEV || test_bit(addr, dev_dyn_addrs))
+			continue;
+		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_FREE);
+		/* Try to add the device, but probe to see if it is really present */
+		__i3c_master_add_i3c_dev_locked(master, addr, true);
+	}
+}
+
 /**
  * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
  * @master: controller
@@ -2445,6 +2555,11 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 		if (rstdaa)
 			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
 		ret = master->ops->do_daa(master);
+		/*
+		 * Handle cases where a dynamic address was assigned but the
+		 * device was not successfully added.
+		 */
+		i3c_master_reconcile_dyn_addrs(master);
 	}
 
 	i3c_bus_maintenance_unlock(&master->bus);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
