Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF736CE8D70
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtiFyANxIAxZ/XRCAUrkhh5LdtPEvjJ+gMTAmY6bU2o=; b=01I1rBMy/lZUID
	+tTnGM7e9GCdocnglGgwxOiLMMDJTyBEAIzsdWYm3vB+DqcFHd7L3znmK9AqtaRZRGibBFk3oK4QD
	N7Y3pFgqwFr/oinBn1fanVfVB5bJeq0tXN0E3946+Gv4ZMvefy2nBMPZf4uSq8eZ59DZ1/TBXDEe6
	0MAzalRfLjKYRXbBIvaRCHpc8ftO03eBjndzvklqgxTgqGY4dV1pmJedw9HO8PF7CjkC6UWVHLFbZ
	xC7QkGFq8OJFybubo2rr6x/LXYNrGMZoPor5Wc7WsZFw7DQJQtM3xl1Z87QmnxUz88LVSsICiYNbY
	eQXI4PWMFZNrwU76y6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJj-0000000CwcD-2VCh;
	Fri, 14 Nov 2025 18:14:39 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJg-0000000CwUD-3krX
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144077; x=1794680077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gu+0KKlNor+I0YaKnHo5K3ViK+WEd+TV6QH5qpcya/0=;
  b=YZFCWjpq29oRB7eRAdqCRYiApQ3AXTJLEsOtt4e+CShJnLQ8wsKO+hpR
   PsVjDWNEHvSaekptS86kKpQbzPquZ8e89dH4K3F3Y278JOTfEDsBcMU5l
   y890BwbMCHuu943iBmtmZQnfEp4d/to6dXtbYaIoXsgWBrJkxZc2cOJC2
   TOPyDGlW2g+z3Ig9Dl6qN9aceHU7s0PJa1vd0yi0s1ohOf9RwPvDb9eIC
   noLBCH/H9Q52HvXPuTnElUimkg1UsRc2jwcucqKPTWryDy9HtMgz5UCbs
   2z8rralfMTk0bVzuD7u1TGUp+hqpbdgkVVnmMWp2GntBV0OdOiRvrsV5A
   g==;
X-CSE-ConnectionGUID: nsoiTG4gQaeOweiP17DRWw==
X-CSE-MsgGUID: Rg9R1+wfRpqGYvXiG8GX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129482"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129482"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:27 -0800
X-CSE-ConnectionGUID: rGpZHVZNQC+Tl+BMMwdkrw==
X-CSE-MsgGUID: qExCvziMTgmnUTbnQFSJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189669018"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:25 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 11/13] i3c: mipi-i3c-hci-pci: Allocate a structure for Intel controller information
Date: Fri, 14 Nov 2025 20:13:54 +0200
Message-ID: <20251114181356.66515-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101437_349157_A4328C1A 
X-CRM114-Status: GOOD (  10.96  )
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

Allocate a structure for Intel controller information, in preparation
additional changes that need to store Intel device-specific information.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index b962d3c2d510..3f391b0854ae 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -18,6 +18,7 @@ struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
 	struct platform_device *pdev;
 	const struct mipi_i3c_hci_pci_info *info;
+	void *private;
 };
 
 struct mipi_i3c_hci_pci_info {
@@ -34,6 +35,10 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
 
+struct intel_host {
+	void __iomem	*priv;
+};
+
 static void intel_reset(void __iomem *priv)
 {
 	u32 reg;
@@ -55,13 +60,17 @@ static void __iomem *intel_priv(struct pci_dev *pci)
 
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
 
 	return 0;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
