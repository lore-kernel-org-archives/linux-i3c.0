Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6955CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zysteTSl+7Q0ejzQhFfuq0mScJFO4eNY89+GpTZSQm0=; b=Dp/MWYb794tb5V
	SlG0fIciKBuMAbjHeh5JbjSYCMWmTANkIHWAp7PlGNDtbhgcJ1o0koJ7Y0c+YjPrvnvLQTAB/ZIRa
	1mBgSRA4NOYBw/xk/TP1fw4svXpYvc6mzc6DeI0TFdHUm0EXDW468zW8N42TiJq9tPGHgmy2TCXv3
	MVeZ7o3ZcP5vnVsr1ZKOn9Bj8bzkExVQ4+nLFADey8C4AVxDf6CXeqKQ7LezljXIUQr26nd9fMCVh
	BRd55hkLNdJVOrNc61wLWkDgCjw7aFGKqwYBLy53JsNqVvPyVsyP0/76X60tvEvKPuz50WshR7Scz
	QLHTzyR73cepY436qsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5y-0000000GAET-1qJ6;
	Mon, 17 Nov 2025 13:16:38 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5v-0000000GA6C-2lXA
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385396; x=1794921396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LGh2irTa8BgOjcAc3NvyGXU61uX3EleYx3ScRNYzi+4=;
  b=FbsYY2Ea0vmpUcFQlroOr932vg6X7pI5hlbA/EzvgEi/1FMT9ShEXvGx
   2gle1/fiEczugeuRb/8druhhkQwPLHKi6ifBWa4A6etAdnZpbDya40lel
   Wm4PruAde2wljY9d65uewSVC9p8E0D1Hi07b1F1SgspOJU8TsOSfsn07q
   c9bE39LgYKhHVcPKaQUt1U5aKS9hssXOo6bnxlyDhVQnhl9jZPl4pqjkv
   CBQAS/9nDBPc+XZ5pVBKnxgJWzZMawLb5uhPMOSHnN4Cw1N/4kWlLLZoL
   ld1dEmXXn6rwrwphp1qr07jhfMBs/zvOs2JIceIzAv5DZtNUtbs5rGft0
   A==;
X-CSE-ConnectionGUID: 9E69WykcQeC++Wld5lNeaQ==
X-CSE-MsgGUID: WuoklOfvSKCuto9wNBtGXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009092"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:36 -0800
X-CSE-ConnectionGUID: W515S4IiQgeNFlKw3+xG/Q==
X-CSE-MsgGUID: J6stnA0BS86nhT2Fo77/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549370"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:34 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 09/12] i3c: mipi-i3c-hci-pci: Change callback parameter
Date: Mon, 17 Nov 2025 15:16:05 +0200
Message-ID: <20251117131609.65988-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051635_707242_69406497 
X-CRM114-Status: GOOD (  11.66  )
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
---


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
