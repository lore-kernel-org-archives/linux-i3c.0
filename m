Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FACD116F6
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbRH0dfLUw+ndu5OmBVXHradkXJ2hw3XihKG5UUrl7o=; b=kfgAcJDLRF2ZHR
	TwFPxHjko5I9FfQI5Aq1eoyCE0AD1/gHeVCUIM++7lZyNvGwPrE/evuemQ1M9ZMNSLdq9SOE15Gv0
	h9LMHBcGYLuzOpApqMW6JnYIQmdR1aXdqp2XhayjFL6K4zQO5I3NazY5m/B2xTnHZpX5KEGajd1X9
	UtbIEy4C31VKy31Sv5exqPho42APuDbzoPbM5Y4STqM9c2Pdex2DjWNO77AtlVKdlV8nWwyCO5OPF
	nDvHTqkc5vU/RkPO0XzKcK9+FDlU8e8jSzSlmOE5hLnxHaC3KwgzYdJsMsvIPw8IGoUQEH4i+G+UU
	rQQtfd+XiA5lvBdVfZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA8-000000003RC-2a4f;
	Fri, 28 Nov 2025 06:41:00 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA3-000000003OT-2z1C
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312056; x=1795848056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s41z8PQ5HUq8//TICct8LhEssaBdbhSEXJx4FtE/PQo=;
  b=Dv8PKaGxjFPRXvfb4mUfcnj770S1hpqT351NRLFp63+9JgAy8FTWU04I
   gLTHRzt3Bnd4dRbOR4antR/wGEDZYyGn/kDE1IF/T3zPNvm19RMwYV9l7
   6SZCfn01D3s0fsdNg76pAJDUcyoepjgDBRKd/9PX0llX4ii5OkvH0jHvL
   cho70n6PM3rllt1X045+LKd3YWtEgi/9vZEHJ5KlBAka90LdoSnfjLdff
   1thKxR029gEZQPghNaWz0B8kvYPf3yLVK+7RqIy746OMdD6kt3XKUwnV9
   dbpL7ItWQDM6A8JfkzD2QmiAn8g0Nr2dWd7I4SFcAyVFXiJXTm0WDCNl1
   g==;
X-CSE-ConnectionGUID: 1FzcyenzRBGiuNNJKW1tew==
X-CSE-MsgGUID: /6E9dq7STAq8hiS+sqm2zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059932"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059932"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:55 -0800
X-CSE-ConnectionGUID: PG0EGHR5RlK5CP+MNymXbQ==
X-CSE-MsgGUID: 1tIESeYSSQSEHWUQ0mLTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348062"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:54 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 03/12] i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
Date: Fri, 28 Nov 2025 08:40:29 +0200
Message-ID: <20251128064038.55158-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224055_789087_7AE254CD 
X-CRM114-Status: UNSURE (   9.23  )
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

Rename some Intel-related identifiers to ensure Intel-related identifiers
begin "intel_" or INTEL_, and for brevity removing purposeless "PRIV" in
preparation to add more register definitions.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4 and V5:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Rename 'intel_init' to 'intel_i3c_init'
	More explanation in commit message


 .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 3d854cee05df..d434e2962740 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -21,11 +21,11 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 
 #define INTEL_PRIV_OFFSET		0x2b0
 #define INTEL_PRIV_SIZE			0x28
-#define INTEL_PRIV_RESETS		0x04
-#define INTEL_PRIV_RESETS_RESET		BIT(0)
-#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
+#define INTEL_RESETS			0x04
+#define INTEL_RESETS_RESET		BIT(0)
+#define INTEL_RESETS_RESET_DONE		BIT(1)
 
-static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
+static int intel_i3c_init(struct pci_dev *pci)
 {
 	unsigned long timeout;
 	void __iomem *priv;
@@ -39,21 +39,21 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
 	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
 
 	/* Assert reset, wait for completion and release reset */
-	writel(0, priv + INTEL_PRIV_RESETS);
+	writel(0, priv + INTEL_RESETS);
 	timeout = jiffies + msecs_to_jiffies(10);
-	while (!(readl(priv + INTEL_PRIV_RESETS) &
-		 INTEL_PRIV_RESETS_RESET_DONE)) {
+	while (!(readl(priv + INTEL_RESETS) &
+		 INTEL_RESETS_RESET_DONE)) {
 		if (time_after(jiffies, timeout))
 			break;
 		cpu_relax();
 	}
-	writel(INTEL_PRIV_RESETS_RESET, priv + INTEL_PRIV_RESETS);
+	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
 
 	return 0;
 }
 
 static struct mipi_i3c_hci_pci_info intel_info = {
-	.init = mipi_i3c_hci_pci_intel_init,
+	.init = intel_i3c_init,
 };
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
