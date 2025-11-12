Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E386ACCFA1E
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXALNvsJL/fbg1VsSZTNb17T9eswVIjtaGcgi+xWgp0=; b=MU+dh1DilJZ4Hd
	2DtzT/DNKOwp6QuT6yo0+tINxyyPt0ivpLRgMEoMyDjnl68ob88gInz/RkOWfqzX1eB0Zck4CnuDn
	d5gJgXa2gfqUF9/9+X+YQQWmivLquR+NpQtK55NXfC8DNuQSvxdvUyzrv3TSVqOM4ipZ9g5zrjuLQ
	K4WzZKXuDQ2prOy+BcAFfZfp05vcEzKkK72aYCbdjvXN+ZiChZ+H9Evsu6mp+gsveqMsfvygBMlYo
	mTwzqCENl6j5DjVGZK+fqmqKzRCOZbARXSQ5pf4VirmE2HurBfTieYOsPOz8qIBvFGDuhqhSZ5p2V
	kpFCU69t3PcpHvIJoDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7i4-00000008WXi-2s75;
	Wed, 12 Nov 2025 10:04:16 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7i2-00000008WKj-1Xi9
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941854; x=1794477854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gS29l5ZCd22N8xCbSCPKAWqsCEUObATjl13op+SH0C8=;
  b=GgjEgd102/WxTijpCSxTc8+CsJrAUjfmq/IYBFfFCm3v7aC8M3wjS+yG
   LC3sMxWdu9XC3iIRGG8BxySLNh+XWQDjPMKceaNtuHdi+kACVIQOIJpQS
   zAVUNXXMdzMKRaLyEhpqDDliA0oYHUP5ttVh+JJ7GS/I+P/KfwexfnbH8
   ngyOUv3ljFAtUaqxjsQhbKD8gHoBEXcszPijg6+UKDuju5ctpbaoj8GF8
   fwtBDXJg+VV66rvhy3jE2Yi2ABGKIxAEhcSdu9CBjrsQ/N5XZmnGwU2oG
   8mqrVAZxgiuEpslQ2eLwQtqt88hF6ZQvmbjNGdWVrBxVC4XT2QvwKTG+6
   A==;
X-CSE-ConnectionGUID: cledk0OjQBmbt865Oesoug==
X-CSE-MsgGUID: NQdgOAXbT/up2QVi2BA4sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616260"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616260"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:14 -0800
X-CSE-ConnectionGUID: 14vnufFbS1Sm92ZjaY/hMw==
X-CSE-MsgGUID: o6E4gxcVR8GPpMM2+UjvlQ==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:12 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
Date: Wed, 12 Nov 2025 12:03:38 +0200
Message-ID: <20251112100339.51726-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020414_441749_E425FFFF 
X-CRM114-Status: GOOD (  15.00  )
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

Add support for Latency Tolerance Reporting (LTR) for Intel controllers.

Implement PM ->set_latency_tolerance() callback to set LTR register values.
Also expose LTR register values via debugfs.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index d53e9dfc5ceb..1d76dc566ab6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -7,12 +7,14 @@
  * Author: Jarkko Nikula <jarkko.nikula@linux.intel.com>
  */
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/idr.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_qos.h>
 
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
@@ -35,10 +37,118 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		10000
 
+#define INTEL_ACTIVELTR			0x0c
+#define INTEL_IDLELTR			0x10
+
+#define INTEL_LTR_REQ			BIT(15)
+#define INTEL_LTR_SCALE_MASK		GENMASK(11, 10)
+#define INTEL_LTR_SCALE_1US		(2 << 10)
+#define INTEL_LTR_SCALE_32US		(3 << 10)
+#define INTEL_LTR_VALUE_MASK		GENMASK(9, 0)
+
 struct intel_host {
 	void __iomem	*priv;
+	u32		active_ltr;
+	u32		idle_ltr;
+	struct dentry	*debugfs_root;
 };
 
+static void intel_cache_ltr(struct intel_host *host)
+{
+	host->active_ltr = readl(host->priv + INTEL_ACTIVELTR);
+	host->idle_ltr = readl(host->priv + INTEL_IDLELTR);
+}
+
+static void intel_ltr_set(struct device *dev, s32 val)
+{
+	struct mipi_i3c_hci_pci *hci = dev_get_drvdata(dev);
+	struct intel_host *host = hci->private;
+	u32 ltr;
+
+	/*
+	 * Program latency tolerance (LTR) accordingly what has been asked
+	 * by the PM QoS layer or disable it in case we were passed
+	 * negative value or PM_QOS_LATENCY_ANY.
+	 */
+	ltr = readl(host->priv + INTEL_ACTIVELTR);
+
+	if (val == PM_QOS_LATENCY_ANY || val < 0) {
+		ltr &= ~INTEL_LTR_REQ;
+	} else {
+		ltr |= INTEL_LTR_REQ;
+		ltr &= ~INTEL_LTR_SCALE_MASK;
+		ltr &= ~INTEL_LTR_VALUE_MASK;
+
+		if (val > INTEL_LTR_VALUE_MASK)
+			ltr |= INTEL_LTR_SCALE_32US | val >> 5;
+		else
+			ltr |= INTEL_LTR_SCALE_1US | val;
+	}
+
+	if (ltr == host->active_ltr)
+		return;
+
+	writel(ltr, host->priv + INTEL_ACTIVELTR);
+	writel(ltr, host->priv + INTEL_IDLELTR);
+
+	/* Cache the values into intel_host structure */
+	intel_cache_ltr(host);
+}
+
+static void intel_ltr_expose(struct device *dev)
+{
+	dev->power.set_latency_tolerance = intel_ltr_set;
+	dev_pm_qos_expose_latency_tolerance(dev);
+}
+
+static void intel_ltr_hide(struct device *dev)
+{
+	dev_pm_qos_hide_latency_tolerance(dev);
+	dev->power.set_latency_tolerance = NULL;
+}
+
+static struct dentry *intel_actualize_debugfs_root(bool add)
+{
+	static struct dentry *debugfs_root;
+	static DEFINE_MUTEX(lock);
+	static int ref_cnt;
+
+	guard(mutex)(&lock);
+
+	ref_cnt += add ? 1 : -1;
+
+	if (ref_cnt) {
+		if (IS_ERR_OR_NULL(debugfs_root))
+			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
+	} else {
+		debugfs_remove(debugfs_root);
+		debugfs_root = NULL;
+	}
+
+	return debugfs_root;
+}
+
+static void intel_add_debugfs(struct mipi_i3c_hci_pci *hci)
+{
+	struct dentry *debugfs_root = intel_actualize_debugfs_root(true);
+	struct dentry *dir = debugfs_create_dir(dev_name(&hci->pci->dev), debugfs_root);
+	struct intel_host *host = hci->private;
+
+	intel_cache_ltr(host);
+
+	host->debugfs_root = dir;
+	debugfs_create_x32("active_ltr", 0444, dir, &host->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444, dir, &host->idle_ltr);
+}
+
+static void intel_remove_debugfs(struct mipi_i3c_hci_pci *hci)
+{
+	struct intel_host *host = hci->private;
+
+	debugfs_remove_recursive(host->debugfs_root);
+	intel_actualize_debugfs_root(false);
+}
+
 static void __iomem *intel_priv(struct pci_dev *pci)
 {
 	resource_size_t base = pci_resource_start(pci, 0);
@@ -76,11 +186,21 @@ static int intel_init(struct mipi_i3c_hci_pci *hci)
 
 	intel_reset(priv);
 
+	intel_ltr_expose(&hci->pci->dev);
+	intel_add_debugfs(hci);
+
 	return 0;
 }
 
+static void intel_exit(struct mipi_i3c_hci_pci *hci)
+{
+	intel_remove_debugfs(hci);
+	intel_ltr_hide(&hci->pci->dev);
+}
+
 static const struct mipi_i3c_hci_pci_info intel_info = {
 	.init = intel_init,
+	.exit = intel_exit,
 };
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
