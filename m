Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7940FCEE33C
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XG00nKBBeDSoJLHxwkNEiHIqacxfxFOk+UQwHJteAts=; b=WtY/UtXYxYWTSw
	PrJ0vtzoYI4thno3Z6+Qkj2VrAfJCPrsjlrio7nYSIM0I6jUf1DvaI1v1J6JHwF9uJ9LN3tg44Xqf
	a4xjzVighZ6ki3MH/mwsBgndhlg6hLv5uLmp9qm/71YjMEqqLb3sCCmqND6Cgue703gDRNzwjPTNB
	mGBa9tESqwaSNuVQFI68DMYwa3dq0QLBuzJPiwUDND+yDBtSkdjIvDjt23g0HtLuA4sq9+XVhZ7H2
	vUEbvkaAOdF8lL7Cgukq2sCDTvVmW5fuhgEOvR0gGqz9AubVa38jmO8EcueSEVczOBN/01mEjmFPT
	7L/G81CpBnj7fgB8eJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpR-00000000lum-0yz6;
	Tue, 18 Nov 2025 16:45:17 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpO-00000000lsT-3fXU
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484315; x=1795020315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ee0+eu6hHaI6bfwwo9AJu4oS6tuglCU4QfQ7010qHxw=;
  b=mdLsyinzFm8DUhzMfbaB6zFMV71rl6EtFOR8UUba2EXyuy6A5t37FSgY
   4KegdLWBmW5GrAFeqgrspveStSwnO+GbBFHJxZ4V0nhnXrqUmhcLBsm1l
   2/WtGUJIuduCzwAXUZHmpmR3qeUJnfH32qvwechv9btkFtymtyAYSFnRj
   8pI/ReWIotXvWXCnHn0phslTFk4KDTAiu+0a24gVInnLIr31Oa/m52JNs
   dYGY5A3XQYljAed1cixNkMycImGWDiWKInSCCbD9t71MgIIVHxGWoI7pi
   XYm4w10jKizCpL4aSIh/wHlZULtutD8Bppv8qpj8+1zZNcPYedTYghHro
   A==;
X-CSE-ConnectionGUID: 5lVfqDEhTbiA/CjdKDdsVA==
X-CSE-MsgGUID: GjfTpNwBRdGHQlCeDsFl/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510681"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:15 -0800
X-CSE-ConnectionGUID: tpHUmEamQeqJmsBKK6Z91w==
X-CSE-MsgGUID: +jpuLnpWQ9evMuKB1jsNOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221462921"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:13 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 03/12] i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
Date: Tue, 18 Nov 2025 18:44:44 +0200
Message-ID: <20251118164453.55532-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084514_920465_6B8F71A5 
X-CRM114-Status: UNSURE (   9.41  )
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


Changes in V4:

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
