Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD8DCEE33A
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsxxowKJvi57tGQmLx5fqlIjUVMxrxUXIPIFw7tbBIk=; b=OSn9M4T7W6r46P
	m/c3Czx3mia4BSw2RP1JkLzptdjT1NWa0gu4zBFSO8YlGocYXDmqim5XxypuYpdHiUXMXhPExZocp
	qFyKMnmJth+Cw0f5aXYJE3hDzuzATRAZspSQmu9HDxQd23bCwFmc2vfGiTBi2e+MhLQk5U7EIajSn
	fMAR7zMq7suz13/yHKvDrg43unyuLBhAHJF/LvEKJaIJTgf8QfqOl7VYzu7OPd25sc21TtMH4uEek
	NubddFnofUhjN4Lnn+7EGVIqn/pXpaBeBdj2K8n595FFrSw5MVf0YkvyhGDBDhZss8SuBN0lz0wp3
	NIVU2eYE0kcac2sLAfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOph-00000000m5f-14vs;
	Tue, 18 Nov 2025 16:45:33 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpc-00000000m1S-0LxR
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484328; x=1795020328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GmRKYRRwWGaGjryNvGBs9LGm8/65fz6tX76bbstXzXA=;
  b=KDumetgi2/9v41/JuhGGakl7ey6GzVRR3oqgX/FWN52tB0KsfzfPwhRk
   A3XIgakXixCQ86Nsh3MU772N0BeCRSilnkMVKNrxgajbuxAfTXZU8A4Rd
   f0Dqj5/hVRstuvmkA2R+WdqQAHCKQeBf0S8OaD/FOS1eRROd8xGttute2
   i+lO9mB0mDiGf54MNjfaL7a8qTDGzp/4CBbbi1BouZq747ITqqDhYnp4D
   RdkDWW4WFp0JatM5jEhbhi2XQiMTT2G/W1B1II7RUsy5Gc7FjKnFQ5SZf
   kkLEx+6sqt9HmLElYDDCYdR+coy9pDUEZy4COaoDVN1VULvj7M35UU32h
   w==;
X-CSE-ConnectionGUID: N9a1BV9KS+uBg4l2vFuu/w==
X-CSE-MsgGUID: NTicYFYbQue6PpncZdo6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510712"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:28 -0800
X-CSE-ConnectionGUID: rz1x+c47SUmu3L+LN/j2IQ==
X-CSE-MsgGUID: Uq9liPROSuC3FkdKcQzEpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221463046"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:26 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 11/12] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
Date: Tue, 18 Nov 2025 18:44:52 +0200
Message-ID: <20251118164453.55532-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084528_610933_9DC36201 
X-CRM114-Status: GOOD (  16.29  )
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


Changes in V4:

	Drop intel_actualize_debugfs_root() that created 'intel-i3c'
	debugfs directory.

Changes in V3:

	Squash previous patch into this one

Changes in V2:

	Make use of FIELD_PREP()
	Improve handling of values that exceed the maximum


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 113 +++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index b962d3c2d510..7d7b769e7b5b 100644
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
@@ -34,6 +38,99 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
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
+static void intel_add_debugfs(struct mipi_i3c_hci_pci *hci)
+{
+	struct dentry *dir = debugfs_create_dir(dev_name(&hci->pci->dev), NULL);
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
+}
+
 static void intel_reset(void __iomem *priv)
 {
 	u32 reg;
@@ -55,20 +152,34 @@ static void __iomem *intel_priv(struct pci_dev *pci)
 
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
