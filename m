Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1EDC55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mrqed2YFzQM4yL0suWj7sDw4I+Kff5cRmTZENBT+8Q=; b=mG8u5H8X74w5/8
	E7PG3rOs3p75QLo+Ypydx1eD5SFDOdFm0RKlRrXvAu2XSIo7bRi2BahUpai4Hbxwp4rw6U6ryQfRT
	ZDmf0MNbwK5m3pjLQ3n0EnCU95QJMH8o68Vna0MGRAqZiX2qdjq46CRyTskLhh/2YFwbUhLBHCH1e
	nA21QbB5kG1zl6C7EUmvsbkkqYdnDQfZeP9s2HrSOx0dTq4BWJj53ldDR3Qtgd4dGVz62540FKuC/
	nxt35WGgShOrBiWSS4AfV2L7vOKLyf/l0VFy4t2iQiMnGjngnRArXy2GAzKHtTWfgkorz2Ipa7VJ5
	A6ZF40XK9Jlcapoz9Ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0Z-00000005sAu-34Jr;
	Thu, 06 Aug 2026 13:19:39 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0Y-00000005s3x-09t9
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022378; x=1817558378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EtxnJOm3NSmACaS/tiOPyFKADy79NbBD5bCrwvIqOZU=;
  b=IW63m7baQ533zPm+GyVsSjE+q+X95pyG+xPjqPS42N6MrampUAzN7Ae2
   Kf3zZ8KE4574hpPMtrp3SlqE3z+JljuGHlzvUOTrZ84yNjonIkSh3M7rY
   FAwUQSYsKFFK3lXeDjtG2jLPX3VFxxtc87luGBr2pF4EtCAJCeEVmkoIy
   d4CaF4vsP1Kfxl7oEBeDY7SrbNt4ae2JB3K4P29vFWVSnxtQsKrEDusNg
   WWPFgVzmkl5IjmaEcmQCFn6HgRmtsQ5+Xu728HvLv/tOa/McCSLzDlyh2
   ILYACq6IfguGHAVkhhtVHlCO4/klZvTXk1P/I/y5o+Hqq3UeQ5zC7sG13
   w==;
X-CSE-ConnectionGUID: oGrIyb+USYO51MQrFDLTgQ==
X-CSE-MsgGUID: yvHs9ktGS4q77gzdCN/46w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149628"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:37 -0700
X-CSE-ConnectionGUID: MHq4+90MSm6Hln4i+ou1gA==
X-CSE-MsgGUID: DhgyIspyRsmuZLe3Jlw7vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338248"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:35 -0700
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
Subject: [PATCH V4 10/14] i3c: master: Add helper to query bus wakeup requirements
Date: Thu,  6 Aug 2026 16:18:53 +0300
Message-ID: <20260806131857.119830-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806131857.119830-1-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061938_085560_48A49D16 
X-CRM114-Status: GOOD (  14.05  )
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

Add i3c_master_has_wakeup_enabled_devs(), which iterates over the devices
on an I3C bus and reports whether any of them are enabled for system
wakeup and have IBI enabled.

Controller drivers can use this helper to determine whether wakeup
support must remain available while the system is suspended.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V4:

	Renamed i3c_master_any_wakeup_enabled() to
	i3c_master_has_wakeup_enabled_devs().

Changes in V3:

	Skip the master device explicitly.  Added kernel-doc noting
	that wakeup enablement is user space policy, so the helper is
	meant to be called from a system suspend callback.

Changes in V2:

	i3c_master_any_wakeup_enabled() now also requires the device to
	have IBI enabled, not just system wakeup enabled, so that a
	device with no active IBI request does not keep PCI PME enabled.
	desc->ibi_lock is taken while checking.  The commit message and
	kernel-doc are updated to match.


 drivers/i3c/master.c       | 35 +++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 6c5341491944..afcd7a21a3e6 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2147,6 +2147,41 @@ static void i3c_master_reg_work_fn(struct work_struct *work)
 	i3c_master_register_new_i3c_devs(master);
 }
 
+/**
+ * i3c_master_has_wakeup_enabled_devs() - check if any device can wake the system
+ * @master: I3C master controller
+ *
+ * Iterate over devices on the bus and return true if any device has
+ * system wakeup enabled and IBI enabled.
+ *
+ * Whether a device is enabled for system wakeup is user space policy,
+ * settable at any time through the device's power/wakeup sysfs attribute,
+ * so the answer is only stable once user space is frozen.  Call this from
+ * a system suspend callback.
+ *
+ * Return: true if any device may wake the system via IBI, false otherwise.
+ */
+bool i3c_master_has_wakeup_enabled_devs(struct i3c_master_controller *master)
+{
+	struct i3c_dev_desc *desc;
+	bool wakeup = false;
+
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_bus_for_each_i3cdev(&master->bus, desc) {
+		if (!desc->dev || desc == master->this || !device_may_wakeup(&desc->dev->dev))
+			continue;
+		guard(mutex)(&desc->ibi_lock);
+		if (desc->ibi && desc->ibi->enabled) {
+			wakeup = true;
+			break;
+		}
+	}
+	i3c_bus_normaluse_unlock(&master->bus);
+
+	return wakeup;
+}
+EXPORT_SYMBOL_GPL(i3c_master_has_wakeup_enabled_devs);
+
 /**
  * i3c_master_dma_map_single() - Map buffer for single DMA transfer
  * @dev: device object of a device doing DMA
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 9d675d01522c..82d9886e7f12 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -765,6 +765,7 @@ void i3c_generic_ibi_recycle_slot(struct i3c_generic_ibi_pool *pool,
 				  struct i3c_ibi_slot *slot);
 
 void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
+bool i3c_master_has_wakeup_enabled_devs(struct i3c_master_controller *master);
 
 struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
