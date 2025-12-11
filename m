Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACFDD41C38
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SXv3KlQzjvoBqbra2GhnCbYbcZN8p/V/Q2/Rnqfyf8=; b=NseIPIEY2KFK2X
	kLIgKFdVYH7ZrIBv04tnO/TAxyFPwsFmuXlEW2QQi4P9EpPBua39XIgHA4K2W4MAndzcAf3+1eiNy
	QZAeDvSQaeBVpyx9anLgvMIM78ueWXarp4bUwseQQzFN8bBDGHm6oba4tUt7JdZoWHKrRx6xGdcIy
	uBVhalz3OC4wjSY/h6370/fVUAFXGR4RN5WvJk//EMCn6KJMhRtbkfcE8xq9JOxreESJwgA41lyJU
	EQtPEJK7Y6SgiIF+2F7HOlCeJgi+tOZB3FOjJ67Vq/e8B763N9m9c1/jo+77+FIO//DAiTfTXCrf7
	61qN2siexb5sj3DguDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh26-0000000GfhL-0ZBC;
	Thu, 11 Dec 2025 13:48:38 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh23-0000000Gfc2-4ASY
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460916; x=1796996916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QZ/NwkhGF8sX8iFlgLsxIilFnUpaSbQIb3h2nlIa5D8=;
  b=oLGAaaFKvsSXYUUIU0/grH/FeN9iyrU6EVZ+2y07mLzyDP126NmLieh7
   KJ29KOovWgAMWAFyhifjsUBa6odyfm/K9h5vDMcTmYatIqvMTicfAG0Ne
   /yFVx1VJzHJQPKkMXtVzcRaSzZwgCqvIUZh8dW+403v4M8dt5k0SarR1M
   WvaJeZVMnWXrf6OSVLjEC2qBh5YHXoyh9qYgv2GW1YoeOkHYp5Z4wH+E4
   6zziZL2Rge2u1OrIudJLR6rBaMEx0NlDTJgaUo+wfUDNKluoiJh9i6l6X
   tdlkU0t8+FITbrFthyH3DXMt7U3r46S+b43ns/tHyarYYE5HqC8wfbWSb
   Q==;
X-CSE-ConnectionGUID: kJkRcl4CR9WkCVyCa0pPjg==
X-CSE-MsgGUID: 0kaoSiK9QWuAp4E22kvvug==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481890"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481890"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:36 -0800
X-CSE-ConnectionGUID: 54VDgcQpQ1eEReilX4oNaw==
X-CSE-MsgGUID: egEFLY5wRX6KnolxAcZvXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171680"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:34 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 05/10] i3c: mipi-i3c-hci-pci: Do not repeatedly check for NULL driver_data
Date: Thu, 11 Dec 2025 15:48:04 +0200
Message-ID: <20251211134809.75872-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211134809.75872-1-adrian.hunter@intel.com>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054836_044138_3B36FAA3 
X-CRM114-Status: GOOD (  10.08  )
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
---


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
