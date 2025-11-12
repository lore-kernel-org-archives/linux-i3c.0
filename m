Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5F4CCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itlFVi2xAMRTHnbjzyQUK4aKqxDPWgCkS2GFzbk2LeM=; b=QEGYfBGXQ4OEPm
	gUHutLjK+JY5Yj8+3T4xIksMiI1Pnl8eCw8qIB5ezh23ycCGUSgysRAppRCuePbbTSzoLi6uEC5UV
	fBCcm3qfuU1tW/5mQqvwheD9iWBy7lIH+P3QJzsVJhFhwsqtCcI91zH6afUjyROmDQE76i7R+4Swh
	YuvmfL9wEMdJMHh6hOnc8s2z6CJzsrnkPoEiOhvVWYacYqu3g2V0Q+UMaD3QiBFEcNJsfuy4vSRTh
	n7zhzb8yoWucfTen6B6kc8Robz2B0/tQfxXUldnZ8JoIK7fqK3OYZosk9XSn84KZbkSjTiefz+cVF
	/xFFHr/HMGo+dKTUsJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hs-00000008WQ5-3i92;
	Wed, 12 Nov 2025 10:04:04 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hq-00000008WKj-1gRB
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941842; x=1794477842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TKZhIlc9Ildkt5QDD9YeN2aTfrja6tl1YDGg7eh5JN4=;
  b=Lh8bESReoKZAyJj5dylNI3CTDDhieMGuBPpe6kIk0pXeEuKKfIWpP1G3
   xsc0yp6MuEoQtrP1h5MJYaDIOM/TKAiSKpI/unaEGv777nhJ6/tjT9GL6
   uKWZh8OX3KYCw9bGMoUcw/S+8CE334NDiVLp3rc0OQBEG+UKJesrLlKCe
   HwANcMeTRWLjQ7EbDCRwLqNyLtzUCTjrSeM0xG05TSIM51eqCq3jPm5ON
   j1msjYNYnG8A53oLDRDlE19ba22GWJrj6sHD/bEvnSd0f4tL9psrilJbx
   Z8Kq7kgUhdpCZGbEdiDYwnjsMw3Prv9lvZcN3agvhxFBAQyGj8ZhjS99B
   A==;
X-CSE-ConnectionGUID: zhxkROV3R/GVOmLp8hoSRA==
X-CSE-MsgGUID: R4S7HAjiRZ6+2ZA+7a1CNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616222"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:02 -0800
X-CSE-ConnectionGUID: suO7ALQXTJ2XDr+L350ixQ==
X-CSE-MsgGUID: /kdSpVaHShObBFsjXQRtrg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:00 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 06/13] i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
Date: Wed, 12 Nov 2025 12:03:32 +0200
Message-ID: <20251112100339.51726-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020402_456911_323F5769 
X-CRM114-Status: UNSURE (   8.01  )
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

For neatness, factor out private registers ioremapping.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 59c592446b5c..003ae61e9f6c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -27,15 +27,19 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		10000
 
+static void __iomem *intel_priv(struct pci_dev *pci)
+{
+	resource_size_t base = pci_resource_start(pci, 0);
+
+	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
+}
+
 static int intel_init(struct pci_dev *pci)
 {
-	void __iomem *priv;
+	void __iomem *priv = intel_priv(pci);
 	u32 reg;
 	int ret;
 
-	priv = devm_ioremap(&pci->dev,
-			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
-			    INTEL_PRIV_SIZE);
 	if (!priv)
 		return -ENOMEM;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
