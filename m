Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57076CE8D71
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2I5vjrBayQwq2Z14goblf/2oGa+LxORH6lrGofa/IRE=; b=gIba9LcTahDaFw
	ebFWMwOZgOILT1iBGm00tu2yvRWz+EaA5TJ6qgXSscbYk+2DZakoqrQ3gNHjnBBHFtGYI02te10JC
	NS+xZg9fCUOCnmquHwipxg2FIiH2j+hWfhwTRiMKCX3FMSplXS5VZlc45Ri6L88cZGYY0lX5ST31J
	08EzG3aDTb5PC+E7ahh3xHZMHJH6mt62BK/csOhERuEJsz6SkewoPyDRzFx4KFBFI35tmg03hOhEO
	1VShRv7ZLqtjoBWM9PxaLE+E4KXZCDOHtiR8z0Jy7Ig7sWAwAX0uZgWFbV26zfOqnd5sX9qSHt51j
	xmXE8kpuLr1MKmLj2/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJW-0000000CwSx-0WmN;
	Fri, 14 Nov 2025 18:14:26 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJT-0000000CwQh-1kkg
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144063; x=1794680063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fbv4S4UpsOU7qLi9Zg7IW0GSdBtqVeTDA3SG1p3qVJM=;
  b=cKPEyZ8MY1FJtt/xmhZiSVy9ooHqtIiAx4b5wnYw6urxI/Udj1M+6JG8
   wu5hV5nRjtEDzFsjDipITo5HysZ0Obd9F9NZ1Tnn7h/NFBdHSytiHLnTF
   XI1eCzH9gLqb/uw03Lj279m6aakwPkB4a9ITpyInTj7vTH8kgYIrnoJe1
   F6wRoKJxVj8p1OiSJ6xWVL41I/7uLwolNtNZmoSVOg7pzmQn/VhEhLloc
   aq/mOjpHVRyZoiAuDO0yKZDkNQV4h6ij4iytCveXa3hSBjBR1RdsIZD2F
   xeh9uoQACqp9p4N9ScIU1FKFDJ+o3C2Q9mQDE4dJWwgeY5Fd96j8r58nL
   A==;
X-CSE-ConnectionGUID: r04aZG75TQiH0oY2XZC06w==
X-CSE-MsgGUID: RlcsBrzLThiz0PqRDpiCKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129375"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129375"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:18 -0800
X-CSE-ConnectionGUID: wHOMrfZhRkCvk/GIRZJatg==
X-CSE-MsgGUID: q5BcGVBRTiWLjwZPVisOwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189668981"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:16 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 05/13] i3c: mipi-i3c-hci-pci: Constify driver data
Date: Fri, 14 Nov 2025 20:13:48 +0200
Message-ID: <20251114181356.66515-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101423_505281_E16081FA 
X-CRM114-Status: GOOD (  10.39  )
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
