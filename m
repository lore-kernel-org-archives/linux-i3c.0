Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA43D116F6
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AjK21PGDIy1ygqq9ppHoYSBiGy2zgd0W+gTnEG6GUM=; b=HYxR3CJkkaSAId
	TZgCYjYPQUX6VAsMW1Szq/V8GAwePHg00LZ3G9hvW/aekhO5BtOicRWcxAYcvRh2dxehq74ZZNnlv
	JZTN6KpceVm6ouURK5EpsCACjPkJep1cQuZDA9KPlNEk9rMVGW/MHiNd8ZCyBm9YyhWh+UQZhBYJK
	DdljTuJGv/hHc/TnH/JWTBjraWeEeLiPYiWA2e+sAiJbS2yfsaFnJ1IbNqr275Q1iOu/jkOvAotLH
	1lZe+RQPmWUKimy+ZQ1MTW9fVY4uX02M9Ko7UkZ1loPEaPmWN8rG/RgQ/5VkT50NTkS1cg/8DvnTS
	NopvJdUdhyqypnAdWgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAD-000000003VE-0pZi;
	Fri, 28 Nov 2025 06:41:05 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAB-000000003Ru-1nUb
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312063; x=1795848063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1rr0NCdEvSgw8A2C9+LU0FZiJ4kcZqF+LRIc5GjvdqY=;
  b=Zrl/IggcqlGxDcR69X/1/+wvXWhkJ69080KZIZbu88VO4AzDNW8rttpO
   ZCHx2tZc9C01E9MG003vVzM1G9HIAKSUQ8hWQg4rrnD+NKziwdJ7FSx7c
   85TgLkYKPgDvQp+XR93KovIsYxKYE8W1DydihJG4mZEmZj5BATdlwuINe
   lvtCckaCIXY8HBk8d5ZabH9DWoTEmhUIGlotaM0uWvtmtt2lkbvVKqvhS
   88tC6jeKzJ6rVa5UJzqKt2anMtiNJJY6/9rc6Da0XURGW3bBlIbMkkaWL
   LArlLkvB6wNWdyTfussJK2CAbjRlr63Iwz3gnNYoC0tDwVaKQ705NL/LN
   A==;
X-CSE-ConnectionGUID: 20zeOrCwTRSWb+ryDrR/xw==
X-CSE-MsgGUID: SdSblUT9R+OYwhGzthRo2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059955"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059955"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:03 -0800
X-CSE-ConnectionGUID: CLu7elkPQFui4Pdyy1DBvg==
X-CSE-MsgGUID: o0X2AZ+3Qlit561YWhSq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348084"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:02 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 08/12] i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
Date: Fri, 28 Nov 2025 08:40:34 +0200
Message-ID: <20251128064038.55158-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224103_509578_595197CD 
X-CRM114-Status: GOOD (  13.00  )
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

Allocate a structure for mipi_i3c_hci_pci device information, in
preparation for additional changes that need to store mipi_i3c_hci_pci
device-specific information.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3, V4 and V5:

	None

Changes in V2:

	Add Frank's Rev'd-by


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index b9794212b2fb..8936e50eddf7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -14,6 +14,10 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 
+struct mipi_i3c_hci_pci {
+	struct platform_device *pdev;
+};
+
 struct mipi_i3c_hci_pci_info {
 	int (*init)(struct pci_dev *pci);
 };
@@ -68,10 +72,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
 	const struct mipi_i3c_hci_pci_info *info;
-	struct platform_device *pdev;
+	struct mipi_i3c_hci_pci *hci;
 	struct resource res[2];
 	int dev_id, ret;
 
+	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
+	if (!hci)
+		return -ENOMEM;
+
 	ret = pcim_enable_device(pci);
 	if (ret)
 		return ret;
@@ -92,14 +100,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (dev_id < 0)
 		return dev_id;
 
-	pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
-	if (!pdev)
+	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
+	if (!hci->pdev)
 		return -ENOMEM;
 
-	pdev->dev.parent = &pci->dev;
-	device_set_node(&pdev->dev, dev_fwnode(&pci->dev));
+	hci->pdev->dev.parent = &pci->dev;
+	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
 
-	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
+	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
 	if (ret)
 		goto err;
 
@@ -110,23 +118,24 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 			goto err;
 	}
 
-	ret = platform_device_add(pdev);
+	ret = platform_device_add(hci->pdev);
 	if (ret)
 		goto err;
 
-	pci_set_drvdata(pci, pdev);
+	pci_set_drvdata(pci, hci);
 
 	return 0;
 
 err:
-	platform_device_put(pdev);
+	platform_device_put(hci->pdev);
 	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
 	return ret;
 }
 
 static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 {
-	struct platform_device *pdev = pci_get_drvdata(pci);
+	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
+	struct platform_device *pdev = hci->pdev;
 	int dev_id = pdev->id;
 
 	platform_device_unregister(pdev);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
