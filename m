Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CB0CEE33C
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnU4EuC7eZ3rgMJ4xHSKllDxjn/pB0ERbf1zbyzCVks=; b=lNtYRB8qrRbrGI
	SdRxcUcaqPmUvDSlvk2Xu4kH4EICNIKb/BEHAwja+KQpdi3E7U54UWgLK4QooLS1O0WOrjMmvE0rP
	rCQmIRht53dBlDL5yN3inG6Xqqswla7Aj3rl55S1S6yz2ckGEfBfaBpKJlZ2qRuFFPnLrxNxfUyWZ
	/Bjx9Bbk/Y9YjH2ZwlUwHQNYr3E4L0qSrsSXxVZyeWH91mpn4irMkTgvIaIfvIu7xZXLO0Rb0ASXR
	REexJ9g0QGOqKAMFwPcW+FWQcoc3O49GET5x+s4WGpoOglAbvFJ42tBdFoRCXnEB537+UGcpkM9OT
	VDnaxQQFyRjsO2nLZRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpN-00000000lsp-31Q6;
	Tue, 18 Nov 2025 16:45:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpL-00000000lru-2QQn
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484312; x=1795020312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JxJ9cpzUdnO9WB0Y5sWt+YO4qAWVFvTagm8vN5l89hk=;
  b=U3WaRYkYDSB4twy2yNqCBM5hKGGP6pBEKmzGnnGddnQCwxKehAlNcTWf
   kEEXJEDDGvO4Pp13Q4cYafhL1fFw5w4qdQgbUFqu1FSlf/H+1ZO3vUlhI
   CyHNog76gFrbkgsdiGQ08J1bhs9a5YaDRSwczvrF3TQ7s749qLG2ohrrh
   S1aXUoY+nmuysR0kxe7jpKhSpS4UEIJzaT8BoAb14XKBx+3WaySbhB4XP
   cUnWPojynsK/jrChX0+LIbuVayUz4Dk0w0FHmjQS3FfVrr5maU2NYrcdx
   1l7kBhGxuObS0dC3C41irbZPPtXZEyQPT8P/YmZBUolVBdTjUHwIw1OHh
   A==;
X-CSE-ConnectionGUID: ccR7Xxe5Rf6/8hvH/y483w==
X-CSE-MsgGUID: YzxcAXAnTO2YGSnPM5MIxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510673"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510673"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:11 -0800
X-CSE-ConnectionGUID: CicH+piyTQmNO+BnTwUp5g==
X-CSE-MsgGUID: DVP5kxfeR/2qgHdiKI2ZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221462885"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:09 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 01/12] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
Date: Tue, 18 Nov 2025 18:44:42 +0200
Message-ID: <20251118164453.55532-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084511_640458_C683A40D 
X-CRM114-Status: UNSURE (   9.04  )
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
