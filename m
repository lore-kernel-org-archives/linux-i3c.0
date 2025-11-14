Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7B3CE8D72
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8If0bHjNS15tdPJMk9h2zygDzFYR4fobUba7HkpG2ZU=; b=KWnTuARHeanr5r
	RgZcCVdeBy0eWPKbL6/0IlCGEx+TZnospnK56yHQKq/IigaRwBfFkZEHmsYWnhB08xRYV/vh7dddL
	nHVn5uG2UNaiCQQwBZie3+VC7SJzutAZPeAG7XTAv0mccGyRF0oZzQTVcB78VoB17YCBUP9ttg1uE
	Itbl96v9MolJ61/1x5v2ppLAvYS3q0cNtmR4PP7JKAR5avywRxCN6PTUHn8l897moKFP88KgtMEMA
	kmcWJscZAuPVxdBy1+tvsmmMEjemEzAjbkaRu9xHA/uniJY2N/R/iSnGvnk2fRsh/LYRK+0wdC6XQ
	Gsbqdgr8N6xJAlayEr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJX-0000000CwUV-3bWS;
	Fri, 14 Nov 2025 18:14:27 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJV-0000000CwQh-2lDP
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144066; x=1794680066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LA+6Ns14F1z90EXk95KYkIAaYakEoMZ085UeLSzpIlo=;
  b=EL/B+2kdvsafbz0MUK34P4QZRDnddSwO15nTpB8+XNH8nX4p8F/QtPbK
   Ug7H1ol/8eMQZJhrJrz1R+5quJCg0N9mAYgfgHHbc4/6xN8SZUSKNqocY
   fOkopuOceJ3yEwOaGtjwGSuvr23GftJuMymUoEAwMjoArmQIqUs4MSDCl
   sVwCKdCILpHyEoB5BehHUUqNtoQRYDHBzEegh3xM2DO9qjuKwWl8IaMa2
   STaKOe3TA7bpUggt7mer0jWhRqGw6bc6IjON4ul6Frf8F2F9sAdTvT9EK
   pgpAGAxhiWbgCnhWZtL+sgrZxxOJ26hAUvjMNGPPh8DYtt0LRalfAEFVT
   A==;
X-CSE-ConnectionGUID: 7z4W5t2SSbeWwzeleOhzAw==
X-CSE-MsgGUID: uCMo+LE/RPuvGAxZwKGaIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129394"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:21 -0800
X-CSE-ConnectionGUID: CA3dIDERS420stIwtHBQyA==
X-CSE-MsgGUID: U+enKZo9Q7W60usxHk69Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189668990"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:19 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 07/13] i3c: mipi-i3c-hci-pci: Factor out intel_reset()
Date: Fri, 14 Nov 2025 20:13:50 +0200
Message-ID: <20251114181356.66515-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101425_751384_6DEA506A 
X-CRM114-Status: UNSURE (   8.71  )
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
