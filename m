Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E803CD41C35
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCHgCIYJ6hwTtHsBk+1yUXMznb0tPXIuiUqrRAEw3zw=; b=ThjfidExCKV5/M
	2S4Xu6HrfJCOFJrXgGpR6kwIo2WDSYoppG4gtgI+niQihKyUEW+I0USZDGetvVNII4mzo7IdLIbbx
	F/iAzu5eZjZsVUq+oAPsZwrUiJNDO7hHUsS6rbAfcAdJ5jMPDX9kjgmaU3eu02rJW+JfDo83OGNMq
	vFK/lzr2H1vsue8DKxVe5YtFH7ORVuw7oawgN5ZHPME6oYkd9NA6TOj/xJqam+/DQ9sqMahEVzYWr
	Jr8L8O/Ui8elQjsnzQ4x5zMGXrfceSzrRZ6f/clxTpnk+FelEZ5qGCD1OdPkffh7PwrbLZpnPf7fI
	WZMj74Q0j6QZZunz2JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh28-0000000Gfj8-2u67;
	Thu, 11 Dec 2025 13:48:40 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh27-0000000Gfc2-0dSI
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460919; x=1796996919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y8odcK17B5VenpjrRIqkexxSJc5AqhRilZinuFjFqKk=;
  b=fMPoJe7l2GFwezfQS7Svlje7gTEmmInfnt3y0FrsKdOA7ZYaj3yzO2sZ
   nTxnS1JzkDXslfc6RCJzaXycXZbo5iVn3p4nwVD5HfsBptmGiY7Og8HhB
   yD3jA3oE6ivjcJOCyzXdAKZOBCgNCExI4PWNns2BUT5hGgLgDA64y+7pF
   IE7dikvRB/SlOwsk3muIEUcW+mZ+BVwv5qtxgZZtr6qj+pHJvxg8GqHyT
   E+tVpKY+5yt3p7Cqv+eQkGsXls+/5H+d60TMXmVXC20R61ElmCojXfwy4
   MWjiqnPZaINfCuOcTaQodsAO6XhwuQ5mR3f1JfYl84HOP4vZFUvCYbpsa
   Q==;
X-CSE-ConnectionGUID: 0RfWnC+aSC6IE2t052YFEg==
X-CSE-MsgGUID: hEuLKcxyRGi+CFMf5AIIsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481904"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481904"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:39 -0800
X-CSE-ConnectionGUID: 6epmvpOmR8qTNSF7308TTQ==
X-CSE-MsgGUID: NGTzdBd8TBGabOBY2ttHnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171693"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:37 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 07/10] i3c: mipi-i3c-hci-pci: Use parent MMIO mapping
Date: Thu, 11 Dec 2025 15:48:06 +0200
Message-ID: <20251211134809.75872-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211134809.75872-1-adrian.hunter@intel.com>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054839_199826_3A66346A 
X-CRM114-Status: GOOD (  13.46  )
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

Prepare for Multi-Bus instance support.  Pass base_regs to child device.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:
	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
	Multi-Bus Instances"


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 39 ++++++++++---------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 0fd3587671e1..0180d99a37e4 100644
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
 static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 
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
@@ -187,8 +181,9 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
+	struct mipi_i3c_hci_platform_data pdata = {};
 	struct mipi_i3c_hci_pci *hci;
-	struct resource res[2];
+	struct resource res;
 	int dev_id, ret;
 
 	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
@@ -203,19 +198,19 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 
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
 
 	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
 	if (dev_id < 0)
@@ -228,7 +223,13 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
