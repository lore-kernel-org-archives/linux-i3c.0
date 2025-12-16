Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D7D609D6
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bD68oazdnmLYkjgrTiFlHWKgrPh6zMLI0cBgpbi4iQ=; b=x5HmGtwEFBXfbP
	nZafs9qGDnPbgsfj0LXogYhNfbHkcjZOBhcEW4uffEnV5q8+aEe5a+Dc7HQXRfhhEoUh4wm08zMlc
	6vZlwqvrhx7KlC5KVf4bxielhLJVO/OSLf7EhXM8zjoiglYGUI32T13i0EJ6PjlXmzuPBS9xIG8yV
	VIoyM/AR4TA3Zgtwn7TdFNgJnynjh+VES0jhhB+p37krwDKUd69642WNzzhTf08RZfRKdH9Ho1n3G
	X7N5REXbuRK19JaVrSnVf1lBO9dAkEQXIJXXHTUAmNIzXzbgJuphppnbov4J72AaeeVquUdBPXDqz
	wmzvRoe3Qk0ADTGHH4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYME-00000005ZRk-2cH5;
	Tue, 16 Dec 2025 16:57:06 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMC-00000005ZNb-2FgN
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904224; x=1797440224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/vpxDmA1rMon2zxAU0E4SoQT18t5My3z2tEJebrelM=;
  b=V5ew6Vn/kwC/j4f8Il/y/p1dCQEB1N4TXFnY0CYM6ogP7rYGBpGcxAgY
   IPpLRUsBLM8GiGxPzmoVjnsDnvgt2zo5h0FZ2SChtXqJ/dSP1jWorI98L
   7mLGCJSO99dWcvz9WYF8x+2LRMeROLPoOItBxqCdWpdqu2rSa5equgrIy
   j4NRMJogRoIFAf9S7o0FEANjiTuwX27EHITVR6qQhxSsOcfT7u8OL0BRc
   i/hCZ1d1afEdsLjxuiS32vQHWl5r1yr6WK7zkBhR29vGMBb0Mt4oPfnXd
   lBGsY0dwvpuPykFcLjH3PiDN0Q3ORKczDGYPSXdMmV1Ol+xv+EsQeadTe
   w==;
X-CSE-ConnectionGUID: oE4uEgwQS1u895/1FeKucA==
X-CSE-MsgGUID: fDNwBxezQGeJoUE0CxwmXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466758"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466758"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:04 -0800
X-CSE-ConnectionGUID: 1L7TUtayTbeYmcdTixAhXQ==
X-CSE-MsgGUID: ikm3BmfPRjCdndEvXmSriA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817691"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:03 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 07/11] i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
Date: Tue, 16 Dec 2025 18:56:38 +0200
Message-ID: <20251216165642.164583-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085704_593048_E1DBCF7D 
X-CRM114-Status: GOOD (  17.77  )
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

Add support for MIPI I3C Host Controllers with the Multi-Bus Instance
capability.  These controllers can host multiple I3C buses (up to 15)
within a single hardware function (e.g., PCIe B/D/F), providing one
indepedent HCI register set and corresponding I3C bus controller logic
per bus.

A separate platform device will represent each instance, but it is
necessary to allow for shared resources.

Multi-bus instances share the same MMIO address space, but the ranges are
not guaranteed to be contiguous. To avoid overlapping mappings, pass
base_regs from the parent mapping to child devices.

Allow the IRQ to be shared among instances.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Enhance commit message

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c     | 21 +++++++++++++++++----
 include/linux/platform_data/mipi-i3c-hci.h | 15 +++++++++++++++
 2 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 include/linux/platform_data/mipi-i3c-hci.h

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 3d6544a64188..6da5daf18166 100644
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
