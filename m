Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF816CE8D70
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ylctrRKZEZv+HlUab8p9GsOfQUyAgriNaYYuEW9E5U=; b=EkBrwDU91k6KVl
	qZzESfviSAg3S3S3xoksEv24V7/eUsMU+OCuwkkAw0RiRgOzRVlrYmi9A9yHEdjOyawUWTrOWoPza
	//tyXGlmdSjQng7ZjUk65WZZed0UB+GGMmYcVlXtpMjNOlx7qNDjwYGpec9v0SEyF7Ni+yLsejHs1
	Xvrli2O/7R+Ftey+0W9jAQUryZZGXoYsTrUCHCxPjI1uuFX9vQ/FFy29loKTg3eTJrh1RBc2vH/BY
	WtExHczP/blo1hBSHfs2BkZ2LKoRT0d6uiEMW29XxADY8n8x3dEsN028cf75i7t0QnutN/OENkF6G
	PAiljgah0Jle6llfHCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJM-0000000CwNL-2Zam;
	Fri, 14 Nov 2025 18:14:16 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJJ-0000000CwM3-3PIW
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144054; x=1794680054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pRXl8MCApycwMCQBP20He+EkkqORlx8Jz1oLL84sRjg=;
  b=ikufxH1AsLGBLbyTX1KNTt5KWbnIoHJhx9G3WkMrKuGxsoJkYzRd1NKL
   Axe/PRWgDFQBKska55kGVj4uraRWLb/+Pqiy4WqFFsUJdgaEK1T296gHh
   jjPwYl4YQuV76STsWEtaE4MsFFw0rSO40DME5+7kFDOIwu++hqiYe8RVl
   GU9n8opYrEawtlB/yxaJuviYvtdHFvrT5zCuvFDhGCJ9Q/h0oqmConXVq
   S5zM952du+pR0tIbiWSCx06T4mThj3fW3eUgZ6dOJeQbPfN2cJNx00BpJ
   +DYvbONkqw9e3KMaqhw+FctC/gFXD1S92s1PC49xtw0w1twYyVHd5idDj
   A==;
X-CSE-ConnectionGUID: nm3QJEhSSeOH5Oj+QPVkvw==
X-CSE-MsgGUID: 24pzmqjWQ4SoC3L65sVsRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129281"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129281"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:11 -0800
X-CSE-ConnectionGUID: RxAoEBp4SR+sKQcAfwURSw==
X-CSE-MsgGUID: Jyi9rZI7QYiQsxvk1NQfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189668957"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:10 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 01/13] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
Date: Fri, 14 Nov 2025 20:13:44 +0200
Message-ID: <20251114181356.66515-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101413_907023_0992739C 
X-CRM114-Status: UNSURE (   9.38  )
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

This is needed only if there is no IOMMU configured, which is not
recommended, but possible.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


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
