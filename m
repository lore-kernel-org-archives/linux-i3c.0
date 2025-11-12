Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ED8CCFA1E
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7GweapA7706QOYKHbqBjI2ON0Kv9sq6OJUAY8ZlAzU=; b=tYBB+bOuqFW+mc
	BsFS4Z613oZQRytDM9HTi6Y5yPHxmA1JjUEqMVhzHpxGZoHkI2etQaJ7J09bLF8GGnJBNZpAkQRN5
	p7ZPnrg/osMg9EkTAdHxyT1shvoQDajAWBIU6Bj5K7VFRoiyd3LarR+M+XtKAPDJJnmg8mSgCsnAI
	JwGE947+I004J3PKZt68hTiPFlcy4Yx914h/RTEVZnjIo4/ofKmDdMtloUkodIQ6wq0D7N/kUA+A2
	D2MLNcFRTO/iNAkGM2TCewXgRJ87RaTJ7MBrFn6f+IF+n+00yqO48c8OrNwwAWlZKNOZMzRem6fgm
	VO62vHlYthrpHgo237GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hz-00000008WTV-2aOw;
	Wed, 12 Nov 2025 10:04:11 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hx-00000008WKj-3gKI
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941850; x=1794477850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GpbV4JqGVn1Tuq3XDDIlRFX32dfgOgf0+Q2UUSsrsR0=;
  b=VQlg6yBwx2IOxaZEQWDPJ/Y9BFXuMhAcc6AJlhSfOHDP/4YgcnGVhkdd
   4P1ChkmyVXthZZuo7gkhpZqRt33tNN9USpB6qmai0ev5WPntOjyOyu4FC
   K/gBxrOkoprRRwWPw53eXId1H7lfwc4BUNxCnxTbKOM61Ez6FX4VD/d91
   MKN7SlyRWnFjUrAHeHl89F/bNvUP7zjuCq3aoXYn09wgfub6ob06oLu/I
   PeTv7WlHQaRBOQvZXU/ZLieS78UfM8BLaEtip0US7Z6iDsYykYzRchZua
   TMhlATEUmcvYVQJgjnLQ+dmoMhWjtxY/E+gAU1hq6lLB/h/iNrmLrCB6U
   Q==;
X-CSE-ConnectionGUID: kRPgPhfMT9utSAe2LL4OCQ==
X-CSE-MsgGUID: Uq5huv/aRzWe2SafybQWJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616248"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616248"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:09 -0800
X-CSE-ConnectionGUID: y0/N/aO2TH6xZx8xL6dVCQ==
X-CSE-MsgGUID: Z3j7uRzUTEKTCMNXsan7sw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:08 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 09/13] i3c: mipi-i3c-hci-pci: Change callback parameter
Date: Wed, 12 Nov 2025 12:03:35 +0200
Message-ID: <20251112100339.51726-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020409_930167_6542BBF6 
X-CRM114-Status: GOOD (  12.07  )
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

Change ->init() callback parameter from a pointer to the PCI device to a
pointer to the locally defined mipi_i3c_hci_pci_info device information.
This is in preparation for consistency when adding more callbacks that will
need struct mipi_i3c_hci_pci_info.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 9fa89af7479f..5142dfcebe7d 100644
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
@@ -50,15 +51,15 @@ static void intel_reset(void __iomem *priv)
 	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
 }
 
-static int intel_init(struct pci_dev *pci)
+static int intel_init(struct mipi_i3c_hci_pci *hci)
 {
-	void __iomem *priv = intel_priv(pci);
+	void __iomem *priv = intel_priv(hci->pci);
 	int ret;
 
 	if (!priv)
 		return -ENOMEM;
 
-	ret = dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
+	ret = dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 	if (ret)
 		return ret;
 
@@ -83,6 +84,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (!hci)
 		return -ENOMEM;
 
+	hci->pci = pci;
+
 	ret = pcim_enable_device(pci);
 	if (ret)
 		return ret;
@@ -116,7 +119,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 
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
