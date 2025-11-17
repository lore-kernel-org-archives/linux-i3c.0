Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665BBCEBF61
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jx/k6FZ9Le53zS9vGnRlVemRk4cJS3eisp0Cc/hiDfw=; b=ZqkdAYu+0dtXMP
	QHAb0h0+X3Bnv9bU/IKv4lV7sREErQoD94RwxRXY/NXXAMb8tcBFniF+7CiRmKGnFQXyqfhvXKLX+
	toKO+rgPH8e9avycfQzekZ0pINK93UQ0+0xMI6y57pFWr/IbtV9f86WOQN0TcexXdnrnYyL4vWTbL
	7k2DlKXNwv9EVChz2w4lbKVmjtrEm4mjrkBvu03mnHnqeNtfgQVCpZQyUeF6v/TBD+gNPoEmV6wA2
	h6yRV38yKVgGtJlwtQQey22otQKWmWnB6HoILYCqF579N4YIsn+EN9AqJOPUx12zC9dA3CAFz+2lu
	L+VFcJaHBvv6r8KU/Xaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5w-0000000GACx-0mcJ;
	Mon, 17 Nov 2025 13:16:36 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5t-0000000GA6C-455f
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385394; x=1794921394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RK3WHI2sdMdmIglXUapGdH6H16X7x7cmu1rZPd8Fh50=;
  b=JcobOEPTBPdhPV1HAN0qujiEN4UOssVm0SjFqk34hJwroQUC+uVjyjzQ
   mYk4ByGgBqeLXV3WneMXZ0svFMgbMybkboarIgFRL3OA92JIrKI1/XeGk
   HvUvIkIdrSUiScTWDCNWBA0RA8/FplAxsyhW3udOY3T3n6Xt9TSNXbQvX
   WakHDnALJhJnnZbetHBagVwQ8cs0PVejgOC0w1EwVhK0G2eo99GuZS+T+
   j5m/L8NGhG1w1xMhhKKivGFoG+AcuBpmKD1LWkyRuW70yd7xuUBr/cFsh
   G9KjCSB5Vml0q8vTS+2GccJn97UaWdvFz/l4bhuoDWHFkhiYWXTBlMhG4
   Q==;
X-CSE-ConnectionGUID: uHWwMUXBTbeYvYbkp0e0Ww==
X-CSE-MsgGUID: X9QQlVJEQb203Z5VLoul/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009088"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:34 -0800
X-CSE-ConnectionGUID: IRrm+/z4T4WBPp3NSSeA9w==
X-CSE-MsgGUID: qLz1IyUVQbqdnFZOZssh9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549362"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:32 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 08/12] i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
Date: Mon, 17 Nov 2025 15:16:04 +0200
Message-ID: <20251117131609.65988-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051634_024857_873D2FB6 
X-CRM114-Status: GOOD (  13.18  )
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


Changes in V3:

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
