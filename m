Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4EDCD4F35
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5aIngCOtp19nQob427zhkyFtZvakVZfKh2x6Ax+Yns=; b=gD30UbwpBrjAr7
	l8pgx29gmn1R5zYFx5X3c7NUji5kYRXYSQNoAyroFzWJ/2qQluTMmhtyBFnmR57zCPwMUwvopKjDK
	X1ofXqseiiesuDr6uZxpfHKzovis4/TXN4qUGfh/wKJGI6rzmb7+2ugLvTw9S6WVXlMjWV2rUCZIw
	JT7+RWtxBnomdLimTc8cmd1eCcg0QkXhuNQ+vy/3QdwiBAfcgZfNQ5k4ydTTd1CHXFiiMOv9+BM2h
	FHyZMlI6l2JrApTsTbtG5dTCfzi9NKGgm8e7KqdJfQI8gTeVXxlx63jso0u9srcWRSa0m9UUqVrXU
	zpx0ptHbT/WkwOl+OUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3g-0000000GeFj-3rXO;
	Tue, 12 May 2026 12:17:56 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3d-0000000GeBi-3SDA
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 12:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778588274; x=1810124274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RFcgaEUNJWXUG55Vm6q7p6mqgRVk7lVpZd7mGX4qEcQ=;
  b=mJjRbEhd7QRKglXcxLQ5Y8HLArud4UHVxcry+dS9pzKG3GZg5IMm1/fh
   l/qqbAq0GtcGubBnEfgMC/rJtsC8iIhgV6yfQXtjCVJAmmw/D+rhXmaDa
   cTdrVwJH+/FC2a6vTusmQvRtDjBxF8ZBvjOvzcPlw+dn0DYZnxX9qa5yw
   ap2z5h0mUrMGhHD1tswgarfErshFmGnhdeGRKBxoKAAU2Tr28Nrp3xufw
   TZb7jHRWADeFrEuvp9t3x1LlDOVIf63hMx1xFhIFoak6FDzF7es/nLqzJ
   vhypaBBa5RHRyfnFNhmn8Ll/1IXPliI/8Wr7e642z2l6uYRdMnOVGoHFm
   w==;
X-CSE-ConnectionGUID: tzpoE3x7RFuYtAEUCb+jZQ==
X-CSE-MsgGUID: 1ruTmd84Qn+tFezBZZhg8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79389499"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79389499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:54 -0700
X-CSE-ConnectionGUID: 6wBN/LPISeyIMqFSJBFo+Q==
X-CSE-MsgGUID: MIIBbum3TiiqFV8qDLnafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241756142"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.121])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:52 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] i3c: master: Ensure Hot-Join operations are stopped on shutdown
Date: Tue, 12 May 2026 15:17:28 +0300
Message-ID: <20260512121732.406009-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260512121732.406009-1-adrian.hunter@intel.com>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_051753_910398_98CFD25A 
X-CRM114-Status: GOOD (  18.17  )
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

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
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
