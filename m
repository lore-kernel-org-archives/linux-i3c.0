Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76264CEBF61
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mso7+8eq/PjGkRy1o1rtQMvhAY+7XKdt0X222tMrFkE=; b=l0CO5rXJArvz7J
	mmcq0PK227pnZ48RmOWUSDGWHQJojw2rIs9Xxgdyju4fMcygEjiWwuQs+DAWIgw7CHZ5IeJ4sLjvI
	KG9sdoSr7Hu8g6NhFRdwoYnX8L0eOrtMdqfu3gRAh7d5q6WRSI5UC1r3l4gnASfsxdqSiSIuHYx6/
	22elz+EqDD88HGC547abI9Yn9/LjnMElk0uOJtMSjAvQXHAgvvqnE1AjCBw+zXFTfNVJkCwkPINO2
	cCZCBQmWSHJRJ09Q9PVpigQfAN2D3yMX5RKEblQt9qIRt6fLyaKytGYc6/cgLWjhDf27Czjspt/rl
	lb6RlDILC0H70Q0YZUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5r-0000000GA9F-0uOJ;
	Mon, 17 Nov 2025 13:16:31 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5o-0000000GA6C-41Ex
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385389; x=1794921389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N7Bb86Pnx04Kr8AosXiic25Pmo9Hv7Mxwb0AGy5zxn0=;
  b=C5ZJjEholybuV57iDhRH5AoyldosxN78yu0z6wEbDqSfmPIwqnLeRw/n
   3sXnmt0+lUqXGEKBvqGDfiFkW7uAvWIsGG+FSuilcnQ+f6bzgD54qMyzJ
   w1rWRvI4VOsVFBzonwV5Ul4THt9zisC3Qp+wCO+djXMJOFobJ0yTNrd/1
   KOxGD9p+6d28rWYDNWo28uiQhrN3iTav0RTm4WpQfuh3XzTivvBAG/1hg
   2EfMuLt1Ep1xSytmNKBWMl/BPyxv+VzzgPwDsos1Ui3Dg3VhR3pSfhMNX
   69WHUk3pu4qQr2ie5nrmErLk+P1hATq3gs/PhM6i5iOdM9myNY3paZ8fe
   Q==;
X-CSE-ConnectionGUID: iSkKknEARZm7RFEdXKvSzQ==
X-CSE-MsgGUID: JqpgSxXWR0S91qQg3AEPgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009074"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:29 -0800
X-CSE-ConnectionGUID: +OwDApkOQ3yqEXXfQ5R/Rw==
X-CSE-MsgGUID: T6WEy6V/St+jwGCq7VZmjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549324"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:27 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 05/12] i3c: mipi-i3c-hci-pci: Constify driver data
Date: Mon, 17 Nov 2025 15:16:01 +0200
Message-ID: <20251117131609.65988-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051629_005398_CB7F932B 
X-CRM114-Status: GOOD (  10.66  )
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

Add const qualifier to driver data because it is constant.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 30915d78045e..abc7bad5e069 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -50,14 +50,14 @@ static int intel_i3c_init(struct pci_dev *pci)
 	return 0;
 }
 
-static struct mipi_i3c_hci_pci_info intel_info = {
+static const struct mipi_i3c_hci_pci_info intel_info = {
 	.init = intel_i3c_init,
 };
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	struct mipi_i3c_hci_pci_info *info;
+	const struct mipi_i3c_hci_pci_info *info;
 	struct platform_device *pdev;
 	struct resource res[2];
 	int dev_id, ret;
@@ -93,7 +93,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err;
 
-	info = (struct mipi_i3c_hci_pci_info *)id->driver_data;
+	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 	if (info && info->init) {
 		ret = info->init(pci);
 		if (ret)
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
