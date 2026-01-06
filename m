Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495CECE9D7D
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SG6Vn3++j9EREyKMYyyaY4vWc+SPGyPFNhzhh/l9kiI=; b=TCuXXGxeWjaJdO
	z599vzPikt9EGqV7wK4wiPxlaD2vLA12F0FolswIUgg1Tk4Lsm8TARVQRN5gYa6kVuzNKswwxrTp+
	38R4ozf9vF8lfcSuwPGyIj+ha6+nR0gBFh27i7XSXiHrG+kxm04Kjnqd3bvHmQ89mGgM7tIUqKATd
	+eyySTGCfqeq39yK2EYbBsMuI/92LgYLhPCA61W0J+7FGo88FUa8KlC6yKyM3dyMZ/cIkzAs4P3RL
	d66OtgKPntE9PpwKfm8KyMWokDrQ+obbA5DqQG8B6pqXxT3RYV6/LPlOB6B8fYugD5u4eXfw6tTxm
	j8Q1TBdI3umsW5Ho+2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAw-0000000DWTp-44Ug;
	Tue, 06 Jan 2026 16:44:54 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAu-0000000DWNZ-1a93
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717893; x=1799253893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HvDvFS16xz74/qtx1uw3E3JfkEPtVzcmbm5PWczEAxQ=;
  b=knG83QYoggOZyoHBWCyBbO7S5doXzuP0Gx5F8eVj8UgvVLd6DVqZRXxi
   Y8KdQCENiNl/NdHJAccQc6FbQyHfC3aDJDFGgtNPzWfLxjFuxbswxISq2
   +Jq/HM7haXO4Jv26zAOtRfUCB97opJHTrFHtX5iiZvDeh2NLRFy/S31VP
   znlP497c3na/O6aGwYULnfnffXG1DVoJHzua0l2FZuDRdjLDiOtKC0J39
   +FifFXZoS2Sb5/SHhFrQ2ezBhpmFKtJF1nb58LymkTQan/q2ZJeYnxIyg
   w1yj1/TJTC0CTrpD4XCBWIZ8qi1aEOv2tZY7+8OF1WCZuTlJzxoZdL5DI
   Q==;
X-CSE-ConnectionGUID: H0o1rOlPQfGUKODhyVlzEA==
X-CSE-MsgGUID: 1al4o4I+Sv66lvj5OxIoDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741845"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741845"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:52 -0800
X-CSE-ConnectionGUID: U+ZxqyZxSc6i4forGVS2uA==
X-CSE-MsgGUID: E1eZT6TdSYSK0lbEqK7n6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838037"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:50 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 06/11] i3c: mipi-i3c-hci-pci: Assign unique device names and IDs for Intel LPSS I3C
Date: Tue,  6 Jan 2026 18:44:11 +0200
Message-ID: <20260106164416.67074-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084452_453199_FCD55DA3 
X-CRM114-Status: GOOD (  17.92  )
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

Simplify the code and ensure names and IDs align with device documentation.
Use explicit device names and IDs for Intel LPSS I3C controllers instead of
dynamically allocated values.

Add "intel-lpss-i3c" to the platform_device_id table in the mipi-i3c-hci
driver and use the same name for Intel I3C controllers in the
mipi_i3c_hci_pci driver.  Assign hard-coded IDs to reflect the hardware
layout.

Intel SoCs include two I3C PCI devices in the Low Power Subsystem (LPSS),
each supporting up to two I3C buses. The second PCI device is assigned ID 2
(not 1) to match this topology.  Additional IDs will be introduced when
Multi-Bus Instance support is implemented.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Change in V3:

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c        |  7 +++
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 43 ++++++++++---------
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 07fb91a12593..3d6544a64188 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -790,9 +790,16 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
 
+static const struct platform_device_id i3c_hci_driver_ids[] = {
+	{ .name = "intel-lpss-i3c" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
+
 static struct platform_driver i3c_hci_driver = {
 	.probe = i3c_hci_probe,
 	.remove = i3c_hci_remove,
+	.id_table = i3c_hci_driver_ids,
 	.driver = {
 		.name = "mipi-i3c-hci",
 		.of_match_table = of_match_ptr(i3c_hci_of_match),
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 0fd3587671e1..3b319fbf18ce 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -27,10 +27,10 @@ struct mipi_i3c_hci_pci {
 struct mipi_i3c_hci_pci_info {
 	int (*init)(struct mipi_i3c_hci_pci *hci);
 	void (*exit)(struct mipi_i3c_hci_pci *hci);
+	const char *name;
+	int id;
 };
 
-static DEFINE_IDA(mipi_i3c_hci_pci_ida);
-
 #define INTEL_PRIV_OFFSET		0x2b0
 #define INTEL_PRIV_SIZE			0x28
 #define INTEL_RESETS			0x04
@@ -179,9 +179,18 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
 	intel_ltr_hide(&hci->pci->dev);
 }
 
-static const struct mipi_i3c_hci_pci_info intel_info = {
+static const struct mipi_i3c_hci_pci_info intel_1_info = {
 	.init = intel_i3c_init,
 	.exit = intel_i3c_exit,
+	.name = "intel-lpss-i3c",
+	.id = 0,
+};
+
+static const struct mipi_i3c_hci_pci_info intel_2_info = {
+	.init = intel_i3c_init,
+	.exit = intel_i3c_exit,
+	.name = "intel-lpss-i3c",
+	.id = 2,
 };
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
@@ -189,7 +198,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 {
 	struct mipi_i3c_hci_pci *hci;
 	struct resource res[2];
-	int dev_id, ret;
+	int ret;
 
 	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
 	if (!hci)
@@ -217,11 +226,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	res[1].start = pci_irq_vector(hci->pci, 0);
 	res[1].end = res[1].start;
 
-	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
-	if (dev_id < 0)
-		return dev_id;
+	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
-	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
+	hci->pdev = platform_device_alloc(hci->info->name, hci->info->id);
 	if (!hci->pdev)
 		return -ENOMEM;
 
@@ -232,7 +239,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err;
 
-	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 	if (hci->info->init) {
 		ret = hci->info->init(hci);
 		if (ret)
@@ -252,7 +258,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 		hci->info->exit(hci);
 err:
 	platform_device_put(hci->pdev);
-	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
 	return ret;
 }
 
@@ -260,28 +265,26 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 {
 	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
 	struct platform_device *pdev = hci->pdev;
-	int dev_id = pdev->id;
 
 	if (hci->info->exit)
 		hci->info->exit(hci);
 
 	platform_device_unregister(pdev);
-	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
 }
 
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Wildcat Lake-U */
-	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
-	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_1_info},
+	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_2_info},
 	/* Panther Lake-H */
-	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
-	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_1_info},
+	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_2_info},
 	/* Panther Lake-P */
-	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
-	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_1_info},
+	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_2_info},
 	/* Nova Lake-S */
-	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
-	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_1_info},
+	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_2_info},
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
