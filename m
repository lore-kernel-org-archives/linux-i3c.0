Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF35D29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETvTKM+iX1Xf42gwkmzJugqBiF7KVldDsxQpTky3f+4=; b=UgBDe2sal77sra
	KHJFoi0VAkkqCsK4lqiofFqZ6OvvrU8Z28scBYIqJDSQNGV5zSvRRyQypuN6fG2xLfs7dQ2ckAuk0
	+2rmQti+knEwT4vAGpUTGHaHYM8reCYstS70iay5SN/NEkbA+NJnZvirawOEa1lBLBtrN4id76Vuk
	1EcJyzJv8w2o5Ofad93ap7PrQ0dN8eGtGyyEf6ExO/ti0T8dpKmrZ9TgUp9TTPDKEH6fYWVJsPjKo
	2IErVk3aFog7EhC7O0Q4Jauew1KDplJJydMAguQQ2mS36tkxmzx/p2+XXKfli7ehTOjf5Oj9JNXgy
	x8ykfNg0o/dhEhGnTpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYou-00000006en5-0b26;
	Tue, 13 Jan 2026 07:28:04 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYor-00000006el9-0tcf
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289282; x=1799825282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=765CABykMIHIbsG1UN/P3tjZq8B8IFIeHBe1G4aRIUw=;
  b=ZFcIjAsTCTX1KXQ6jkfJ6xXeJu2AMXwLWymSUO9bdQka6fiEb9N7XcRj
   T3k/3euMXRq+OpOPAsjEN6dZ/N54Ffh3YgfnxtBshBUnP9sQqPVRrjwWo
   BQxPLLisADqGqnDed7x8qsPyPc/3cTTuwzlFt421jEa+SwxXWbUTLcJq5
   OrUb2KvilRCwwimga9b3oT0DFw2iLQudJHnRVuSunq5StVW4vJrjWOCNe
   26mXBA9VyYKo3BzldLOz9ow0ljR7YgUw1764Q8Tdvp8cPp8NPyhMbBARe
   ST+pLbZeBDgWCE85CorgXlAW+YHPIvF7t1yMVvocBu1e4h/X3PLNE+1U4
   g==;
X-CSE-ConnectionGUID: Rn+8ivTyR2yvSCrJVKW/5g==
X-CSE-MsgGUID: 1FyojVM/Q6a/sOvomO1guA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625548"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:28:01 -0800
X-CSE-ConnectionGUID: S5Ra0jsdQ5ahdyJBHVw60w==
X-CSE-MsgGUID: D59+OSZYTjOdTOO+FzpA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021399"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:59 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 20/21] i3c: mipi-i3c-hci: Add optional Runtime PM support
Date: Tue, 13 Jan 2026 09:27:01 +0200
Message-ID: <20260113072702.16268-21-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232801_316992_62C174E7 
X-CRM114-Status: GOOD (  22.77  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Use new i3c_hci_reset_and_init() and i3c_hci_set_master_dyn_addr()
	Use devm_pm_runtime_set_active_enabled() which allows
	i3c_hci_rpm_disable() to be dropped.
	SET_RUNTIME_PM_OPS -> RUNTIME_PM_OPS


 drivers/i3c/master/mipi-i3c-hci/core.c | 76 ++++++++++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 +
 2 files changed, 72 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index ec5425f07635..02c5a133e329 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/platform_data/mipi-i3c-hci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "hci.h"
 #include "ext_caps.h"
@@ -182,6 +183,7 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
 	int irq = platform_get_irq(pdev, 0);
 
 	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	hci->irq_inactive = true;
 	synchronize_irq(irq);
 }
 
@@ -564,6 +566,14 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
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
@@ -723,6 +733,55 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hci)
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
+	ret = i3c_hci_reset_and_init(hci);
+	if (ret)
+		return -EIO;
+
+	i3c_hci_set_master_dyn_addr(hci);
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
+	devm_pm_runtime_set_active_enabled(dev);
+
+	hci->master.rpm_allowed = true;
+}
+
 static int i3c_hci_init(struct i3c_hci *hci)
 {
 	bool size_in_dwords;
@@ -841,6 +900,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	hci->master.dev.init_name = dev_name(&pdev->dev);
 
 	hci->quirks = (unsigned long)device_get_match_data(&pdev->dev);
+	if (!hci->quirks && platform_get_device_id(pdev))
+		hci->quirks = platform_get_device_id(pdev)->driver_data;
 
 	ret = i3c_hci_init(hci);
 	if (ret)
@@ -852,12 +913,10 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = i3c_master_register(&hci->master, &pdev->dev,
-				  &i3c_hci_ops, false);
-	if (ret)
-		return ret;
+	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
+		i3c_hci_rpm_enable(&pdev->dev);
 
-	return 0;
+	return i3c_master_register(&hci->master, &pdev->dev, &i3c_hci_ops, false);
 }
 
 static void i3c_hci_remove(struct platform_device *pdev)
@@ -880,11 +939,15 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
 
 static const struct platform_device_id i3c_hci_driver_ids[] = {
-	{ .name = "intel-lpss-i3c" },
+	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
 
+static const struct dev_pm_ops i3c_hci_pm_ops = {
+	RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci_runtime_resume, NULL)
+};
+
 static struct platform_driver i3c_hci_driver = {
 	.probe = i3c_hci_probe,
 	.remove = i3c_hci_remove,
@@ -893,6 +956,7 @@ static struct platform_driver i3c_hci_driver = {
 		.name = "mipi-i3c-hci",
 		.of_match_table = of_match_ptr(i3c_hci_of_match),
 		.acpi_match_table = i3c_hci_acpi_match,
+		.pm = pm_ptr(&i3c_hci_pm_ops),
 	},
 };
 module_platform_driver(i3c_hci_driver);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index ed89228ea971..6035f74212db 100644
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
@@ -144,6 +145,7 @@ struct i3c_hci_dev_data {
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
