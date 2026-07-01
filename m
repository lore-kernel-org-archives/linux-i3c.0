Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24431C43327
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMeHt+Uq35fKFmQudBAFLXOs0eEqrrTVCi6v52IR1kM=; b=nWrG7Yc74wdJJ7
	+RBlmWRU5apznZE3GNN1HHih8OZoNiVNPrB86hwbDnoGmFhFts+wfDQQ6oH53dsOSvQB3Ma7bz2Q0
	M1JvJxIZ7je4G/uyBegj5W1NIfl+PkF8eYDwNi9IpTHJAkjd9JQlEQoSdIbBhq/Pm/7CR3emoCI3p
	C07FHhol7RKHol2HmE3IJ3IFpktUYdWGjMksTWnlXMPje92K1U1oc1kgv4rY26ichvSjHygzapk6s
	xeC35cRr5i0MOhvM02FwpjHs5pewcA80J19lxzsXcJ9Rrr4kuybSETJsI5mU4ZRXxaUDbjTatt/f6
	j22xwUMHmm5p8aGBqChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1CF-00000002wSQ-3YEf;
	Wed, 01 Jul 2026 20:06:11 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1CD-00000002wRb-2i6C
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936370; x=1814472370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xpKgPGn7FASAl8THDfEQnPWCZu586ywBfc3bGU/xi4k=;
  b=mjkg2ts87NtEbHbtUfAP0pyUauPDL8brSQ/R6FuMmG/rv7sabPqAllEO
   3qiAToywfLsfwju84p+/A8Pr4Ge9hUe1DIu+bCJI1dm5YIxlQMmi8QQjH
   FpobKFIhnN7TtqsmZ1IX4ccbsFgvyuEwpGLLg7e2r4tvy8+w75kXRPNJA
   ct0eIprHWTj+N7UqoU9MeeaKIX08Qgy5zwsX/XVARe0KVqsUWDz21ayWc
   SDey5k1iI8cu6E8QF20axjwt0R0k1gFQ5akMtbloTP8zioQyX7Y4VyJbg
   KmijpdOkesD/NQIIzf5+CZ6hT0QsnJYRbNqXjgiFWs/iumAHOgw0PLZRw
   Q==;
X-CSE-ConnectionGUID: vjwPxl9lSiW5X0k6l5BVyw==
X-CSE-MsgGUID: EhRnxfiWTdCYmccsX8YKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83812899"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83812899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:06:10 -0700
X-CSE-ConnectionGUID: pq3InF5+TAi0F17JvQaZYg==
X-CSE-MsgGUID: JFWOQshKQJeLyRnsltlEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="252805015"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:06:07 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@lists.infradead.org,
	linux-pm@lists.infradead.org
Subject: [PATCH RFC 1/7] i3c: master: Support IBI-based wakeup capability
Date: Wed,  1 Jul 2026 23:05:46 +0300
Message-ID: <20260701200552.220042-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701200552.220042-1-adrian.hunter@intel.com>
References: <20260701200552.220042-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_130609_693833_02A63504 
X-CRM114-Status: GOOD (  13.37  )
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

An I3C controller acts as a bus controller for one or more I3C devices.
If the controller can wake the system in response to an In-Band
Interrupt (IBI), then any device on that bus that is capable of
generating IBIs can potentially be used as a wakeup source.

Add an ibi_wakeup flag to struct i3c_master_controller so controller
drivers can advertise support for IBI-based wakeup.

If set, mark IBI-capable I3C devices as wakeup capable when they are
registered, allowing wakeup management through the standard device
wakeup framework.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c       | 8 ++++++++
 include/linux/i3c/master.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f1be38a640ca..a47e2924bb70 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -17,6 +17,7 @@
 #include <linux/list.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeup.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -1930,6 +1931,13 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		if (desc->boardinfo)
 			desc->dev->dev.of_node = desc->boardinfo->of_node;
 
+		/*
+		 * In the case of IBI wakeup, any IBI-capable device can
+		 * wakeup.
+		 */
+		if (master->ibi_wakeup && (desc->info.bcr & I3C_BCR_IBI_REQ_CAP))
+			device_set_wakeup_capable(&desc->dev->dev, true);
+
 		ret = device_register(&desc->dev->dev);
 		if (ret) {
 			dev_err(&master->dev,
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 4d2a68793324..af3c35a8e7b6 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -511,6 +511,7 @@ struct i3c_master_controller_ops {
  * @hotjoin: true if the master support hotjoin
  * @rpm_allowed: true if Runtime PM allowed
  * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
+ * @ibi_wakeup: IBI can wakeup the system
  * @shutting_down: set to true when master begins shutdown or unregister
  * @boardinfo.i3c: list of I3C  boardinfo objects
  * @boardinfo.i2c: list of I2C boardinfo objects
@@ -545,6 +546,7 @@ struct i3c_master_controller {
 	unsigned int hotjoin: 1;
 	unsigned int rpm_allowed: 1;
 	unsigned int rpm_ibi_allowed: 1;
+	unsigned int ibi_wakeup: 1;
 	bool shutting_down;
 	struct {
 		struct list_head i3c;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
