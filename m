Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E6CD8C8E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mPH5SisIrKjNsj1YD34yyrVgNCMI/yQYu61yrQBdjM=; b=S0D/NpxLJatPjD
	ImzNrGdpahHP4tlIqKpMHOljcTbgRIbjq8FHw1653VFa8rnhLRGUEVmXvqdB4ZqwZgc7j4gUcIBUq
	KIcc1hqgpLXrAXaJjkMmt5XQ2OUe+DXF9/79cQnjdzMxQxIaLHj0OFW8+hblZCrI1qtD5xo25tcau
	18rjRnmiwsGoZGaVH3uEWojsi0Q8CA5iJRWRlWtWfT7TmkdVzBQUR1Tx3AleI9q/H823HxqrmgGNC
	OQ7bbH5EMeNNZdinwxV7No5bibh9JTdC5jwI/vp9nHykF+6l/tHVVNnoCeiUlzX8Nlmtf/fVfIulh
	7R09AleQEuiUPazZibdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUsX-000000031X0-09e6;
	Mon, 08 Jun 2026 07:58:37 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUsV-000000031Us-0dQC
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 07:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780905516; x=1812441516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x2VXj/Nx4+/OXVgvZtsyp+fYeFTpnNAEdzB1IL8FNwk=;
  b=FaOEuUPs0e5S5WCHAnd27o4A7eGISm1wWsz75b4jmqxZCO/1A85fQz5q
   3gIQ3KmL4f3iJtbuy92GCp62onr2MfK4eQUutX3E6YbUxogM3Q9rY5BCl
   kxQ2CRD9BPZOTyy1ptI5XsjMDtL3SMeZtcPhXds4Dh9erAnJj/KW3ydq2
   7j+lSM6NLuveh8hQG11lpJLhInsLeRwOBKekDwySBkxAkyJ8UVT4lRGoY
   i+yAr+IxVqBdMh8VP7K2UfSpd1syWXxz3ZtJn0ElV8dumwjaasBi+R43q
   7XJsbm9yfwnm/9lGtHaE/9BYqmWGBINBtTSoO+Be6h8pEF9xaA+XJYmI8
   Q==;
X-CSE-ConnectionGUID: sP68fGhoRSmZXnIvOnXD8w==
X-CSE-MsgGUID: D1q/vSCWRMmF4LcU17gZ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85520180"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="85520180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:35 -0700
X-CSE-ConnectionGUID: i2sJbUHNRzukRfKknfgZGQ==
X-CSE-MsgGUID: FE3L0oZ8TnqSq0Am3n9cvA==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:33 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 6/7] i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_locked()
Date: Mon,  8 Jun 2026 10:57:59 +0300
Message-ID: <20260608075801.16111-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608075801.16111-1-adrian.hunter@intel.com>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_005835_232401_E576CE00 
X-CRM114-Status: GOOD (  15.60  )
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

Relocate i3c_master_do_daa_ext() and i3c_master_do_daa() so they appear
after i3c_master_add_i3c_dev_locked().

This ordering is required for upcoming changes where the DAA flow will
(indirectly) rely on i3c_master_add_i3c_dev_locked() functionality.
Reordering avoids forward dependency issues and keeps related code paths
logically arranged.

No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	None


 drivers/i3c/master.c | 128 +++++++++++++++++++++----------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 57857a3351c7..5021d25b718a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1870,70 +1870,6 @@ static void i3c_master_reg_work_fn(struct work_struct *work)
 	i3c_bus_normaluse_unlock(&master->bus);
 }
 
-/**
- * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
- * @master: controller
- * @rstdaa: whether to first perform Reset of Dynamic Addresses (RSTDAA)
- *
- * Perform Dynamic Address Assignment with optional support for System
- * Hibernation (@rstdaa is true).
- *
- * After System Hibernation, Dynamic Addresses can have been reassigned at boot
- * time to different values. A simple strategy is followed to handle that.
- * Perform a Reset of Dynamic Addresses (RSTDAA) followed by the normal DAA
- * procedure which has provision for reassigning addresses that differ from the
- * previously recorded addresses.
- *
- * Return: a 0 in case of success, an negative error code otherwise.
- */
-int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
-{
-	int rstret = 0;
-	int ret;
-
-	ret = i3c_master_rpm_get(master);
-	if (ret)
-		return ret;
-
-	i3c_bus_maintenance_lock(&master->bus);
-
-	if (master->shutting_down) {
-		ret = -ENODEV;
-	} else {
-		if (rstdaa)
-			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
-		ret = master->ops->do_daa(master);
-	}
-
-	i3c_bus_maintenance_unlock(&master->bus);
-
-	if (ret)
-		goto out;
-
-	queue_work(master->wq, &master->reg_work);
-out:
-	i3c_master_rpm_put(master);
-
-	return rstret ?: ret;
-}
-EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
-
-/**
- * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
- * @master: master doing the DAA
- *
- * This function instantiates I3C device objects and adds them to the
- * I3C device list. All device information is automatically retrieved using
- * standard CCC commands.
- *
- * Return: a 0 in case of success, an negative error code otherwise.
- */
-int i3c_master_do_daa(struct i3c_master_controller *master)
-{
-	return i3c_master_do_daa_ext(master, false);
-}
-EXPORT_SYMBOL_GPL(i3c_master_do_daa);
-
 /**
  * i3c_master_dma_map_single() - Map buffer for single DMA transfer
  * @dev: device object of a device doing DMA
@@ -2476,6 +2412,70 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
 }
 EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 
+/**
+ * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
+ * @master: controller
+ * @rstdaa: whether to first perform Reset of Dynamic Addresses (RSTDAA)
+ *
+ * Perform Dynamic Address Assignment with optional support for System
+ * Hibernation (@rstdaa is true).
+ *
+ * After System Hibernation, Dynamic Addresses can have been reassigned at boot
+ * time to different values. A simple strategy is followed to handle that.
+ * Perform a Reset of Dynamic Addresses (RSTDAA) followed by the normal DAA
+ * procedure which has provision for reassigning addresses that differ from the
+ * previously recorded addresses.
+ *
+ * Return: a 0 in case of success, an negative error code otherwise.
+ */
+int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
+{
+	int rstret = 0;
+	int ret;
+
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+
+	if (master->shutting_down) {
+		ret = -ENODEV;
+	} else {
+		if (rstdaa)
+			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+		ret = master->ops->do_daa(master);
+	}
+
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	if (ret)
+		goto out;
+
+	queue_work(master->wq, &master->reg_work);
+out:
+	i3c_master_rpm_put(master);
+
+	return rstret ?: ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
+
+/**
+ * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
+ * @master: master doing the DAA
+ *
+ * This function instantiates I3C device objects and adds them to the
+ * I3C device list. All device information is automatically retrieved using
+ * standard CCC commands.
+ *
+ * Return: a 0 in case of success, an negative error code otherwise.
+ */
+int i3c_master_do_daa(struct i3c_master_controller *master)
+{
+	return i3c_master_do_daa_ext(master, false);
+}
+EXPORT_SYMBOL_GPL(i3c_master_do_daa);
+
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
 static int
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
