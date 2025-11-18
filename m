Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B354CEDDA4
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NT/Kz6BGCGRVHaEuEc2dNIWWyCaiKEIWdaIvHXJTis8=; b=fznm7jaJ7xfzpB
	lVubQCCt7JCThKu96gsyENMSq/ywy0CeaPn6aN5bq0kbAAk1FcFsuuSMQa3QmJq68zz+We3+/QO4U
	WVZTNEI0BDxFjkH81kfteO+gtjTenLhvxlsq7CF7dh8GKfSVWd4Mh+QbBZedGXTGa64KpcjfjoA8b
	zzmp6TpYpr8rZzhthcA48F8RLkOdzb+tSgPeDz1kp5PwLsc6XuJTx+Lh0s+4zo2w41+mNXAWpV+rt
	y2woNkqOwZOyC4EEfICkWhIFqEwcKuQnk2uXdoZcm8ukxNGEOnf/LhrWIwr+/SCuc+ROawlACNYDe
	Emxuv7bwTRN8Mbqs1gRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpf-00000000m49-1IVc;
	Tue, 18 Nov 2025 16:45:31 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpY-00000000lzI-3VrK
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484325; x=1795020325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/NmuHkT0DpiFmswnTy4ggc8aox2ytsNtCIOrlX9lbDw=;
  b=DRxEuir4kOX97Emy+Mn1nj2xA7KuiCeIivtw95af/OT5KdkEj+2TXTXs
   NKIdBm16pBf/1vcJGNa8wAD8v1IDMuKfss13u015fX9kmywP5tOFUbhMT
   2jXm8jCiFGHQLzzlW/Ofadzd9GbAWcaB0zUu+28AluScTrqyN/+Btm6/P
   Rtk9bJoAmO7iH4Bdw4f3K0XNlYucif+w4XuguGCgM1007n8miYJUz3cTy
   IxKIMa3DXez+NDu6N92IqQxuEKxF3M3wNqwP8+MX2MTzLczW+BnLAoVxz
   X1Nic+dFScjUNO8zhH2Ekm+fc0ybm3DlS5WKtnzeTrhjrR2PosEEDvZyU
   A==;
X-CSE-ConnectionGUID: EGTK6pHDR1elMFTKoQELbQ==
X-CSE-MsgGUID: RM9xa0tdQdSXg+WBpr8vqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510706"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510706"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:25 -0800
X-CSE-ConnectionGUID: KJy4d9rnSM+YwwIq0ssCtw==
X-CSE-MsgGUID: R372uNXeRli4Y7ld6bJ4Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221463021"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:23 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 09/12] i3c: mipi-i3c-hci-pci: Change callback parameter
Date: Tue, 18 Nov 2025 18:44:50 +0200
Message-ID: <20251118164453.55532-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084525_162269_D58BD784 
X-CRM114-Status: GOOD (  11.47  )
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
