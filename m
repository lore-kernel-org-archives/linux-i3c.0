Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9524FC47BE1
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKZq6nvqt/BjwozTBSGksK2myPBStHvE3tmQCGvy8+Q=; b=24591otaW5o2Hz
	wefwwqxjzLEgXUEaKvk5RW4O2FY6X1zOUdTMdQGRErMUuUlLDJ9WjI2S0sPJieoBX4+MsNJpbE3V/
	PD2ZKgL0QK5hV6FcShiT2dwUlIaoHeFL7LVui+PtCY06RXZZHMFyuUIW2XTufMsNJf4hJHhj1c47+
	JiptqkCHWheNSPBrTkaptMh1/Q6X+HrwUJgMrU6a7usH9tq9rDrTQTQ8B/XIl0f9mgSW56Ufct0wZ
	IAql3Xz+iDIPc2MByJbZlH/AnCdV8LYFEYxZRqId9C0KXQaurU8v8Tfb9BfXC8aFZ/OgaHQBIQEG7
	4RHKrjfjwFRRsWQ/SMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAy-0000000DWV5-1H4Q;
	Tue, 06 Jan 2026 16:44:56 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAw-0000000DWNZ-017R
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717894; x=1799253894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJ2xwzbXNw6ljeBZ6LZoTd5gMSEPG3IJflsIj5Q62ec=;
  b=HvV+ikzAoZBmAYs5vJmjPZ4F7lGzudz9ljhlasiDxi9AzMAkM72MD2tO
   IzVCIkmLDLoq7gM3taVKaNzwt8w09lpRI3D4BYEfOecdCfFvs2KykAEVU
   X2GA6/7L6ZCHpsnKGaXN6t+VNxP+AyEtj65B7nwXr0gFRqBs76aV04yWu
   +fEuGzRj1Fb+YsjYU06sfQ4u1yfkIpMBNI65ugf++j1B5pul+aH2kL58N
   8cqekUTghOmoK5DCZOB6O9no46sInx1LNfoHl9h6UWVCN/EiJ/wu3S8V5
   wFE2sutpercn6la/aeuAOzola8RuCZTbF0BfbllxXcK5ypZ6sDycvakZH
   Q==;
X-CSE-ConnectionGUID: guwLHakjTW2cJEk4VeaE+w==
X-CSE-MsgGUID: hibhJ+kcT5emSi9GvYLGyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741849"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:54 -0800
X-CSE-ConnectionGUID: zkTbYsscSRGRg/ZE6LWs1A==
X-CSE-MsgGUID: 4C43SzHxSZa3MUroJnl4Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838041"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:52 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 07/11] i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
Date: Tue,  6 Jan 2026 18:44:12 +0200
Message-ID: <20260106164416.67074-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084454_088515_F6801FE0 
X-CRM114-Status: GOOD (  18.35  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

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
