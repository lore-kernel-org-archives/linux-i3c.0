Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1292CE8D70
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2Lahq4I4393mDBPaDgyT2GzAW+KBCWrJlnKu62el4I=; b=CKuZQkRLJflhnu
	28Cmh1m7UQHpepHcpytwQ9xd/nfivHY3fzI9kSFo+EQAV58Pzz1iOV2OTPKM4YorfD9gfF9mK77k8
	OapSXojHaK6NHy4Iso8doQ+SyuA7DV0HCMbq4ZSjpCJrMabp6mZqDPHSrBAFG4Lgr7PcFSlYI6YB2
	fI6ZTCwuq0KH3gDu3C04wffPMFJpADihr6jx8maCIo8XuqCfsmGvU+dJRljbv7mO9DExKQcbgB4Ss
	ueUuPXeBe/cBWDPS9Ycd243cvAJ+/4z/BQV0VpI+dOaZJLXPmLtbMhOF+Ut/5UWV29WkidU9Aas66
	EmNfWdmUwlA5jDl21Q9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJR-0000000CwQ6-2aWi;
	Fri, 14 Nov 2025 18:14:21 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJO-0000000CwON-2Xno
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144059; x=1794680059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kWSQs+wvMMDeV631hD3UaM2Er+Hmp0ZBC9kEI3sSifA=;
  b=CNtfAEBIJFKDiFjJDrwBbhIkNZkj8nyrCJDx7tjX/Q+8LVq8PpTpAmYN
   GBszuOuY5qE40CJWiLiq0F0x4/RrpAm6so17iZxuKI4pCt+lc93PY0Hwl
   rhanKuVwZPNicMmWhKQhL8I+igdGvrlgU0IdmTTMEn0nZGyEfAktPS2Pb
   SQltODiUPooKtqxShcJQMgVtp8pmTYKqsH891WBNXoRGsdqAsiyF3WUM3
   TULHRKcH+BnCLg3GrcpZFLqN7tdD4UeteoG1Avgp2fcid4njLb0IrFF9G
   Kl96RLf829Xfv2kj8w/Aqx07kJWu0CCtig24VNP84XnTSn43d3XF1B8pV
   w==;
X-CSE-ConnectionGUID: VQTtqAZWR+2FoZKu68Heaw==
X-CSE-MsgGUID: y3ZsupPZRdKdXR1GGyJdkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129340"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:14 -0800
X-CSE-ConnectionGUID: 3Z+JZgnCQvqHjD8zcT8p9g==
X-CSE-MsgGUID: C/XgEW0vRJyvykdIUjRH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189668972"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:13 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 03/13] i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
Date: Fri, 14 Nov 2025 20:13:46 +0200
Message-ID: <20251114181356.66515-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101418_712253_66755612 
X-CRM114-Status: UNSURE (   9.34  )
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
---


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
