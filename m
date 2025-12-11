Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735C7D41C37
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9OXNsRYSRGffHJi/QTGT9xxng1g16pL4v3C4N9gBlY=; b=MFaRI3eh1j2dkr
	xK6Phw84W8KokMjRQbW41gOQbsUOLdllvs5EmHzexexEeHA5iIeUuZvPOlEGo+2ciokQZ2y0C3Pg7
	yRHhO6YzRzfYtygsODOeM+/xiR08UKzN0KAHFannInRLolgmA0vod+nMhsVXKol3EL5dK7IWcDtPy
	LRRJ2zd8Pg+8DzxY7vkVjusN0WM2OpyxDtv/fKiuzGCsBJQOvzrhKWFNymI6Maj5yDcOaA96LQR6s
	ticsgXbH6SMv0Hu0AfBTYmGxNcXfCGiGPxfhATrthA0Nbd6EY3XhVmh0WgAyRR83DY39B2aakBYhW
	LiuURZsngfA7dKqnVsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh2B-0000000GflK-0tlx;
	Thu, 11 Dec 2025 13:48:43 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh28-0000000Gfc2-3GmQ
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460921; x=1796996921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WUXzc81Vzzi4dmiyFiCSB/jg+Em4b2xdo+oV5NGUUGg=;
  b=lGO7xVV/JwRQ3009qKbjBlADZi2xByfdCRfUOPAbrq6HJ7wWp9HeQ0fN
   9VxotNhKqgkZW9s/3ID5GzcmVwnb0L8UUpiEC/uwGbcbWyxZTvnaz872T
   OA5docHa48T4FsGfNvuYCgEVNP3/ii5KO5tRLKAkG2GtyBXZ2MchS6xtW
   P3Kv0oDqEPxv7pH6gNyDyTVXAo6k0QBipB6BFf4ocrMkSzRM9PFTZWsFn
   0tK79aIWZuGFCDlhNcijsoB9/Ecp2ySooTATTegAQOl1/jTBO10tGl4xy
   Vt3ecXjNFMnlEwpAMs+H3W8wU4bnfdSBzDBWVUjZHKkZgcLwO2/p3NjVd
   Q==;
X-CSE-ConnectionGUID: OBCSZAu0TZGG2pgPtSWJhQ==
X-CSE-MsgGUID: qWcFLN5nRv6VgD7CdAi+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481912"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:40 -0800
X-CSE-ConnectionGUID: lAFjHnn5Qoe7PYBGc6zZmw==
X-CSE-MsgGUID: IDLb3oArTYWPfKpCeK15XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171698"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:39 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 08/10] i3c: mipi-i3c-hci-pci: Convert to MFD driver
Date: Thu, 11 Dec 2025 15:48:07 +0200
Message-ID: <20251211134809.75872-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211134809.75872-1-adrian.hunter@intel.com>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054840_829616_E50034ED 
X-CRM114-Status: GOOD (  17.97  )
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
---


Changes in V2:
	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
	Multi-Bus Instances"


 drivers/i3c/master/Kconfig                    |   1 +
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 100 ++++++++++--------
 2 files changed, 58 insertions(+), 43 deletions(-)

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
index 0180d99a37e4..68088967942b 100644
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
@@ -20,8 +21,8 @@
 
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
-	struct platform_device *pdev;
 	void __iomem *base;
+	int dev_id;
 	const struct mipi_i3c_hci_pci_info *info;
 	void *private;
 };
@@ -178,13 +179,59 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 	.exit = intel_i3c_exit,
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
+	cell->name = "mipi-i3c-hci";
+	cell->id = hci->dev_id;
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
+	int ret;
+
+	if (!cells || !data)
+		return -ENOMEM;
+
+	hci->dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
+	if (hci->dev_id < 0)
+		return hci->dev_id;
+
+	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
+
+	ret = mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
+	if (ret)
+		goto err_free_ids;
+
+	return 0;
+
+err_free_ids:
+	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
+	return ret;
+}
+
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	struct mipi_i3c_hci_platform_data pdata = {};
 	struct mipi_i3c_hci_pci *hci;
-	struct resource res;
-	int dev_id, ret;
+	int ret;
 
 	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
 	if (!hci)
@@ -206,41 +253,13 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret < 0)
 		return ret;
 
-	memset(&res, 0, sizeof(res));
-
-	res.flags = IORESOURCE_IRQ;
-	res.start = pci_irq_vector(hci->pci, 0);
-	res.end = res.start;
-
-	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
-	if (dev_id < 0)
-		return dev_id;
-
-	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
-	if (!hci->pdev)
-		return -ENOMEM;
-
-	hci->pdev->dev.parent = &pci->dev;
-	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
-
-	ret = platform_device_add_resources(hci->pdev, &res, 1);
-	if (ret)
-		goto err;
-
-	pdata.base_regs = hci->base;
+	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
-	ret = platform_device_add_data(hci->pdev, &pdata, sizeof(pdata));
+	ret = hci->info->init ? hci->info->init(hci) : 0;
 	if (ret)
-		goto err;
-
-	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
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
 
@@ -251,23 +270,18 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 err_exit:
 	if (hci->info->exit)
 		hci->info->exit(hci);
-err:
-	platform_device_put(hci->pdev);
-	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
 	return ret;
 }
 
 static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 {
 	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
-	struct platform_device *pdev = hci->pdev;
-	int dev_id = pdev->id;
 
 	if (hci->info->exit)
 		hci->info->exit(hci);
 
-	platform_device_unregister(pdev);
-	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
+	mfd_remove_devices(&pci->dev);
+	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
 }
 
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
