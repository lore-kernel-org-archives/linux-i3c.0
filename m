Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE0CD4F2C
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 08:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO4fTHIQLot6ORKoUQSVZlRuR1XqcL2TJkPATNKwsSY=; b=p1Po5KLy68ieFL
	4ul8xNkRDm7RgAb6ogmhlU6jr/Hab4WJ0EK4kAK8EAa+622mCG1XOqp23Y+VPmDMUVw2PW08eEKrv
	dH0Vc8/oBc0Osb7uS4r3uvpLVsQ9DnorJtp3mn0+crlxaWBP3dEZr/3N8SBqAIwWOAeqVBG8cKtn8
	+JinbfFLQf02vDlU/UqzyS6xwxy8MhTUi/1epT+hrUwSBtKFevHgsYwuA+/QQ9LDEaMKV2yczlWOr
	9/yMZE0SKsYTsRhLGbmoihNdQe8+SqAKzpUF1OV5ZMlAsKX8kwSLurXxmxhy/R3TCbO8QA8Uyd37j
	AVk2YeLqreXg3U3nytyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpe-0000000AXEA-2QOf;
	Fri, 12 Jun 2026 08:01:38 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpb-0000000AX9a-1QZb
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 08:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781251295; x=1812787295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M6/UkvbYXdDeW349yvKXIELY/Wpavlkmy7Hb6vwNhmY=;
  b=iQdMIED9AUMR1ekIhNjxUOT7eVEvgsFlfJgYcx5tExFX6Rp/FKbFYKEL
   T5nJx+5cop7GdLP49TLiiLOFHJnEYPw8uqKxiO0J1Mjk6MgMLEN/Drmyi
   1eUbaYQBSiWlGnT2X8UTHm7kkIH+EJ7UZ8L/Ftu5X4R6ZaxCApdrRBJaW
   A/nO8SuWab1uDrJzVjrFsur7NHG1cAsovgYQsx2rKmfkWAxGwf9+rCaoA
   zjuZAO91xmfASZzEfDx9NJOpv0Am3iopB1UdOqV0XtS+m/PT6SzN3Q7+3
   yPwiML7rKcX8MTx8yxUFG20OvWZRESqgCQuvQuMe/+mUrbFUVMryhOy6J
   g==;
X-CSE-ConnectionGUID: 8mpW2eb3SqGaAXQ0864g2Q==
X-CSE-MsgGUID: JTk8VLpESx2z4T35kYOfXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82186765"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82186765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:29 -0700
X-CSE-ConnectionGUID: qtdevnf4RWqXCbMu5RFWIA==
X-CSE-MsgGUID: 6eIt50SrRCylrB1N46ftTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246630381"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.41])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:28 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 6/7] i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_locked()
Date: Fri, 12 Jun 2026 11:01:06 +0300
Message-ID: <20260612080107.11606-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260612080107.11606-1-adrian.hunter@intel.com>
References: <20260612080107.11606-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_010135_428754_5EB3F8FD 
X-CRM114-Status: GOOD (  15.79  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Add Frank's Rev'd-by

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
