Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585F3D116F5
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVJ7BKNPJeA6tuImaMzU79Vm2C1vkw7AcTus7E/y17o=; b=FR6TjK3UqReptU
	oZMD51WBmU1e+brBrgSn/HxsOqmMMq4kiPF1pQDimgyB7z1+/EAVA+YNWGw+9R8Wh4P0i+qonZiZC
	g38ZRNPiEFG2xPuooDBWUPomqbxVol2nqFH1FCElGT2bXcyD4VQ/rZ/CYHDWWRrsKeDJqH2qyfaSr
	g8YZll3G+XYF6yGBxJVyFhv5MByoqSfaeh0yoHULRIzXl5Wxg3XxU8TmqNB2Eb+h0SZ5J8ux7X9yL
	0/N9upPQHFrmDimBnmpXmyzuCIum2gcT+QjVgIDKM82V/cz3zk3sT7QXYdSHkH80lH+pP0hXe0hAi
	tKZv+87cWFss4Ofq3SQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAC-000000003Ug-3yyN;
	Fri, 28 Nov 2025 06:41:04 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAA-000000003Ru-0LI1
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312062; x=1795848062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4wrpCBq6NJQh+7NqyxuQ5lacVNkAinbXrBCVGdohjkQ=;
  b=H7gQLHQCZXFdaNavPanKMN0ctX1iLSO1riRjSK21MlC8Uqc+6JQP+e1d
   +SQf+jEwbWur7ueaATL6K4hptcNpvs+mIscR1HVqtWDCRnZSfMefxQht0
   o6nq+Df4+uzUXoT/lMM7c7O0/HCqTUBKk7Czermx6sQYo5sD8hlxDt0L3
   VYL09uMRgRdmD0M8HsuEDWu2EMyt9dCGInWqmkhzywEUi28sdLtolLmgA
   PsZzD/TQRMrlvZZkGTKCb2wh7IKtrSpFUiV7bQiH8+W5wRuu1fL9oEK23
   bcAZRxNljpuVFEaCykayhtB67UIw3bRFzXq+p4YzdiD2zLVScPAmJwt9E
   w==;
X-CSE-ConnectionGUID: LQdI60ReQQmjTNSzcLpciA==
X-CSE-MsgGUID: vPDENmoSSpOmsIel7Axh4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059951"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059951"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:02 -0800
X-CSE-ConnectionGUID: q/4QDhKzQ2+8x5ltho9C9A==
X-CSE-MsgGUID: PUR4euSXQcio+9xcA3mUHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348077"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:00 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 07/12] i3c: mipi-i3c-hci-pci: Factor out intel_reset()
Date: Fri, 28 Nov 2025 08:40:33 +0200
Message-ID: <20251128064038.55158-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224102_203751_87F8BDD0 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

For neatness, factor out intel_reset().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4 and V5:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Move location of intel_reset() to get a prettier diff


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 1e1f2c42bd74..b9794212b2fb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -27,6 +27,18 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
 
+static void intel_reset(void __iomem *priv)
+{
+	u32 reg;
+
+	/* Assert reset, wait for completion and release reset */
+	writel(0, priv + INTEL_RESETS);
+	readl_poll_timeout(priv + INTEL_RESETS, reg,
+			   reg & INTEL_RESETS_RESET_DONE, 0,
+			   INTEL_RESETS_TIMEOUT_US);
+	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
+}
+
 static void __iomem *intel_priv(struct pci_dev *pci)
 {
 	resource_size_t base = pci_resource_start(pci, 0);
@@ -37,19 +49,13 @@ static void __iomem *intel_priv(struct pci_dev *pci)
 static int intel_i3c_init(struct pci_dev *pci)
 {
 	void __iomem *priv = intel_priv(pci);
-	u32 reg;
 
 	if (!priv)
 		return -ENOMEM;
 
 	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
 
-	/* Assert reset, wait for completion and release reset */
-	writel(0, priv + INTEL_RESETS);
-	readl_poll_timeout(priv + INTEL_RESETS, reg,
-			   reg & INTEL_RESETS_RESET_DONE, 0,
-			   INTEL_RESETS_TIMEOUT_US);
-	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
+	intel_reset(priv);
 
 	return 0;
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
