Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEF6D73E80
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQ1kX/OY1clBLc2782MJDJA+julXNtsTnlCFu/X3Rko=; b=ViaCoo9rrEXRkM
	1/1Q1wdWJ85dZq7tibeh8YYhm9hl/ag3AcExbJ6s39ng2UyPdUdUlmwjigF2K/SNf6I+LTlZcFLp4
	eL3fXrA81A1ReFgvTfJ11XH598635/7uOzRuHO3VJLxrXeIfXgXJK/Sw0hbHvVSFXIoV5NslvrydU
	y6DFIOFJi4fLFlQV3RTS7WC7q56lBAiAU36jPcPQO5E6VkR/GEjqQGosYnlrPJtSCNyROeNtVDi3b
	rkZjH8OdJ86J52oK3AKmZuP58TFRv25zjz8fOfN1hOcI2w3UXYdHSY9flbByMX5vVhZMqvCoN2spF
	a71JT6/AZG+OzCGZbIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWbf-00000000VVJ-1JXm;
	Thu, 29 Jan 2026 18:19:03 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWbb-00000000VT1-1TLi
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 18:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769710739; x=1801246739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CLXURq7tlSrIb+QZ2FESlRHc+yoIVSsLvnSsvxf0JUY=;
  b=Oi8myQ9y8b8vRAsVGvC7JX+h+QI9tuXS40afMFRqCIgEXG4ma5NSfR6p
   4jXkQCBQT4QDOm3dYYfW3B52Jj0rVAW7VNSo46LKDySy/fbjgo5yqsrGA
   HCpLeZcbrf3pJMXSykYc79T52+0u+xodqn8Hvxuk9gaiIzRWI+jAwl6Oe
   zzRjjxQSWZ0B7w8H1yQrw1Yx37CUgLatw3Y1jctoYQjlzXBJvz/BnPHcC
   bW2CuEFO5KQyvmB7MNeSkox1wCdb5XokRVDagyjI+WbvHaIw0AaEyJSar
   QvmqANLjpx4ulJ+SHZE5aFKsRBAWEwOvpBqOAQqnSMgXcciFV9sBI30b7
   g==;
X-CSE-ConnectionGUID: zFaIVuDlSGeIA4u1fi+4Iw==
X-CSE-MsgGUID: 8c4m10DZTcO2R54uZpxCGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70158282"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="70158282"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:18:59 -0800
X-CSE-ConnectionGUID: Xsn2QIhpSoukT7gB2j1Qjg==
X-CSE-MsgGUID: 1TcGD0alSmeebOPI8M6rng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208255287"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.96])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:18:57 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/7] i3c: master: Allow controller drivers to select runtime PM device
Date: Thu, 29 Jan 2026 20:18:36 +0200
Message-ID: <20260129181841.130864-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260129181841.130864-1-adrian.hunter@intel.com>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101900_696183_C85D8342 
X-CRM114-Status: GOOD (  16.00  )
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

Some I3C controller drivers need runtime PM to operate on a device other
than the parent device.  To support that, add an rpm_dev pointer to
struct i3c_master_controller so drivers can specify which device should
be used for runtime power management.

If a driver does not set rpm_dev explicitly, default to using the parent
device to maintain existing behaviour.

Update the runtime PM helpers to use rpm_dev instead of dev.parent.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c       | 9 ++++++---
 include/linux/i3c/master.h | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 49fb6e30a68e..bcc493dc9d04 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -108,10 +108,10 @@ static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
 
 static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
 {
-	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->dev.parent) : 0;
+	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->rpm_dev) : 0;
 
 	if (ret < 0) {
-		dev_err(master->dev.parent, "runtime resume failed, error %d\n", ret);
+		dev_err(master->rpm_dev, "runtime resume failed, error %d\n", ret);
 		return ret;
 	}
 	return 0;
@@ -120,7 +120,7 @@ static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
 static void i3c_master_rpm_put(struct i3c_master_controller *master)
 {
 	if (master->rpm_allowed)
-		pm_runtime_put_autosuspend(master->dev.parent);
+		pm_runtime_put_autosuspend(master->rpm_dev);
 }
 
 int i3c_bus_rpm_get(struct i3c_bus *bus)
@@ -2975,6 +2975,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
+	if (!master->rpm_dev)
+		master->rpm_dev = parent;
+
 	ret = i3c_master_rpm_get(master);
 	if (ret)
 		return ret;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index af2bb48363ba..4be67a902dd8 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -501,6 +501,7 @@ struct i3c_master_controller_ops {
  *	 registered to the I2C subsystem to be as transparent as possible to
  *	 existing I2C drivers
  * @ops: master operations. See &struct i3c_master_controller_ops
+ * @rpm_dev: Runtime PM device
  * @secondary: true if the master is a secondary master
  * @init_done: true when the bus initialization is done
  * @hotjoin: true if the master support hotjoin
@@ -526,6 +527,7 @@ struct i3c_master_controller {
 	struct i3c_dev_desc *this;
 	struct i2c_adapter i2c;
 	const struct i3c_master_controller_ops *ops;
+	struct device *rpm_dev;
 	unsigned int secondary : 1;
 	unsigned int init_done : 1;
 	unsigned int hotjoin: 1;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
