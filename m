Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9410CC88E64
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2+dnJc4xPEWlx/EfEU8/AIQhO2qy5J8SYjpUqg0zpg=; b=xMoOr+GIfBxMfY
	O5/8UM/EiACo+uycAJDUnCnFnTq0WKo+w+gdkTI9Ks+bKz5DpbhAbfr+7lYz+dPr2obiKruhxRreQ
	hJa4O4BrOYXw1892oatelLBjugtnlc0JjYTVAAiesudSeWA1Toqt9JZ34ie/lK9cffrzNokkXrWyR
	TeNksy/8SgtR0evLjx0n13zYr5PL9NAt8roB5J88pp4gyPC/694oEGq/466/H2Bd2YLOyXNfU/URA
	w1t6LdKd3BaSv/yc9a4AaI4wkn3sdjXl8qW8lpOp0a2CnccXnUgR4v7yj3k0gJrkpFztHkXMLd391
	2HD6+bPuQut9CnlLIdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tO-00000003F8n-0ytc;
	Mon, 14 Sep 2026 11:30:34 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tC-00000003F3I-1H3L
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385422; x=1820921422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/qRaVzi57uA1RVt6op5h061fdRuK9AL6oojq4XEDI2M=;
  b=MNEVY2Adm+JYYjyPHBE6AnS/dg3UUvIESF8AeHSTHa4l4BN65oRCzYoI
   N21DMmjQietg9nz+z1E+jGKzukAjNdG32lTrsRSxkdXJMkTU3EyTvmnt+
   ymhXOPsUa/qHO1FjMVKOn3cms+suPE4khYl1j6rmtHTeIOVs8G1E+1PcX
   5eTaUrfJOph4GYFrrcOGJhhTDgj7Q3LE6TXwSU1pB9IyM+TonnKlcyhbL
   klHpQc2KBD/GhnB4fy5dvdxrkkcn+EquFUjjHy4CmCt/5yFK8eKGWxrLM
   awjfDwf4JGB0r+S14MqGDTRN3n7cS/wXBDFgUe9ZBz7yXGICJnntilfc6
   w==;
X-CSE-ConnectionGUID: qfvLy8sNSZWa6bmwknJ74Q==
X-CSE-MsgGUID: 6yYokKuYSfyWnSULxKjEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864420"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864420"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:22 -0700
X-CSE-ConnectionGUID: nIFkBfFPQjuDGNbkn5+V8A==
X-CSE-MsgGUID: Rudr8J3cTci5upHLmkQ++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133086"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:20 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/17] i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
Date: Mon, 14 Sep 2026 14:29:49 +0300
Message-ID: <20260914113003.183150-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043025_562709_F80CF7E7 
X-CRM114-Status: GOOD (  10.94  )
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

intel_i3c_init() creates the pm_qos_latency_tolerance_us sysfs attribute
before probe calls pci_set_drvdata().  A userspace write to the attribute
can therefore invoke intel_ltr_set(), which uses pci_get_drvdata(),
before drvdata has been initialized.

Move pci_set_drvdata() before hci->info->init() so drvdata is available
before the sysfs attribute becomes accessible.

Fixes: 884a33131f2a ("i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index ab595661db1e..af9595009b03 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -445,6 +445,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret < 0)
 		return ret;
 
+	pci_set_drvdata(pci, hci);
+
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
 	ret = hci->info->init ? hci->info->init(hci) : 0;
@@ -455,8 +457,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err_exit;
 
-	pci_set_drvdata(pci, hci);
-
 	mipi_i3c_hci_pci_rpm_allow(&pci->dev);
 
 	return 0;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
