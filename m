Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCF3CD4851
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 12:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UXLnsd9tlTcfJ3c1RzFrriOy21yiywAszZSd3hmq8g=; b=ZNa0Zm8P98w8dY
	23i5fBbSupsRQSta32z7pNi5g8wtOcL0Xm/skVL/7CjfEbMHWDUVsxh746V7OedWxqN9gZFgJlOjt
	7KGaFHhSbFlPmHalX6eWAKZRuEnZkgTgT47cxFAZIViPqRw5ojKgLfrLkXlXWw8XYtd7OhsgO6+mT
	r573ynh4GkfRlDvtO8G7m6EEbXW6bxnFfcP5Yv3vGM6rB6A1gdJewBUKoF1rGZSf3E9nq4jAuFOTF
	RbVuUQ67ruHyuZw+Agh+gonWt/ECpUZ7r+3OWZ4Isg6qR4sKUAnBlOJ9zQ6E12vQ/Ofl4FxeFuwKu
	jiR7NBerZSUmFjuATNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3a-0000000GeC0-2peY;
	Tue, 12 May 2026 12:17:50 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3Y-0000000GeAj-0YUk
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 12:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778588268; x=1810124268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Nu3OZDOmbKNKiTWVhoCSpKDi6flE6D28VO36QUz+ro=;
  b=Vx9NwDNwv5MeiUlvP/q/UUVHpQrzy+BEQ6KLE/VAHTZv2FPljC7qs3+3
   dHVs0m/WSUkS9HkCwM41e/F3rYiRyWzrtMn2GgJ+0jaDFKzNC47TUK12w
   U6m/iEJJ+diAgwbvJx1jhdxylEOs9aYPXNe6am5qwJSxJvS1Cly99rubP
   6GCWKLHG4YeuJuRLWdBIjIHiHi/yLzbM206YPNq7dyefBlPjFOf7n7OU1
   C8TVUrO/wFVUAPsN2+VIE76wzWUghkUE8F/sdQZgYqnimtv1QX3Ml0MOy
   T7JfKcPVmayLA7QpxINqdLhMaMY9MjfzGtwd1D6N3v0oGH08rmyR8UJFb
   Q==;
X-CSE-ConnectionGUID: 1Bwn0e6eT+2XRF8UnLdkMg==
X-CSE-MsgGUID: dkC95Jj7SbmOLilQbN3DLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79389483"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79389483"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:48 -0700
X-CSE-ConnectionGUID: 0t/VBKKHSkeoGg8Wf7LuTQ==
X-CSE-MsgGUID: nJWyVGpGTpmiAlqcyxH6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241756124"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.121])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:46 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] i3c: master: Make hot-join workqueue freezable to block hot-join during suspend
Date: Tue, 12 May 2026 15:17:25 +0300
Message-ID: <20260512121732.406009-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260512121732.406009-1-adrian.hunter@intel.com>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_051748_214859_84591EA5 
X-CRM114-Status: GOOD (  15.01  )
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

The I3C master workqueue (master->wq) is used to defer work that needs
thread context and the bus maintenance lock, most notably Hot Join
processing (which calls i3c_master_do_daa() to assign dynamic addresses
to newly joined devices).

Currently the workqueue keeps running across system suspend, which can
race with the suspend path:

 - do_daa() may execute after the controller has been suspended,
   issuing bus transactions on a powered-down or otherwise unusable
   controller.
 - New I3C devices can be enumerated and added to the bus mid-suspend,
   registering driver model objects at a point where the I3C subsystem
   and its consumers are not prepared to handle them.

Mark the workqueue WQ_FREEZABLE so its workers are frozen for the
duration of system suspend/hibernate and resumed afterwards. This
naturally defers any pending or newly queued Hot Join work until the
system (and the controller) is fully resumed, closing both races
without adding explicit suspend/resume synchronization in the master
drivers.

Update the kerneldoc for struct i3c_master_controller::wq to reflect
that the workqueue is freezable.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c       | 2 +-
 include/linux/i3c/master.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5cd4e5da2233..ab11e2d79aab 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3079,7 +3079,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	if (ret)
 		goto err_put_dev;
 
-	master->wq = alloc_workqueue("%s", WQ_PERCPU, 0, dev_name(parent));
+	master->wq = alloc_workqueue("%s", WQ_PERCPU | WQ_FREEZABLE, 0, dev_name(parent));
 	if (!master->wq) {
 		ret = -ENOMEM;
 		goto err_put_dev;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 592b646f6134..e6112e5f6608 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -515,7 +515,7 @@ struct i3c_master_controller_ops {
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
- * @wq: workqueue which can be used by master
+ * @wq: freezable workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
