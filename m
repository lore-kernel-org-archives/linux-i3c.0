Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC414C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4iT7nt1hNhSXvy0tGehuCvf2m4HBp9y/xjBDMXv86E=; b=Rih0QnQ1WpReHj
	KpYvkDa1nqc4cW45jqZkIWZMOZo+lFnB1yosXl6BXWXj6HB591kl6a6rG2SY0OK60UzkE1NyviKVR
	PMXigMNzf7Cjm44siUCRlyF812PPTkhst0tw7+vQMcGTMTWCDtW6LiDYr8l8O6+Zf2ky5p0Ey5x8P
	hWwSy4L+IltubyTsNxjdbwMi3K+w+6CdGuBIDV9YbTCDtRFg0NeOBPnGBsrP2mjoOIGwaABN1LG9G
	CUU0APWzjkydkySLmQX4gLbY0Lgt5TwnVFPce+ltOEcxfEFxSKd2KIshzudZtFzzlghhNK0bAfkrT
	CSfyYIIOTzySNqT2PEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Ld-00000002xAy-2La7;
	Wed, 01 Jul 2026 20:15:53 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Lb-00000002x67-0BI9
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936951; x=1814472951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3P3wdcp+8UpuSxAdjYoys5NJLGvY0xP8Nj5ewS+gK0c=;
  b=IR/O7dyDbarmjU1mKe5IVuPEpsb5PJEYmwACRSr6ybG/OUaMTENOxZp6
   IaIOs/uI9dxs+UWB/0StOJj0EAdK/Ex4u2R5b1V4/j2ZhZpmD4R9L5m9G
   YgOv6NE2w5Uev+j8pnuIw4AsiuhC8u0rM1NPZNTrxYsTPwDYsYpMPyGrI
   vPvzijsUr37RacwiL0NTjZOHNDDKiYlEyWIB19v3ZELDhXGhT/uCriQ1W
   J1TCflbrcy9sKQm9wbloCj6677XEm47hHkj1YH9qCgfSBd0Vwd1Dz2seO
   UlUTItwiHFBRSk2XJZZKKJHnd1oniy09QkLkbkaYV+OxeuwUndscnP1DJ
   w==;
X-CSE-ConnectionGUID: l5DclrHASEqpyLBXMqK3jA==
X-CSE-MsgGUID: +TwYHrvCTQ6dSaAmkPwmjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82671800"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82671800"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:51 -0700
X-CSE-ConnectionGUID: 8kmrO+GfQJemH6zcQwrQRQ==
X-CSE-MsgGUID: lHCmGmRPQqif7vrg0ouOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282737057"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:49 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH RFC RESEND 3/7] i3c: master: Add helper to query bus wakeup requirements
Date: Wed,  1 Jul 2026 23:15:29 +0300
Message-ID: <20260701201533.220818-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701201533.220818-1-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131551_089669_4742C562 
X-CRM114-Status: GOOD (  11.30  )
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

Add i3c_master_any_wakeup_enabled(), which iterates over the devices on
an I3C bus and reports whether any of them are enabled for system
wakeup.

Controller drivers can use this helper to determine whether wakeup
support must remain available while the system is suspended.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c       | 27 +++++++++++++++++++++++++++
 include/linux/i3c/master.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index a36f9b617cbf..979457e635bd 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1957,6 +1957,33 @@ static void i3c_master_reg_work_fn(struct work_struct *work)
 	i3c_bus_normaluse_unlock(&master->bus);
 }
 
+/**
+ * i3c_master_any_wakeup_enabled() - check if any device can wake the system
+ * @master: I3C master controller
+ *
+ * Iterate over devices on the bus and return true if any device has
+ * system wakeup enabled.
+ *
+ * Return: true if any device may wake the system, false otherwise.
+ */
+bool i3c_master_any_wakeup_enabled(struct i3c_master_controller *master)
+{
+	struct i3c_dev_desc *desc;
+	bool wakeup = false;
+
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_bus_for_each_i3cdev(&master->bus, desc) {
+		if (desc->dev && device_may_wakeup(&desc->dev->dev)) {
+			wakeup = true;
+			break;
+		}
+	}
+	i3c_bus_normaluse_unlock(&master->bus);
+
+	return wakeup;
+}
+EXPORT_SYMBOL_GPL(i3c_master_any_wakeup_enabled);
+
 /**
  * i3c_master_dma_map_single() - Map buffer for single DMA transfer
  * @dev: device object of a device doing DMA
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index af3c35a8e7b6..b9f2d84ac276 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -746,6 +746,7 @@ void i3c_generic_ibi_recycle_slot(struct i3c_generic_ibi_pool *pool,
 				  struct i3c_ibi_slot *slot);
 
 void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
+bool i3c_master_any_wakeup_enabled(struct i3c_master_controller *master);
 
 struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
