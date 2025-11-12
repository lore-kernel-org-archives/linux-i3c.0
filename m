Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A652ECCF9F8
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2unDJhnqyyAAEKZfDOSpVeZKNo0MbAF9m97nckrAayI=; b=Go6aWi86w24xK0
	TTrmn5K41ArcgKJIRzI+j5xi+lUk0WD30CEjF80rClqDCu13+MsW1xd+T1XhQnuMHXssu07xfy/GT
	Uh6KzQAnO8OviaroSnTNiHk1u8eSdbt1LgvSzpomsL1xpPtMN6dDBm7h09vzZAcofM9aJH0MaW6BB
	6iZnEGslEUrFP3vNpvihFNNpRmgmkralG9IpfSoYFpsNRTXKYxitUXOGza4FY7y0FJ4TEi5FiCxsv
	BqgXkWns6eYEEwOpXRQuV4B84IYBtkKSPvnT1/W4e8ME6NhI/fsvXsdqmUmrrk+TWEqYV9Fn9Alfh
	0wq9eyrTcBl8I/PpFcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7i3-00000008WWg-1mh8;
	Wed, 12 Nov 2025 10:04:15 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7i0-00000008WKj-3XYE
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941853; x=1794477853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dnuaygvJTF+oZrcNXyu7xxAsp04msxbe2U0bnUcQHGs=;
  b=eUWqHRE3rIP5TlMenyk+x8dmkGbn+dxkfJ5s5xkrljYd4+lNgxSQZYHr
   inThc6XQ20Pw2u0wZjzLjforWggsmVU5xG+DbyAqB2NglKu+3mHr84Ogs
   1S7ivkDHMfgXbgPccBzrE/qWm58lfrPQg8I9SABtxkS4xtIuChxcLpBy/
   YLKIzT45+AvgHEK4S2NXQsqKFqdFYA1sD6w6DkoCriWH6HZ5L+6IhdtMd
   LTK9sC9NJ0GcWbrDF+8tH2N+zpWpM6/1ZYX2vN+Sv4T7wDlSTmCTKoTcr
   TFKu17uZR+QWcz9bnmZZoIVqXIiSA9l4Yl3tZkscSFs3Gjtni0iQZp0Pr
   w==;
X-CSE-ConnectionGUID: wzworWDHR52bIbS6XWcrTA==
X-CSE-MsgGUID: C0twm241SSmdXSF122UwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616257"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:13 -0800
X-CSE-ConnectionGUID: BGfIc0LCRTCbUFakvMb0mA==
X-CSE-MsgGUID: A2rm9W74RFyCzfbiXqgrog==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:11 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 11/13] i3c: mipi-i3c-hci-pci: Allocate a structure for Intel controller information
Date: Wed, 12 Nov 2025 12:03:37 +0200
Message-ID: <20251112100339.51726-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020412_947230_F9C5B865 
X-CRM114-Status: GOOD (  10.87  )
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

Allocate a structure for Intel controller information, in preparation
additional changes that need to store Intel device-specific information.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 4209e51257b3..d53e9dfc5ceb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -18,6 +18,7 @@ struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
 	struct platform_device *pdev;
 	const struct mipi_i3c_hci_pci_info *info;
+	void *private;
 };
 
 struct mipi_i3c_hci_pci_info {
@@ -34,6 +35,10 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		10000
 
+struct intel_host {
+	void __iomem	*priv;
+};
+
 static void __iomem *intel_priv(struct pci_dev *pci)
 {
 	resource_size_t base = pci_resource_start(pci, 0);
@@ -55,16 +60,20 @@ static void intel_reset(void __iomem *priv)
 
 static int intel_init(struct mipi_i3c_hci_pci *hci)
 {
+	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
 	void __iomem *priv = intel_priv(hci->pci);
 	int ret;
 
-	if (!priv)
+	if (!host || !priv)
 		return -ENOMEM;
 
 	ret = dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 	if (ret)
 		return ret;
 
+	hci->private = host;
+	host->priv = priv;
+
 	intel_reset(priv);
 
 	return 0;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
