Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB17CC5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/vLOPjP77uP7xyNmgmfSBJOVCLsgsS6FKY/RTAemyU=; b=C5tngQCdnP/RkB
	yzqKBra7b4wR/Hb5WEvZdd8L4bFTUPhjqGQbpZQZs22HPu1Ird5F1zYb/93n1e8trzvVxgFfREKeQ
	Y7Qznz+hZU0E0MGkIfxSs1bzZRpFa/mYkOXfVwFSBvleAZ2sawe9TtvPsMB0x4kDgmvRgkQERLvJO
	Lq5yn+SUzB82deN5bJ8Y8HpTxzsRx4THFqSqXcti3z5f+3hq6pVzl8/32Jwv82EL7pIDwIoyzDnIL
	jAccH3CuIGpyKRoWNC2rzJepcMbPCdMebdHPb3tpLkDRrXavnXZaAMKU5o2g4HWbYJJiexME5FWE1
	Nik/dcP/n0RVQWMxlT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM1B-00000008IuS-2V3f;
	Fri, 07 Aug 2026 14:57:53 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM18-00000008Iso-3IkO
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114671; x=1817650671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=umdniyFg/qqA1LNU9pxljLDd0VTYT8cJTJzAEkiC6Hk=;
  b=S4lXz3i0mPVp4BUHfX+DtIuCF6Pg8DLTL3iP3ZolaPClldIuj0b1KXTJ
   22LLZf04VzWljvg2ZhskFM3YEbhX/MSGF/M99LkzjoPCEIbgnvQzmOb91
   Z3508ZNYeM/rJP1JwCGIZUX/mmf9s6N7cO5otnvqH4Fx6u6+/VSSV+FoV
   PYpKw3ixLvDKQOGR/NbpZ4bylqmhUUl+SIViS5LCH4w5IS5i2NYueSZYw
   qHuwPuND6EHj35Zsu15yDpKd1qPqqPLHkOM9yuNf5iPTwmuYGU02/CniT
   kOSm4ugsS3JEbYM6/F87zUDGJ1mS2RvGbEptg9j8mycCw+puXiMmYyFTk
   g==;
X-CSE-ConnectionGUID: Kwpdw6yhStSCgrKLdAbM7A==
X-CSE-MsgGUID: WQd6NAcpQ7iRQRpPq1eUSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485297"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485297"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:50 -0700
X-CSE-ConnectionGUID: QAlhtbX4RNuHvLsbTYLMOA==
X-CSE-MsgGUID: 9f/Q1UDCQY+7kUtCw80+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809953"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:23 -0700
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
Subject: [PATCH V5 13/14] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
Date: Fri,  7 Aug 2026 17:56:37 +0300
Message-ID: <20260807145638.168865-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075750_861697_B23C40CE 
X-CRM114-Status: GOOD (  18.67  )
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

The MIPI I3C HCI driver needs to identify the underlying system device
used for DMA mapping and PM operations. The logic for determining that
device is currently embedded in the DMA implementation.

Factor this code out into i3c_hci_sysdev() so it can be shared by other
parts of the driver and keep the device-selection logic in one place.

The explanatory comment moves with the code, reworked as kernel-doc now
that it documents a function rather than an inline block.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
---


Changes in V5:

	Added Frank's Rev'd-by
	Added Mukesh's Ack'd-by

Changes in V4:

	Reworked the comment that moves with the code into kernel-doc,
	and mentioned that in the commit message.

Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 16 ++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 15 +--------------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index cfe9b5390b56..f95da427d7a9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -15,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/platform_data/mipi-i3c-hci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -117,6 +118,21 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
 	return container_of(m, struct i3c_hci, master);
 }
 
+/**
+ * i3c_hci_sysdev() - Get the device to use for DMA
+ * @dev: Device the HCI controller is bound to
+ *
+ * When an IOMMU is enabled, DMA API calls must use the device that IOMMU
+ * setup was done for.  Under PCI enumeration that is the PCI device, not
+ * the "mipi-i3c-hci" platform device below it.
+ *
+ * Return: @dev's parent if it is a PCI device, otherwise @dev.
+ */
+struct device *i3c_hci_sysdev(struct device *dev)
+{
+	return dev->parent && dev_is_pci(dev->parent) ? dev->parent : dev;
+}
+
 static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
 {
 	reg_write(MASTER_DEVICE_ADDR,
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 0672ed1132f8..7c2b20474130 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -15,7 +15,6 @@
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/io.h>
-#include <linux/pci.h>
 
 #include "hci.h"
 #include "cmd.h"
@@ -301,23 +300,11 @@ static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
 	struct hci_rh_data *rh;
-	struct device *sysdev;
 	u32 regval;
 	unsigned int i, nr_rings, xfers_sz, resps_sz;
 	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
 	int ret;
 
-	/*
-	 * Set pointer to a physical device that does DMA and has IOMMU setup
-	 * done for it in case of enabled IOMMU and use it with the DMA API.
-	 * Here such device is either
-	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
-	 * grandparent (PCI enumeration).
-	 */
-	sysdev = hci->master.dev.parent;
-	if (sysdev->parent && dev_is_pci(sysdev->parent))
-		sysdev = sysdev->parent;
-
 	regval = rhs_reg_read(CONTROL);
 	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
 	dev_dbg(&hci->master.dev, "%d DMA rings available\n", nr_rings);
@@ -332,7 +319,7 @@ static int hci_dma_init(struct i3c_hci *hci)
 		return -ENOMEM;
 	hci->io_data = rings;
 	rings->total = nr_rings;
-	rings->sysdev = sysdev;
+	rings->sysdev = i3c_hci_sysdev(hci->master.dev.parent);
 
 	for (i = 0; i < rings->total; i++) {
 		u32 offset = rhs_reg_read(RHn_OFFSET(i));
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index b3d9803b1968..b8d2a3d680f8 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -184,6 +184,8 @@ void amd_set_resp_buf_thld(struct i3c_hci *hci);
 void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
 int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 
+struct device *i3c_hci_sysdev(struct device *dev);
+
 #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
 
 int i3c_hci_rpm_suspend(struct device *dev);
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
