Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF1CCCF9F8
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfN57Gc15FK7SJ8szsw71Mt2Ugy0LKIRb3z9/L/uwyk=; b=odl4jPYOmyTS3v
	0rgOqsqoK7kIhKcV6i6MiCWek7EAZuTez+ai74raN+rhJciPH0nJEG9GE2F1ANcFPhMJ/1enKnDpO
	KzxwnwMVqwRyEthp1UZDKS/PypB4HGmZQRk9zH67lwY7mT7AcE6TQHvFj6Lut1jrbgigzSi6HOLUp
	ZtdGv7czc2pVXz7/xHfQ0RJUmO9+rNmnHRb2RVvBqwyTdIuAj56TNqIbXJts+ubuFfbv2g5/R6Bz8
	99D00aWphQR6iuLmYgP/uM9ORyUcFuJRImx59I3hUKOgEC2kqyBNrnGkX/qbnm6p9JEk9F5e/Ai82
	7xMiDVjb5lqWc9r+t9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hq-00000008WOb-2bq8;
	Wed, 12 Nov 2025 10:04:02 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7ho-00000008WKj-3Awb
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941841; x=1794477841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n+bTxUNYOxmpw9T+OtML4pp4MatvQiIV094o1rFYtPc=;
  b=C7uu3yFhhVESoSFaAYN/5mJxIE5i9ZPz3Vs+pdPz/ZPTlvZfi+PU0VMh
   0dbJczaGLtjD/rkjbmZVLt+QvsNcPA+NAdCP8plo9yWC34ddiry+y/wzf
   VKbbYllou5tWqgQgVDAbUx6HcqKtgMV2b5vufstJFRl5lirmZx857nwqa
   si5fI3XlZhtYqFSBj2rJQ8yqeRgAufudAuTeDWrSHY3dpTM9s1CVi8WSz
   Upz0T+YwPP98GPX9QarBixKedAmrHXMlks1k6LbYLwa1RfYdEMrytLGTh
   xVLmZIqZY9EPQ9k5+VVHxstUowXUBB/w4NZNmrVk61hKV7LI5/qBo2Lh8
   Q==;
X-CSE-ConnectionGUID: FjtJUQcqQmi0ND3eF6KeYg==
X-CSE-MsgGUID: 1NRr0EqvTi+F/Dk4+wAxLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616216"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:00 -0800
X-CSE-ConnectionGUID: 9LTLGG9ASYaGoI7MZDpAAA==
X-CSE-MsgGUID: MVSXIYdzRtuSVo/cHjtvzw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:59 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 05/13] i3c: mipi-i3c-hci-pci: Constify driver data
Date: Wed, 12 Nov 2025 12:03:31 +0200
Message-ID: <20251112100339.51726-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020400_808016_20799475 
X-CRM114-Status: GOOD (  10.44  )
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
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index c15e0556a691..59c592446b5c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -53,14 +53,14 @@ static int intel_init(struct pci_dev *pci)
 	return 0;
 }
 
-static struct mipi_i3c_hci_pci_info intel_info = {
+static const struct mipi_i3c_hci_pci_info intel_info = {
 	.init = intel_init,
 };
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	struct mipi_i3c_hci_pci_info *info;
+	const struct mipi_i3c_hci_pci_info *info;
 	struct platform_device *pdev;
 	struct resource res[2];
 	int dev_id, ret;
@@ -96,7 +96,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
