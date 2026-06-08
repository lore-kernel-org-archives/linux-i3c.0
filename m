Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FECD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0fCbT2kIyep0u4Zsd5gNdxmhaYGaeC6hng0JAyDSWI=; b=BG449tQj8CL1Mz
	qdp3+buEOuadi528EIAUbHZAfon6QOQMgkPTAtRE2z8MEJCsxM0TPdcRzCbd0J90yq582ouGJfcF6
	WYrhaxuYGhcW09sicxnZt6taMBvyQ+vHyMF9LyLK7PFzQbr8vQx+Emd/ZRwjuf49waPvb3grB7utl
	w6NPHGI4kQbErM+lfyXOxd8ttUgzQ1hrHQhkEJhrCFsi50VqZdD8zzgwMOeFM7U9LloGgY04flkhv
	YkI/wzDQjzltvoAKKt/DUZnU38ST1k43cgnl4j+DwfLs/Ir/ux0esh9xh/ZkKwot0LDLQjwUv+tY0
	R5OIbtPqDCTN3feyGJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlq-00000002qtq-2rsE;
	Mon, 08 Jun 2026 05:43:34 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlo-00000002qr4-2F5H
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897413; x=1812433413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DSNkL4XqDO2tisska05hOkPCZwpg70LsKAEDzIXnWYw=;
  b=UNSBTaiie04fyicxq58mRmcT6MKAzO8rPHW8IUmpioA1T3gM3/fkJNHy
   XLs36cFQaguHc2Cy7amLinTZalRaCjaQi4w9bczHYBLkM5SNoeNZc0Ou+
   F8HzsjMP1BaaFN5Po5lRRt9Xx/QgGW4oVdX7IotafkjwdhKmOtP+gwOi9
   KRaYcp1ti+CSMiP4SN9jPY4vyXBriF9ad3dsQhMh0aDtHzbkNK3HVTg/t
   2k5CZ2PP4rt38A1ENhFwXrDX1zsd2MZeJQ/dWYO8lIROiSJq94HKGXk1T
   Tv9qxtTfL9hKpMbh+5TKy/pImiUzXMmNtGZBgtfLdZCckwHarPbNB6Kis
   w==;
X-CSE-ConnectionGUID: K6AxaM6fSGqRaGejTlGVqg==
X-CSE-MsgGUID: hNQw8QLZRiuiiI4Y3hhBmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284043"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284043"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:32 -0700
X-CSE-ConnectionGUID: fOu2QWmqS8aI7D6tR7yNyQ==
X-CSE-MsgGUID: pjxQrvyGQty/Vr9SQPgY5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505676"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:30 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 4/8] i3c: master: Ensure Hot-Join operations are stopped on shutdown
Date: Mon,  8 Jun 2026 08:43:08 +0300
Message-ID: <20260608054312.10604-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224332_617906_4816E181 
X-CRM114-Status: GOOD (  18.60  )
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

System shutdown invokes each device's bus shutdown callback to quiesce
hardware, but the I3C bus type does not currently implement one.  As a
result, on shutdown the controller's Hot-Join work and any in-flight
i3c_master_do_daa() can keep running (or be newly triggered) while the
rest of the system is being torn down.

A similar window exists at i3c_master_unregister() time: cancel_work_sync()
on hj_work prevents queued work from completing, but does not stop a
fresh Hot-Join IBI from re-queueing the worker, nor a concurrent sysfs
writer from toggling Hot-Join via i3c_set_hotjoin().

Introduce a single "shutting down" gate in the I3C core, set under the
bus maintenance lock so it is observed by any in-progress DAA path
before pending work is cancelled.  Install an i3c_bus_type shutdown
callback that engages this gate for master devices during system
shutdown, and use the same gate in i3c_master_unregister() so both
paths get identical guarantees.

Once the gate is engaged, the Hot-Join worker, i3c_master_do_daa_ext()
and i3c_set_hotjoin() all bail out cleanly, so Hot-Join IBIs that race
with shutdown become no-ops, direct DAA callers see -ENODEV, and sysfs
writers can no longer re-enable Hot-Join through ops->enable_hotjoin()
while the controller is going away.

No functional change for the steady-state runtime path; the new checks
only take effect once the controller has been marked as shutting down.

Note, this patch depends on patch "i3c: master: Consolidate Hot-Join DAA
work in the core".

Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add dependency note to commit message
	Add Fixes tag
	Add Frank's Rev'd by


 drivers/i3c/master.c       | 52 +++++++++++++++++++++++++++-----------
 include/linux/i3c/master.h |  2 ++
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index cdb5cb2aa65d..a59c4b744b36 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -368,14 +368,6 @@ static void i3c_device_remove(struct device *dev)
 		driver->remove(i3cdev);
 }
 
-const struct bus_type i3c_bus_type = {
-	.name = "i3c",
-	.match = i3c_device_match,
-	.probe = i3c_device_probe,
-	.remove = i3c_device_remove,
-};
-EXPORT_SYMBOL_GPL(i3c_bus_type);
-
 static enum i3c_addr_slot_status
 i3c_bus_get_addr_slot_status_mask(struct i3c_bus *bus, u16 addr, u32 mask)
 {
@@ -637,7 +629,8 @@ static void i3c_master_hj_work_fn(struct work_struct *work)
 {
 	struct i3c_master_controller *master = container_of(work, typeof(*master), hj_work);
 
-	i3c_master_do_daa(master);
+	if (!master->shutting_down)
+		i3c_master_do_daa(master);
 }
 
 static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
@@ -658,7 +651,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
 
 	i3c_bus_maintenance_lock(&master->bus);
 
-	if (enable)
+	if (master->shutting_down)
+		ret = -ENODEV;
+	else if (enable)
 		ret = master->ops->enable_hotjoin(master);
 	else
 		ret = master->ops->disable_hotjoin(master);
@@ -837,6 +832,30 @@ static const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
 
+static void i3c_master_shutdown(struct i3c_master_controller *master)
+{
+	i3c_bus_maintenance_lock(&master->bus);
+	master->shutting_down = true;
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	cancel_work_sync(&master->hj_work);
+}
+
+static void i3c_device_shutdown(struct device *dev)
+{
+	if (dev->type == &i3c_masterdev_type)
+		i3c_master_shutdown(dev_to_i3cmaster(dev));
+}
+
+const struct bus_type i3c_bus_type = {
+	.name = "i3c",
+	.match = i3c_device_match,
+	.probe = i3c_device_probe,
+	.remove = i3c_device_remove,
+	.shutdown = i3c_device_shutdown,
+};
+EXPORT_SYMBOL_GPL(i3c_bus_type);
+
 static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 			    unsigned long max_i2c_scl_rate)
 {
@@ -1846,10 +1865,13 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 
 	i3c_bus_maintenance_lock(&master->bus);
 
-	if (rstdaa)
-		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
-
-	ret = master->ops->do_daa(master);
+	if (master->shutting_down) {
+		ret = -ENODEV;
+	} else {
+		if (rstdaa)
+			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+		ret = master->ops->do_daa(master);
+	}
 
 	i3c_bus_maintenance_unlock(&master->bus);
 
@@ -3166,7 +3188,7 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
 void i3c_master_unregister(struct i3c_master_controller *master)
 {
 	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
-	cancel_work_sync(&master->hj_work);
+	i3c_master_shutdown(master);
 
 	if (master->ops->set_dev_nack_retry)
 		device_remove_file(&master->dev, &dev_attr_dev_nack_retry_count);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index eb5c51608bd7..77e63082b06e 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -511,6 +511,7 @@ struct i3c_master_controller_ops {
  * @hotjoin: true if the master support hotjoin
  * @rpm_allowed: true if Runtime PM allowed
  * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
+ * @shutting_down: set to true when master begins shutdown or unregister
  * @boardinfo.i3c: list of I3C  boardinfo objects
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
@@ -539,6 +540,7 @@ struct i3c_master_controller {
 	unsigned int hotjoin: 1;
 	unsigned int rpm_allowed: 1;
 	unsigned int rpm_ibi_allowed: 1;
+	bool shutting_down;
 	struct {
 		struct list_head i3c;
 		struct list_head i2c;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
