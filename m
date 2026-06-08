Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06803CD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ws9mZZB4iIeTThys2JT5JVOFYNwo9Z1CE/zaxEUGYqg=; b=EXTDskEdlQPsPf
	/AwFyRI/8ySny9+HRPojednqd9xzFfYeer84HEkJgrUnGTXMSQVlDCMlxZL2niSnEVCY0L/4GHd2e
	oRfaoGxFrrjaoohI+ECeyywL/W8sjFuu38KpbaM/6mfj69/OnnQiWX/Ui6yaGCWHXjyozkg4Sw8N3
	HE0E5COjy24nth3egu/DTdQdSvVJjy7vOCPyVI0sa/vevQZrdV7ngJ9QnuG44lYuVBd8D4b3vj7a3
	KYm1PNDdrrbXoqh8EdnYC1CHWKByDXyfztbIdNqV0OXeDu8RA9yzABKUnqdZIaJw9AvF+2sXKM2pn
	VsDtNgj3ANmx+Any4XSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlv-00000002qwO-3Efe;
	Mon, 08 Jun 2026 05:43:39 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlt-00000002qr4-1MGQ
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897417; x=1812433417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E8Vt+NIVNs2ebq02cwn40Si4wDD5rT6ahbuuDnfCWj4=;
  b=Wcx41Oj7mPVvYJEBFvlkpTO/Tl2NQojfrb7He4PUilsJY+U41XBxTMkV
   jZ9c4DUuOZldE/UfiqF3yF/3HzRrcZhA41Htezx2Hbos9ojbUcRQncwuv
   tQZxGLhpRLpeIle6+rJtanHInIH5sbOZ4FFg/2FiEm6jHGylmxiJTUfJz
   K3AVqJ08c9xhhhUYWji3KiGo6ATMrb0ic6rBnL7Ngim61vDFCJrCt7byj
   EHQG9lmG1NcYRtyGndDKb+KVaW6AIkYubVDXq7eZe4l8pFAC59/BBVC1c
   7udOyPJt/aVj6kkTvGjbFyt7DuCzFyvdVgeFyenpAOHI9nyW94nUu9Z5B
   w==;
X-CSE-ConnectionGUID: zsvHB9pDSaykwHUL9HDDPA==
X-CSE-MsgGUID: ljS5mrx3Rbailw9KWyyPEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284059"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284059"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:37 -0700
X-CSE-ConnectionGUID: MGudDwUZR0O74P0aAc18sQ==
X-CSE-MsgGUID: LyA9su9oQ7StQYTk7l4t3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505692"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:34 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 6/8] i3c: master: Defer new-device registration out of DAA caller context
Date: Mon,  8 Jun 2026 08:43:10 +0300
Message-ID: <20260608054312.10604-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224337_420056_48DA8A03 
X-CRM114-Status: GOOD (  18.74  )
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

Master drivers may invoke i3c_master_do_daa_ext() during resume to
re-run Dynamic Address Assignment.  As well as assigning addresses to
any newly arrived devices, this restores the dynamic address of devices
that lost it across system suspend, so it has to run as part of the
controller's resume path.

A side effect of i3c_master_do_daa_ext() today is that it also
registers any newly discovered I3C devices with the driver model
inline, via i3c_master_register_new_i3c_devs().  Doing that from the
resume path is problematic: a hot-join-capable device may join the bus
during this same DAA, and registering it immediately would push driver
model work (probing, sysfs, etc.) into the controller's resume context,
where the rest of the system is not yet fully resumed and the
controller driver is still partway through its own resume sequence.

Decouple discovery from registration: add a reg_work work item to
struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
on master->wq (the freezable workqueue) instead of calling
i3c_master_register_new_i3c_devs() directly.  The worker performs the
registration only when the controller is not shutting_down, and is
cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
freezable, any newly observed devices end up being registered after
the system has finished resuming.

i3c_master_register() also routes its initial post-bus-init registration
through reg_work, using flush_work() to keep probe-time behavior
synchronous.  This keeps a single registration code path and ensures the
worker is the only writer of desc->dev.

Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd by

Changes in V2:

	Add comment about reg_work use
	Add Fixes tag


 drivers/i3c/master.c       | 27 ++++++++++++++++++++-------
 include/linux/i3c/master.h |  6 ++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index a59c4b744b36..c9685379e868 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -839,6 +839,7 @@ static void i3c_master_shutdown(struct i3c_master_controller *master)
 	i3c_bus_maintenance_unlock(&master->bus);
 
 	cancel_work_sync(&master->hj_work);
+	cancel_work_sync(&master->reg_work);
 }
 
 static void i3c_device_shutdown(struct device *dev)
@@ -1838,6 +1839,16 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+static void i3c_master_reg_work_fn(struct work_struct *work)
+{
+	struct i3c_master_controller *master = container_of(work, typeof(*master), reg_work);
+
+	i3c_bus_normaluse_lock(&master->bus);
+	if (!master->shutting_down)
+		i3c_master_register_new_i3c_devs(master);
+	i3c_bus_normaluse_unlock(&master->bus);
+}
+
 /**
  * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
  * @master: controller
@@ -1878,9 +1889,7 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 	if (ret)
 		goto out;
 
-	i3c_bus_normaluse_lock(&master->bus);
-	i3c_master_register_new_i3c_devs(master);
-	i3c_bus_normaluse_unlock(&master->bus);
+	queue_work(master->wq, &master->reg_work);
 out:
 	i3c_master_rpm_put(master);
 
@@ -3126,6 +3135,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 		goto err_put_dev;
 	}
 	INIT_WORK(&master->hj_work, i3c_master_hj_work_fn);
+	INIT_WORK(&master->reg_work, i3c_master_reg_work_fn);
 
 	ret = i3c_master_bus_init(master);
 	if (ret)
@@ -3151,12 +3161,15 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	/*
 	 * We're done initializing the bus and the controller, we can now
-	 * register I3C devices discovered during the initial DAA.
+	 * register I3C devices discovered during the initial DAA. Device
+	 * registration is done via reg_work because that keeps a single
+	 * registration code path and ensures the worker is the only writer
+	 * of desc->dev. Flush the work to preserve synchronous probe-time
+	 * behavior.
 	 */
 	master->init_done = true;
-	i3c_bus_normaluse_lock(&master->bus);
-	i3c_master_register_new_i3c_devs(master);
-	i3c_bus_normaluse_unlock(&master->bus);
+	queue_work(master->wq, &master->reg_work);
+	flush_work(&master->reg_work);
 
 	if (master->ops->set_dev_nack_retry)
 		device_create_file(&master->dev, &dev_attr_dev_nack_retry_count);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 77e63082b06e..8cdd7be505d3 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -523,6 +523,11 @@ struct i3c_master_controller_ops {
  *	be done from a sleep-able context
  * @hj_work: work item used to run DAA after a Hot-Join event is detected.
  *           Queued to @wq by i3c_master_queue_hotjoin()
+ * @reg_work: work item used to register newly discovered I3C devices with
+ *            the driver model. Queued to @wq by i3c_master_do_daa_ext() so
+ *            that device registration is deferred out of the DAA caller's
+ *            context (notably the resume path), and is skipped if the
+ *            controller is shutting down
  * @dev_nack_retry_count: retry count when slave device nack
  *
  * A &struct i3c_master_controller has to be registered to the I3C subsystem
@@ -548,6 +553,7 @@ struct i3c_master_controller {
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
 	struct work_struct hj_work;
+	struct work_struct reg_work;
 	unsigned int dev_nack_retry_count;
 };
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
