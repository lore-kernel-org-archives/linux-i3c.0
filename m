Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38221CEBF61
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISHBV5RUhdbXBa3aHXFNDCRl35kQUtiUvGt3ZRSNFmA=; b=uTS0POmxi3a/yt
	aW6JMN9JpifW3lr5TmTbTzE8LCju7De7BwceP7QB6h1m0AQcgYora1USoyxgPYfXmklgpjGC8zyfp
	3XbyXypAmBztOWZcHbq6SA+6MzQ6+5vmepwcRF15EtE1DYCmp630es9HWKMf00s4xzolyhmjLENfs
	FamyeGw8O5GZ92Y7qQsSY1Eu47Cx5o3ETJUqzUnKr3+yhM8CGYhLtv6YuWdR+HYsbZ5wf2eAqctP6
	LuxePAO1H9TtR0XKvW66r0zw85w702+KlPikxD4N5l9p/g2DPnWAgoMCkYxWH3WCHhOb3YloWPVjD
	EAWLZS/xWd/fFwma/cdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5k-0000000GA4u-40YQ;
	Mon, 17 Nov 2025 13:16:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5i-0000000GA3t-1DVy
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385382; x=1794921382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3YiE1gLEUcvmw34qSe3Qq/Kua1UK2fTGLsgyTEz2FCQ=;
  b=KKzFcQyCiso9L2c3HlZzfUexEJGavpthyRuEa8O87oYUUqKq2Gskcj8j
   QHnkEg5BEgGBI1KdyuEyKuxrEA32QOPq7027TQ46z0RW6s/NYSiUUQJuI
   1apxo9dja/rBOJM/Y2rv7yKWlnvbgTA9ha7C1bopn7rJvwYFTXl3cEfTA
   p0q7NGnhdMRm0JQUw8dny4SVfio2K+f+iXhNdo3NyGCgVlKl74tKEy02T
   c8/hUWfGjEmnQ2qCI0eE/yKtYCCAEWr39rLprJv5dbeUEg41Ma4+zN9nv
   mtNMV67GRidjR9savJXlkiQSQ4TrPCGI6K6T3jp/5wNnPpfhF5Us1B/TJ
   A==;
X-CSE-ConnectionGUID: kL78XADPQW2M6aM+3x2A+Q==
X-CSE-MsgGUID: HR6deRrtRNuKgkLzYjKQqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009054"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009054"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:22 -0800
X-CSE-ConnectionGUID: AQPCdFDFRK62JMjTG82SOw==
X-CSE-MsgGUID: F+z6b6RXTH6Us8mHb/u2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549280"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:20 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 01/12] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
Date: Mon, 17 Nov 2025 15:15:57 +0200
Message-ID: <20251117131609.65988-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051622_349339_3E436760 
X-CRM114-Status: UNSURE (   9.24  )
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

All Intel controllers support 64-bit DMA.  Set the DMA mask accordingly.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Omit mention of IOMMU in commit message.

Changes in V2:

	No need to check error from dma_set_mask_and_coherent() with a
	64-bit mask

 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index dd4484eff2f0..3cd15ca7d391 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -36,6 +36,8 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
 	if (!priv)
 		return -ENOMEM;
 
+	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
+
 	/* Assert reset, wait for completion and release reset */
 	writel(0, priv + INTEL_PRIV_RESETS);
 	timeout = jiffies + msecs_to_jiffies(10);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
