Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F51CE8D71
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0VmISkQCqDsTDuxU9pHz8gwl2IhZLew7CysC/m/pxw=; b=MXrv0iddS8si5V
	SEG702xJB74R818+SrLScVvUPItoKV55gWR3zBPOb4zRe28YvbHbvnoEcP8upLQFJl0429XK6gbVs
	PEMFLbNweqN6VI/TPOl0ht2nxEJNRBbBNCmi8GWZrls/ZK+C1NC6udtDOlv2AwhhhBs0X21hPaP3z
	p1uawxILNsC/g4V/gOmkA8KPuUdtyndCRoj+ob7lOhFU5qr8M1syTIMqKV+/relLMN4/krH/e551A
	VWh84FyL0pSh/Az1zkObjRfBu+8aPXnAHziXOgp78aoDximcnEV3xzaKD1nJkbN0di7Ceh2DF+oYn
	JTGbRrYlJvxIdNbHG6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJc-0000000CwXx-2wsC;
	Fri, 14 Nov 2025 18:14:32 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJZ-0000000CwUD-3CXw
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144070; x=1794680070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dDdz5L7qX2GogJ3XVc6qWc0VqBoYwy8ZIjqy9j2pvHI=;
  b=KLPqimlT9DfirRUZBmNpzGYc3cF7clupFoXMVW9oUXsFR9MQ/FSQ8CzG
   ERkjXRfyKVgSnIeChb1f/6Ld2LgAS4F86MRcnRfKUQvhotZiJ119SG4Dm
   AQ3K1bLGf7gIskhgX4kEqzgWNM+tNlXQXvY0rZigP+tStn8G3KpnLDMyn
   9LAoYFZS+r0gxvz9sLkKHlzrMSNFyRuWtIA4OoQSHo+S6VpIMC/AB8utv
   y74EGSfHE4H/XtS/2rPq46r7k/yJo8NyHZuLV5oWRQfBSN4IeieMy9PSE
   HIP5Ch5epUe9xt2z3hT3v/g0bc8SWI/i0kmQ/QzRmfYl5efHvSAGivLSn
   g==;
X-CSE-ConnectionGUID: 0YjNFkDrSjGCILmF4id1QQ==
X-CSE-MsgGUID: Qd6OG9BlSgeN1z+tJ8traw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129415"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129415"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:24 -0800
X-CSE-ConnectionGUID: V1etypkTQoGMX5Rrbjd+5g==
X-CSE-MsgGUID: KV9yaFFcTLWOCqa6CMEcgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189669006"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:22 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 09/13] i3c: mipi-i3c-hci-pci: Change callback parameter
Date: Fri, 14 Nov 2025 20:13:52 +0200
Message-ID: <20251114181356.66515-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101430_477602_12D77E8B 
X-CRM114-Status: GOOD (  12.58  )
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
