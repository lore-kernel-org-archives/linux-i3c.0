Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A76E9537B
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAAH5MTgoSAx2i+Frfi4IAwLiX6BjW5jc6h0KZYJGjE=; b=uFg1ocVJEZ266F
	FVSr0KosFqQlfM+1iTNz8KX5J5qDmatGeEb7mSmFL7KU/1hYnwVpR3ojgzAPn7oHuoKo6YcVYmiYn
	TZHVUdVIitLysF27pIfOp57kEO68L4dVLbPs9SGNkqeMNWTUqZSqER0Mgnlx1FZ1d3jd4Tp+kYs5g
	mPJSAL4vrTM/FOq/Qctc1pupt6atlXA80eqmycSoyQiiE4Wb2y+AWLwqEGYcgUBZR42g+N1rDBQqq
	T4BzB3cTYYRBokYdatoACTUKPXj56RvMhu/dMv9RSxOTJr0M7aOrjer80yV8ZDIfLq2EdVPwXxOq6
	OJHEcq/2K9REwUXUDmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar9-00000008LMU-0meY;
	Wed, 04 Feb 2026 11:15:35 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar6-00000008LHZ-2xSK
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 11:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203733; x=1801739733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8uZUl7dRYQ1vDoeqLeeTplfjKSrd2sHVmpbmGEgDa/0=;
  b=TdjUkSOuolLP/v5RGaYTvxHBe6/cr667M12x3p3ZT9EZvM6mCb7szdFO
   /OXzS62AsNJzzdQyhzXmTzGxowsz49n1gxAcKGUSQqUpRSR77wScgZVLU
   eUoDVOJkoL709IWyiaSTGL3G6a/GEhnhZLWLqlQDhHspZcQnntc8J9yW0
   Srr7lvoWO1MXVxrcGx1YkLh+urDez4EZcO0tGh2eYEmh/sImm/5akvy6q
   jZoTtWQuPfcE1TZn8OGAcIGpaesZ/WF7tWXQ1nhrubbwLXbwkBByvAV9/
   IxUCiX83mToWvShC/55OKwBWfe/rFRFUs0SS+yZ8JNe72kqDL3XmbdtcO
   A==;
X-CSE-ConnectionGUID: nxQNbJkiQ0uM3NYpupSnAA==
X-CSE-MsgGUID: zf26HT7DToiFuSW86y/A8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70406069"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70406069"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:33 -0800
X-CSE-ConnectionGUID: Cv1FicQ6TjWf4wA96AAH5Q==
X-CSE-MsgGUID: GaisAjf7Qvy6W+LQ4Jc9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209739288"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.181])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:31 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 5/6] i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
Date: Wed,  4 Feb 2026 13:15:10 +0200
Message-ID: <20260204111511.78626-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204111511.78626-1-adrian.hunter@intel.com>
References: <20260204111511.78626-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_031532_757250_A4AF80C0 
X-CRM114-Status: GOOD (  22.48  )
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
---


Changes in V2:

	Do not enable autosuspend.
	Callbacks for parent-managed invocation were renamed
	from i3c_hci_runtime_suspend to i3c_hci_rpm_suspend and
	from i3c_hci_runtime_resume to i3c_hci_rpm_resume.
	Amend commit message slightly.


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index bc83caad4197..c562e666f29a 100644
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
@@ -210,6 +220,128 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
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
+	if (ret) {
+		if (ret == -EAGAIN || ret == -EBUSY)
+			pm_runtime_mark_last_busy(&hci->pci->dev);
+		for (int i = 0; i < pm_data.dev_cnt; i++)
+			i3c_hci_rpm_resume(pm_data.dev[i]);
+	}
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
@@ -323,6 +455,8 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 
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
