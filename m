Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CF6CCF9F8
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOWV5Ltm0NJKdXcyC1ecaA0Ely6/eIePrwYu1+OnCcA=; b=WKTjT1RHdG3dqz
	ncjZSmesg/l7I3QXdUp7c1Wam1rFo4tJNU0x9pzFMBxYjfj6j5Fao1ntdNgnKOSUtdzi6qbNw+T1r
	5fbSYOTjnazDOKXquKX3Zc1H9pxDIYHdbxWUmrlUKMimUP4ASI50BEez6+aTa3e+gjzQbKS+oJS+/
	LXeWfLXQI22b1tGnM/WxqUYKgM3Za7VmU9f03mE4OjYPLx/ugvXunkERSqDtjE8P/GUD8iHkn6XQ7
	/xtpEuy62PCSDO2+8VWAvxojhNMMbkXrl+KJOTlyJRcEnJo6eeL7LEZWyr8eamM2fBpSENhcSLGm2
	tmhnoBGe+2AWyUvF7FVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hw-00000008WRD-0XfC;
	Wed, 12 Nov 2025 10:04:08 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hu-00000008WKj-2kUH
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941847; x=1794477847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jM3RWDH0XmpVWAjYf7o5tOFIRZRU9D1dhystY6lkK3k=;
  b=QjGUZIIUX1DITHpWy4CGJezhhP1w/UO/fl2m1HvhhMssgUZKNMWtbKks
   jbkGVRWkm+fkdWM75cRgePjXHjEj5xfhpKWYgrkRGzNWtRSlCrtsJOEds
   kQA9AgV19hqSr2TE9BO8kqoDKKKbqPRguWCClBEmfJ3WPuoJJ+cKlA5IN
   l9J6wxbQdqj7tZFQ8WWTy7ds1mLJqQwB4vPcH23qsMwl1uUd4/RBVPKDS
   zMBKU3LoXhKKlaouyA3OZ0rvHSMyQ5zrGA7HYuuglsSIPSNgJW+EYalgy
   it2FzqDRg7FxjPF4BnTxtIau21kePu9tz5z/0O7SfP5g5ycE8esVRnpT0
   Q==;
X-CSE-ConnectionGUID: zrEMTk5GRp60OKyqvegrzQ==
X-CSE-MsgGUID: wInzuYahTQ6JRQomIClKWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616240"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:06 -0800
X-CSE-ConnectionGUID: 2+JKQH14TQecbPuBCvWsQA==
X-CSE-MsgGUID: BWNkXu9dRW++wc4U8bPkxg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:02 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 07/13] i3c: mipi-i3c-hci-pci: Factor out intel_reset()
Date: Wed, 12 Nov 2025 12:03:33 +0200
Message-ID: <20251112100339.51726-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020406_708420_56B95EB6 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

For neatness, factor out intel_reset().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 26 ++++++++++++-------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 003ae61e9f6c..b3b6b6f43af2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -34,18 +34,9 @@ static void __iomem *intel_priv(struct pci_dev *pci)
 	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
 }
 
-static int intel_init(struct pci_dev *pci)
+static void intel_reset(void __iomem *priv)
 {
-	void __iomem *priv = intel_priv(pci);
 	u32 reg;
-	int ret;
-
-	if (!priv)
-		return -ENOMEM;
-
-	ret = dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
-	if (ret)
-		return ret;
 
 	/* Assert reset, wait for completion and release reset */
 	writel(0, priv + INTEL_RESETS);
@@ -53,6 +44,21 @@ static int intel_init(struct pci_dev *pci)
 			   reg & INTEL_RESETS_RESET_DONE, 0,
 			   INTEL_RESETS_TIMEOUT_US);
 	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
+}
+
+static int intel_init(struct pci_dev *pci)
+{
+	void __iomem *priv = intel_priv(pci);
+	int ret;
+
+	if (!priv)
+		return -ENOMEM;
+
+	ret = dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
+	intel_reset(priv);
 
 	return 0;
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
