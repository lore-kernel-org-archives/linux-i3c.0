Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59601D609D2
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cR499BU8UactR+VvXnHnX4g7BrxE8sraJs7aZDbGPo=; b=AXEbhM+UGevnKW
	2lJbL1WpHNfyxdm28tR0ZDXBtMYGD75ZPoibrXhoavRElsMrjElq/e1w2f+1C3/UuZc3MDiM346Ku
	hD38qg37o98oGR6Bpoe46xj85Z6SZ+7CXd0yzehIsnpW8OuJQoA3wtFjMPnSUplfA3cnYkYboMg+A
	UGh0yvqLWVLEnCS/bkT3oWcpp4XE9o3du2R7s4AWlVIyIuLdk+STClDPbpk1uAFqJo54hlrTBgRpZ
	J4QosDpnVsvbFDvbbvCZW2R7iaaFTFSbFiwwEinvjHD4cPJD7ajBLB8EPymBU3+216PT/4vqrFUx/
	4/kPPPNzwaKZp+Akc5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMI-00000005ZUl-0TrQ;
	Tue, 16 Dec 2025 16:57:10 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMF-00000005ZNb-3iQC
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904228; x=1797440228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nWNEhdtqQgc1LfJC3cj/EhL9DESxYNCK333RxsrQE8o=;
  b=UJqPyjp8HE42A3vwYr2aUvbcfT3EclVd0WguTu+lU3LEQgQUjGUykEpl
   UBJh5p7UIYwdLpRRkS72inUItkJDzNGQRKN9VQLRbxm2YfYgB38tIgFPe
   e/Zl1ff9yoC0ZiBPVMxNvoz2J1BXHZcXrVA9dJAyhI2TlC21R5DsKLHiR
   Fm+6lubehgEiPbiprVpgRtQgowVlaqfHJt5I32TpcwA0NvUgQJg8o84B8
   /jM0Zd/zDtcbK+VXGgd9XQrot0+Dnf39yUGyXi1knpnpBDogP6bOiP7cs
   sRfXS2HTjjA7Z2ch17Jqb0GBIyR9pdd/tgV0U8cZ90YLH9kGDaPb7VYgJ
   w==;
X-CSE-ConnectionGUID: lkxPuA8YRiaFwrQ1O6RCmA==
X-CSE-MsgGUID: 6q/Ae+X2QzSWkftNth2Vvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466771"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466771"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:07 -0800
X-CSE-ConnectionGUID: Jpk+q+IrSiCsj2cyWQkTZA==
X-CSE-MsgGUID: UXHpq2DwQIW5sYKTT3Onlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817710"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:06 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 09/11] i3c: mipi-i3c-hci-pci: Convert to MFD driver
Date: Tue, 16 Dec 2025 18:56:40 +0200
Message-ID: <20251216165642.164583-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085707_935873_E1ABBA5C 
X-CRM114-Status: GOOD (  16.69  )
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

Prepare for Multi-Bus instance support.  Convert to MFD driver but still
support only 1 instance.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by
	Adjust for doing away with dynamic devid allocation

Changes in V2:
	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
	Multi-Bus Instances"


 drivers/i3c/master/Kconfig                    |  1 +
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 75 ++++++++++---------
 2 files changed, 41 insertions(+), 35 deletions(-)

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 82cf330778d5..2609f2b18e0a 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -69,6 +69,7 @@ config MIPI_I3C_HCI_PCI
 	tristate "MIPI I3C Host Controller Interface PCI support"
 	depends on MIPI_I3C_HCI
 	depends on PCI
+	select MFD_CORE
 	help
 	  Support for MIPI I3C Host Controller Interface compatible hardware
 	  on the PCI bus.
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index ca562a5634e8..7ef17255c312 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -12,6 +12,7 @@
 #include <linux/idr.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_data/mipi-i3c-hci.h>
@@ -20,7 +21,6 @@
 
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
-	struct platform_device *pdev;
 	void __iomem *base;
 	const struct mipi_i3c_hci_pci_info *info;
 	void *private;
@@ -187,12 +187,45 @@ static const struct mipi_i3c_hci_pci_info intel_2_info = {
 	.id = 2,
 };
 
+struct mipi_i3c_hci_pci_cell_data {
+	struct mipi_i3c_hci_platform_data pdata;
+	struct resource res;
+};
+
+static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
+					struct mipi_i3c_hci_pci_cell_data *data,
+					struct mfd_cell *cell)
+{
+	data->pdata.base_regs = hci->base;
+
+	data->res = DEFINE_RES_IRQ(0);
+
+	cell->name = hci->info->name;
+	cell->id = hci->info->id;
+	cell->platform_data = &data->pdata;
+	cell->pdata_size = sizeof(data->pdata);
+	cell->num_resources = 1;
+	cell->resources = &data->res;
+}
+
+static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
+{
+	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
+	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
+	int irq = pci_irq_vector(hci->pci, 0);
+
+	if (!cells || !data)
+		return -ENOMEM;
+
+	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
+
+	return mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
+}
+
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	struct mipi_i3c_hci_platform_data pdata = {};
 	struct mipi_i3c_hci_pci *hci;
-	struct resource res;
 	int ret;
 
 	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
@@ -215,38 +248,13 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret < 0)
 		return ret;
 
-	memset(&res, 0, sizeof(res));
-
-	res.flags = IORESOURCE_IRQ;
-	res.start = pci_irq_vector(hci->pci, 0);
-	res.end = res.start;
-
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
-	hci->pdev = platform_device_alloc(hci->info->name, hci->info->id);
-	if (!hci->pdev)
-		return -ENOMEM;
-
-	hci->pdev->dev.parent = &pci->dev;
-	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
-
-	ret = platform_device_add_resources(hci->pdev, &res, 1);
+	ret = hci->info->init ? hci->info->init(hci) : 0;
 	if (ret)
-		goto err;
-
-	pdata.base_regs = hci->base;
-
-	ret = platform_device_add_data(hci->pdev, &pdata, sizeof(pdata));
-	if (ret)
-		goto err;
-
-	if (hci->info->init) {
-		ret = hci->info->init(hci);
-		if (ret)
-			goto err;
-	}
+		return ret;
 
-	ret = platform_device_add(hci->pdev);
+	ret = mipi_i3c_hci_pci_add_instances(hci);
 	if (ret)
 		goto err_exit;
 
@@ -257,20 +265,17 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 err_exit:
 	if (hci->info->exit)
 		hci->info->exit(hci);
-err:
-	platform_device_put(hci->pdev);
 	return ret;
 }
 
 static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 {
 	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
-	struct platform_device *pdev = hci->pdev;
 
 	if (hci->info->exit)
 		hci->info->exit(hci);
 
-	platform_device_unregister(pdev);
+	mfd_remove_devices(&pci->dev);
 }
 
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
