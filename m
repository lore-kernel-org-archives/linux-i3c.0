Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF648E98E13
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Feb 2026 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+W6ISdpce9HTIZt3Sp3EGqxD/aCH6XiS7KisHMbdj8=; b=pz+OCg7QemVYwe
	Rj1sIGtB+A4B6iDWkkTm4f9XNhTcIZfVXAU91Ss5P/PyVWGB3X10O3r5jt+OhO1dJhcamEOvPiVK4
	8vTHJI1CPp6DpXXRAvW3P/nPjFZRGqIl5hTe1o25yNRBvTFas4wsUasQxTBY39cSdbLXXxLO4Xp03
	Dv9abg1NL7Chp55NQcRhLb614RsJDffVLduGaE8Oh1WlFwu/qLRcOGOprgKllrPjwcX5AQ/7ofE0B
	xh4+UI4NV4D3zOdUwhw0yDprj5+s/8e7h0IrzUzz6UXZkEyPblrXK6jTRfz0hT22AcgRdD9Dv3jvP
	M4Z5xtWsC9OKxD2GuX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS7l-0000000HWoP-2Car;
	Mon, 23 Feb 2026 09:21:05 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS7i-0000000HWlv-2Ac5
	for linux-i3c@lists.infradead.org;
	Mon, 23 Feb 2026 09:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771838462; x=1803374462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mfYkiE95/nqkHbOE/di4F1fOvAsA0NYtnKgm+ZmhpTQ=;
  b=cTwt7Gkv3zvlcYXigweSkOJEg7e6MPleU+RJGqpnSQKGUj7zwjewYz1E
   FArrxvnvfYkqzJi1RyU4v4tth2k9ToB5Ndd5oTGHHQ78MwIA257m10r1Z
   ib/Avivejh01cLXV/GwSQwLiZO3B7A+8G7tiohwWMOxb0oeHrbDyZwFnV
   nlPY1EJHMBB+4tvy127nPigS4WqzqfkVlVEJlgtkzKtxIwvRTFveQSbLw
   zzSvJWQr9xxgaqkNF5qDcd4jsI4n28sC1L7g9FhisAKHxMSOjEjgtTsrI
   J4GMpIq+m0+8OlYomPcBL8fqgMzuf/nZNeWLEBJ+9ICb1cVs9nYiA8Pwv
   Q==;
X-CSE-ConnectionGUID: R7XgRHMOTY6hycIEOpvpHA==
X-CSE-MsgGUID: nrs0l36aRfCp5v7Jni/BGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72928715"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72928715"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:21:02 -0800
X-CSE-ConnectionGUID: 11i8ntCSSAGmEIxcl7Mn/Q==
X-CSE-MsgGUID: 4w65ub3SQYuAjh/zWj7uJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215346095"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.206])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:21:01 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V4 4/5] i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
Date: Mon, 23 Feb 2026 11:20:40 +0200
Message-ID: <20260223092041.104689-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223092041.104689-1-adrian.hunter@intel.com>
References: <20260223092041.104689-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_012102_569930_DF65F16B 
X-CRM114-Status: GOOD (  21.82  )
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

Some platforms implement the MIPI I3C HCI Multi-Bus Instance capability,
where a single parent device hosts multiple I3C controller instances.  In
such designs, the parent - not the individual child instances - may need to
coordinate runtime PM so that all controllers runtime PM callbacks are
invoked in a controlled and synchronized manner.

For example, if the parent enables IBI-wakeup when transitioning into a
low-power state, every bus instance must remain able to receive IBIs up
until that point.  This requires deferring the individual controllers'
runtime suspend callbacks (which disable bus activity) until the parent
decides it is safe for all instances to suspend together.

To support this usage model:

  * Add runtime PM and system PM callbacks in the PCI driver to invoke
    the mipi-i3c-hci driver's runtime PM callbacks for each instance.

  * Introduce a driver-data flag, control_instance_pm, which opts into
    the new parent-managed PM behaviour.

  * Ensure the callbacks are only used when the corresponding instance is
    operational at suspend time.  This is reliable because the operational
    state cannot change while the parent device is undergoing a PM
    transition, and PCI always performs a runtime resume before system
    suspend on current configurations, so that suspend and resume alternate
    irrespective of whether it is runtime or system PM.

By that means, parent-managed runtime PM coordination for multi-instance
MIPI I3C HCI PCI devices is provided without altering existing behaviour on
platforms that do not require it.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	Remove unnecessary pm_runtime_mark_last_busy()

Changes in V2:

	Do not enable autosuspend.
	Callbacks for parent-managed invocation were renamed
	from i3c_hci_runtime_suspend to i3c_hci_rpm_suspend and
	from i3c_hci_runtime_resume to i3c_hci_rpm_resume.
	Amend commit message slightly.


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index bc83caad4197..ed0efed17726 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
+#include <linux/i3c/master.h>
 #include <linux/idr.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -20,16 +21,24 @@
 #include <linux/pm_qos.h>
 #include <linux/pm_runtime.h>
 
+#include "hci.h"
+
 /*
  * There can up to 15 instances, but implementations have at most 2 at this
  * time.
  */
 #define INST_MAX 2
 
+struct mipi_i3c_hci_pci_instance {
+	struct device *dev;
+	bool operational;
+};
+
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
 	void __iomem *base;
 	const struct mipi_i3c_hci_pci_info *info;
+	struct mipi_i3c_hci_pci_instance instance[INST_MAX];
 	void *private;
 };
 
@@ -40,6 +49,7 @@ struct mipi_i3c_hci_pci_info {
 	int id[INST_MAX];
 	u32 instance_offset[INST_MAX];
 	int instance_count;
+	bool control_instance_pm;
 };
 
 #define INTEL_PRIV_OFFSET		0x2b0
@@ -210,6 +220,125 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
 	.instance_count = 1,
 };
 
+static int mipi_i3c_hci_pci_find_instance(struct mipi_i3c_hci_pci *hci, struct device *dev)
+{
+	for (int i = 0; i < INST_MAX; i++) {
+		if (!hci->instance[i].dev)
+			hci->instance[i].dev = dev;
+		if (hci->instance[i].dev == dev)
+			return i;
+	}
+
+	return -1;
+}
+
+#define HC_CONTROL			0x04
+#define HC_CONTROL_BUS_ENABLE		BIT(31)
+
+static bool __mipi_i3c_hci_pci_is_operational(struct device *dev)
+{
+	const struct mipi_i3c_hci_platform_data *pdata = dev->platform_data;
+	u32 hc_control = readl(pdata->base_regs + HC_CONTROL);
+
+	return hc_control & HC_CONTROL_BUS_ENABLE;
+}
+
+static bool mipi_i3c_hci_pci_is_operational(struct device *dev, bool update)
+{
+	struct mipi_i3c_hci_pci *hci = dev_get_drvdata(dev->parent);
+	int pos = mipi_i3c_hci_pci_find_instance(hci, dev);
+
+	if (pos < 0) {
+		dev_err(dev, "%s: I3C instance not found\n", __func__);
+		return false;
+	}
+
+	if (update)
+		hci->instance[pos].operational = __mipi_i3c_hci_pci_is_operational(dev);
+
+	return hci->instance[pos].operational;
+}
+
+struct mipi_i3c_hci_pci_pm_data {
+	struct device *dev[INST_MAX];
+	int dev_cnt;
+};
+
+static bool mipi_i3c_hci_pci_is_mfd(struct device *dev)
+{
+	return dev_is_platform(dev) && mfd_get_cell(to_platform_device(dev));
+}
+
+static int mipi_i3c_hci_pci_suspend_instance(struct device *dev, void *data)
+{
+	struct mipi_i3c_hci_pci_pm_data *pm_data = data;
+	int ret;
+
+	if (!mipi_i3c_hci_pci_is_mfd(dev) ||
+	    !mipi_i3c_hci_pci_is_operational(dev, true))
+		return 0;
+
+	ret = i3c_hci_rpm_suspend(dev);
+	if (ret)
+		return ret;
+
+	pm_data->dev[pm_data->dev_cnt++] = dev;
+
+	return 0;
+}
+
+static int mipi_i3c_hci_pci_resume_instance(struct device *dev, void *data)
+{
+	struct mipi_i3c_hci_pci_pm_data *pm_data = data;
+	int ret;
+
+	if (!mipi_i3c_hci_pci_is_mfd(dev) ||
+	    !mipi_i3c_hci_pci_is_operational(dev, false))
+		return 0;
+
+	ret = i3c_hci_rpm_resume(dev);
+	if (ret)
+		return ret;
+
+	pm_data->dev[pm_data->dev_cnt++] = dev;
+
+	return 0;
+}
+
+static int mipi_i3c_hci_pci_suspend(struct device *dev)
+{
+	struct mipi_i3c_hci_pci *hci = dev_get_drvdata(dev);
+	struct mipi_i3c_hci_pci_pm_data pm_data = {};
+	int ret;
+
+	if (!hci->info->control_instance_pm)
+		return 0;
+
+	ret = device_for_each_child_reverse(dev, &pm_data, mipi_i3c_hci_pci_suspend_instance);
+	if (ret)
+		for (int i = 0; i < pm_data.dev_cnt; i++)
+			i3c_hci_rpm_resume(pm_data.dev[i]);
+
+	return ret;
+}
+
+static int mipi_i3c_hci_pci_resume(struct device *dev)
+{
+	struct mipi_i3c_hci_pci *hci = dev_get_drvdata(dev);
+	struct mipi_i3c_hci_pci_pm_data pm_data = {};
+	int ret;
+
+	if (!hci->info->control_instance_pm)
+		return 0;
+
+	ret = device_for_each_child(dev, &pm_data, mipi_i3c_hci_pci_resume_instance);
+	if (ret)
+		for (int i = 0; i < pm_data.dev_cnt; i++)
+			i3c_hci_rpm_suspend(pm_data.dev[i]);
+
+	return ret;
+}
+
 static void mipi_i3c_hci_pci_rpm_allow(struct device *dev)
 {
 	pm_runtime_put(dev);
@@ -323,6 +452,8 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 
 /* PM ops must exist for PCI to put a device to a low power state */
 static const struct dev_pm_ops mipi_i3c_hci_pci_pm_ops = {
+	RUNTIME_PM_OPS(mipi_i3c_hci_pci_suspend, mipi_i3c_hci_pci_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(mipi_i3c_hci_pci_suspend, mipi_i3c_hci_pci_resume)
 };
 
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
