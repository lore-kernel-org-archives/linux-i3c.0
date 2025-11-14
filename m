Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5505FCE8D71
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhPg6X0jqOqAF2ztJKS8bq28fW+7gErl8jsXxexDXOc=; b=TFAZRTOtCiJ3JH
	x1Z1VV8m96w8WMvMqTj+p/oRIYwWSTtHGM/gnqgXCz+HCvFfKc98l64yXAJyiHbIDPQt2DanKbAB6
	18F0VPErP7R2ihl2rI17fKL0Vp93icdVeYtz57icIktj8FgHpbGGL6StEBP9CXWRc/m3K41gAZmlb
	brQ5bWgIpjx1Z7hrXUqJ2Xb8/Pcc+gEQtcFd/locKc9FHaImUPQFfycHDsqUnKlAdmvNLj9qOA9ZZ
	sP5HWEX0e3aH+xRPRpTCl+4E997rjABwNqAVS/mZPmUmW3t1lwnnHTtGTdMZv3gopMlwE8CZzGcvD
	xRoLUHK9WF95yOCTXoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJn-0000000Cwec-0RM0;
	Fri, 14 Nov 2025 18:14:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJj-0000000Cwc7-2FTJ
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144080; x=1794680080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AuE6FfxRq8SDBbyULlvWqF0r+mEXMfZsijRaB4Lp6ng=;
  b=gdpOAR6O6aIDP/ll+FrhD0eyqvBtCZG6yJ+Y5q+CyvH6yngfgdJiPfa3
   byst8blJx5lpcNiUzVNreAdLLh9La3+VZLUiwUEqaG2Z7VDxVXcDvr2Mh
   J0JNDlZ5nprsof/maXOOMPaGTxzmlybGcamHHCJLKgR8VJGcSdpPHx/ow
   o92KpKFHDuBnb/Ea1xiz4e4T3huu/3VDfxt6WxuzyzGuh8XC4eNi+E9Iz
   Ag5j3au5He1otitqYuUAzCxkVERWsceFb204Ys2VctJlwQG1Hl3Nld0Tp
   62DYSRZAyjNE64Lj7Fh+jtmIG/jSvKZVVnyHXGDA+2uY1KxdFp6queL9v
   A==;
X-CSE-ConnectionGUID: MJDg18FrTtahY5WxNYjjbw==
X-CSE-MsgGUID: YaLfkm6PSyKVfNXqxZY81g==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129506"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:30 -0800
X-CSE-ConnectionGUID: hup+qw7ZQpW3PhIxDwnsDA==
X-CSE-MsgGUID: khjc0fDgRkKCZAJmNS7bVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189669028"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:28 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 13/13] i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
Date: Fri, 14 Nov 2025 20:13:56 +0200
Message-ID: <20251114181356.66515-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101439_626138_03860927 
X-CRM114-Status: UNSURE (   7.21  )
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

Set d3cold_delay to 0 for Intel controllers because a delay is not needed.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 2c827e877d29..58e00301e5db 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -183,6 +183,8 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 
 	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 
+	hci->pci->d3cold_delay = 0;
+
 	hci->private = host;
 	host->priv = priv;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
