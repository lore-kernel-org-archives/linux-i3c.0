Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACFFD116EA
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOeCCphihnzB93y+q/3PmVyeBEUlp++O+oK7o9dRZJg=; b=PrBb+hmac4+fgx
	LeARUTJQPgjKnw1QDqudQZM40z6q/Nx0OYMxHL7WT5MNucyjbp99jUPMAmatBqlR0oFDmr0gH2hko
	G+n504gBCtl3G/r2X407wdIFM1/wrLBIWXEUpfgWaTNTDwuFZUykS4mCepyittgUpkm+IVAKJF+bX
	oTr7U9yhfy/Na5Uwibcd20OS3rgJE02aRqkFxyOuogoM6l865ArEhW5D5zEllX7E9arULaCGyjnzW
	gfVelHFevyOfxg/oydC8hmaO1IaVsVUUtRqUjjqyLnLTzV7iMXyidAbpwJRsxGZvQiNQ1Ewjxvs9V
	/0n1DPDtrpr9Pzc6Oi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA8-000000003QS-0SYD;
	Fri, 28 Nov 2025 06:41:00 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA0-000000003Oi-27Ge
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312053; x=1795848053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B6l/UlthmUJN1gluuuniymXSfGXGtbmJ41uYWJy/8XQ=;
  b=QtIWl9k7b+T1QCnCq1CHqWxFxbt/wn5s5iDI2n2Xy9UEhfCd5SpABinh
   6zQfolhzMautk73uxDKqxbrfz83pJ+R3mwas7BEsS704lDo4WTJX8tjyl
   Qa8nDWrbm/Rs2U2j5CZXrHRzc0W8i1tqh+a3mwiLEJh2VCOJCmAlpm32M
   rv2muUu9hoAu5R2zQ6etugZSR+1vr5O+q4ph4jjnjVeNszbxEJNwrShhC
   HlZaQ8mR4s3CAjsoD1R7lFt8THTj3eeXWx5U1l1RKkazOPBovEFZeT/SH
   +uKM/P59fkgtBlNFHLRDuRpfJ+12+kyu7lS2HXF8IoGfD7B1+WNoLvmOn
   Q==;
X-CSE-ConnectionGUID: COFiHc+qR4SwztRGe/t6ZQ==
X-CSE-MsgGUID: YGbIkuDESZ6Yaq2JsVzogQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059926"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059926"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:52 -0800
X-CSE-ConnectionGUID: gKs7nSvaQk2+gx58iwM1wg==
X-CSE-MsgGUID: tqr3l9P2TeyINV3Wa4uoyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348050"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:50 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 01/12] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
Date: Fri, 28 Nov 2025 08:40:27 +0200
Message-ID: <20251128064038.55158-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224052_582198_34F16BB0 
X-CRM114-Status: UNSURE (   8.68  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	None

Changes in V4:

	Add Frank's Rev'd-by

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
