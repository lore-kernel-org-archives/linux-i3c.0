Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30961D6CFDC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 06:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scMwzrJhEstM32EG6LgOVIK8cs6GmArixHtKFebHMR4=; b=wuIpm2MCSjcHR0
	Ml6Ef8YaJAU1h+v2Xk/IsZNH9pvZ26g063AmXCwSH5zw7MmwwgvezqpjqB+PF9AiIWRh27TqvxWoC
	cNkgyJQGE+K8vEEsoi1qHUmX0oHUwDP6pka6GCb21gcLvSg8oBBv8tWd4T6vb4oXq9hCdlOWxaPsu
	dS38gz4hSazBZx/JkOgoMJtMvo3Oh49sg9cqLrIo0EUnTkfkPsPxcly1hB4Zpn5yhl3M117ZSL1E/
	lEJ69vEmlVlwuQPoCiVWDpS7O2yN+fn7BoSLozjWjDXQvGFXCzAa0zWlIh2ra+cg1LHVqq4Nla9x9
	zUgrI0fXO+87cI82koaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAjm-00000008Ike-3dN0;
	Fri, 23 Jan 2026 06:33:42 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAjk-00000008Ija-1Y04
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 06:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769150020; x=1800686020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yG3+n4IoNNzxeH6eDZxX7hOOtoTud463bBvo0AQCpPY=;
  b=CTHvGTQhVvJAKxrRJ8ncfX0z/VITxx6VvB/tfLaGGio4ZSiyu4DU/98g
   q6Qx+csvqZqM5ObgzN/OgjFWcZfa0R5VrCkFzyBVZ8G4ZEhkO0KusejVB
   JayRMI5MUfpEdrL5vrig4fe9p/gLJyq8HkoW+Iz016oBMIVh4ErzpFF1J
   cNpdbik8ZnQHY0YEEYJew7Clo4aKlIWB3KrQWaR4CQH/3bYsYCJvGPrvM
   SjO5/bh3LOlG3vWvNeSBb01YwJKzExIQd1dGKX/TURAk9qrbnrTxTof0R
   W/8g7GcdRCbu1oYQp+TD7elAzvN4ABfJcNu22jRAhHMW4yh2ArrGQ0OQi
   A==;
X-CSE-ConnectionGUID: 1diVxmZTRTOs7Ll0dm41Cg==
X-CSE-MsgGUID: b/EAAv7YQUaUTruAYsgbyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81514040"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81514040"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:33:40 -0800
X-CSE-ConnectionGUID: CYaB92S1RCi7SLOQtGj80A==
X-CSE-MsgGUID: 90BoKfhoQSGOw7SZKJcKNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207210816"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.101])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:33:38 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 1/3] i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
Date: Fri, 23 Jan 2026 08:33:23 +0200
Message-ID: <20260123063325.8210-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123063325.8210-1-adrian.hunter@intel.com>
References: <20260123063325.8210-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_223340_451821_F46026FD 
X-CRM114-Status: GOOD (  17.46  )
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
i3c_master_do_daa_ext() to handle this situation.

The restore procedure is straightforward: issue a Reset Dynamic Address
Assignment (RSTDAA), then run the standard DAA sequence. The existing DAA
logic already supports detecting and updating devices whose dynamic
addresses differ from previously known values.

Refactor the DAA path by introducing a shared helper used by both the
normal i3c_master_do_daa() path and the new extended restore function,
and correct the kernel-doc in the process.

Export i3c_master_do_daa_ext() so that master drivers can invoke it from
their PM restore callbacks.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	Rename 'restore' parameter to 'rstdaa'

Changes in V2:
	Helper function is now called i3c_master_do_daa_ext() and takes
	'restore' as an argument.
	Fix new helper function so that RSTDAA is conditional on the
	'restore' parameter.
	Subject and commit message amended accordingly.


 drivers/i3c/master.c       | 49 +++++++++++++++++++++++++++++---------
 include/linux/i3c/master.h |  1 +
 2 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 594d61edcef4..49fb6e30a68e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1735,22 +1735,24 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 }
 
 /**
- * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
- * @master: master doing the DAA
+ * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
+ * @master: controller
+ * @rstdaa: whether to first perform Reset of Dynamic Addresses (RSTDAA)
  *
- * This function is instantiating an I3C device object and adding it to the
- * I3C device list. All device information are automatically retrieved using
- * standard CCC commands.
- *
- * The I3C device object is returned in case the master wants to attach
- * private data to it using i3c_dev_set_master_data().
+ * Perform Dynamic Address Assignment with optional support for System
+ * Hibernation (@rstdaa is true).
  *
- * This function must be called with the bus lock held in write mode.
+ * After System Hibernation, Dynamic Addresses can have been reassigned at boot
+ * time to different values. A simple strategy is followed to handle that.
+ * Perform a Reset of Dynamic Addresses (RSTDAA) followed by the normal DAA
+ * procedure which has provision for reassigning addresses that differ from the
+ * previously recorded addresses.
  *
  * Return: a 0 in case of success, an negative error code otherwise.
  */
-int i3c_master_do_daa(struct i3c_master_controller *master)
+int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 {
+	int rstret = 0;
 	int ret;
 
 	ret = i3c_master_rpm_get(master);
@@ -1758,7 +1760,15 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 		return ret;
 
 	i3c_bus_maintenance_lock(&master->bus);
+
+	if (rstdaa) {
+		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+		if (rstret == I3C_ERROR_M2)
+			rstret = 0;
+	}
+
 	ret = master->ops->do_daa(master);
+
 	i3c_bus_maintenance_unlock(&master->bus);
 
 	if (ret)
@@ -1769,7 +1779,24 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 	i3c_bus_normaluse_unlock(&master->bus);
 out:
 	i3c_master_rpm_put(master);
-	return ret;
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
 }
 EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c1ec597f655c..af2bb48363ba 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -598,6 +598,7 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
+int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa);
 struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
 					  size_t len, bool force_bounce,
 					  enum dma_data_direction dir);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
