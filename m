Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F12BCD8CB2
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jun 2026 07:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duWbs+3HAYoODYoNRlgjhkujeYfrd++kDpX3oZ+O0rQ=; b=gsVaPnPfd1Xms5
	vYIim0MjNG/rV2pNgt+HDypexG4AzgoHeG+Vhf9cRhLX32rzFD9ZrBxpwjsgzKS/7JGjXtZlZJo1I
	bMNFRCy3YsEQQI/0m74R2ySbsdTWb8nFgchOJYL0i7yw8mA/J+yPPix0uXjFidrd8jv1+07aRjMb3
	n9WbZxIGrilIay1CLYDGuUaD22yW7ATT48BzbLhBEOUW7bRBJEQxI7HJWmjOWFQNf71ody7weG8fY
	d3LGrrQD3d6OPo1wt+R/mCnVZBNiMzakXUW91dqoV5t3lCSCkGVPo02Y8VESVAENxtOcDDDooHvBO
	ukel26bbSO/O+PnmwQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOF-00000006xS2-3NEo;
	Wed, 10 Jun 2026 07:30:19 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOC-00000006xQn-2ZBK
	for linux-i3c@lists.infradead.org;
	Wed, 10 Jun 2026 07:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781076616; x=1812612616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q0c2bQqPKdMUDQJks5Kc4HAzA+gxLx6mnJpIIu24xqM=;
  b=I+jmSiUPl7s0efwS64EkSpMHzYUSMYDBbpJoHDwiUNj30wQmvx0Blwn9
   NE/pgBXHZNxApPDnYqG7VNthzggMV2bkZx5k9+yC/RT52yJr/3cGG4aEx
   au+/ovE1cfTIcMz148ho+bLcd3XtG2QBWIYDHJqrk3uxKheKdDAY+NoQN
   3pYHsi/1CoIGAH4nlt/547aVW7ukaNC4jKaCrX/P8DsvLHx+GVOWWxX4Z
   +YGofSMRMmrmTPwRY1AgT3alH383/XNM+Ereuhy7/5vYto1K3DrzocEF2
   PsT5KpGJQCVpINK11nSEUDgozfF3NbFMO5ZdTlPT2trnKPAmuuJwgdspM
   g==;
X-CSE-ConnectionGUID: qAGYwxhJRfS10QnklHxe3A==
X-CSE-MsgGUID: VokW1ynHTFutN1Q2h9G2Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80878402"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80878402"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:10 -0700
X-CSE-ConnectionGUID: zjSL8ZzhR3CenHybivwFPA==
X-CSE-MsgGUID: ADb3O5/pTrWKkKyx8Cldmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270103438"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:07 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/7] i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
Date: Wed, 10 Jun 2026 10:28:46 +0300
Message-ID: <20260610072852.36934-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260610072852.36934-1-adrian.hunter@intel.com>
References: <20260610072852.36934-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_003016_665955_253A2B8D 
X-CRM114-Status: GOOD (  23.09  )
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
Also update when IBIs are freed, to cover the corner case when an IBI is
freed without first being disabled (e.g. oldedev in
i3c_master_add_i3c_dev_locked()).

Move i3c_hci_addr_to_dev() into core.c, reimplement it using the new
array, and add a lockdep assertion to enforce that hci->lock is held
by callers.

Demote a message in PIO and DMA IBI handling, from an error to a debug
message, because there is a race window when the condition can arise
normally.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Factor out __i3c_hci_disable_ibi() to facilitate also clearing
	ibi_devs[dat_idx] upon IBI free, and update commit message
	accordingly.
	Demote a message in PIO and DMA IBI handling, and update commit
	message accordingly.


 drivers/i3c/master/mipi-i3c-hci/core.c | 37 ++++++++++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  7 +++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 drivers/i3c/master/mipi-i3c-hci/ibi.h  | 13 +--------
 drivers/i3c/master/mipi-i3c-hci/pio.c  |  7 +++--
 5 files changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 53797841b63f..1e1f05aff092 100644
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
@@ -639,14 +645,40 @@ static int i3c_hci_request_ibi(struct i3c_dev_desc *dev,
 	return hci->io->request_ibi(hci, dev, req);
 }
 
+static void __i3c_hci_disable_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev)
+{
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+
+	mipi_i3c_hci_dat_v1.set_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->ibi_devs[dev_data->dat_idx] = NULL;
+}
+
 static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 
+	/* Must ensure the IBI has been disabled */
+	__i3c_hci_disable_ibi(hci, dev);
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
@@ -654,6 +686,8 @@ static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 
 	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->ibi_devs[dev_data->dat_idx] = dev;
 	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 }
 
@@ -661,9 +695,8 @@ static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
-	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 
-	mipi_i3c_hci_dat_v1.set_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	__i3c_hci_disable_ibi(hci, dev);
 	return i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 87622d6f817e..0672ed1132f8 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -967,8 +967,11 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 
 	dev = i3c_hci_addr_to_dev(hci, ibi_addr);
 	if (!dev) {
-		dev_err(&hci->master.dev,
-			"IBI for unknown device %#x\n", ibi_addr);
+		/*
+		 * Either an IBI received just before IBI's were disabled, or
+		 * the controller is broken. Assume the former.
+		 */
+		dev_dbg(&hci->master.dev, "IBI when not enabled at address %#x\n", ibi_addr);
 		goto done;
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
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index b5ae1cfaa9e0..ff2657ee220b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -869,8 +869,11 @@ static bool hci_pio_prep_new_ibi(struct i3c_hci *hci, struct hci_pio_data *pio)
 
 	dev = i3c_hci_addr_to_dev(hci, ibi->addr);
 	if (!dev) {
-		dev_err(&hci->master.dev,
-			"IBI for unknown device %#x\n", ibi->addr);
+		/*
+		 * Either an IBI received just before IBI's were disabled, or
+		 * the controller is broken. Assume the former.
+		 */
+		dev_dbg(&hci->master.dev, "IBI when not enabled at address %#x\n", ibi->addr);
 		return true;
 	}
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
