Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A585CD5BC9
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e77VxuTnIiVRBCRmxC6OWyEZ5c2UAgSeHZG2N2VMn7A=; b=rarmhhesVjyily
	SI9ezBpdGigpm8d140APvzXsY1lawMS+YoqsFsKECuU7RF4nodOcgZlVyI3nenM2FoCe/CklzvycR
	JYm1SQhq0iynkOVGp8YrKfk+pPo48FdLxh7KU58uU+8yWaco+gzoDvImPtYKovem+RURX9pl8FgQp
	1J8LfOlirxLAvxwfhvoLclaxfuwmWmfLaqR1LVC1oN4SCz2GkT2m2Us0ydwSK65vdGrQmwhY045ZR
	sDE7KiFzilz4HQOGTdm8T4ZCYzUoSeZXIEQooOFrvKB9L0qFlxW6fosh4pae7rvMah33FSqizNRya
	BGVGkPikCiWcLkMfmvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCR0-000000040EQ-0DIR;
	Wed, 27 May 2026 11:28:26 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQx-0000000407g-3ESs
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 11:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779881304; x=1811417304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UdVzoX6TAvkxJCmAld800Acbx2BqoaWKE7AJ/0JgK4c=;
  b=O7TtLkuFr/k7GiW07hJf3RnalovWIf+9GwClgh8/gJ8+nNNqQd8NkxnN
   QDt5/4v1XLg8ko2dwanF2V1bWb//0ZAyoCSpZBbBjIQdgWEHcXoCm45XW
   mL6eGVHVy5HBAaSOG5UBsZsmOJcDmFJymRcT3Gef9f3f6OxlUgVhufmJF
   Afh4dfsbTCcSiSen3FsiURVilxDmu6QRdGgaeYjri3y8KFsGV6c0gx0zx
   G14co/HjHs46A3Ud+fmNLQqOcBbj8gyuUWB1mbar05ONnEQYHeRsqiezj
   CY73QBR2QQ8GQmpljtCZ9MhNC9qXrBGSpvbMoqRnlxaVCurw014QWWN8t
   g==;
X-CSE-ConnectionGUID: Y4TYxHB2QfS1xgy1nTfiwA==
X-CSE-MsgGUID: VAtzt/qMRZOa+nzp91yR1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103381747"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="103381747"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:23 -0700
X-CSE-ConnectionGUID: R4p11NR6R5+EORFJCibY3Q==
X-CSE-MsgGUID: JdJrSb8URbWlMQRAMAEH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246238660"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.228])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:21 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] i3c: master: Reconcile dynamic addresses after DAA
Date: Wed, 27 May 2026 14:27:58 +0300
Message-ID: <20260527112758.38530-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260527112758.38530-1-adrian.hunter@intel.com>
References: <20260527112758.38530-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_042823_860172_64F63572 
X-CRM114-Status: GOOD (  27.23  )
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
 drivers/i3c/master.c | 114 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 69e19c56f9a5..9f91c46b52ef 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -7,6 +7,7 @@
 
 #include <linux/atomic.h>
 #include <linux/bug.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -1613,6 +1614,56 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
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
@@ -2256,22 +2307,25 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
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
@@ -2282,6 +2336,18 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
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
@@ -2399,6 +2465,8 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
 	i3c_master_free_i3c_dev(newdev);
 
 err_prevent_addr_reuse:
+	if (no_dev)
+		return;
 	/*
 	 * Although the device has not been added, the address has been
 	 * assigned. Prevent the address from being used again.
@@ -2406,8 +2474,45 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
 	i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_I3C_DEV);
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
+	/* Mark all devices' dynamic addresses in the bitmap */
+	bitmap_zero(dev_dyn_addrs, I2C_MAX_ADDR + 1);
+	i3c_bus_for_each_i3cdev(&master->bus, desc)
+		__set_bit(desc->info.dyn_addr, dev_dyn_addrs);
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
@@ -2441,6 +2546,11 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
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
