Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598D5CD8CA8
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 08:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+abg+DGrSA35URgRdOVm5wTdbSSQjZb5y3S5SoOnJa8=; b=WmBdU9UjzsCKoc
	ZzwgvStg4Vog74ZVPMNFy3Lhpr0Eb/qVS1wzZSo1jK9JdRAEd/ky4tblMv2bslMB5yLKUjxwA9F3n
	qR7ShVneY80A9/bcuAvvXM4S+lF22QAChdTkDYa6zObPbJvMqCtv5aCJJ/O1qzB5TrBVHUkZqwB9Q
	W9/zXRRl1QEEYaMJjhhAzpZ1eYytAGUI01FDQw9ZIDKKvRgh83eb5A8mDTMI79ltJtwrw2Gqv/AIG
	tNknutXCg5K7986mHItt8oO1nN1m9yBrjwf9CLOKTPauxuxk6E/q6WVqD/o39c3hgv2UQ0UXxyx8q
	KcWpTUDFbIQCnl5A+nWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpb-0000000AXAe-09pU;
	Fri, 12 Jun 2026 08:01:35 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpY-0000000AX8Y-1oou
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 08:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781251293; x=1812787293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WDd+H90RRCcMeOI3X5JKO9Mr15sSAXUO36fkXriSKaM=;
  b=dA+g0dr0JNweMTJoVC5nm2MEFEejgxH2URe7d3ItNa3+EWyOc66FFc6b
   +UTRDrCy6oUmdBeDn5SAeasVsyoD+27IrBVCv7ZZLFpKfpdmmX5rePDAO
   ++ZzZ4m/hCLbarP7zBc0kuZj0pQhOl7sPyFyTltT02nVoRU9k8HrJVvhY
   hC/FG8enp+cGXrMh9Iy2/2fnGji2S+ACKrJ7iQ5sazO5UgBNapUzJb5ZW
   oeNU2+i1WFbWhG6lF9np0R1Mcc+yYp2G0ISYqMxtM7m0XBQL5xq1nKTBY
   ruTjQBMMuDVLhB7ZrgA9CAkNRplrsA6IbPCXCTkm9H85wQwSunzPE0o5M
   Q==;
X-CSE-ConnectionGUID: vqV6hmADRt+7sgmSXiXz8w==
X-CSE-MsgGUID: Jv6ke/YVTe6L40fHzItXUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82186734"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82186734"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:20 -0700
X-CSE-ConnectionGUID: QfZQfkZkRSCSa2y0HMZ8pQ==
X-CSE-MsgGUID: TruGCnLPQyaXs87ixG6RfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246630334"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.41])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 1/7] i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
Date: Fri, 12 Jun 2026 11:01:01 +0300
Message-ID: <20260612080107.11606-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260612080107.11606-1-adrian.hunter@intel.com>
References: <20260612080107.11606-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_010132_485985_9AA513F1 
X-CRM114-Status: GOOD (  23.00  )
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


Changes in V4:

	None

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
