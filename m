Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71358CCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exCpfAGqA6uADIcD0oIUWmDC5kJ1Gd6GzH0PFL3zts0=; b=iOeoF9MQv9l60N
	wvop7akaUiOjevcEfvi4Pa5LL5RNbPPjUVgxF7D4WtB/dMzHmAMLYPAri3UHTy+YztJ4jbzJQD3a+
	vAgLDJoKyKcEPtKIJxuTmJClPDfUP1mMihkejoGbFasqwdNUOsx/yOBHaXkz1XKUxq12gpAIoJA53
	AD4drt9wtEwigW7cphll7Aw5HpzdyjvnCaRe0yOWneJkxEWBgxl3imzIfYzojjaqnaaTR+nA84IJQ
	srwXGo+vLiuHlsv8ijv9Xnw1dIuvW5q9evyeOEd7hFXRJf8OHfSgnozk2vv1aAPVl7LrGYIVx75h6
	0skQv/DdVJ5Nlq6zi2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7i2-00000008WVi-0Z5q;
	Wed, 12 Nov 2025 10:04:14 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hz-00000008WKj-1EUX
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941851; x=1794477851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ObFqIBGQpT28Q74c/4t3j8N3cBVyQ+8d9eEOCXlNYlQ=;
  b=ONFmJH5xhJ9MDs4WJBCla2FqWkndipzx1D9SMjz2Yedwe13w7cK3E49r
   gjxG2nCIf6EvVLtpgg1Uc2KRQM9iuMmW1tPUOGef77Qzgk6s9+vdob8VN
   xhDtLuJBouzqFQJrC745XL/BJhx6JPV1jDIFmEExOtsfMtd2A+nmU7sF8
   iuAceztxCxl853oU59eHEvdKUH/hPTEkzMc7+no7NRvr3piyz5QPtnrag
   sTKN3XZyBUumXBRmSvWVssiLPXthY9NIvjkMTE7aE+irTb32nq2fjnX6j
   J82KAFVaKPUlDgRtpC3AuA5TEpEl7KAKXrU7G4wbLOGPg30m3WfoHnK1P
   Q==;
X-CSE-ConnectionGUID: yIxzj1iLS2uUkbE4xSAnqA==
X-CSE-MsgGUID: l/U9dZliTRS0gTSGOy8Flw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616252"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616252"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:11 -0800
X-CSE-ConnectionGUID: 5JgqfEJ8RHu5yuzUnK7XnQ==
X-CSE-MsgGUID: 4cEqfT6wSguQ2iST7ThwSA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:09 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 10/13] i3c: mipi-i3c-hci-pci: Add exit callback
Date: Wed, 12 Nov 2025 12:03:36 +0200
Message-ID: <20251112100339.51726-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020411_352445_9F03E7B5 
X-CRM114-Status: GOOD (  12.43  )
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

Add ->exit() callback as a counterpart to ->init().  This is in
preparation for adding device-specific features that require cleanup
upon driver removal.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 5142dfcebe7d..4209e51257b3 100644
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
@@ -75,7 +77,6 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	const struct mipi_i3c_hci_pci_info *info;
 	struct mipi_i3c_hci_pci *hci;
 	struct resource res[2];
 	int dev_id, ret;
@@ -117,9 +118,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
@@ -144,6 +145,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
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
