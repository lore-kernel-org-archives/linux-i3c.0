Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9EDC982CA
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jan 2026 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFyUdfwuyeZvZdxUabXyxpsGuFuAiKQAvoL9fDshF8g=; b=tZ5W/XHECsdVjA
	mbH0dZw9lieQ+jL3BKkvf52IIpDwdzeTcpsf5RrXiihWElngUGl3ILdR6QWikxw7v7zzjg61/XPPE
	uUpJq2g/oRPstfCnBfR6XoH2Klj/iPdiaKNqUaW3gijj7v+m8T1pSRraFOPBoWNCy9qDjNrYRsm1/
	dA0aGFvFRojCdhibZFSOlO5SSsVqIXizw6Vz67k8UxI7pY88HqwwTmOJt/tmpAnDoyt7/P68h4+yK
	pqaeReRjyJYW47oFFs1TqqkaeqBfzCaeJmcpwA1wCC2N5z7eVXV4Xc738DNH9Oj41kgby7arVIMYM
	zIRYkYJfYCmmOtJL8vGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVP-0000000EKRu-0x8w;
	Fri, 16 Jan 2026 15:12:55 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVL-0000000EKQK-0Iwh
	for linux-i3c@lists.infradead.org;
	Fri, 16 Jan 2026 15:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768576370; x=1800112370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6k1yojZjt1xm/5Qy1CIENVjFmi1kRYiEf9gAFPobSbA=;
  b=caVSdq1WR0YmCqwUIUgUvTtxk+BTkGtJdEcc+BHcRqixjb/D6wi7HzPr
   n4KNsKiTIkT1stWqmLSJZDGRixdpYRKKl4tCYIR3N1fCf+CcRn0KTJTep
   pYDmPZRt8bMEoEL0ey9Z137c3FULFTzJvUp3LJsrmxwHVASINeKRyMrJY
   ME15yfJGtJ/VdUkt68RsXwZjUUK2+ButBX3xpRXH8D6LNFJDMh8Jkbcdc
   5c4P6KAvgDpRdtP9JUk0FYKPiQHg2uFIQKRC88wQKp+CSOqhjzpSW2qyt
   lDBPISd71GXsLTmcR2C8qSpopHcYbxLu/Pqi1UX+8mlXkVwNG2qv3rjOG
   w==;
X-CSE-ConnectionGUID: /ATceJoGSouwCOdt+HozJA==
X-CSE-MsgGUID: X7dW53GJTHKAmQfXdWiu1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69802811"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69802811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:12:49 -0800
X-CSE-ConnectionGUID: QDLOInIpSVayadQTW05heg==
X-CSE-MsgGUID: y/4qplbwRMuoab4eqPMvYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="209742995"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.96])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:12:48 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 1/3] i3c: master: Add i3c_master_restore_daa() for post-hibernation address recovery
Date: Fri, 16 Jan 2026 17:12:35 +0200
Message-ID: <20260116151237.96721-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260116151237.96721-1-adrian.hunter@intel.com>
References: <20260116151237.96721-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071251_147318_59CCFC2F 
X-CRM114-Status: GOOD (  16.71  )
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

After system hibernation, I3C Dynamic Addresses may be reassigned at boot
and no longer match the values recorded before suspend. Introduce
i3c_master_restore_daa() to handle this situation.

The restore procedure is straightforward: issue a Reset Dynamic Address
Assignment (RSTDAA), then run the standard DAA sequence. The existing DAA
logic already supports detecting and updating devices whose dynamic
addresses differ from previously known values.

Refactor the DAA implementation by introducing a shared helper used by both
i3c_master_do_daa() and the new restore function, and correct the
kernel-doc in the process.

Export i3c_master_restore_daa() so that master drivers can invoke it from
their PM restore callbacks.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c       | 60 +++++++++++++++++++++++++++-----------
 include/linux/i3c/master.h |  1 +
 2 files changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 594d61edcef4..1ba5d08365b4 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1734,23 +1734,9 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
-/**
- * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
- * @master: master doing the DAA
- *
- * This function is instantiating an I3C device object and adding it to the
- * I3C device list. All device information are automatically retrieved using
- * standard CCC commands.
- *
- * The I3C device object is returned in case the master wants to attach
- * private data to it using i3c_dev_set_master_data().
- *
- * This function must be called with the bus lock held in write mode.
- *
- * Return: a 0 in case of success, an negative error code otherwise.
- */
-int i3c_master_do_daa(struct i3c_master_controller *master)
+static int __i3c_master_do_daa(struct i3c_master_controller *master, bool reset)
 {
+	int rstret;
 	int ret;
 
 	ret = i3c_master_rpm_get(master);
@@ -1758,7 +1744,13 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 		return ret;
 
 	i3c_bus_maintenance_lock(&master->bus);
+
+	rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+	if (rstret == I3C_ERROR_M2)
+		rstret = 0;
+
 	ret = master->ops->do_daa(master);
+
 	i3c_bus_maintenance_unlock(&master->bus);
 
 	if (ret)
@@ -1769,10 +1761,44 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 	i3c_bus_normaluse_unlock(&master->bus);
 out:
 	i3c_master_rpm_put(master);
-	return ret;
+
+	return rstret ?: ret;
+}
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
+	return __i3c_master_do_daa(master, false);
 }
 EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
+/**
+ * i3c_master_restore_daa() - Restore Dynamic Addresses
+ * @master: controller
+ *
+ * After System Hibernation, Dynamic Addresses can have been reassigned at boot
+ * time to different values. A simple strategy is followed to handle that.
+ * Perform a Reset of Dynamic Address (RSTDAA) followed by the normal DAA
+ * procedure which has provision for reassigning addresses that differ from the
+ * previously recorded addresses.
+ *
+ * Return: a 0 in case of success, an negative error code otherwise.
+ */
+int i3c_master_restore_daa(struct i3c_master_controller *master)
+{
+	return __i3c_master_do_daa(master, true);
+}
+EXPORT_SYMBOL_GPL(i3c_master_restore_daa);
+
 /**
  * i3c_master_dma_map_single() - Map buffer for single DMA transfer
  * @dev: device object of a device doing DMA
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c1ec597f655c..ea757b92e440 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -598,6 +598,7 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
+int i3c_master_restore_daa(struct i3c_master_controller *master);
 struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
 					  size_t len, bool force_bounce,
 					  enum dma_data_direction dir);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
