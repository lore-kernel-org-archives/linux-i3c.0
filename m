Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC65D3B7EA
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 11:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoVLye8dMSB2mCJokSL0QZQPBcylugZZjBkoMvwI0lM=; b=hLWFkvYp5hoDVM
	0SmT4UeT031naDrQl4+oX2rdtWndzPAGvt2oPhB/Q+gRDaYPydreQkbrTxQ/PH6Zf4YHi1Pw+Qnyz
	q65WFcGUVYzclPaWHl+AsoWXBjDn/KGzJsP0914jSu/Ajx7lQu2vQL72IkGhjiE9qyyZ5Iw80Rcm7
	IuYPa1w8n3uxoCM9mhp8G/fd8h4qvXoUoIeZU6471pV/Un7LU9IaxPKDvQ+GxmIMy4tKF2cNyQX1E
	lNwdwd+3qfKehBT5XOZ8WuR8DOCLqNca5RJwVtUzihX2fYTChgB298D6ecudtVn5QNlUBkS6jiIzu
	KZlDHOjko4vxHcwge98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFZ-0000000EDO7-2VNb;
	Tue, 09 Dec 2025 11:51:25 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFW-0000000EDK7-0s4w
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 11:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765281082; x=1796817082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QL1f1266GRtYeWYedMYwJsbamQhsw93xyj7BQLY3vr8=;
  b=fYqjMdPpqrv3jhTU0ADo8qYmw9QUXvPbbKBc/zAWOKH0xhM2UaKtkBlT
   12TJ8Iv/fyp4eZDK0t2tu6JIm1AVryk+4PtpZZrQ1hjmw1EhlkQm/lZSb
   QwHSDylXAgiuQmCGzyP3gpR/x1A33oS1Fd1CU58i+Amc8QR1xPNEI3ESM
   FeYToOGPLtSNzf6C5HCwy0WBQRtCNEXzkTdubvpIZrTe7LcztdZOfyT+C
   Eo3Yr2r4g2fSscueIvACQ8/yoiUKMv/nLGX9JSEPraUPlIuFT24prY7b8
   y3qU4YPquOQk3nO/88CbVpzK7ldTQRtd7amlvD16RU53Z8iBjoL90xXcx
   w==;
X-CSE-ConnectionGUID: CiKhjMlDRXKwsF4Px50y8w==
X-CSE-MsgGUID: +hpKMWkMQk69pPz0NHNo2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67271179"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67271179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:22 -0800
X-CSE-ConnectionGUID: y5Tz0BQYRy2/cClEvxZENw==
X-CSE-MsgGUID: NY6vuhyoTuaxW4cHQTS4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200644438"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:20 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 5/7] i3c: mipi-i3c-hci-pci: Define default driver data
Date: Tue,  9 Dec 2025 13:51:02 +0200
Message-ID: <20251209115104.124156-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251209115104.124156-1-adrian.hunter@intel.com>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_035122_272990_1191690F 
X-CRM114-Status: GOOD (  10.40  )
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

Define default driver data, to save having to repeatedly check for NULL.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index dc8ede0f8ad8..ccaec5d3d248 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -184,6 +184,9 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 	.exit = intel_i3c_exit,
 };
 
+static const struct mipi_i3c_hci_pci_info dflt_info = {
+};
+
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
@@ -228,8 +231,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err;
 
-	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
-	if (hci->info && hci->info->init) {
+	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
+	if (hci->info->init) {
 		ret = hci->info->init(hci);
 		if (ret)
 			goto err;
@@ -244,7 +247,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	return 0;
 
 err_exit:
-	if (hci->info && hci->info->exit)
+	if (hci->info->exit)
 		hci->info->exit(hci);
 err:
 	platform_device_put(hci->pdev);
@@ -258,7 +261,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
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
