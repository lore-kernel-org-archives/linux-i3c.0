Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F91ACD4F54
	for <linux-i3c@archiver.kernel.org>; Mon, 18 May 2026 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54+h84vLfFYDkPYAqxuak4vDQ8yOUtZfnXh76cyyWoc=; b=YKw8BInoRZhD1X
	dsH/9q/IfK1JByKcoR1ECNiR5HG3x3ottTbJiVbEEL9ceN/AXwCOMYgtFqL3zeGtV08VHCBtJqrru
	UMFRZI5jQr8OCx5+HqiJKJLGkiVWnNtUaMuBigGIgJQzDOeXNuhG/wa9ffC+0NNSRwlZt0/ikqWA0
	/GLTHGihlhPyezFTWGsHxBw9NXF7YVrNZfjCZzORhWu+xYyw31AFFGwMoFtSL6VZQ0YAZGOcaLDlK
	L+YbKqjAoNTjTmG8atFtS4xToFxcoQi5KdSbUkIs2+pzOTEfj2My7WbVAiFqEDpNer+FQUHdhApF5
	Sh0d0rvQyQyCM9yidOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZY-0000000FW9Z-3uCQ;
	Mon, 18 May 2026 11:55:48 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZW-0000000FW3B-1HZ1
	for linux-i3c@lists.infradead.org;
	Mon, 18 May 2026 11:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779105346; x=1810641346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UTjhVCrREM53e4OcVoixACuB519wxeFJxJJPGmIx5OE=;
  b=XJIdwv29NDtEIFZguEESpZmVKF77TC5gP84FohJhyC4x3T36VA+wtZnp
   eMoLQL+SYSprdqaPDX/uzgrMxmyEetyYgaoMuPtrhSTwMTOPXwYhmYNbz
   PgWKGXBahLG+59DOsfsXd1J25RenfFjiISOl/4Z7e95Fy+v52lOU8kTQo
   Vpix6fOVuPUH8jYeOdeg3K0WOtrnW+Qu+JnJ9lNCZiLZoDuiMNSo9a45m
   ilKO5GfptAtGV08Y7GkT4KoY8kgLQ5+rvIQdY2aiBCsqqAqPSsZ4a+Tco
   6G5keYpRxEPhG0cyjO+PjLKHxluK7IABu7cP/fR874R87aKp13N/vs1oH
   w==;
X-CSE-ConnectionGUID: SynOvLbYSNqve1OlbcksLw==
X-CSE-MsgGUID: q1pBM76eSO+rZIx9W7l34Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91347068"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91347068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:46 -0700
X-CSE-ConnectionGUID: REZAZ45mQsCFhhPG85/kTA==
X-CSE-MsgGUID: irb79U/BRzao2jfXMVdFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239663415"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.220])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:44 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/8] i3c: master: Ensure Hot-Join operations are stopped on shutdown
Date: Mon, 18 May 2026 14:55:15 +0300
Message-ID: <20260518115520.98335-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518115520.98335-1-adrian.hunter@intel.com>
References: <20260518115520.98335-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_045546_357297_53ED286F 
X-CRM114-Status: GOOD (  18.59  )
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
