Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270E1C55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GuS10f4j1V0FzXfIi8Gy1ZnUDInCSBCUcYa1j67ukaU=; b=Bk22H+BxOjXhXw
	oZJHLnUuPGCtyGe1g6ITnAwqmaRLvhS7bjyCRd/3eI4xspdbHoqYnzII7thLHB+wmNBIzFnbE2bRJ
	f8Ijt5RDaBRNMDE8ez93gSDU9fX6J8ZG1U3qUeR2IOtoS/GTwsHLzfO2KZlxUY0mqhIPryx1F5mKM
	SeqXUE4SDfW03YAuLAva2KYoUULL36PjBa4RrPMRbnH2o7KmNfLRisURA/w/ZK/PcoRKjMUERpRHw
	lDOeokIFQYHhWKQUs87gDXdqf877PYeUM8BXbpP6DYldywzlw/hyR0/Ir7d2pIbu64Vkg6mSZrwRJ
	qwhjEekf7NXrFD6FkQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLv-00000001wZb-3ao9;
	Tue, 04 Aug 2026 13:38:43 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLu-00000001wP5-0XFY
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785850722; x=1817386722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HWQMI+wawODYOPEXCnKPsgukTVxlPA74yZ6Re2Vsr8Q=;
  b=JRnYKRZZwCCdDz8MKvlpz252LNrlG634OPYYgWBRA7yXVVmf72XqcC8K
   OIMvh/o0NXhP3C88aZxvSe1dk3N1woELs2h1s6/NJNSVYD8wXFdWuSOZ8
   TX9BYlOBY7sI6r5xP6xyRFvAphvJHop25j3VZE04z1F7xcZtmHv3dgOkF
   RJJDeQF0RYbrdK4unZRGeluOlCrfjA+yImCiNqjiM9cbtsCdv/QKutzch
   n1QizbLHAkihijV7jzBN7Rt0i4qnBrOseZTCAUpPZDWY6kUsvjUCb9owh
   l2QT+4gD+0W7ZsfzaQyYVPXX3CROU9pPH8wofnkDnC4iMNIi8ajxkXxNG
   g==;
X-CSE-ConnectionGUID: oXt9HFmrTx2nQL/RNpiBDA==
X-CSE-MsgGUID: e7Epyd8sTUuNQgoKOusLZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86410139"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86410139"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:42 -0700
X-CSE-ConnectionGUID: b4EQ/XzgQrixUfSNLTCYvQ==
X-CSE-MsgGUID: V4piSqSJQoe8IXa9kChn9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263501030"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:39 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 08/14] i3c: master: Support IBI-based wakeup capability
Date: Tue,  4 Aug 2026 16:38:04 +0300
Message-ID: <20260804133810.184905-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133810.184905-1-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063842_207420_01BA6D38 
X-CRM114-Status: GOOD (  11.23  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Dropped the redundant #include <linux/pm_wakeup.h>.  That header
	must not be included directly, and linux/device.h, which is
	already included, provides device_set_wakeup_capable().


 drivers/i3c/master.c       | 7 +++++++
 include/linux/i3c/master.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e7ea41007889..e6b320da475e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2110,6 +2110,13 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		if (desc->boardinfo)
 			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
 
+		/*
+		 * In the case of IBI wakeup, any IBI-capable device can
+		 * wakeup.
+		 */
+		if (master->ibi_wakeup && (desc->info.bcr & I3C_BCR_IBI_REQ_CAP))
+			device_set_wakeup_capable(&desc->dev->dev, true);
+
 		list_add_tail(&desc->dev->node, &i3c_unreg_devs);
 	}
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 2b96c4ea75fb..16394aca7230 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -523,6 +523,7 @@ struct i3c_master_controller_ops {
  * @hotjoin: true if the master support hotjoin
  * @rpm_allowed: true if Runtime PM allowed
  * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
+ * @ibi_wakeup: IBI can wakeup the system
  * @shutting_down: set to true when master begins shutdown or unregister
  * @boardinfo.i3c: list of I3C  boardinfo objects
  * @boardinfo.i2c: list of I2C boardinfo objects
@@ -562,6 +563,7 @@ struct i3c_master_controller {
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
