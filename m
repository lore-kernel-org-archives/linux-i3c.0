Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06A7CEBF91
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtHwl2UvB16PEPZLPkOhhIkyBEEc3oZbPo6MN3crmwM=; b=W4hDeXde/9orQ5
	SMMUM4PNYqMpNGDNS8Gw4aDKC6J5dSmvmafZ11KScyK9UjxQd46HDw66WFrbZpOvqvZwnlKgVAVSp
	Ahl0tPwcrUX9X+SESQG0CeG5i0j3sw8cgesxMAyJlH3Xu0HS2OcbE4WPIHEEqsTDCaxaA2zJEhptM
	eKROMPFbBy24X/kSG2v7SeJuQo58MRM9X5DJ99snJDDCcmB1aiKJqmuHcaWTWGPXGrxsNKolDAZO/
	Tm/QAwMM3q+0z26OxQQVXXMlV3QlASWpMXtr+JmxIGEjPuE+PWWYzw3IsR57IOCe46d8+wGiA/Jp2
	Ef8iGxonHMgAYqOutkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5z-0000000GAFj-2sYv;
	Mon, 17 Nov 2025 13:16:39 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5x-0000000GA6C-1YLS
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385398; x=1794921398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pK1vsxMng9w9l1jnZRuLJZ6mDruaz2VAuhUMY33IJi8=;
  b=jlnob8u6rqLT3JN1371uNysiopA+gAjiH89xlptvstzPyLwnTxg70MGL
   5KMyboM15oAYffACV0MfGYFuDHSxbNamU/ZXGwv9cd6O0rXFDGU1KQaKH
   W4eD422t9ZdoGsR/b2DwCmJdgbnIWh8r9NHnR5iibsSVA0EuvcVb2zndK
   UeYtuuAPLr8aX9UgqDBEj8HUFX1xCVTkTSK90HsLdSvGnQV9q5xfkd+F/
   d3jmtnMrsC5Ops8RZxnUL1RVlRggbIvn1GUJO5k90B4TYOeFpjdpZ8tvS
   ebrcfuKXWd/R+Sllm5FUdfKOeSepPL7NCec9wvbjOx2GBBhS2R+BpVfpD
   Q==;
X-CSE-ConnectionGUID: 5PcZ9YSBSmOEYmyXpT9eAg==
X-CSE-MsgGUID: 3ZBVyDpfRUeh8iAzWxD48g==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009097"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009097"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:37 -0800
X-CSE-ConnectionGUID: catSc0EfRLi9BECEq0xxhg==
X-CSE-MsgGUID: kaRrXg5PRw+nyVVJ2kweKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549377"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:36 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 10/12] i3c: mipi-i3c-hci-pci: Add exit callback
Date: Mon, 17 Nov 2025 15:16:06 +0200
Message-ID: <20251117131609.65988-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051637_429701_DCA4C2C7 
X-CRM114-Status: GOOD (  12.75  )
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

Prepare to add device-specific features that require cleanup
upon driver removal.  Add ->exit() callback as a counterpart to ->init().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Improve commit message.

Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 7bfb9fe337b6..b962d3c2d510 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -17,10 +17,12 @@
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
 	struct platform_device *pdev;
+	const struct mipi_i3c_hci_pci_info *info;
 };
 
 struct mipi_i3c_hci_pci_info {
 	int (*init)(struct mipi_i3c_hci_pci *hci);
+	void (*exit)(struct mipi_i3c_hci_pci *hci);
 };
 
 static DEFINE_IDA(mipi_i3c_hci_pci_ida);
@@ -72,7 +74,6 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	const struct mipi_i3c_hci_pci_info *info;
 	struct mipi_i3c_hci_pci *hci;
 	struct resource res[2];
 	int dev_id, ret;
@@ -114,9 +115,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err;
 
-	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
-	if (info && info->init) {
-		ret = info->init(hci);
+	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
+	if (hci->info && hci->info->init) {
+		ret = hci->info->init(hci);
 		if (ret)
 			goto err;
 	}
@@ -141,6 +142,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 	struct platform_device *pdev = hci->pdev;
 	int dev_id = pdev->id;
 
+	if (hci->info && hci->info->exit)
+		hci->info->exit(hci);
+
 	platform_device_unregister(pdev);
 	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
