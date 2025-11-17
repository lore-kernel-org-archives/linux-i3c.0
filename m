Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A19ACEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEGJxCRMIqM28We+EGXqjra3b3E3vUEfWx9vn9Bhz38=; b=QuKh+j64XmPR6f
	kwptb8sS2kyMHFkUZZ6/rCEH0wTY6Alc8IdXyKQ4TO6fEXtpUFsAQqTVJlFXWk8UX2ka5kAWLFACx
	fjKh/+c6rmdu3QNK5+QMK73uMpNTstkqxeo3inlh1cWNd/QoluZpciaYSOmljkcAN9kqU5mqyBRnI
	YuGsLdLeoFEYcB+vtMH1SlauQsJrhVtbCfd9Pw8PJNrvpexmgMOoGqt+IiZKQJZKdyAjY/+cnw0wg
	ZpBgQhw1tqDqbToFjk0riDKYKVWwUXF5immhz/quxILZ8GuGaR622i9wbcoF0cE+JtIqeIOZH9XqX
	SfucA7PScLU/XgVCDVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz61-0000000GAH4-0huB;
	Mon, 17 Nov 2025 13:16:41 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5z-0000000GA6C-04hw
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385399; x=1794921399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sCk74iu3Q9z7qYWTna5emiHqNf02kBWIvL8rSwdO7OA=;
  b=LByKB8Soy7ryVrQhD7yPCstOuHchAmQIw4KVV0i4GEFXv6CkNZZkOfov
   vwW1qCLvODKU68GLVhOPvXxjV3QsTkBP29o06qzzUVgMmQQocFBlF0Gew
   gvjF780kn1/8MU8owdok8PWbJ/7yxYn9fCqnKhiLn2Pszc6wd9v0ovcKA
   fLrIX4GbUZYaFkwVdwA+Z9gHyzVPwooQNlZmAGZGXzhUWVI5wdRjnx9zw
   pc2T3MllGI8i98Huh2K5F3sj0co+IdvUhV6F5UWVEj7+bpZMh4gl8S/tZ
   NPd1FAPg9VDMwQ9uVr/C/tHzIkS+ijA32HW1Uj7AlxRgbDmCKCRv2HIL2
   A==;
X-CSE-ConnectionGUID: 4YoFIcxRSBiXMr4G6LbLJw==
X-CSE-MsgGUID: 9Wbg5KodSQ6lFZvclm9JIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009101"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:39 -0800
X-CSE-ConnectionGUID: 0f4pb6EeQzahqYVfL/eFxw==
X-CSE-MsgGUID: wCKwmRjcRyaUC3EWOp6rwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549389"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:37 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 11/12] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
Date: Mon, 17 Nov 2025 15:16:07 +0200
Message-ID: <20251117131609.65988-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051639_066421_D465EA6F 
X-CRM114-Status: GOOD (  17.39  )
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


Changes in V3:

	Squash previous patch into this one

Changes in V2:

	Make use of FIELD_PREP()
	Improve handling of values that exceed the maximum


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 136 +++++++++++++++++-
 1 file changed, 135 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index b962d3c2d510..2c827e877d29 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -7,17 +7,21 @@
  * Author: Jarkko Nikula <jarkko.nikula@linux.intel.com>
  */
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
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
 	struct platform_device *pdev;
 	const struct mipi_i3c_hci_pci_info *info;
+	void *private;
 };
 
 struct mipi_i3c_hci_pci_info {
@@ -34,6 +38,122 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
 
+#define INTEL_ACTIVELTR			0x0c
+#define INTEL_IDLELTR			0x10
+
+#define INTEL_LTR_REQ			BIT(15)
+#define INTEL_LTR_SCALE_MASK		GENMASK(11, 10)
+#define INTEL_LTR_SCALE_1US		FIELD_PREP(INTEL_LTR_SCALE_MASK, 2)
+#define INTEL_LTR_SCALE_32US		FIELD_PREP(INTEL_LTR_SCALE_MASK, 3)
+#define INTEL_LTR_VALUE_MASK		GENMASK(9, 0)
+
+struct intel_host {
+	void __iomem	*priv;
+	u32		active_ltr;
+	u32		idle_ltr;
+	struct dentry	*debugfs_root;
+};
+
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
+		if (val > INTEL_LTR_VALUE_MASK) {
+			val >>= 5;
+			if (val > INTEL_LTR_VALUE_MASK)
+				val = INTEL_LTR_VALUE_MASK;
+			ltr |= INTEL_LTR_SCALE_32US | val;
+		} else {
+			ltr |= INTEL_LTR_SCALE_1US | val;
+		}
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
 static void intel_reset(void __iomem *priv)
 {
 	u32 reg;
@@ -55,20 +175,34 @@ static void __iomem *intel_priv(struct pci_dev *pci)
 
 static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 {
+	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
 	void __iomem *priv = intel_priv(hci->pci);
 
-	if (!priv)
+	if (!host || !priv)
 		return -ENOMEM;
 
 	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 
+	hci->private = host;
+	host->priv = priv;
+
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
 	.init = intel_i3c_init,
+	.exit = intel_exit,
 };
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
