Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E7D116EA
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbAlgMBVX9akXOQIDKIwpaoGzUChUYNM/msPci6llag=; b=ScNKxaYI9xGIhc
	QKEuADyskc8gbLpFjLq6UfceFls/ZpPVMUW3SZbtU/4Fg1zNM7a3y7tE8s8qZu+7aezPzPvlW0dDC
	0oecKHuob3F59lmDDUGOfVWmkljyzMY54CZzpglcJ2sCAP+safOgmkpNzPAtX0uvPEMLVLA0cBPdm
	JaDIqBKUUurLTDZhL5EpGeuR/t9EOBqg+6HAExtX9cyJ7NYsqXCN2Y4BZI/YhagpxTMViwNmMTDtO
	bOVmic//bH4NHkKF5vpT5/FCiu2kkOLb61/RqO+laya8TrzA9XBb77Z1djLz5uoOfXwwiZjDG/6vl
	belU3QgBLaVIpsBOKerQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAJ-000000003Z9-1D3e;
	Fri, 28 Nov 2025 06:41:11 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAE-000000003Ru-2KuU
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312067; x=1795848067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZKuPnIMLdmG8j6ilyJ3dFN4jmkZmueu3M6i/B0y4dWs=;
  b=MXlmGet/5AcDIsf90H9y/woQTgI4+fWe36R3DnVTaHBvw4tArXHZJQ5t
   3WqCiXjAc8THPolbn+pyOn9iBzHitaFob6LTnBnBfxliqF71AC2w4pxKv
   X3ShNrJxt3wfNBHH8vHHmW4jKM/Tfh9gtFIGO57YeRlG42M8dG9UglYYY
   f1jCdKxHoaGDM0FXdzXox5wwSGYiyVwTjoMZnOeHbe/6djq5W6kZFPYKl
   HMuMhSMIV3dnfvHedbappWrkIMK0V2Y8wymknmixR/tQO73sDJMTG/skA
   w2u9SRrJb6vsiHlMQ3RBaanZ02fw5AatHuUNnegc/jTdfbWDcPnLQUQaM
   w==;
X-CSE-ConnectionGUID: UX1ADgGwSl2tTR2Q5k5A1A==
X-CSE-MsgGUID: UBWyx30pSGm4F+w6fdJbog==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059962"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059962"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:06 -0800
X-CSE-ConnectionGUID: 7FJn53vuR1W0Ghdh9eKw3A==
X-CSE-MsgGUID: beZvnXQVQvKy+1gSKNHgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348109"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:05 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 10/12] i3c: mipi-i3c-hci-pci: Add exit callback
Date: Fri, 28 Nov 2025 08:40:36 +0200
Message-ID: <20251128064038.55158-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224106_634872_EA83E8B2 
X-CRM114-Status: GOOD (  12.65  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Add missing call to ->exit() on error path

Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	Improve commit message.

Changes in V2:

	Re-based


 .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c  | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 7bfb9fe337b6..7a91efbd3e54 100644
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
@@ -114,21 +115,24 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
 
 	ret = platform_device_add(hci->pdev);
 	if (ret)
-		goto err;
+		goto err_exit;
 
 	pci_set_drvdata(pci, hci);
 
 	return 0;
 
+err_exit:
+	if (hci->info && hci->info->exit)
+		hci->info->exit(hci);
 err:
 	platform_device_put(hci->pdev);
 	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
@@ -141,6 +145,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
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
