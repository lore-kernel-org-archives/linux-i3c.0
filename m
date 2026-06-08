Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB587CD8C8E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 08:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBaaetCyNeaCt9nGSh0QY80CJI8tAaaoIPHE4P3pJ5k=; b=ws63c8kbC0ZxFM
	VBPfNKNhE0AKch3I7b+mWLS9dliUXYXNuwU9zq8XhispxkmEFqDNSXDV40l53vkDkg2GNBCyAt0Uj
	pEeq/b22UIiWKwbfI9Z/xDJAtNRRdRgB/v2/7W0PrER/gXnDq45rDwR1fiWTVL7q4CaWbvxdKF03P
	Xp7vtCbC3iVboFBjxju5kUCY3PxVFkwD/i3/Te3oZZztCGQSuHKE7mz/OPi7Bx+XDP5qu751L+dAE
	vRNpZOyk9Dl0Pzk15mXaoapFWKZh7p9Ksz2PldRzeIcWnuSvoTywVKS96P53vRVKYWABtXpo5S2bH
	8r1Lr2bow+FA+iFmONKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUuV-000000031gU-2CB1;
	Mon, 08 Jun 2026 08:00:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUuT-000000031gO-3nm9
	for linux-i3c@bombadil.infradead.org;
	Mon, 08 Jun 2026 08:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AX9fqzD73MKnC+ZB/CKMOCvE4mnnqKfJsVidbZrJaSk=; b=cD8zMg+1hfCbGQWbJO58oR2Dp7
	FgpQSksMMEjsPU8xT46FCV4KAph87Ere5iLy/PZTaGL/lBuQYLKYHfS4kckRSY9nd9Kqee7xnvRdB
	LUNfcvP+EkD2TmwNknMYQABwEGAXNEjLgIz6C5vIilj+DjUDQtqxZVbRNWoMNxsko1knC3NPvk5VC
	flQZtZOEJAEtqN3y6ZaSXIIL5CQz3b7F3+nbjYvywl4Z4A07QRbqmnDIjLT5jhuwg4xzxMkDv+YcZ
	PshDoPn3kgL8LxOnOb2hvZ5tdVbM4WnURbsDkoaQ+Q393enVYxTrks5ENZByNZYjFzdoZKw8yAO/u
	dcg+pjaQ==;
Received: from mgamail.intel.com ([198.175.65.14])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWUuM-00000000g5m-1EFZ
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 08:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780905631; x=1812441631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fYUKQwXEODXgUL0RQCOezn0uRebdWFq8B2C9AOq7dsk=;
  b=DfoCW206MdvN+XYyWwpkIXNreLZMdPLfBOS00J+uT52DQ9eaeptoC3zk
   T0DLTAEY2lp+svsUFS8Nl5XZBBVskW7Tsc/VmkD/+f9IFMEb744h/3rKE
   ycUVLkJ1VywUUafZFoLwqoRbWDDFCCZNVSILgs64jJ7/W5A7gQMX6qF3v
   6PYEyi9EX9bkJVbQPKvDYGDPtTX8noE/KuwyDYdnpN+ki6QNY9fgVXimW
   oBVlR5tvydsEEP88m59UrBsiJdAmfuN0b80doBWRSPXShsuwfLjkzfXfb
   5g+aoF8Rs6/hP7kX7Dj0xBw24azibvlLuxL0sXo8DlSTyMbZNPsnRkKxP
   A==;
X-CSE-ConnectionGUID: S3Y6ziTgSFmZm67Kj3jMsA==
X-CSE-MsgGUID: VOEexf1sSgC7sBFY6r67cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85520145"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="85520145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:26 -0700
X-CSE-ConnectionGUID: vFGv5i0gQV+i7gVmywwqxw==
X-CSE-MsgGUID: Lz5eIxhZQmad1lqFFCcwYg==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:24 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/7] i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
Date: Mon,  8 Jun 2026 10:57:54 +0300
Message-ID: <20260608075801.16111-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608075801.16111-1-adrian.hunter@intel.com>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_090035_169151_8D9674A0 
X-CRM114-Status: GOOD (  22.64  )
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
---


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
