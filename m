Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B0ACE9D7F
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/6P7OJ3jmscfS48v3oRBXvkdKiKDQfJv9KpZNx+2Hc=; b=cNIU0iQoVpaJjv
	2AkSMFVhjibeR7tO+5rEKghD5PyYdKKY6TmhB7fVUblYahCyiGzzXt4TsK66FHx6HfE5B9slpTpe4
	8LM0NIr+1BwxAE5bUs1BG5LB/0rm1rpjzfgowq+UodaRHbirp5SA1uSsjcAWsRG6+PZJ1DkLBfEqT
	26Ngzk86D2wCPwKTPBQrMeOgHBVKk/umdxpcQ6FaeSmJrn6ZZBipHdCHEWR+ARzlQT6boEeu0D8m8
	WU7uGDwDnJ/IW3VzNE/GaDDysn+5tms0vI0ZsBDzdyRGuE9irnkBrSfw3aoRhq7wbUhfsC8QB5lOy
	+PuyzD8C+pXwXJX9n9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAB0-0000000DWWW-3PMv;
	Tue, 06 Jan 2026 16:44:58 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAx-0000000DWNZ-3UbB
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717896; x=1799253896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6oVHXv8XgeleCx/t53I44wNZl6CgrNl6y/ioavdnUsM=;
  b=Wwa+ps8KVMYdibzBUIJVVUlInSRgijnJXpxaVcnWu0fE9UMO//69JGUo
   uEsu+pKr+Kli17spTivaauBH9hcQsg6Zat2v6EPCIi1ZXPreqIClwxq0X
   EMn8247sDv3oZSKLpRuCLxTuzl9JmdneGTIrfAWHnDrh03spys6FaDZaC
   lJ91Hb1UpWVK1/8pNwsMXu1BG3a5bwIjc1c30/G030nOAZiuzIJ1haV4m
   ERUH9VzWgzK3rBv9XTmy8ZcsMwnT9f0VDammK9Ny6oSq/KK1c7Jvhm5Gs
   ELLFf4KUJ0MFeKl60hcCMcI82Pc6UOFOCnRF8HL5o96LJjFjM+9EIyBq6
   g==;
X-CSE-ConnectionGUID: 2FevDNBUQVC/lteTAdFBPg==
X-CSE-MsgGUID: EwgxdCcDT9ax3WjIy+jh3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741854"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:56 -0800
X-CSE-ConnectionGUID: coxacuW1RvCLA8HXe02XCw==
X-CSE-MsgGUID: xUYWKjYhQDSVTOky1QUFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838046"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:54 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 08/11] i3c: mipi-i3c-hci-pci: Pass base regs as platform data to i3c core device
Date: Tue,  6 Jan 2026 18:44:13 +0200
Message-ID: <20260106164416.67074-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084455_952626_1F3E946D 
X-CRM114-Status: GOOD (  15.69  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

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
