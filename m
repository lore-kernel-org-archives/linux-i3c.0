Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0D4CEBF97
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ficxv5D8sZYOsnjcqu+qjHtPpC2K/RpJUdGmC4CpCc=; b=iAno0BVOZNP99S
	BgE9Ux2fXgjHZeHQsWKMoQ+/bI/tDiGxcoelV7iisXfc98fzQ3M7dNyNlD2h73XUyot8p/PKKROr3
	0FtymRRnwaW39x7vSBKl2V0MT1aliarpL24Fl1TeqOJHIbOaO4NL+ZARCocVcaQMgkGNDEZzedk3t
	3/5JH8y1yrhZyclFQK8b5X/Fda1Gc0DCf1b1gLz/Eug5DDLq4AJXLQRbwng7/xCP5lcKr5NhmjZ1J
	meNwIC8TW4wwRV/l2Zzu9FJfaqFO4GaGosn2xHU3JZJR04yBdwBPjudAgUCHcm/D/1v0bWTzWrHlp
	tJK2EPBx/bokpgfYc/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5o-0000000GA7E-34Pn;
	Mon, 17 Nov 2025 13:16:28 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5l-0000000GA54-3HDL
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385386; x=1794921386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=royrWpsqDye5EGreI/k6QFykx4UKf9tpYu8+7n75AyA=;
  b=R4gLbcfKx0Bn2SeTMIWJwok6nVURyFpnc+wS1w/DCmE4NI0Grpa4aTkn
   I2L8s3FsL2Zcu/ZQMM7OM0anyEmlGeqCyGc0OGvG7fyGHLnbotyzOjBbG
   nQOBuial5UA3yhF3eVKtGS2AD4BAmD1r01f5sLRZ/Vb1FLfc1IwYXdZCP
   Bre0vjF62COF2TIefLIA89fCIwTvdM9S5BY7ZVKAvEynB8qMkuPQ2aPDJ
   bQ30uR/AswA5qbrZiGJksv7DK+8IdlW6DlJ3ZjajmIz/LVjsbUKYnXjKU
   bTdT8ESsiRfA8LfrQl004ffeNW8otmnU3ntw/nMyQLreq+Ou2wB/enuDY
   Q==;
X-CSE-ConnectionGUID: VPCGj1a9RLmhYfwqAGokGA==
X-CSE-MsgGUID: Aptgq71kQfekfOEzQsTiTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009064"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009064"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:26 -0800
X-CSE-ConnectionGUID: VPD26BJPTLiEVP8XCN4a1g==
X-CSE-MsgGUID: 2BjJ3LKmSuSdAPwkaN4gfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549294"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 03/12] i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
Date: Mon, 17 Nov 2025 15:15:59 +0200
Message-ID: <20251117131609.65988-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051626_016063_DBF3E344 
X-CRM114-Status: UNSURE (   9.40  )
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
