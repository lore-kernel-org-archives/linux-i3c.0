Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA92C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMeHt+Uq35fKFmQudBAFLXOs0eEqrrTVCi6v52IR1kM=; b=BoJsszM4Jvwtz9
	mURDGimkk6fxmDMvtc9819fwUJK89BwK0s5kepvAzp71B7QR/JcORUoJ9v/6w5mDUj8o+K8b1lvaJ
	23eAmX99uQigzE29L6R8nyZLY81oIhRtyWZaaPYZLx68ryHqES9HuBGIbm+olw6ygI9pqEowgg9XD
	qiPFtIRxtFLivxj4T8FG62DJhmpzyWi022GxqYVuHO7dBamHfCT9kduLzgfYQqnSdcQUeKjONZgrB
	6jYOUcw+jcK0Mou2Msf+umjzRogKgqBIBGlXBdlfgdOErsei3py0UT0VQQrRRz/s2id3Fj34golvk
	oy5CPMlGipNJaCBoUk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1LX-00000002x7M-1fOX;
	Wed, 01 Jul 2026 20:15:47 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1LV-00000002x67-46Do
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936946; x=1814472946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xpKgPGn7FASAl8THDfEQnPWCZu586ywBfc3bGU/xi4k=;
  b=SIIQtiYYlmKPJeCRS9jRI2ajgYWjQL9NfyZz/s+Mf+g6owLb5oRpK1tl
   jxm8qXwAbNtbxs6qdQFWcqrD4gu82Iz5oJD4OEBH49E+2wKQRf9IsIoIu
   2jntIvjHco6ZH2d5yds0hnSDYhnhu/mYZLviNE0Q5/2ZEHWOgq7XxIL49
   u6Bo8O3oP2ghNSPI+bbmETWOnUIUmGTBWSta1AhaF1uUYNx/AiJS3lHxd
   e7x5Gcx5swt7dqKHHNASNjEwAqeuOLNPdbanyJ54j5LEaYyitv8jwwX9U
   HdZIbxjkm3fcbrpgR8LmcV5YkkElLs/7VSzKMvJh6zpzZUSBjLspA4nfk
   w==;
X-CSE-ConnectionGUID: 3zeuUPJuR7aR7WIn3pD04g==
X-CSE-MsgGUID: nCcFEmFRRNuSXib1fkH1lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82671787"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82671787"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:46 -0700
X-CSE-ConnectionGUID: bztpNFPZRFyTDZ929/440Q==
X-CSE-MsgGUID: +wmrM7/hQ3uKWso7miGTEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282737047"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:44 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH RFC RESEND 1/7] i3c: master: Support IBI-based wakeup capability
Date: Wed,  1 Jul 2026 23:15:27 +0300
Message-ID: <20260701201533.220818-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701201533.220818-1-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131546_021154_FD8F4F0C 
X-CRM114-Status: GOOD (  13.08  )
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
