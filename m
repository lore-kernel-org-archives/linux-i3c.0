Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E81D609D2
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MR5b+d0twNU0SU2MKd1tXeSj7mvEUMMr/pY1x/gAzsY=; b=yvVE/Ihy/T5n6N
	qgaWSJTfT0BtAHHFxsEEs5HdMW51wUY2EZHMcm+UifF/qqwUV3wkToFZaEK2Huq7yjsVX7sUlekDz
	RG+LOHo5GFnhl1ZZN6HtCpBKztn5kaNBqvUViAgJPG1TqTSRtZRQuzUgLWCdTShfra/d+GXUjDw1X
	Irwy36hGs3SahhlINR2HFjEW2I756DsIHOrLLg8XBsvAqBwcOk8OFAxAn7BTWk6sAEQM6T9o9YO8p
	mqSU5ChmSUBdU+6W+CNc7fRmx/8GmOf5Wl7rC5ZPArwncJXqeZhnXwjGD7+zNRyoqB6zms6d6/W8p
	GKmWuItBUaAu6r/UlwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMC-00000005ZOe-1EpK;
	Tue, 16 Dec 2025 16:57:04 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYM7-00000005ZLT-2mAV
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904219; x=1797440219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kfq+4wtLs/DRbeh6vln9okpBrX890pjmy9Q+jhmIxFk=;
  b=Qt7KTscmsiKsZsk+L4F2E7hlj7YllbKBzZJ0ZL5pmrXs+gvmaTivNc8u
   J9rw/22D7TrmZ6oObS36NAER3/WQ5/YaG4tViIk+VzLYNMifO03MkYp+f
   yq/8KzWFkxvF7VU6IkIAHj8qGltg4Ahbh4guAqeX9LYjLDAlGERGPvCZo
   02sSQEK4c/Yd1O3FUbhPBfyx8vndsXxmcgDRab9+EICuYxFdnXjBoM9lQ
   TlCV31imDGdMy1nGFjk5NkZWmyci1Q89K8eXBxumzCkztdx8/dHwMI0lP
   p4YJ0LlfxHKayAeQsyfPuxu55YRuP8nP6LHUBG5OLtxrHVDcQSaFxxQ5r
   g==;
X-CSE-ConnectionGUID: G8zpglVRSz+0bQ0//x/now==
X-CSE-MsgGUID: nngf/PMERoOWRO1nwQ8qSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466741"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:56:59 -0800
X-CSE-ConnectionGUID: PDMWbjtCRASxVTXIDwTepw==
X-CSE-MsgGUID: whsui5z+QjuZTC46Ht055w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817612"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:56:58 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 04/11] i3c: mipi-i3c-hci-pci: Do not repeatedly check for NULL driver_data
Date: Tue, 16 Dec 2025 18:56:35 +0200
Message-ID: <20251216165642.164583-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085659_717548_441F3D45 
X-CRM114-Status: GOOD (  10.07  )
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

All entries in the id_table have driver_data. Do not repeatedly check for
NULL driver_data.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Drop default driver data


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index dc8ede0f8ad8..8ade911e3835 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -229,7 +229,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 		goto err;
 
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
-	if (hci->info && hci->info->init) {
+	if (hci->info->init) {
 		ret = hci->info->init(hci);
 		if (ret)
 			goto err;
@@ -244,7 +244,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	return 0;
 
 err_exit:
-	if (hci->info && hci->info->exit)
+	if (hci->info->exit)
 		hci->info->exit(hci);
 err:
 	platform_device_put(hci->pdev);
@@ -258,7 +258,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 	struct platform_device *pdev = hci->pdev;
 	int dev_id = pdev->id;
 
-	if (hci->info && hci->info->exit)
+	if (hci->info->exit)
 		hci->info->exit(hci);
 
 	platform_device_unregister(pdev);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
