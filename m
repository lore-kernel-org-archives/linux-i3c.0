Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999CACCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6FZWNZR9UD5WmtXg+r1t/wgK3PEcrsPUnf2IA0H0Vs=; b=TxH6crwbFVrzkl
	8yZmTk3s3tkGKN4K9O3otCuGfpS93J31AnWqcYKOymLRf5nMEwphr9e9q5F5aYTW7w9JquKYCeKJ1
	UWhb+UBHCvg8vhrfBmzh6AltNKlNY6Pe3IizE1C1R1GxTOih/CxehBTPgYStmZRDfx/UIiAHly+p5
	cVDIDaOmbzdV+pKjYozX/Yqlx5BSr2dZkj7YkGa2Jqm9KWNmHZjOkyOQw0vt4yvK4lCYmWBBWI//p
	O1GO1ikuxotyLIj0IZ1jM+BoxGsBf/veAqxnEzzMSVOttbeVw3z0TN9ANV1pxRrFL+HfIYsZBsqIX
	1zIfZDPDrLWL1DK9dD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hy-00000008WSZ-1Z0j;
	Wed, 12 Nov 2025 10:04:10 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hw-00000008WKj-0jUl
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941848; x=1794477848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1OpIgppJc8GTbZch0MbExKyzR5JD4pzhOi82aQK/7CY=;
  b=BnCxfpLiuRItrztbZHF/NUrpUFRQL3eKCuBkyezSArg8v2C+jKVItSbP
   dLAnFkmyL2DC/I35dCoxnyHNUvA+EgUubZuNxzHxNY9QuKZbJB5dgM1FV
   8rVw1tlRYkZ+W6YOypKmLjXTWqRTLPI6W/ruFlCAG1vjWo5ukt3GOrzF3
   UGSC0dKqMiwelg72nTLjBiO/fWmX9AWa5b3DkTt8WIq/4iz5eoJu09tng
   9UDvppkvMxGFzVwH7XIBNfKxmqP8k+MxqoQ4Tnyg+lUAL4HnCIY8O2d5G
   cU7n1KivSiOfVZrYxMNG+2kv1rCVlCVC7bOOYH04+oNvcjcHLsSWwe9qk
   Q==;
X-CSE-ConnectionGUID: YANPfKQYSS6qet/bJ0ut8A==
X-CSE-MsgGUID: gG+3/BUBTKOkXi/zMa7FKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616245"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616245"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:08 -0800
X-CSE-ConnectionGUID: TxiEYYUsSdih+OWExmqzrg==
X-CSE-MsgGUID: 4TZKgaXgRa2UwV8YP1fc4A==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:06 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 08/13] i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
Date: Wed, 12 Nov 2025 12:03:34 +0200
Message-ID: <20251112100339.51726-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020408_223980_2696D6CB 
X-CRM114-Status: GOOD (  12.85  )
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
---
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index b3b6b6f43af2..9fa89af7479f 100644
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
@@ -71,10 +75,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
@@ -95,14 +103,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
 
@@ -113,23 +121,24 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
