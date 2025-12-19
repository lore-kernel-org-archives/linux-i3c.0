Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E8D78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRI3XQor/FBbBePgPe4q9vqMVs1GqX48xwczpxgYAG4=; b=Tlh3CVfOE1i9eq
	i4uxqX/y1ySnG5gh/vOBRsOqiji/X+vt/iL8qeAxmwGn6IsoiXOP22g/RbyVP6yEM9gZpyiWHoYk4
	SiYa4WWT3ED2TW2I8nbbJAU4cLENxawgINKgnQN1iR2T4mxUmffJMFAoTiGEZRNLeYUsvxiRW3yO/
	XCLF6lSrxgm3EKczoP5lAgSLkPnuKabFM+iD9w8ebTTlAOnjU/mCracdGOVbWn7QVrVBIUxWdfu1f
	Y8HSGM0vRPZAPF2iMn5s433bDMq06dnqrCyKkKxB1uuv5M7PQnqdNcjHp22ZjREmAZm9ItfiOWEuQ
	Y9ZbB4MYr6exq9VHE2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkO-0000000ARgV-16yA;
	Fri, 19 Dec 2025 14:46:24 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkM-0000000ARes-0CjC
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155582; x=1797691582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Md4xCH84G6usibkcHOCDjOFlpl0gEk3uAfysNS8mOo=;
  b=ix+Ke8uHsFLjD0Lca/nAf6aZFC7nXBRnufXkiDMo2f1weziC6OAcgUE1
   YFNKtu2owYp8FWL7Hnl7VuIkcm3w5FSbJO4RTProDXCQRMtaqLwoXpFT5
   ZQ3X17nRVBACwkeszZ7hb4KpfKOfseb7x3b9SI+cdRfYCm3feI3H62rgF
   kOhhY8NBiZtRv7iMB4txosNCWYhySrgSs1gEibdRWFfNqdGLomUBVjR7O
   BHHg7+M9+eSmx3YZvSs/uGMSK3BU4AHOkYPM4RHC9HhTWOpOeiOvx+Ae/
   gYA0awZoT0gHQxgOUQ8HerPQSkufHJFPjb7O8Bo1meOJ1TsV7rzWGs44q
   w==;
X-CSE-ConnectionGUID: HlFORNODS1muOb1MBZhGVQ==
X-CSE-MsgGUID: Ak+HuHs5TsqR0zP+viEkMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588996"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:22 -0800
X-CSE-ConnectionGUID: 9fKoj+hJTnysdhHj7KMqiA==
X-CSE-MsgGUID: QHUqFC3oTUCfCfdYfqCOjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564099"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:19 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 15/17] i3c: master: Introduce optional Runtime PM support
Date: Fri, 19 Dec 2025 16:45:32 +0200
Message-ID: <20251219144534.84391-16-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064622_120312_AC27304C 
X-CRM114-Status: GOOD (  17.61  )
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

Master drivers currently manage Runtime PM individually, but all require
runtime resume for bus operations.  This can be centralized in common code.

Add optional Runtime PM support to ensure the parent device is runtime
resumed before bus operations and auto-suspended afterward.

Notably, do not call ->bus_cleanup() if runtime resume fails.  Master
drivers that opt-in to core runtime PM support must take that into account.

Also provide an option to allow IBIs and hot-joins while runtime suspended.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/device.c       | 46 +++++++++++++++++--
 drivers/i3c/internals.h    |  4 ++
 drivers/i3c/master.c       | 93 +++++++++++++++++++++++++++++++++++---
 include/linux/i3c/master.h |  4 ++
 4 files changed, 138 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 8a156f5ad692..101eaa77de68 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -46,10 +46,16 @@ int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
 			return -EINVAL;
 	}
 
+	ret = i3c_bus_rpm_get(dev->bus);
+	if (ret)
+		return ret;
+
 	i3c_bus_normaluse_lock(dev->bus);
 	ret = i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
 	i3c_bus_normaluse_unlock(dev->bus);
 
+	i3c_bus_rpm_put(dev->bus);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_device_do_xfers);
@@ -66,10 +72,16 @@ int i3c_device_do_setdasa(struct i3c_device *dev)
 {
 	int ret;
 
+	ret = i3c_bus_rpm_get(dev->bus);
+	if (ret)
+		return ret;
+
 	i3c_bus_normaluse_lock(dev->bus);
 	ret = i3c_dev_setdasa_locked(dev->desc);
 	i3c_bus_normaluse_unlock(dev->bus);
 
+	i3c_bus_rpm_put(dev->bus);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
@@ -106,16 +118,27 @@ EXPORT_SYMBOL_GPL(i3c_device_get_info);
  */
 int i3c_device_disable_ibi(struct i3c_device *dev)
 {
-	int ret = -ENOENT;
+	int ret;
+
+	if (i3c_bus_rpm_ibi_allowed(dev->bus)) {
+		ret = i3c_bus_rpm_get(dev->bus);
+		if (ret)
+			return ret;
+	}
 
 	i3c_bus_normaluse_lock(dev->bus);
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		ret = i3c_dev_disable_ibi_locked(dev->desc);
 		mutex_unlock(&dev->desc->ibi_lock);
+	} else {
+		ret = -ENOENT;
 	}
 	i3c_bus_normaluse_unlock(dev->bus);
 
+	if (!ret || i3c_bus_rpm_ibi_allowed(dev->bus))
+		i3c_bus_rpm_put(dev->bus);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_device_disable_ibi);
@@ -135,16 +158,25 @@ EXPORT_SYMBOL_GPL(i3c_device_disable_ibi);
  */
 int i3c_device_enable_ibi(struct i3c_device *dev)
 {
-	int ret = -ENOENT;
+	int ret;
+
+	ret = i3c_bus_rpm_get(dev->bus);
+	if (ret)
+		return ret;
 
 	i3c_bus_normaluse_lock(dev->bus);
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		ret = i3c_dev_enable_ibi_locked(dev->desc);
 		mutex_unlock(&dev->desc->ibi_lock);
+	} else {
+		ret = -ENOENT;
 	}
 	i3c_bus_normaluse_unlock(dev->bus);
 
+	if (ret || i3c_bus_rpm_ibi_allowed(dev->bus))
+		i3c_bus_rpm_put(dev->bus);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_device_enable_ibi);
@@ -163,19 +195,27 @@ EXPORT_SYMBOL_GPL(i3c_device_enable_ibi);
 int i3c_device_request_ibi(struct i3c_device *dev,
 			   const struct i3c_ibi_setup *req)
 {
-	int ret = -ENOENT;
+	int ret;
 
 	if (!req->handler || !req->num_slots)
 		return -EINVAL;
 
+	ret = i3c_bus_rpm_get(dev->bus);
+	if (ret)
+		return ret;
+
 	i3c_bus_normaluse_lock(dev->bus);
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		ret = i3c_dev_request_ibi_locked(dev->desc, req);
 		mutex_unlock(&dev->desc->ibi_lock);
+	} else {
+		ret = -ENOENT;
 	}
 	i3c_bus_normaluse_unlock(dev->bus);
 
+	i3c_bus_rpm_put(dev->bus);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index f609e5098137..0f1f3f766623 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -11,6 +11,10 @@
 #include <linux/i3c/master.h>
 #include <linux/io.h>
 
+int __must_check i3c_bus_rpm_get(struct i3c_bus *bus);
+void i3c_bus_rpm_put(struct i3c_bus *bus);
+bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
+
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ff6cbc044787..594d61edcef4 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -106,6 +106,38 @@ static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
 	return container_of(dev, struct i3c_master_controller, dev);
 }
 
+static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
+{
+	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->dev.parent) : 0;
+
+	if (ret < 0) {
+		dev_err(master->dev.parent, "runtime resume failed, error %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static void i3c_master_rpm_put(struct i3c_master_controller *master)
+{
+	if (master->rpm_allowed)
+		pm_runtime_put_autosuspend(master->dev.parent);
+}
+
+int i3c_bus_rpm_get(struct i3c_bus *bus)
+{
+	return i3c_master_rpm_get(i3c_bus_to_i3c_master(bus));
+}
+
+void i3c_bus_rpm_put(struct i3c_bus *bus)
+{
+	i3c_master_rpm_put(i3c_bus_to_i3c_master(bus));
+}
+
+bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus)
+{
+	return i3c_bus_to_i3c_master(bus)->rpm_ibi_allowed;
+}
+
 static const struct device_type i3c_device_type;
 
 static struct i3c_bus *dev_to_i3cbus(struct device *dev)
@@ -611,6 +643,12 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
 	if (!master->ops->enable_hotjoin || !master->ops->disable_hotjoin)
 		return -EINVAL;
 
+	if (enable || master->rpm_ibi_allowed) {
+		ret = i3c_master_rpm_get(master);
+		if (ret)
+			return ret;
+	}
+
 	i3c_bus_normaluse_lock(&master->bus);
 
 	if (enable)
@@ -623,6 +661,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
 
 	i3c_bus_normaluse_unlock(&master->bus);
 
+	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
+		i3c_master_rpm_put(master);
+
 	return ret;
 }
 
@@ -1712,18 +1753,23 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 {
 	int ret;
 
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
 	i3c_bus_maintenance_lock(&master->bus);
 	ret = master->ops->do_daa(master);
 	i3c_bus_maintenance_unlock(&master->bus);
 
 	if (ret)
-		return ret;
+		goto out;
 
 	i3c_bus_normaluse_lock(&master->bus);
 	i3c_master_register_new_i3c_devs(master);
 	i3c_bus_normaluse_unlock(&master->bus);
-
-	return 0;
+out:
+	i3c_master_rpm_put(master);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
@@ -2065,8 +2111,17 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 
 static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
 {
-	if (master->ops->bus_cleanup)
-		master->ops->bus_cleanup(master);
+	if (master->ops->bus_cleanup) {
+		int ret = i3c_master_rpm_get(master);
+
+		if (ret) {
+			dev_err(&master->dev,
+				"runtime resume error: master bus_cleanup() not done\n");
+		} else {
+			master->ops->bus_cleanup(master);
+			i3c_master_rpm_put(master);
+		}
+	}
 
 	i3c_master_detach_free_devs(master);
 }
@@ -2421,6 +2476,10 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 			return -EOPNOTSUPP;
 	}
 
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
 	i3c_bus_normaluse_lock(&master->bus);
 	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
 	if (!dev)
@@ -2429,6 +2488,8 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
 	i3c_bus_normaluse_unlock(&master->bus);
 
+	i3c_master_rpm_put(master);
+
 	return ret ? ret : nxfers;
 }
 
@@ -2531,6 +2592,10 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
 
 	master = i2c_adapter_to_i3c_master(adap);
 
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
 	i3c_bus_maintenance_lock(&master->bus);
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
@@ -2544,6 +2609,8 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
 	}
 	i3c_bus_maintenance_unlock(&master->bus);
 
+	i3c_master_rpm_put(master);
+
 	return ret;
 }
 
@@ -2881,6 +2948,10 @@ int i3c_master_register(struct i3c_master_controller *master,
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
 	device_initialize(&master->dev);
 	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
 
@@ -2960,6 +3031,8 @@ int i3c_master_register(struct i3c_master_controller *master,
 	i3c_master_register_new_i3c_devs(master);
 	i3c_bus_normaluse_unlock(&master->bus);
 
+	i3c_master_rpm_put(master);
+
 	return 0;
 
 err_del_dev:
@@ -2969,6 +3042,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	i3c_master_bus_cleanup(master);
 
 err_put_dev:
+	i3c_master_rpm_put(master);
 	put_device(&master->dev);
 
 	return ret;
@@ -3114,8 +3188,15 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 		return;
 
 	if (dev->ibi->enabled) {
+		int ret;
+
 		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
-		if (i3c_dev_disable_ibi_locked(dev))
+		ret = i3c_master_rpm_get(master);
+		if (!ret) {
+			ret = i3c_dev_disable_ibi_locked(dev);
+			i3c_master_rpm_put(master);
+		}
+		if (ret)
 			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
 	}
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 6225ad28f210..c1ec597f655c 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -504,6 +504,8 @@ struct i3c_master_controller_ops {
  * @secondary: true if the master is a secondary master
  * @init_done: true when the bus initialization is done
  * @hotjoin: true if the master support hotjoin
+ * @rpm_allowed: true if Runtime PM allowed
+ * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
  * @boardinfo.i3c: list of I3C  boardinfo objects
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
@@ -527,6 +529,8 @@ struct i3c_master_controller {
 	unsigned int secondary : 1;
 	unsigned int init_done : 1;
 	unsigned int hotjoin: 1;
+	unsigned int rpm_allowed: 1;
+	unsigned int rpm_ibi_allowed: 1;
 	struct {
 		struct list_head i3c;
 		struct list_head i2c;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
