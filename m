Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A926AC5ACAB
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmP739UiPcKoKK/l1wIk3EYJxwDL1n766Nyc3hSKDw4=; b=WQtA1Ao+MzjubR
	gueY3vxju4fnkJ6jRQRNfJ9wEPj5pFCjqf5HhXCss7/wy8VtETNmkay36pBHXiK/1TuJGeuWbkXPG
	CW018TA4OngY0PCfYVZlSXvIueVkjjnlPOhLHJITG6j+ULPVOR0cyh9mGEY62II5oaQZdGTlsg3Nv
	kZBDLUIJFEBPd2jvgXYNBZyyhvGsLho0WvgFA1t1ZSZFUuTPFd2wr8Yo96NcieSL0GxmFxNVDT9AT
	lmVmFdjCJOB35WLZtbkHVgHZOr2ZeAnxEQV/EiW3LaYUzJ+hEJKwUrzOeqXRPZIKgzD/fZUZhUlaT
	V2XP19AfAdHRxX5H10gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM13-00000008IpR-1YVG;
	Fri, 07 Aug 2026 14:57:45 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0z-00000008Imh-266Q
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114661; x=1817650661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HMfkNYlkMl4nYVHY/HGi+CKtxHkiK63zKh72UBnUWHg=;
  b=Yp27lzE7siGlmxBh7fjuA25QFQMLNEOLOpiA9IpQDHSHonbVPq12bbxb
   aQNXba3MyXenT2FZ9qN8F67yTZ22+qL7FqIBLjnL26iMWdfY4T2LkP+Km
   K/X1cJQ5352Um6yzEuIeXtE+rMnoEjc7KRKy7WURzjTWWzqMSjrddeswW
   ms7pQtNWfTPCJailkyVDR6jZ2FCrv6V2gfy9b5Fm/KOLY7wASlBCa2t/E
   EBoUYM4PBA4/kbcCO8AmNvi4dxyQlul4bGV5u7M16rZtQICYtTTQrDKqG
   CB2wij3rLFR+n9C/PT/Rgo1qFWil44enyfTnwrxh7tLeWp3tBAT4YKSc0
   w==;
X-CSE-ConnectionGUID: LOLhe0YsTp2omSZ23HDv8w==
X-CSE-MsgGUID: qzz2Xx8ARmy60WsGjykyHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485257"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485257"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:40 -0700
X-CSE-ConnectionGUID: M5a2VntuQ8+qmc8ar+QlJA==
X-CSE-MsgGUID: rZAJ2+MZT0esXdwK98x56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809945"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:14 -0700
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
Subject: [PATCH V5 10/14] i3c: master: Add helper to query bus wakeup requirements
Date: Fri,  7 Aug 2026 17:56:34 +0300
Message-ID: <20260807145638.168865-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075741_581640_6714C660 
X-CRM114-Status: GOOD (  13.63  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by : Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
---


Changes in V5:

	Added Frank's Rev'd-by
	Added Mukesh's Ack'd-by

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
