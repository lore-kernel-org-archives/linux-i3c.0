Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5633CD609D7
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9o7GjmVZDSkgOJJmyhxM3SQjQEiwKf7kHXc+4RO9KYc=; b=mGKCrH1kIDvNu2
	GvWYlJQkXAUoNF8w9Lv5pGQEPFbRGQran6KKgNQNFhwRlbe+OX7TkpZ1kfkRyYCTIRigIHiwNwoiS
	QYbjUzEtYrvZ3kyDgtDb5k86cSinUylNROnmRvemN/VvAzsUevgCpVkE3QbXY0u53DEF/p9uz3JwL
	VHlI2wGLnmYACIN6TfOiCG3xeiOiJzys8NEPpwWYx+nXC8A3sSZolEiSXGR+itVIPnBWBLLv+5Dw+
	z5QWgudoWlMwCzXlFBC/k3XREooajIoxBHXY5nGz7fDvdym9+J2Z7FVyfcrFYwgn79TuqEviYdTnN
	WYquFU8VhTZBN8QUiL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMD-00000005ZQ0-0CIS;
	Tue, 16 Dec 2025 16:57:05 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMA-00000005ZNb-3vzT
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904223; x=1797440223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pQXKENEkyWAyNxWB1AGBn1Ftd1c3dSgjAy3ZuzhK89c=;
  b=eLqGEGMoaV/I7RyRJhsRu0XEFwGpvqDDJeo3Amm9r6uFD+sn4LQ9e7f2
   xg037H6bprfp3YRKanDDyHcG6q1syyzvzdTcXtO1oP0SdgAOzugHLi+nH
   IMLNnocA7s8SahPa7v7GCE82N8xEbG8VQmB2bJ0cKIwOFx6chaUWzLp5M
   H0Q/5dF7wWKAFyLHP7USqLAzO23juRYoz/WmCXgCxmK/19LeAn5RIUJEZ
   1e3G7huAt3+sM4Re0RiAkFCuZyuZ/x2rr7TlOz6DLhzPUk1+uU4HsvmEb
   JTIZbSmb2nJh0tpN5f1HYvF/7fBiXHb9JEOFsAn6XurQyrsqBTMFySgUA
   g==;
X-CSE-ConnectionGUID: Y7cl1jdfQjaTH42xlQgFrA==
X-CSE-MsgGUID: KHGYqSDhQNOiM96og3yyyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466751"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:02 -0800
X-CSE-ConnectionGUID: T4OU8d5STa2+zbO+bWgV+g==
X-CSE-MsgGUID: 28ivMW1qS1Gq0TJadjchNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817678"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:01 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 06/11] i3c: mipi-i3c-hci-pci: Assign unique device names and IDs for Intel LPSS I3C
Date: Tue, 16 Dec 2025 18:56:37 +0200
Message-ID: <20251216165642.164583-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085703_027262_645AD82E 
X-CRM114-Status: GOOD (  17.44  )
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
---


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
