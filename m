Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9CCCEE33A
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRRCpyIdRRX2gLG9aHNEb1ZwV0i0cnowDuCZN1ohwlI=; b=d+CefVbJatdJ6V
	K0rVF4bl1bJoGVSTupvTWXoP5KfVtxpAvF70SwNdIb3tXwROKghtC6Yg0PECBMcbgkdQS+OtPL6HR
	LPEz8x9TgN269Ee+XUkmx+BvtG819Py23fPSL/3z1NRoneXJ1VaGWjUX4veyT3+fLwLSWvyl5Zw1D
	LA8zAGAPPTMqnPKTIzFXLtDFnxYCKFEa+vlrfsKsha2C63FtvMfqiApXp439A+t8HpYQwxaq9tEcs
	L9dBcVnPrugXHCnRO0RXZy+oJBsffXdcqJ275x0y5OBVEv4BC07nnm9hYDTG7md5vmxEeHpz90w++
	OKMjX/YA16ujI8UZT42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpV-00000000lxD-4ASv;
	Tue, 18 Nov 2025 16:45:22 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpS-00000000lsT-0yoZ
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484318; x=1795020318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vCu/OkxooQjfPkcpqOMXTgHhl6jo1Nju0BO5y7eDnFI=;
  b=GJ6KTusBVe016qVH5duRDd30l8Vysvjz1PPZB56KcQHS622cwDfmNf0L
   Rwm5Pq3N0IVW2nSImL2EXWvVV/H2izgYAtwW20ta4mKhT/NuNKUcquwch
   9wzhhq3rE5H913UuaeH1AOK7bbVvP30vX0vc7P7kMYp6WUCJyFHNsNsBr
   UQ1N3ziX8+6k+AAn0mlekdgp06+WLqR3n2YSdHbzq23uF0m72QO0BWj49
   MbuQ+n53bw5FLwskQmGZYvBqkB2jZ1hOPZn9HRVnPW+x99xDnxXgP0dMp
   lroWzOSX0071QwmWGwpHBO/P2W3D9xTwo7xXZg2u4Pr6SZPWwGw/UATzq
   g==;
X-CSE-ConnectionGUID: /nEVFb40TryoZtupICmbQA==
X-CSE-MsgGUID: ofhEcqyMSmWU4TriHy9mgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510690"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510690"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:18 -0800
X-CSE-ConnectionGUID: XB+rBs9SQeyZHWK7sMTy+w==
X-CSE-MsgGUID: BlRK0iIdQKigfkuwYlrMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221462952"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:16 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 05/12] i3c: mipi-i3c-hci-pci: Constify driver data
Date: Tue, 18 Nov 2025 18:44:46 +0200
Message-ID: <20251118164453.55532-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084518_281426_251F8061 
X-CRM114-Status: GOOD (  10.78  )
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


Changes in V3 and V4:

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
