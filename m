Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D2FCEDDA4
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8frtEzrsMkye9zzXcpxmNDzwJzdT1qYZSDSAD1hhToQ=; b=pklg99DdCBNGbb
	j9mLXF8LZ2dK++9dgtOu1CO69qZp14Sm/a+yZZl2nzCFF5y+wbo2nR6pur0Y8e5xSVA/X6tYW7kjT
	OTb8e9qf+oAESAsjVWxBpIZe6szCCW/z69Rq4gJnd/RKL+MnjIWiz6xPeUrYwJXHe7UIzR+TuqDlG
	rlsYM/BvsIH9UhPAjAr9jZCXKNVP5PWTM3RPQdRQ2om2GKyeAmaY4xAnzcqX0k5m0+LNJNoZrNhFB
	eaPNJBu+SRtNyK7dS6sddxopal9sHLFzXlkzNkwy6EwWMNbe6nJd3YuHuxULGoNyUKPHGZNbxfhQe
	2rhseSODUkEFJo1C8/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpZ-00000000m0C-0oTI;
	Tue, 18 Nov 2025 16:45:25 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpV-00000000lxB-2nV3
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484322; x=1795020322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KwrnXwKOliiHY7WAyJSQBUpsjyS2dU6dXR1jcBZ5w9Q=;
  b=Tso8Qag2dwYuqpz0UqW7Xxi+W59SHWF93sMVLxnDrxWmw54eHCqQ5i+z
   gT+givpkNpq9QMxI9u1Ff7qV4dZ54H9zhyLwk4BvKfmlIYDTeFM8nRcrK
   SdNrVYAvYj9KbG6+ofFHpjxZL54Pq0iGxjckornPvIJ2PByoGhswXaV03
   IBWtPYA2fX8BxmN6Cte4WdHLX0QSK8eRLk0XnBnw+Wj6AZGUBwEm4HYtb
   Gsr1dIQE2BatoiPOnKcMEuiDhvIyb9UjDhuOXEccDzdvG/Gfn7hNqhhrA
   6RxQX0V5DEAswzVSIMif7z63fL0wvLEKofRgEUYeTUNok0PYZAU+Zq7ty
   A==;
X-CSE-ConnectionGUID: MYByTV/kSom9dYjN4OsvUA==
X-CSE-MsgGUID: SxjlUuTrQseD5jdgmEFTtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510699"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:21 -0800
X-CSE-ConnectionGUID: dtnVHLL5TPmmZ2tupdY27A==
X-CSE-MsgGUID: 27mxxncWRSOoyPwCAqZMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221462980"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:19 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 07/12] i3c: mipi-i3c-hci-pci: Factor out intel_reset()
Date: Tue, 18 Nov 2025 18:44:48 +0200
Message-ID: <20251118164453.55532-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084522_625836_5E0F5F2E 
X-CRM114-Status: UNSURE (   8.78  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Move location of intel_reset() to get a prettier diff


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 1e1f2c42bd74..b9794212b2fb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -27,6 +27,18 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
 
+static void intel_reset(void __iomem *priv)
+{
+	u32 reg;
+
+	/* Assert reset, wait for completion and release reset */
+	writel(0, priv + INTEL_RESETS);
+	readl_poll_timeout(priv + INTEL_RESETS, reg,
+			   reg & INTEL_RESETS_RESET_DONE, 0,
+			   INTEL_RESETS_TIMEOUT_US);
+	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
+}
+
 static void __iomem *intel_priv(struct pci_dev *pci)
 {
 	resource_size_t base = pci_resource_start(pci, 0);
@@ -37,19 +49,13 @@ static void __iomem *intel_priv(struct pci_dev *pci)
 static int intel_i3c_init(struct pci_dev *pci)
 {
 	void __iomem *priv = intel_priv(pci);
-	u32 reg;
 
 	if (!priv)
 		return -ENOMEM;
 
 	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
 
-	/* Assert reset, wait for completion and release reset */
-	writel(0, priv + INTEL_RESETS);
-	readl_poll_timeout(priv + INTEL_RESETS, reg,
-			   reg & INTEL_RESETS_RESET_DONE, 0,
-			   INTEL_RESETS_TIMEOUT_US);
-	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
+	intel_reset(priv);
 
 	return 0;
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
