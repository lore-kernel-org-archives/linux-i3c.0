Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32F4CD8C9D
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcRLla9rJkCPb4OZqqE8ROD1cMMaGsC5nxO62Xi7DIY=; b=ypShcy4px8FPC8
	DyW3qIIIIlnnbvggPzelmbiu6yXu1AXq1pGgzc1HFhz20lUHIzb7P8vhM8AhQiZPkkhhWOjKcKv0I
	MCdt5NP1rn1l+cN1X/WDMgBN9CfYr/GDJLkObzvxQuwcmxyE9s2in+wPDZCuQa4EKQK8qdFXNaCzW
	pLDVQKPtK+RpODYmnmKx6i2UyMiCWnV1Ik7w9omvKSDHAc4MKbqwsHnooWYilWbdrDG1EvLBEkLUj
	x3jS4ChfGoc4wLv27OzstaFfrIrt9/2MX/h6xCM1cxg+lu5+UCpCa3PV5iogFSkK4CiGaf+7hmeuX
	8wA2W+0GBa06vjwADUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlk-00000002qr6-1vwG;
	Mon, 08 Jun 2026 05:43:28 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSli-00000002qqP-0LOn
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897406; x=1812433406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0D0ziknM5/Nl0Em5mnCs2JXj0peRPBzkNfGpiwO0e64=;
  b=MWhzW6bvA1kji+JsUem73tL6dN115KOVq+1Vkd/KAtOfW4Fssij9ME1r
   IyeLu6GepjJYW4NuudHX94gPTPVqorWEwa7sz6u2h9E5nri7sMm3jzwsC
   Fbo4wcCtfpGnBNh3MSczGExcXUpSft5KajjNhOTE1gFypJlZN17kcCM9Z
   QMaUimsgKoDx3NZkRvxdyWeOb+1CxS0MR6AXS4QjRweQexQTnZ8tS5ia8
   7Yowraq2DZhtklzw1MWM0Y/trdvfGymyAdGyhKgN7QnEv6xxQ4JCmxt96
   5tiv1NrqZz6AWojmfTwFPel3reKePyVdXF9JjQ/hnOa9Wpp74lMr+waxK
   g==;
X-CSE-ConnectionGUID: 8KPbwlNsS22+gOkmOxyiMA==
X-CSE-MsgGUID: W9R7/7umQD6EqjVCjdyoVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284021"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284021"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:25 -0700
X-CSE-ConnectionGUID: M+RnJbdNSN2ggOLN8Kq3HA==
X-CSE-MsgGUID: cYtTb+/oQLKvuXQS6YM67g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505651"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:23 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/8] i3c: master: Make hot-join workqueue freezable to block hot-join during suspend
Date: Mon,  8 Jun 2026 08:43:05 +0300
Message-ID: <20260608054312.10604-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224326_172526_5E9AEFC2 
X-CRM114-Status: GOOD (  14.50  )
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

Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Fixes tag
	Add Frank's Rev'd by


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
