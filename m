Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E66FC982D9
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHEBGiC4yayJdDYIACmyJLmu8gCQIu7hYKgEofS/nbg=; b=ds2AhnUHw/Gbjs
	xveU84YJr/wI+S74xCilG6fZhdRe45flzEZJGLjo2w5mWHZYJoniy4mYiy1Py5DQQS9tn0c1tqPHU
	btY7EaFj94PSP3ZFfQ5zN16uUZ9Z7S7qNKrKfLTm8b/eyGHT8zFHcpL/iJsD/GM2PCBFVBiTn/rWD
	yv4twBC8NA2e4v+vtNzx7bpPBeU93GQEE3uZLSK9I/AyF0lO3ENweEEMbyl/BiIx3WpejxARggDcp
	gpJO9ftML7gYyzeGRukvnLbn04s1UQACcijyjbu9SWCJ52RXxqVqa7DOKn8ajIxZ6ExynmOK6kTSL
	M9fUsK38DruJ8Q+OrVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYh-0000000CJHr-3TLQ;
	Thu, 17 Sep 2026 19:14:11 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYg-0000000CJFz-0i7q
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672450; x=1821208450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dIcVzOaTZO1fs3vVHAqmHUmDdlEhoSgS/3LqdyEdb+I=;
  b=bPau6LdGWpb9f6aNy3XNnZCPvhq0E5IF9Qht2IH7vpHMLvMMbOHCf82Z
   OFe9IGrcgIsQl0oeRxZLF0PuNuSiS/aVyfssMYarB1K4S7BLPHXoNMDHj
   DZq6kWRDtqmaEMwTs0AJ2P2ow9lpxD3cF9ej76qwjQW5j9LuD+Ps83AmY
   jd0Xq6nePqC3PtHVUpIIjce3POvNRnO0TemRrv6ORi77up9/cBJLuMihD
   NjyB8m6dUP434FNUq3o5aH5czOG4KlGrVe960ja+LES8rQEDz8AitTUv3
   VWcOAnY9DcnIJ9JPyMkhVfNBFX5VJk3oXutfhfT7nleFfd45/HZkFJOtu
   w==;
X-CSE-ConnectionGUID: F/fGo3MvQlWzXIPYtnir+w==
X-CSE-MsgGUID: FMlm1nXrQRC64HTUvbvtrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639869"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639869"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:10 -0700
X-CSE-ConnectionGUID: 4k9SUdIDQX66OlP2HsR25A==
X-CSE-MsgGUID: I156SIMtTUeSHBTiSvgEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271922"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:08 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 02/17] i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
Date: Thu, 17 Sep 2026 22:13:41 +0300
Message-ID: <20260917191356.133242-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121410_232913_8C6A9D9E 
X-CRM114-Status: GOOD (  12.16  )
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
---


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
