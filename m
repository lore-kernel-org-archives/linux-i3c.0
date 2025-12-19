Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C79D78787
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=av34K1RyUIEXy3adjMDjjXSHMkOS9ODwESasJf3Dwck=; b=k53YiD+IDicNOL
	JX41QzL4iqZcwf3DEQaO2+nXNCewbW/+uDUh8Jklk0TutUI4BaUcqmec7kocP1pZuvkHo84Xs8YDr
	r7wJdVnOK/qF2BWiRHnI+aGtqr2ROLZQTj6AzFttKg4ZwOFlUfyIalZ3//R9XCmzJQiNLhWg4VfMV
	NljU2VmLCFuk4x14ZQI3zB87sW8QT5QPVV444uJcZdseb30rqnPPZWmRijrgn/c8yP/78lZ9tcnrt
	3KnUHKLUcbrN+mXx6dM2K/COHoQxtn3oLcYgsQXPHmrAQl1qBtxmsJUB/Yum1Lm3oeL0v/CSqDu63
	xTdFXjAuqe9tHUzDG1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkQ-0000000ARiZ-3Rga;
	Fri, 19 Dec 2025 14:46:26 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkO-0000000ARes-0yvK
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155584; x=1797691584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UUqavB8KdRwlhgT+G19I1f7PNm4ESUexDm2+pf4xxuk=;
  b=h3uXJxY6HwnzuEEJr1HhSvXD1lhDZVEqCk7wubfpkP7KhzXJ7m6l+BPt
   Dz+Y9puEKWsMILxzQid7Jeu84dNk5Ie4uDvxPJ3qtmpkqV310nIY6Pac1
   t9epPowZuKRD86dzxfRWKuXgvjqS0B5TMQgxU6egjaa5FGO9rSSZSI3uR
   Sb4Xg4YmTzjk5pOac9Pf3QBBHwO3oIfFqBVW1mIQ7yD35A6sqcTHAoKue
   fotpwtKye92se5lI4rGk9zP7flBqv1fyJgobj62emFRfNqWw+nj5Sxw7O
   sZ062uK25rmiFt+1jbpS2vfotmyjO2gZu+JzUITsJuPykzacJv1pqMxgr
   g==;
X-CSE-ConnectionGUID: ldJnREoLR8+EiF4PeqWT+w==
X-CSE-MsgGUID: PlJeakKCRYG8cLeNnWzGeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93589002"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93589002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:24 -0800
X-CSE-ConnectionGUID: jcgrgM/JRtC+Au4mFkQnUA==
X-CSE-MsgGUID: V2SWhMhdSPGIV8s949UyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564113"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:22 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 16/17] i3c: mipi-i3c-hci: Add optional Runtime PM support
Date: Fri, 19 Dec 2025 16:45:33 +0200
Message-ID: <20251219144534.84391-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064624_299223_7204E58B 
X-CRM114-Status: GOOD (  23.13  )
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

Implement optional Runtime PM support for the MIPI I3C HCI driver.
Introduce runtime suspend and resume callbacks to manage bus state and
restore hardware configuration after resume.  Optionally enable autosuspend
with a default delay of 1 second, and add helper functions to control
Runtime PM during probe and remove.

Read quirks from i3c_hci_driver_ids[] and set new quirk
HCI_QUIRK_RPM_ALLOWED for intel-lpss-i3c devices to enable runtime PM for
them.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 96 +++++++++++++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 +
 2 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 3b0609cb7da7..9a8d34ae4a66 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/platform_data/mipi-i3c-hci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "hci.h"
 #include "ext_caps.h"
@@ -176,6 +177,7 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
 	int irq = platform_get_irq(pdev, 0);
 
 	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	hci->irq_inactive = true;
 	synchronize_irq(irq);
 }
 
@@ -558,6 +560,14 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	irqreturn_t result = IRQ_NONE;
 	u32 val;
 
+	/*
+	 * The IRQ can be shared, so the handler may be called when the IRQ is
+	 * due to a different device. That could happen when runtime suspended,
+	 * so exit immediately if IRQs are not expected for this device.
+	 */
+	if (hci->irq_inactive)
+		return IRQ_NONE;
+
 	val = reg_read(INTR_STATUS);
 	reg_write(INTR_STATUS, val);
 	dev_dbg(&hci->master.dev, "INTR_STATUS %#x", val);
@@ -613,6 +623,70 @@ static int i3c_hci_software_reset(struct i3c_hci *hci)
 	return 0;
 }
 
+static int i3c_hci_runtime_suspend(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+	int ret;
+
+	ret = i3c_hci_bus_disable(hci);
+	if (ret)
+		return ret;
+
+	hci->io->suspend(hci);
+
+	return 0;
+}
+
+static int i3c_hci_runtime_resume(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+	int ret;
+
+	ret = i3c_hci_software_reset(hci);
+	if (ret)
+		return -EIO;
+
+	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
+
+	reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
+
+	reg_write(MASTER_DEVICE_ADDR,
+		  MASTER_DYNAMIC_ADDR(hci->master.this->info.dyn_addr) |
+		  MASTER_DYNAMIC_ADDR_VALID);
+
+	mipi_i3c_hci_dat_v1.restore(hci);
+
+	hci->irq_inactive = false;
+
+	hci->io->resume(hci);
+
+	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+
+	return 0;
+}
+
+#define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
+
+static void i3c_hci_rpm_enable(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+
+	pm_runtime_set_autosuspend_delay(dev, DEFAULT_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	hci->master.rpm_allowed = true;
+}
+
+static void i3c_hci_rpm_disable(struct device *dev)
+{
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+}
+
 static int i3c_hci_init(struct i3c_hci *hci)
 {
 	bool size_in_dwords, mode_selector;
@@ -806,6 +880,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	hci->master.dev.init_name = dev_name(&pdev->dev);
 
 	hci->quirks = (unsigned long)device_get_match_data(&pdev->dev);
+	if (!hci->quirks && platform_get_device_id(pdev))
+		hci->quirks = platform_get_device_id(pdev)->driver_data;
 
 	ret = i3c_hci_init(hci);
 	if (ret)
@@ -817,12 +893,20 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
+		i3c_hci_rpm_enable(&pdev->dev);
+
 	ret = i3c_master_register(&hci->master, &pdev->dev,
 				  &i3c_hci_ops, false);
 	if (ret)
-		return ret;
+		goto err_rpm_disable;
 
 	return 0;
+
+err_rpm_disable:
+	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
+		i3c_hci_rpm_disable(&pdev->dev);
+	return ret;
 }
 
 static void i3c_hci_remove(struct platform_device *pdev)
@@ -830,6 +914,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
 	struct i3c_hci *hci = platform_get_drvdata(pdev);
 
 	i3c_master_unregister(&hci->master);
+
+	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
+		i3c_hci_rpm_disable(&pdev->dev);
 }
 
 static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
@@ -845,11 +932,15 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
 
 static const struct platform_device_id i3c_hci_driver_ids[] = {
-	{ .name = "intel-lpss-i3c" },
+	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
 
+static const struct dev_pm_ops i3c_hci_pm_ops = {
+	SET_RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci_runtime_resume, NULL)
+};
+
 static struct platform_driver i3c_hci_driver = {
 	.probe = i3c_hci_probe,
 	.remove = i3c_hci_remove,
@@ -858,6 +949,7 @@ static struct platform_driver i3c_hci_driver = {
 		.name = "mipi-i3c-hci",
 		.of_match_table = of_match_ptr(i3c_hci_of_match),
 		.acpi_match_table = i3c_hci_acpi_match,
+		.pm = pm_ptr(&i3c_hci_pm_ops),
 	},
 };
 module_platform_driver(i3c_hci_driver);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 38f927685d3b..6339adf4b67a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -51,6 +51,7 @@ struct i3c_hci {
 	void *io_data;
 	const struct hci_cmd_ops *cmd;
 	atomic_t next_cmd_tid;
+	bool irq_inactive;
 	u32 caps;
 	unsigned int quirks;
 	unsigned int DAT_entries;
@@ -143,6 +144,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
 #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
+#define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
