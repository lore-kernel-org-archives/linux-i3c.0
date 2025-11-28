Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32393CFD376
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ulVUBKjxL55xZr7wZxmU4hERi9kIWGPm+1ldtfi+6g=; b=crXDh/Z2Rnbfxt
	6w9Nc0lVg2K0iAfsX8EPFGHs66BWgKOXuOBdg6qdaVJBUXr1lk9ubB5yhw0XZFL0FVVtdLbYpMlfz
	6ubVLd6nSzuxklzx42/+wazFEgYSq+Z/g1b8S7e0IcKhM45jO1Tv2WpAcBtMeBRwt6/sCa+GYVU+J
	qMbDTruW5Sm88A+10YUpHkpkiF999AFINaSsigtJ74Xst62uOTzrYkW07VW4AzDFgWer3fsKk6q5M
	BPe4cFbGMQw7veVTVyZoi9OrvG8tlSgKmYKpNXwcoHd6KMCp94nCkSlJk86BtN+xGniMA94VwnUpC
	EinCUWequGsNM2c/v/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAF-000000003X1-2pj5;
	Fri, 28 Nov 2025 06:41:09 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAC-000000003Ru-47am
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312065; x=1795848065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+mKrMnsl1uQoKJE6e1PJg9TADzcymtCpQe9x456kFx4=;
  b=MGGNwJKso3dZuDuMVmZEzIh9pv/Upv1M2Pb8veXh688gPI6d2OW7/JYm
   ggn7a7kbe+bWZNCU/4L6q05lkY+1vANAzCmehB0f93qL0BV0Cj8U9+vzD
   m70LU1KbTw32U0qzYV/HWA0zM5QxZDntutXec5u9SoBG3MVE+ApSPkiMf
   Bsj73xckDxc5m2sjBtcaI3WThHkMP6INsWNYvDq8YQlbQ2bxf5Ivs9nzr
   HoUHss3H33gXCpPLIC4sMRp+LUgYX28PHa0BUHeBkFyMe9wnUCFeo8nUu
   nh/aBUoHLCbw6jW8pMBgnK1OO5zM1TTiWPMCTBJTU7fJQKP16qsdTLPJM
   A==;
X-CSE-ConnectionGUID: 8BzKL4vgSqO3cYiKLwvsqw==
X-CSE-MsgGUID: YYuMlTtvSyunqBpIBjE0gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059959"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:05 -0800
X-CSE-ConnectionGUID: z468i05BSP2hE21MXr6gPQ==
X-CSE-MsgGUID: Af9ZzujDQ5ehZq7wvis7Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348102"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:03 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 09/12] i3c: mipi-i3c-hci-pci: Change callback parameter
Date: Fri, 28 Nov 2025 08:40:35 +0200
Message-ID: <20251128064038.55158-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224105_061115_BF6CD7AE 
X-CRM114-Status: GOOD (  11.15  )
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

Prepare to add more callbacks in mipi_i3c_hci_pci_info.  Change ->init()
callback parameter from PCI device pointer to mipi_i3c_hci_pci_info device
pointer.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	None

Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	Improve commit message.

Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 8936e50eddf7..7bfb9fe337b6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -15,11 +15,12 @@
 #include <linux/platform_device.h>
 
 struct mipi_i3c_hci_pci {
+	struct pci_dev *pci;
 	struct platform_device *pdev;
 };
 
 struct mipi_i3c_hci_pci_info {
-	int (*init)(struct pci_dev *pci);
+	int (*init)(struct mipi_i3c_hci_pci *hci);
 };
 
 static DEFINE_IDA(mipi_i3c_hci_pci_ida);
@@ -50,14 +51,14 @@ static void __iomem *intel_priv(struct pci_dev *pci)
 	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
 }
 
-static int intel_i3c_init(struct pci_dev *pci)
+static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 {
-	void __iomem *priv = intel_priv(pci);
+	void __iomem *priv = intel_priv(hci->pci);
 
 	if (!priv)
 		return -ENOMEM;
 
-	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
+	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 
 	intel_reset(priv);
 
@@ -80,6 +81,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (!hci)
 		return -ENOMEM;
 
+	hci->pci = pci;
+
 	ret = pcim_enable_device(pci);
 	if (ret)
 		return ret;
@@ -113,7 +116,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 
 	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 	if (info && info->init) {
-		ret = info->init(pci);
+		ret = info->init(hci);
 		if (ret)
 			goto err;
 	}
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
