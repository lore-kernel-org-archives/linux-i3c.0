Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D28D3B7F3
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21gG4wH6oGWhsoqcbbfk0rH///qpwqbJi3FwP4syasI=; b=ZF6HW7bPwB12nJ
	PaVxfn1cTyJk07wbgz1HTeckh8Pgqvcr5KCw8Bc7Lz1ucNFNiv/b5KGPtvht+Z5LSLXQkXYf4BgaB
	R3bxx+kFkLXutD97L0j8fEVt2M3P9FXytWflr6fEEngf41GIz+tSjFGwtjlsREg9pwqSREzz+e9Q/
	0awWr1ms85detcmdvDjJamL+33SY0ZSfxYcAWqGnb+0xxZsKVzxBgirFvCpsrCu6kEbB1JLWZQuMg
	XoKkmFSHhmO4BLZnfutegU8p4vPumkVTQH0PE9RNC/TitOg+IL30t3CRvkma9qVyg+vSr2i57Wwhj
	D/yb4lN4om8N6iZhTorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFa-0000000EDP2-3xJO;
	Tue, 09 Dec 2025 11:51:26 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFX-0000000EDK7-3OiI
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 11:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765281084; x=1796817084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VU69/vhmZhsDB2MN885nSD26RrR06iBw0udsJWIJuaA=;
  b=EGEfbsw7tTr4e0gimNQKSI4s92tq1MYWjPTC8HIZYrGrCnPP/SuaDPLg
   zvd7IAcpdn0g2Tv4HAuz+IU4ysTW8DnAYj6++C1esJ38ANjVNHczQhUQj
   zRDZt3ntrBv41Bvjp1jOv7DQUmKOMz2SBMLZ5+hR/Go3p6q/dTlppOiSR
   AC56nt6TJiUURkTTSnSI7+tjqAg8Yl8IitH1c6lJ0tyDm5+0JcAo/hkrE
   BMo4WY7BeTZsMBJkMltYpTDPisqYxyNRIVe6GpeMOxBDucDBx3S1cEwYd
   uL2lKveoMNOtp9qv3s91B5vDQ35APtCeS/6DXTWuvptnMz85qHChz/wOI
   w==;
X-CSE-ConnectionGUID: n4lNYmH8Rdq6Csxsh1mB1w==
X-CSE-MsgGUID: 22358KhZQ0y7DppMwKJGFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67271184"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67271184"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:23 -0800
X-CSE-ConnectionGUID: qKHwUd1CTmWl+jZuKAjbmA==
X-CSE-MsgGUID: Wa0P01GISCylMlVwQXw6Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200644441"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:22 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 6/7] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
Date: Tue,  9 Dec 2025 13:51:03 +0200
Message-ID: <20251209115104.124156-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251209115104.124156-1-adrian.hunter@intel.com>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_035123_873971_5FDF8AF3 
X-CRM114-Status: GOOD (  22.80  )
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

A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
multiple I3C Buses (up to 15), with one instance of the HCI Register Set
and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
hardware function (e.g. PCIe B/D/F).

Convert to a Multifunction driver and create an MFD cell for each instance.
Create a separate platform device for each instance.  Use platform_data to
pass the instance's register set start address.

MIPI I3C specification defines an Extended Capability to hold the offset
of each instance register set.  However parsing to find that information is
relatively complicated compared with just including it in the driver data.
Do that for now.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/Kconfig                    |   1 +
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 180 +++++++++++++-----
 2 files changed, 131 insertions(+), 50 deletions(-)

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
index ccaec5d3d248..145f9adadf75 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -12,27 +12,43 @@
 #include <linux/idr.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_data/mipi-i3c-hci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 
+/*
+ * There can up to 15 instances, but implementations have at most 2 at this
+ * time.
+ */
+#define INST_MAX 2
+
+struct mipi_i3c_hci_pci_instance {
+	int dev_id;
+	u32 offset;
+};
+
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
-	struct platform_device *pdev;
+	void __iomem *base;
 	const struct mipi_i3c_hci_pci_info *info;
+	struct mipi_i3c_hci_pci_instance instances[INST_MAX];
 	void *private;
 };
 
 struct mipi_i3c_hci_pci_info {
+	struct mipi_i3c_hci_platform_data pdata;
 	int (*init)(struct mipi_i3c_hci_pci *hci);
 	void (*exit)(struct mipi_i3c_hci_pci *hci);
+	u32 instance_offset[INST_MAX - 1]; /* Excludes instance at offset 0 */
+	int instance_count;
 };
 
 static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 
 #define INTEL_PRIV_OFFSET		0x2b0
-#define INTEL_PRIV_SIZE			0x28
 #define INTEL_RESETS			0x04
 #define INTEL_RESETS_RESET		BIT(0)
 #define INTEL_RESETS_RESET_DONE		BIT(1)
@@ -143,19 +159,12 @@ static void intel_reset(void __iomem *priv)
 	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
 }
 
-static void __iomem *intel_priv(struct pci_dev *pci)
-{
-	resource_size_t base = pci_resource_start(pci, 0);
-
-	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
-}
-
 static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 {
 	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
-	void __iomem *priv = intel_priv(hci->pci);
+	void __iomem *priv = hci->base + INTEL_PRIV_OFFSET;
 
-	if (!host || !priv)
+	if (!host)
 		return -ENOMEM;
 
 	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
@@ -187,12 +196,106 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 static const struct mipi_i3c_hci_pci_info dflt_info = {
 };
 
+static void mipi_i3c_hci_pci_init_ids(struct mipi_i3c_hci_pci *hci)
+{
+	/* 0 is a valid id, so set unallocated ids to -1 */
+	for (int i = 0; i < INST_MAX; i++)
+		hci->instances[i].dev_id = -1;
+}
+
+static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
+{
+	/* ida_free() ignores negative ids */
+	for (int i = 0; i < INST_MAX; i++)
+		ida_free(&mipi_i3c_hci_pci_ida, hci->instances[i].dev_id);
+
+	mipi_i3c_hci_pci_init_ids(hci);
+}
+
+static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
+{
+	int dev_id;
+
+	mipi_i3c_hci_pci_init_ids(hci);
+
+	for (int i = 0; i < nr; i++) {
+		dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
+		if (dev_id < 0)
+			goto err_free_ids;
+		hci->instances[i].dev_id = dev_id;
+	}
+
+	return 0;
+
+err_free_ids:
+	mipi_i3c_hci_pci_free_ids(hci);
+	return -ENOMEM;
+}
+
+struct mipi_i3c_hci_pci_cell_data {
+	struct mipi_i3c_hci_platform_data pdata;
+	struct resource res;
+};
+
+static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
+					struct mipi_i3c_hci_pci_cell_data *data,
+					struct mfd_cell *cell)
+{
+	u32 offset = idx ? hci->info->instance_offset[idx - 1] : 0;
+
+	hci->instances[idx].offset = offset;
+
+	data->pdata = hci->info->pdata;
+	data->pdata.base_regs = hci->base + offset;
+
+	data->res = DEFINE_RES_IRQ(0);
+
+	cell->name = "mipi-i3c-hci";
+	cell->id = hci->instances[idx].dev_id;
+	cell->platform_data = &data->pdata;
+	cell->pdata_size = sizeof(data->pdata);
+	cell->num_resources = 1;
+	cell->resources = &data->res;
+}
+
+static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
+{
+	int instance_count = hci->info->instance_count + 1; /* Include instance at offset 0 */
+	struct mipi_i3c_hci_pci_cell_data *data __free(kfree);
+	struct mfd_cell *cells __free(kfree);
+	int irq;
+	int ret;
+
+	cells = kcalloc(instance_count, sizeof(*cells), GFP_KERNEL);
+	data = kcalloc(instance_count, sizeof(*data), GFP_KERNEL);
+	if (!cells || !data)
+		return -ENOMEM;
+
+	ret = mipi_i3c_hci_pci_alloc_ids(hci, instance_count);
+	if (ret)
+		return ret;
+
+	for (int i = 0; i < instance_count; i++)
+		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
+
+	irq = pci_irq_vector(hci->pci, 0);
+
+	ret = mfd_add_devices(&hci->pci->dev, 0, cells, instance_count, NULL, irq, NULL);
+	if (ret)
+		goto err_free_ids;
+
+	return 0;
+
+err_free_ids:
+	mipi_i3c_hci_pci_free_ids(hci);
+	return ret;
+}
+
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
 	struct mipi_i3c_hci_pci *hci;
-	struct resource res[2];
-	int dev_id, ret;
+	int ret;
 
 	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
 	if (!hci)
@@ -204,68 +307,45 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		return ret;
 
-	pci_set_master(pci);
-
-	memset(&res, 0, sizeof(res));
-
-	res[0].flags = IORESOURCE_MEM;
-	res[0].start = pci_resource_start(pci, 0);
-	res[0].end = pci_resource_end(pci, 0);
-
-	res[1].flags = IORESOURCE_IRQ;
-	res[1].start = pci->irq;
-	res[1].end = pci->irq;
+	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return ret;
 
-	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
-	if (dev_id < 0)
-		return dev_id;
+	pci_set_master(pci);
 
-	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
-	if (!hci->pdev)
-		return -ENOMEM;
+	hci->base = pcim_iomap_region(pci, 0, pci_name(pci));
+	if (IS_ERR(hci->base))
+		return PTR_ERR(hci->base);
 
-	hci->pdev->dev.parent = &pci->dev;
-	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
+	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
 
-	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
+	ret = hci->info->init ? hci->info->init(hci) : 0;
 	if (ret)
-		goto err;
+		return ret;
 
-	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
-	if (hci->info->init) {
-		ret = hci->info->init(hci);
-		if (ret)
-			goto err;
-	}
+	pci_set_drvdata(pci, hci);
 
-	ret = platform_device_add(hci->pdev);
+	ret = mipi_i3c_hci_pci_add_instances(hci);
 	if (ret)
 		goto err_exit;
 
-	pci_set_drvdata(pci, hci);
-
 	return 0;
 
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
+	mipi_i3c_hci_pci_free_ids(hci);
 }
 
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
