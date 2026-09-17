Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415BAC88E72
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzJooDDzHdBB8Vgy95Ak98Ll1sV1CwXwwkW1QakUcsg=; b=GaBKvr9IpeqyUW
	AKoseMEPj81t2/yJuEFmhnqw1JHS1LnJZxc4FNKgNWd85szEaj78mEaDX91UE3AKOtthpc8ZMhvh7
	e7KXxO8TPi17L/KZAjNbGuVTXvF45jFn8JM1Bs9zPR0SAGlUrA5jMRW6JmRz1gnsseW6m2S2lqcyb
	1LgZxHvczY8v2hoqBo8yiSCcJybBPaDEOB8UOzj2+qJUMyEPM3bdPsfDfPnpsiwQR2M8+I5hEDGVB
	dfMI+6Anokvv47Tc7VDClr3NzQh8WTKT4hwIoyS4mTti2fB4laI7pAhERlvS2EgkoHoDJNob2l71j
	BVgQenSe/PJwKrN6O11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYm-0000000CJK8-3xmi;
	Thu, 17 Sep 2026 19:14:16 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYk-0000000CJFz-2cdf
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672454; x=1821208454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fBFWg6OSG/ILRLbZM/M1/PmT05Eyb82u1TD5r3l3lgs=;
  b=R9nCbmW+/bqfEQ15n/IVob5P/ZOh+fgtXKeXWaUACxxl0bVO5pu0hFtw
   teKSy6CgEy503SnkLli5GSVjNcU9DnGVwwtHu8XfRpoCOtKzYdrNj1jFA
   yZnauEkjA6vyAaNezTFBzCYs5swRUQwUiPUmezRhImVRL693pDW5Sqsfi
   GYqyz427HvE4bnDm9usoTFlik1TnbtCH0acZxUcmfLBUNKInsDtX50G6/
   aMLQXa2dAgRD4xacRj3L4Te3s5Qtic/XsR1/6v8XwrnyPPftbwOWGlZQh
   P04ynPkAsMGFIbrEFMVaEnoc3hay5ZpIOPhWVFDvstbEo/aQ0vIXAvvRX
   Q==;
X-CSE-ConnectionGUID: L5dReatoSOmcandJKYn/Rw==
X-CSE-MsgGUID: 2Uw4At/kTDW4/U02+bwEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639890"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:14 -0700
X-CSE-ConnectionGUID: fV+NIwIkTsms5ddOd7RyNA==
X-CSE-MsgGUID: N6RtnzF7TMumMYRKqMXc3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271958"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:12 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 04/17] i3c: master: Match ACPI targets to the correct bus controller instance
Date: Thu, 17 Sep 2026 22:13:43 +0300
Message-ID: <20260917191356.133242-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121414_680980_8A2BC285 
X-CRM114-Status: GOOD (  22.05  )
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

For ACPI-enumerated I3C targets, _ADR encodes both the zero-based bus
controller instance number in bits 51:48 and the Provisioned ID (PID)
in bits 47:0, as defined by ACPI 6.6 Table 6.2 and MIPI DisCo for I3C
v1.1 section 5.2.

However, i3c_master_add_acpi_dev() treats the entire _ADR value as the
PID. On multi-instance controllers this folds the instance number into
the PID, causing i3c_master_add_i3c_boardinfo() to reject devices on
instance 1 and above with -EINVAL.

The problem is exposed by the MIPI I3C HCI PCI driver, which creates one
MFD child device per bus controller instance. Since the child devices do
not have their own ACPI companions, they all inherit the parent's ACPI
node and therefore enumerate the same set of child devices. As a result,
a target belonging to any instance other than 0 prevents registration of
all controller instances.

Add an instance number to struct i3c_master_controller, propagate it
from the HCI PCI driver, extract the PID from bits 47:0 of _ADR, and
ignore ACPI child nodes that belong to a different controller instance.

ACPI-enumerated I2C devices are unaffected. Their controller instance is
encoded in the Resource Source Index of the I2cSerialBusV2 descriptor
rather than in _ADR and will require separate handling.

Fixes: b46a4b3c5d1e ("i3c: master: Support ACPI enumeration of child devices")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master.c                          | 19 +++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/core.c        |  4 +++-
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    |  1 +
 include/linux/i3c/master.h                    |  3 +++
 include/linux/platform_data/mipi-i3c-hci.h    |  4 ++++
 5 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f9a6c8560fab..215a22f2c7b6 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/i3c/i3c.h>
 #include <linux/acpi.h>
 #include <linux/atomic.h>
+#include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/bug.h>
 #include <linux/delay.h>
@@ -3076,6 +3077,13 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
 	return ret;
 }
 
+#define I3C_ACPI_ADR_PID GENMASK_U64(47, 0)
+/*
+ * Zero-based instance number of the Bus Controller to which the Target is
+ * connected.
+ */
+#define I3C_ACPI_ADR_INSTANCE GENMASK_U64(51, 48)
+
 #ifdef CONFIG_ACPI
 static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
 				   struct fwnode_handle *fwnode)
@@ -3083,6 +3091,7 @@ static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
 	struct acpi_device *adev = to_acpi_device_node(fwnode);
 	acpi_bus_address adr;
 	u32 reg[3] = { 0 };
+	u64 pid;
 	int ret;
 
 	/*
@@ -3100,9 +3109,15 @@ static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
 
 	adr = acpi_device_adr(adev);
 
+	/* Match the multi-bus instance number */
+	if (FIELD_GET(I3C_ACPI_ADR_INSTANCE, adr) != master->instance)
+		return 0;
+
 	/* For I3C devices, _ADR will have the 48 bit PID of the device  */
-	reg[1] = upper_32_bits(adr);
-	reg[2] = lower_32_bits(adr);
+	pid = FIELD_GET(I3C_ACPI_ADR_PID, adr);
+
+	reg[1] = upper_32_bits(pid);
+	reg[2] = lower_32_bits(pid);
 
 	fwnode_property_read_u32(fwnode, "mipi-i3c-static-address", &reg[0]);
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dadf049bd4b5..8b3a87d8a8bb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1142,8 +1142,10 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	 * necessarily in separate contiguous sub-ranges. To avoid overlapping
 	 * mappings, provide base_regs from the parent mapping.
 	 */
-	if (pdata)
+	if (pdata) {
 		hci->base_regs = pdata->base_regs;
+		hci->master.instance = pdata->instance;
+	}
 
 	if (!hci->base_regs) {
 		hci->base_regs = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index af9595009b03..5b8e10d05cee 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -390,6 +390,7 @@ static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
 					struct mfd_cell *cell)
 {
 	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
+	data->pdata.instance = idx;
 
 	data->res = DEFINE_RES_IRQ(0);
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f7ceec2b4477..72065715feee 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -536,6 +536,8 @@ struct i3c_master_controller_ops {
  *		 Bit 0: SETDASA
  *		 Bit 1: SETAASA
  *		 All other bits are reserved.
+ * @instance: Zero-based instance number of the Bus Controller as defined by the
+ *            DisCo specification I3C Target Address (_ADR) Encoding
  * @wq: freezable workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
@@ -573,6 +575,7 @@ struct i3c_master_controller {
 	} boardinfo;
 	struct i3c_bus bus;
 	u8 addr_method;
+	u8 instance;
 	struct workqueue_struct *wq;
 	struct work_struct hj_work;
 	struct work_struct reg_work;
diff --git a/include/linux/platform_data/mipi-i3c-hci.h b/include/linux/platform_data/mipi-i3c-hci.h
index ab7395f455f9..6f61d8a02378 100644
--- a/include/linux/platform_data/mipi-i3c-hci.h
+++ b/include/linux/platform_data/mipi-i3c-hci.h
@@ -3,13 +3,17 @@
 #define INCLUDE_PLATFORM_DATA_MIPI_I3C_HCI_H
 
 #include <linux/compiler_types.h>
+#include <linux/types.h>
 
 /**
  * struct mipi_i3c_hci_platform_data - Platform-dependent data for mipi_i3c_hci
  * @base_regs: Register set base address (to support multi-bus instances)
+ * @instance: Zero-based instance number of the Bus Controller as defined by the
+ *            DisCo specification I3C Target Address (_ADR) Encoding
  */
 struct mipi_i3c_hci_platform_data {
 	void __iomem *base_regs;
+	u8 instance;
 };
 
 #endif
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
