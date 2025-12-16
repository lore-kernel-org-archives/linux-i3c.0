Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AFED609CE
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uKNlEyBt4Z7f73dOfrUu/xFKVQWUI2tU+bBiIKzOA4=; b=j3P9xekYCKn7wx
	eYi0qqyo1Rgpr5nvXwLcqE5Ff/yXYXIXwZvQQczlKyLt9dDw16LJDGGYKU3Yc4Z0xzo5BgU23rvu4
	X416SU4aGNkwnWGwxkAaBMTekciScp61YtV7VyKtkuGNcJxDQPonQRg77Mz6FO3Ss6oKvyiiP/uXh
	Kz3nVhC6cTbIzl9WAQPJdyGKcw6f3Y3CaX5WxddeP34wHqNxFCfJIqEX7HXFUccNd/02qfpEVIStg
	quwhaxVbrnVeQcgfLAUkH5J3FR/OOeYI8LuW/LJxxvO+vqqpm9ChdpkUHCbulZ87oL+pLc1AWBG+F
	wvL85pVJ5e7P1s4KSndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMG-00000005ZTh-3dlD;
	Tue, 16 Dec 2025 16:57:08 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYME-00000005ZNb-0skV
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904226; x=1797440226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KNfQm+jIkykNidEzBoAcqsLbBu0sOWvlUD7jO19IYFc=;
  b=M8Y4tGpKPkGBpzNlQRWcpqsqF6XfFyGm5+WC950BcXltRcVHeOLEFzWI
   c7lHbyJbTtTiy71nLN6FQfonW6zPRFrvHK9A/cb+QIma9Gmh/2pOfrENG
   WrAVbSSl+kiRYTVFr0kCpj4+HDEdUOUQL7bExGxFgN2oqDb9OxvPYSqkB
   iw5ko7ItlFw0rbJKi4BKpOjiU/XRCHbtOsBhXg+5fApFqjCn32gdNsYug
   4at/GkvOnB3+O3qSI/E/w4Ikojq4yGYcBvBm4bVWydISutKq2kxg0Oy51
   y3pZdglzIwhC+gWoKGnIhebbjrr5zXJ7oEN04wpQTudxDb9pxKhfwzh1n
   Q==;
X-CSE-ConnectionGUID: 9O/9j85zS5erQyh5UwwAHw==
X-CSE-MsgGUID: ypzgvfY3RpWMb6/dpTFDAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466765"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:06 -0800
X-CSE-ConnectionGUID: ZX/ZvbEUQ2yvurH7D+MX4w==
X-CSE-MsgGUID: p9TOSzQ3TW2HwZ0z+fzdYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817700"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:05 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 08/11] i3c: mipi-i3c-hci-pci: Pass base regs as platform data to i3c core device
Date: Tue, 16 Dec 2025 18:56:39 +0200
Message-ID: <20251216165642.164583-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085706_257037_3B350154 
X-CRM114-Status: GOOD (  15.11  )
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

Use the parent's MMIO mapping for multi-bus instances to avoid overlapping
regions.  These instances share the same MMIO address space, but the ranges
are not guaranteed to be contiguous.  By passing base_regs from the parent
mapping, child devices can access their registers without creating
conflicting mappings.

Prepare for multi-bus instance support by passing base_regs to child
devices.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Enhance commit message

Changes in V2:
	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
	Multi-Bus Instances"


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 39 ++++++++++---------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 3b319fbf18ce..ca562a5634e8 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -14,12 +14,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_data/mipi-i3c-hci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
 	struct platform_device *pdev;
+	void __iomem *base;
 	const struct mipi_i3c_hci_pci_info *info;
 	void *private;
 };
@@ -32,7 +34,6 @@ struct mipi_i3c_hci_pci_info {
 };
 
 #define INTEL_PRIV_OFFSET		0x2b0
-#define INTEL_PRIV_SIZE			0x28
 #define INTEL_RESETS			0x04
 #define INTEL_RESETS_RESET		BIT(0)
 #define INTEL_RESETS_RESET_DONE		BIT(1)
@@ -143,19 +144,12 @@ static void intel_reset(void __iomem *priv)
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
@@ -196,8 +190,9 @@ static const struct mipi_i3c_hci_pci_info intel_2_info = {
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
+	struct mipi_i3c_hci_platform_data pdata = {};
 	struct mipi_i3c_hci_pci *hci;
-	struct resource res[2];
+	struct resource res;
 	int ret;
 
 	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
@@ -212,19 +207,19 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 
 	pci_set_master(pci);
 
+	hci->base = pcim_iomap_region(pci, 0, pci_name(pci));
+	if (IS_ERR(hci->base))
+		return PTR_ERR(hci->base);
+
 	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (ret < 0)
 		return ret;
 
 	memset(&res, 0, sizeof(res));
 
-	res[0].flags = IORESOURCE_MEM;
-	res[0].start = pci_resource_start(pci, 0);
-	res[0].end = pci_resource_end(pci, 0);
-
-	res[1].flags = IORESOURCE_IRQ;
-	res[1].start = pci_irq_vector(hci->pci, 0);
-	res[1].end = res[1].start;
+	res.flags = IORESOURCE_IRQ;
+	res.start = pci_irq_vector(hci->pci, 0);
+	res.end = res.start;
 
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
@@ -235,7 +230,13 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	hci->pdev->dev.parent = &pci->dev;
 	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
 
-	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
+	ret = platform_device_add_resources(hci->pdev, &res, 1);
+	if (ret)
+		goto err;
+
+	pdata.base_regs = hci->base;
+
+	ret = platform_device_add_data(hci->pdev, &pdata, sizeof(pdata));
 	if (ret)
 		goto err;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
