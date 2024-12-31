Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBC8E77194
	for <linux-i3c@archiver.kernel.org>; Tue, 31 Dec 2024 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XShkgBazBOMOSNGRWhf96TBEl6DnOwcGSrRqdyAnLTI=; b=ZXFSGQwpN1p+r5
	RjqmE39IMAwQ2fz9mSipag+QUs/qqh8mBBANKeigE5ormtoRJwKihinZEHwkZdZGCT61JfE7tjnaZ
	xTJrHhOBS6CuyaLRALkesg/leLivvlGYyon3NUawSPeEUoY2RY3xCiY0DMk0EkiC86gFeOscSdoqW
	afacTnOgD3/Ut9R5Qt/M5b4ep4kTxIt+Rja63fsfr8Gl/4cuAnDkkDH8KiVqMsZbxliL6zKrHbP4F
	NdR2zsbMefQEnqYRynpTpknbHYtEj05xpB1mVHzN4QnvpJW5py+kxMKRNzxl2BhCMrT0O2cXPhGYj
	SueS/hosIcpQXACpQbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSau4-000000078SC-0O5y;
	Tue, 31 Dec 2024 11:59:16 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSau1-000000078RF-37gj
	for linux-i3c@lists.infradead.org;
	Tue, 31 Dec 2024 11:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735646354; x=1767182354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lSgOXvfupCKg/wqgrQRhbmbwY9oR09m8MYZkt12DE8U=;
  b=lk6+FyzVC4W90k4PaUPV4L3GI9ANXWWLDx9bwN6kCpq4B64/my8+kj/e
   0ZNsEKoJCiGU2scmk1PPIrA4lTlh5gUBiOhDxXwQ1im3e9dXXeDEC/Uuz
   dlUGq9/vbIbr/i3mKXDFr6LuBCyoSjNIHonMBcFtUd5Wm+NTeNoZ2WPD4
   GNB9g1/crdDlJl+IovT8dJQktCga5r0raHFggg1U8ADbVZDbIiUeQkdze
   kfp6WeC5g4Qaugxvbwhhsgk9xww8tjkj6aThJw/Pn2xut2e1fppfoXCpr
   OejM8v8IDk/UkXbJLLvzWDAoIgoO6zMwIzk+ccdQCDt25Gx4G3mAwLG2T
   g==;
X-CSE-ConnectionGUID: InUjWZdAQg2uAt/lHiiHPw==
X-CSE-MsgGUID: GQrlCk39QiCwtFx5k/M52g==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47344707"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="47344707"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 03:59:10 -0800
X-CSE-ConnectionGUID: 6347TWJAQ8KHucbwrt5SSQ==
X-CSE-MsgGUID: NBANFrdGQ1OZf2YZkuKrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100857122"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP; 31 Dec 2024 03:59:08 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/2] i3c: mipi-i3c-hci: Add support for MIPI I3C HCI on PCI bus
Date: Tue, 31 Dec 2024 13:59:04 +0200
Message-ID: <20241231115904.620052-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241231115904.620052-1-jarkko.nikula@linux.intel.com>
References: <20241231115904.620052-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_035913_804002_953D5A78 
X-CRM114-Status: GOOD (  20.35  )
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

Add a glue code for the MIPI I3C HCI on PCI bus with Intel Panther Lake
I3C controller PCI IDs.

MIPI I3C HCI on Intel platforms has additional logic around the MIPI I3C
HCI core logic. Those together create so called I3C slice on PCI bus.
Intel specific initialization code does a reset cycle to the I3C slice
before probing the MIPI I3C HCI part.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/Kconfig                    |  11 ++
 drivers/i3c/master/mipi-i3c-hci/Makefile      |   1 +
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 148 ++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 90dee3ec5520..77da199c7413 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -57,3 +57,14 @@ config MIPI_I3C_HCI
 
 	  This driver can also be built as a module.  If so, the module will be
 	  called mipi-i3c-hci.
+
+config MIPI_I3C_HCI_PCI
+	tristate "MIPI I3C Host Controller Interface PCI support"
+	depends on MIPI_I3C_HCI
+	depends on PCI
+	help
+	  Support for MIPI I3C Host Controller Interface compatible hardware
+	  on the PCI bus.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called mipi-i3c-hci-pci.
diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
index 1f8cd5c48fde..e3d3ef757035 100644
--- a/drivers/i3c/master/mipi-i3c-hci/Makefile
+++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
@@ -5,3 +5,4 @@ mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
 					   cmd_v1.o cmd_v2.o \
 					   dat_v1.o dct_v1.o \
 					   hci_quirks.o
+obj-$(CONFIG_MIPI_I3C_HCI_PCI)		+= mipi-i3c-hci-pci.o
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
new file mode 100644
index 000000000000..c6c3a3ec11ea
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI glue code for MIPI I3C HCI driver
+ *
+ * Copyright (C) 2024 Intel Corporation
+ *
+ * Author: Jarkko Nikula <jarkko.nikula@linux.intel.com>
+ */
+#include <linux/acpi.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+
+struct mipi_i3c_hci_pci_info {
+	int (*init)(struct pci_dev *pci);
+};
+
+#define INTEL_PRIV_OFFSET		0x2b0
+#define INTEL_PRIV_SIZE			0x28
+#define INTEL_PRIV_RESETS		0x04
+#define INTEL_PRIV_RESETS_RESET		BIT(0)
+#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
+
+static DEFINE_IDA(mipi_i3c_hci_pci_ida);
+
+static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
+{
+	unsigned long timeout;
+	void __iomem *priv;
+
+	priv = devm_ioremap(&pci->dev,
+			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
+			    INTEL_PRIV_SIZE);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Assert reset, wait for completion and release reset */
+	writel(0, priv + INTEL_PRIV_RESETS);
+	timeout = jiffies + msecs_to_jiffies(10);
+	while (!(readl(priv + INTEL_PRIV_RESETS) &
+		 INTEL_PRIV_RESETS_RESET_DONE)) {
+		if (time_after(jiffies, timeout))
+			break;
+		cpu_relax();
+	}
+	writel(INTEL_PRIV_RESETS_RESET, priv + INTEL_PRIV_RESETS);
+
+	return 0;
+}
+
+static struct mipi_i3c_hci_pci_info intel_info = {
+	.init = mipi_i3c_hci_pci_intel_init,
+};
+
+static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
+				  const struct pci_device_id *id)
+{
+	struct mipi_i3c_hci_pci_info *info;
+	struct platform_device *pdev;
+	struct resource res[2];
+	int dev_id, ret;
+
+	ret = pcim_enable_device(pci);
+	if (ret)
+		return ret;
+
+	pci_set_master(pci);
+
+	memset(&res, 0, sizeof(res));
+
+	res[0].flags = IORESOURCE_MEM;
+	res[0].start = pci_resource_start(pci, 0);
+	res[0].end = pci_resource_end(pci, 0);
+
+	res[1].flags = IORESOURCE_IRQ;
+	res[1].start = pci->irq;
+	res[1].end = pci->irq;
+
+	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
+	if (dev_id < 0)
+		return dev_id;
+
+	pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
+	if (!pdev)
+		return -ENOMEM;
+
+	pdev->dev.parent = &pci->dev;
+	device_set_node(&pdev->dev, dev_fwnode(&pci->dev));
+
+	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
+	if (ret)
+		goto err;
+
+	info = (struct mipi_i3c_hci_pci_info *)id->driver_data;
+	if (info && info->init) {
+		ret = info->init(pci);
+		if (ret)
+			goto err;
+	}
+
+	ret = platform_device_add(pdev);
+	if (ret)
+		goto err;
+
+	pci_set_drvdata(pci, pdev);
+
+	return 0;
+
+err:
+	platform_device_put(pdev);
+	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
+	return ret;
+}
+
+static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
+{
+	struct platform_device *pdev = pci_get_drvdata(pci);
+	int dev_id = pdev->id;
+
+	platform_device_unregister(pdev);
+	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
+}
+
+static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
+	/* Panther Lake-H */
+	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
+	/* Panther Lake-P */
+	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
+	{ },
+};
+MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
+
+static struct pci_driver mipi_i3c_hci_pci_driver = {
+	.name = "mipi_i3c_hci_pci",
+	.id_table = mipi_i3c_hci_pci_devices,
+	.probe = mipi_i3c_hci_pci_probe,
+	.remove = mipi_i3c_hci_pci_remove,
+};
+
+module_pci_driver(mipi_i3c_hci_pci_driver);
+
+MODULE_AUTHOR("Jarkko Nikula <jarkko.nikula@intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MIPI I3C HCI driver on PCI bus");
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
