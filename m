Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862C2C982D8
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gq1JiSMrMMjFr4gvdrMochnfVGXtEjjL3r5ztax0jIQ=; b=XwhET5sRGy+0PH
	7wlZ7sdgSv7cdAdVxf3RptOGPm58RN2bauOzG9uFZd6ojzw33OqegLhzuzWCOAeyaDTpSMhtuek9l
	E+nTChD8p2GDOV8x8Sv6UAkK09KI+x4M/c5ivkFVpORG3ibw+4CvjkgAXC7aLDkKvpNOW5N4GBWPw
	jF2Oheu+QCU0NvuARVZajb8bRmDmwFRFWZlJXWsLwtM6TePOH9KsFAiPSIORqRFxdA1l43cFHBTqj
	qNnN1pupZhTOjD9zOySlGs/D1T+yhZdFgwBiCqSZXvedqEdfxODFCh+0eDsO7KeCyWd4nKX/2XkIm
	lKIEqqks7KC5ra133nEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JE2-000000002RJ-0unk;
	Sun, 20 Sep 2026 15:13:06 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JE0-000000002QA-0u0j
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917184; x=1821453184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g5q4k4wNuKyraLS5RjLW+Kf+wR3QXIUT+ivUO6OTS3k=;
  b=Df87EI+Bd0EVGSGRw0XY0ioTBsHYt4dVRv3nbg3jEYflPcaAp5NOddhy
   4RUa3en26JXzpIqZ2xz1DIKe9aOY0ur3WcTOXgZFw7rkWkaBNdPBZ2TZE
   fnVBuKxDP7P1hWjPNUCodGCseppgtCa5qZJzsyf031b/n4RXVU30kM74j
   QXeL9ZdnzUVDsRRnfmq/mchVPecUhZmBshOJmfglgdezOWTvMv9CyJeje
   mMP0tHA9v8yxpIURpKOjigp1YK/vLqufZJC6jitl+uQX3uTWmSKOht6H9
   dQ+7oTMgE+Ez5O/HdjKjO1W91Yg2R1VoHtcqdCikwPArilu8IkU4vwI7I
   A==;
X-CSE-ConnectionGUID: JSBNuFRHTESrC/abusl2Zg==
X-CSE-MsgGUID: VRmd5H15QhWvwxQQEr6qUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548412"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548412"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:04 -0700
X-CSE-ConnectionGUID: gVUYWYfSRWiYNNPK38bQNA==
X-CSE-MsgGUID: O1eBygYDSL6WUD9cDnzb1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352373"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:03 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 02/17] i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
Date: Sun, 20 Sep 2026 18:12:32 +0300
Message-ID: <20260920151248.46936-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081304_267824_D0967963 
X-CRM114-Status: GOOD (  12.19  )
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

The controller writes whole DWORDs, so a read whose length is not a
multiple of 4 overwrites up to 3 bytes past the end of the destination
buffer. That is a property of the controller, not of the IOMMU, but the
bounce buffer that works around it was used only when the device was
IOMMU mapped. Everywhere else the buffer is left unprotected.

Drop the device_iommu_mapped() condition.

The overrun is easily seen with CONFIG_SLUB_DEBUG=y and kernel command
line options intel_iommu=off slub_debug=FZPU, which reports it as a
kmalloc redzone overwrite, like:

  [kmalloc Redzone overwritten] 0xffff8a354561570e-0xffff8a354561570f @offset=1806. First byte 0x15 instead of 0xcc
  =============================================================================
  BUG kmalloc-8 (Not tainted): Object corrupt
  Allocated in i3c_master_retrieve_dev_info+0xc1/0x760 age=40 cpu=6 pid=1
  ...
  Freed in i3c_master_enec_disec_locked+0xeb/0x140 age=40 cpu=6 pid=1
  ...
  WARNING: mm/slub.c:1233 at object_err+0x1c1/0x1cf, CPU#6: swapper/0/1
  ...

Fixes: 9e23897bca62 ("i3c: mipi-i3c-hci: Use physical device pointer with DMA API")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank Li's Reviewed-by tag.

Changes in V2:

	Added the slub_debug report to the commit message.


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 7c2b20474130..5b195978f376 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -428,7 +428,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 static struct i3c_dma *hci_dma_map_xfer(struct device *dev, struct hci_xfer *xfer)
 {
 	enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
-	bool need_bounce = device_iommu_mapped(dev) && xfer->rnw && (xfer->data_len & 3);
+	bool need_bounce = xfer->rnw && (xfer->data_len & 3);
 
 	return i3c_master_dma_map_single(dev, xfer->data, xfer->data_len, need_bounce, dir);
 }
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
