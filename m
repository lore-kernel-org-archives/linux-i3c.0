Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216BACD4F54
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7kZA4CSMjGlRFVugKgCbN6DqZdwLIsIcYIc9/Cmayg=; b=vm0tc5odNao0fJ
	5/6NlJdAFQ0ixBr2rXXq5AI5aQVj1ZVFlqnjsuGbWJTTHPQxLUPgZFtQSLCWnyxPyz7KLJ/t8qKy6
	3zUxSZvmDK1cwcIX7wxByhH7+fgsAGWTqAhldhi1esecdD8a2OeOeiKYOgIgzy7ph/UJfT53sfnVM
	XiiYJYqkbiivM7bf8B31Zyxzqo4EtKeFZOvEbIm0axLOIqcq64cxwIjuZwfhOCQpH4kUPaGNP8RVa
	oJwGqQnW6vgEeOPUlfc+04HpY7zviU9btKFznMjyvz0Li2tMRANd5ZSxaw80giVl2IGwhedLYc7wU
	3hytleviHCBNQL1fgakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQp-0000000407V-2v0l;
	Wed, 27 May 2026 11:28:15 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQm-00000004063-0BXy
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 11:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779881292; x=1811417292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AED9LWUIxYLhM9bfJPCLy77sniwXqpeZtyMxTjvG5Mg=;
  b=Td5KoJpTHMWl0FvjgUEO3AKiT8eSIhZgvrfDxrJxPqOZLW4a0VBNrsjl
   UpxEhq83VfclQbxWkCuPSK5BYq0vjNjry//ZN2Nq5crdDIM9ISxVe2SXc
   TMCBHJ//fY6OIUeNv/MUvyyttiHlsck9G8hxp5Ei/JNdQVICkkEwuYGdN
   8OQwHfer5o2E0nDSwpJxJOkxZYELsbPxNfxEhjS7x3W4f2o/XmMLvSnx/
   prFNaaWDZxWKCTOizaGuTBQpSyS52/8vHIwciuk2YCxqs9g+U/9WT/dEd
   8JiXDig9vYJ2IO6NFA1azPNcFvIh2otmSiBuia5Iww1BaMUDm/HH3uk2c
   w==;
X-CSE-ConnectionGUID: blK5NnqZS6Oa+ldodOC3dg==
X-CSE-MsgGUID: jSMsiD+CSFiaO+zw4v+log==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103381707"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="103381707"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:11 -0700
X-CSE-ConnectionGUID: 0zaioKM7TiCmsBw3CmiiMg==
X-CSE-MsgGUID: 3ukmTD2RQp+ZolczDLvXBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246238578"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.228])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:10 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
Date: Wed, 27 May 2026 14:27:52 +0300
Message-ID: <20260527112758.38530-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260527112758.38530-1-adrian.hunter@intel.com>
References: <20260527112758.38530-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_042812_155669_4A22B53C 
X-CRM114-Status: GOOD (  18.83  )
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

i3c_hci_addr_to_dev() walks bus->devs.i3c, which is protected by
bus.lock (rwsem).  However, it is invoked from the MIPI I3C HCI IRQ
handler, which cannot take bus.lock.  This allows concurrent device
addition/removal in the I3C core to modify the list while it is being
traversed, potentially leading to use-after-free or crashes.

Remove the dependency on the bus device list and introduce a dedicated
lookup table.  Add an ibi_devs[] array indexed by DAT entry, maintained
under hci->lock.  Update the array when IBIs are enabled or disabled,
so that it always reflects the set of devices allowed to generate IBIs.

Move i3c_hci_addr_to_dev() into core.c, reimplement it using the new
array, and add a lockdep assertion to enforce that hci->lock is held
by callers.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 25 +++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 drivers/i3c/master/mipi-i3c-hci/ibi.h  | 13 +------------
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 53797841b63f..b19bdff5c5e2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -22,6 +22,7 @@
 #include "ext_caps.h"
 #include "cmd.h"
 #include "dat.h"
+#include "ibi.h"
 
 /*
  * Host Controller Capabilities and Operation Registers
@@ -124,6 +125,7 @@ static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
 static int i3c_hci_bus_init(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
+	struct device *dev = hci->master.dev.parent;
 	struct i3c_device_info info;
 	int ret;
 
@@ -144,6 +146,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		return ret;
 
+	hci->ibi_devs = devm_kcalloc(dev, hci->DAT_entries, sizeof(*hci->ibi_devs), GFP_KERNEL);
+	if (!hci->ibi_devs)
+		return -ENOMEM;
+
 	ret = hci->io->init(hci);
 	if (ret)
 		return ret;
@@ -647,6 +653,21 @@ static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
 	hci->io->free_ibi(hci, dev);
 }
 
+struct i3c_dev_desc *i3c_hci_addr_to_dev(struct i3c_hci *hci, unsigned int addr)
+{
+	int dat_idx;
+
+	lockdep_assert_held(&hci->lock);
+
+	for (dat_idx = 0; dat_idx < hci->DAT_entries; dat_idx++) {
+		struct i3c_dev_desc *dev = hci->ibi_devs[dat_idx];
+
+		if (dev && dev->info.dyn_addr == addr)
+			return dev;
+	}
+	return NULL;
+}
+
 static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -654,6 +675,8 @@ static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 
 	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->ibi_devs[dev_data->dat_idx] = dev;
 	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 }
 
@@ -664,6 +687,8 @@ static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 
 	mipi_i3c_hci_dat_v1.set_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->ibi_devs[dev_data->dat_idx] = NULL;
 	return i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 41d31a53abd3..b3d9803b1968 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -65,6 +65,7 @@ struct i3c_hci {
 	unsigned int DAT_entry_size;
 	void *DAT_data;
 	struct dat_words *DAT;
+	struct i3c_dev_desc **ibi_devs;
 	unsigned int DCT_entries;
 	unsigned int DCT_entry_size;
 	u8 version_major;
diff --git a/drivers/i3c/master/mipi-i3c-hci/ibi.h b/drivers/i3c/master/mipi-i3c-hci/ibi.h
index e1f98e264da0..073ca67b7d04 100644
--- a/drivers/i3c/master/mipi-i3c-hci/ibi.h
+++ b/drivers/i3c/master/mipi-i3c-hci/ibi.h
@@ -26,17 +26,6 @@
 #define IBI_DATA_LENGTH			GENMASK(7, 0)
 
 /*  handy helpers */
-static inline struct i3c_dev_desc *
-i3c_hci_addr_to_dev(struct i3c_hci *hci, unsigned int addr)
-{
-	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
-	struct i3c_dev_desc *dev;
-
-	i3c_bus_for_each_i3cdev(bus, dev) {
-		if (dev->info.dyn_addr == addr)
-			return dev;
-	}
-	return NULL;
-}
+struct i3c_dev_desc *i3c_hci_addr_to_dev(struct i3c_hci *hci, unsigned int addr);
 
 #endif
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
