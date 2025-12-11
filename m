Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250E2D41C3A
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1Fj2+dD2ugyE+JczxrpoLCzr1sjq/d21C/53zl8sR0=; b=2VytpW19afQ3yS
	ABFhz/DDGnHJQUv1f2l0PAGXXk2Apk+puxXX4d5i6LI0cNUl3I4DIZVzlyOHkaRjrnPO9t6wZEWH0
	5+XuDu6ZtBDTKLMmKkbCENsDo7q5HGEYUYQkjONR2IeyTk7gZ/AsNN5Q2SjZ4fzw+PzSiFBOjLPsJ
	FLAUgPMS3xHuGYXIklfIQsUvTiHe4lUj1NL5+T7taUIxivD2r3NjjICnPbmavOqDqiwDsLF3f77f2
	FDamXcxrHMfJojbtd6iwdrstca6HdPgkvVa4FQpqPjr5a3pEvIiBfjpYfrOp8Y9y3AHLW9U6AyaCk
	FXy+wih1W9z/1d/7xlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh24-0000000GfgG-3hpz;
	Thu, 11 Dec 2025 13:48:36 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh22-0000000Gfc2-1kd8
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460914; x=1796996914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zoap4o/1V8KaAfumWBmWX3nuDaRhCrPeEgBENBV7eO8=;
  b=ZHT3hX5VOf4p/syNxrVqgKyUrLdgNX+FuN1apTEHxnBp4ho66FmpgAtk
   QQaC5sjZC/z/u1OuqnlOCaJ76IJx/yZ57ou9vo/uy6TKYbzwJkkNqRW4Y
   WtN/ejGeeF6GBu7yy2+hplpluYyWz5Ssd4hN35LGf7JzZ/LaNdQ/HwO2a
   xUYMK2bwNpMpHiaJn5RA5Kfbjhh/MrN0wEqa78/uG6WqXMuT4harrGqsy
   wdsWeim2fEboxlhau2a2WOX0pH2aTgUFzyJPEk3tLabHChtUr33U5sYrQ
   6ITWqQk4OfXqzsx+2yfZCIycxEUExqr3oubpZC/pQiR8+X46TxEtRcZIZ
   Q==;
X-CSE-ConnectionGUID: 9ceOHOSaQaqI/5v5+sBaTA==
X-CSE-MsgGUID: xsRTrXi3Rtqtwcqnh5AYwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481874"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:34 -0800
X-CSE-ConnectionGUID: SOjvf6T/TuSKBSOtjeWF/A==
X-CSE-MsgGUID: 4dQcFj25Q5WTy10m/r7r4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171672"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:32 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 04/10] i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
Date: Thu, 11 Dec 2025 15:48:03 +0200
Message-ID: <20251211134809.75872-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211134809.75872-1-adrian.hunter@intel.com>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054834_479275_AF1DAEED 
X-CRM114-Status: GOOD (  16.39  )
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

A separate platform device will represent each instance, but it is
necessary to allow for shared resources.

Multi-bus instances share the same MMIO address range, but not necessarily
in separate contiguous sub-ranges. To avoid overlapping mappings, provide
base_regs from the parent mapping.

Allow the IRQ to be shared.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c     | 21 +++++++++++++++++----
 include/linux/platform_data/mipi-i3c-hci.h | 15 +++++++++++++++
 2 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 include/linux/platform_data/mipi-i3c-hci.h

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 07fb91a12593..05b8df1cf86d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/platform_data/mipi-i3c-hci.h>
 #include <linux/platform_device.h>
 
 #include "hci.h"
@@ -737,15 +738,27 @@ static int i3c_hci_init(struct i3c_hci *hci)
 
 static int i3c_hci_probe(struct platform_device *pdev)
 {
+	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
 	struct i3c_hci *hci;
 	int irq, ret;
 
 	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
 	if (!hci)
 		return -ENOMEM;
-	hci->base_regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hci->base_regs))
-		return PTR_ERR(hci->base_regs);
+
+	/*
+	 * Multi-bus instances share the same MMIO address range, but not
+	 * necessarily in separate contiguous sub-ranges. To avoid overlapping
+	 * mappings, provide base_regs from the parent mapping.
+	 */
+	if (pdata)
+		hci->base_regs = pdata->base_regs;
+
+	if (!hci->base_regs) {
+		hci->base_regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(hci->base_regs))
+			return PTR_ERR(hci->base_regs);
+	}
 
 	platform_set_drvdata(pdev, hci);
 	/* temporary for dev_printk's, to be replaced in i3c_master_register */
@@ -759,7 +772,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
-			       0, NULL, hci);
+			       IRQF_SHARED, NULL, hci);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/platform_data/mipi-i3c-hci.h b/include/linux/platform_data/mipi-i3c-hci.h
new file mode 100644
index 000000000000..ab7395f455f9
--- /dev/null
+++ b/include/linux/platform_data/mipi-i3c-hci.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef INCLUDE_PLATFORM_DATA_MIPI_I3C_HCI_H
+#define INCLUDE_PLATFORM_DATA_MIPI_I3C_HCI_H
+
+#include <linux/compiler_types.h>
+
+/**
+ * struct mipi_i3c_hci_platform_data - Platform-dependent data for mipi_i3c_hci
+ * @base_regs: Register set base address (to support multi-bus instances)
+ */
+struct mipi_i3c_hci_platform_data {
+	void __iomem *base_regs;
+};
+
+#endif
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
