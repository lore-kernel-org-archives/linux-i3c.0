Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267F3C5ACC2
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTHnkrrwlx/xrbXg7+fT96hEvIpVMQXzsyPl+PIJtn0=; b=OMefgka6kfwD9L
	GY9ufVL6UEkX4yDcTpO9G4TwLON7WTYKIqXp+NhxnSA6mIXJkl6/3g6AmEYgG1oNOuMDZggGsBL/1
	2Os2MKQvGMHlpfSyyXOA2weBd4vuvaFkxmX8Gx8OvG8EzmkpuNMH48uWssJqcsQOPKXMbPSdzRUAD
	Z8FRBUfCuNd0A6NOky5GkYXsaQA2x7uzHF2IYAmoS1WWfty81YuPTeIlrAW1l/vZhHxHGRjZLP5EJ
	oZUN+cCsapTY3uuzdXrjYAlCl17F4JbcynZQ6Kzbm4GY48TVCOgRlvpprTXGC5/BQx3mSDmItDFKy
	1n3k+S/S8sMXWS3o8XLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0p-00000008Ihc-2pRu;
	Fri, 07 Aug 2026 14:57:31 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0m-00000008Ifs-46e7
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114649; x=1817650649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iUf7XrtbaGTZLGwnhEqDqVPZQrqJ/bjk10K3AhMjNNw=;
  b=P5unf9xJ/WRJFZTWK8wPkgLQ6ZuEXmr1V57RPi9XzmXisrtQB4FqgYuc
   SVSCfLPPDEHD4/rRmmXgZ9KKpE2dbWkd9lKF+7p6day1DXIPRfBOMxB+r
   6POmPLXFqwcfM+VW0p/SATGUrp79IOhhTJ9bW8JhKDUgaithcWfz0Rx9Z
   A4Ase+bpqr/TMCfdkAlah84MMKgJm28cCWSGJBGx0khFNqqTBW2oW4WpK
   lq9Gdz1/DqtWnYtW9CvEQImsJLTJiNZaDnr/9OmkgUVy5bS6TVwwu2hS9
   aHz7l0Xtf8rIWE7L2A7ZPNe7+7raAMbT1867ZLs6dWtwNqZY06NqlOZgp
   A==;
X-CSE-ConnectionGUID: 3oct6LiyR82GDtL/nAJQMg==
X-CSE-MsgGUID: CCF5AK8cSKqewXKPg7o+HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485180"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485180"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:24 -0700
X-CSE-ConnectionGUID: MiaaZ06gQ6KmppPlDM5SPg==
X-CSE-MsgGUID: M0Ah3gm0RiSsebDU/Co6Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809875"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:56:48 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	mukesh.savaliya@oss.qualcomm.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V5 01/14] i3c: master: Fix recursive locking during device registration
Date: Fri,  7 Aug 2026 17:56:25 +0300
Message-ID: <20260807145638.168865-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075729_062256_803E1299 
X-CRM114-Status: GOOD (  19.37  )
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

i3c_master_register_new_i3c_devs() registers newly discovered devices
while holding i3c_bus_normaluse_lock(), a down_read().  device_register()
can immediately probe the device, and probe callbacks typically invoke
I3C helpers that take i3c_bus_normaluse_lock() again, leading to a
recursive acquisition of the same rwsem.  rwsems do not support recursive
read locking and can deadlock when a writer is waiting.  See the
"Recursive read locks" section of Documentation/locking/lockdep-design.rst.

For example, with Intel LPSS I3C, LOCKDEP generates a WARNING like:
  # echo intel-lpss-i3c.0 > /sys/bus/platform/drivers/mipi-i3c-hci/unbind
  # echo intel-lpss-i3c.0 > /sys/bus/platform/drivers/mipi-i3c-hci/bind
  WARNING: possible recursive locking detected
  kworker/5:1/94 is trying to acquire lock:
  ffff88811c810d78 (&i3cbus->lock){++++}-{4:4}, at: i3c_device_match_id+0x45/0x370
  but task is already holding lock:
  ffff88811c810d78 (&i3cbus->lock){++++}-{4:4}, at: i3c_master_reg_work_fn+0x21/0x5f0

Fix this by separating device creation from device registration.
Populate desc->dev under the maintenance lock, collect the devices that
still need registration into a local list, then release the lock before
calling device_register().  Finally retake the lock and clean up any
devices that failed to register.

Use the maintenance lock rather than the normal-use lock while adding
device objects.  A write-side maintenance lock prevents readers from
observing a partially initialized desc->dev during initial device
population, or desc->dev disappearing if registration fails.

The local list requires a list node, so add a list node member to struct
i3c_device.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'd-by

Changes in V4:

	Expanded the kernel-doc for the new struct i3c_device @node
	member to note that it is only for use by
	i3c_master_register_new_i3c_devs() and is not protected by a
	lock.

Changes in V3:

	Added Cc: stable@vger.kernel.org

Changes in V2:

	New patch


 drivers/i3c/master.c       | 45 ++++++++++++++++++++++++++++----------
 include/linux/i3c/master.h |  3 +++
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f485b98805cf..d2fb1a110521 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2069,12 +2069,21 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 static void
 i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 {
+	struct i3c_device *i3cdev, *tmp;
 	struct i3c_dev_desc *desc;
+	LIST_HEAD(i3c_unreg_devs);
 	int ret;
 
 	if (!master->init_done)
 		return;
 
+	i3c_bus_maintenance_lock(&master->bus);
+
+	if (master->shutting_down) {
+		i3c_bus_maintenance_unlock(&master->bus);
+		return;
+	}
+
 	i3c_bus_for_each_i3cdev(&master->bus, desc) {
 		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
 			continue;
@@ -2104,25 +2113,37 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		if (desc->boardinfo)
 			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
 
-		ret = device_register(&desc->dev->dev);
-		if (ret) {
-			dev_err(&master->dev,
-				"Failed to add I3C device (err = %d)\n", ret);
-			desc->dev->desc = NULL;
-			put_device(&desc->dev->dev);
-			desc->dev = NULL;
-		}
+		list_add_tail(&desc->dev->node, &i3c_unreg_devs);
+	}
+
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	list_for_each_entry_safe(i3cdev, tmp, &i3c_unreg_devs, node) {
+		ret = device_register(&i3cdev->dev);
+		if (ret)
+			dev_err(&master->dev, "Failed to add I3C device (err = %d)\n", ret);
+		else
+			list_del_init(&i3cdev->node);
+	}
+
+	i3c_bus_maintenance_lock(&master->bus);
+
+	list_for_each_entry_safe(i3cdev, tmp, &i3c_unreg_devs, node) {
+		list_del(&i3cdev->node);
+		desc = i3cdev->desc;
+		i3cdev->desc = NULL;
+		put_device(&i3cdev->dev);
+		desc->dev = NULL;
 	}
+
+	i3c_bus_maintenance_unlock(&master->bus);
 }
 
 static void i3c_master_reg_work_fn(struct work_struct *work)
 {
 	struct i3c_master_controller *master = container_of(work, typeof(*master), reg_work);
 
-	i3c_bus_normaluse_lock(&master->bus);
-	if (!master->shutting_down)
-		i3c_master_register_new_i3c_devs(master);
-	i3c_bus_normaluse_unlock(&master->bus);
+	i3c_master_register_new_i3c_devs(master);
 }
 
 /**
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 2dc139a217bf..26535beb1e77 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -238,6 +238,8 @@ struct i3c_dev_desc {
  *	  every time the I3C device is rediscovered with a different dynamic
  *	  address assigned
  * @bus: I3C bus this device is attached to
+ * @node: unregistered device list node, only for use by
+ *	  i3c_master_register_new_i3c_devs(), it is not protected by a lock
  *
  * I3C device object exposed to I3C device drivers. The takes care of linking
  * this object to the relevant &struct_i3c_dev_desc one.
@@ -248,6 +250,7 @@ struct i3c_device {
 	struct device dev;
 	struct i3c_dev_desc *desc;
 	struct i3c_bus *bus;
+	struct list_head node;
 };
 
 /*
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
