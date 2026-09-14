Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7754DC88E50
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4G/VmArCrzZKH7Q6DDPW0/6v3pR6BN40reeAhQ6HJOE=; b=gzGiXwOJHjI2MK
	kSckPYA7sQBcGn9X8ittqpXJc/uKQEi6A57IfcsSH4Y7uyyMFtZesrY2mPmqnF6QSQgEhTIyf0iAd
	jFrMGbgbaS7GgPLjqpmJHB+gKXWIrwcokzUK7GvsiXLkp6pek2gE/yeA3PO6BIzvuepA039jO/rW3
	LKBa+gshAUdf3qA7L6nN2l7ju54Tq5ZbBO2kPWwE5b9dKz9v6d9Q4COJJTeC8xA0q0NU3B6tdmFoN
	ojhNwdn0Qbe07moMYgsTrgvKxtofyYr8AmttFBr7U9sEGr+yo+zkJlqfm/MpjnGRPtXYUN+NC+GFp
	iHaCHIhh6HNoabisb02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tG-00000003F63-0mK5;
	Mon, 14 Sep 2026 11:30:26 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tA-00000003F3I-00hF
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385420; x=1820921420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AWJpGZg1USdXSuuSye8Vru9aY+e4QifHuzuSPImJmGg=;
  b=WIfjoMvScebZoPsS/J6Ph0QahqbFnhJsca10TziILk16xRmlQTKel43B
   F70EkIEWjnto5XC8ilgLGqf8F9d2R496ntkEutJCdgsHjwcRNxRA9TW5X
   DK0ZJ/r2bknZhVUkY+vqso69gmFpTVM814Z0UiFUjxUdTaXi8Cx60QW84
   TqWcTnJgh+GkwXH8kGQfFNkWIR/GQasF0HF5fvLOWDzcqzzlefUBflw1A
   xvtcPU0jc0rfatOrA8VTikBY0/o9kQbt0VSjjBNt/YX/Lq54LN5zvFPjy
   tcWy62gAwwI2H/r/vDua1l+hllS5e9YXxP0RPCF6L5rOWPdIH8hQOVoDn
   A==;
X-CSE-ConnectionGUID: Gm9ftlHuSqaz3tLy/aohjw==
X-CSE-MsgGUID: GV3dga81TNOhXLssi2ze5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864415"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864415"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:19 -0700
X-CSE-ConnectionGUID: mx4jDuN6SDOJksbcolhC5w==
X-CSE-MsgGUID: hZGL/coTTSmH7qOaW52E4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133046"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/17] i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
Date: Mon, 14 Sep 2026 14:29:48 +0300
Message-ID: <20260914113003.183150-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043020_374492_25052ADD 
X-CRM114-Status: GOOD (  12.40  )
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
kmalloc redzone overwrite.

Fixes: 9e23897bca62 ("i3c: mipi-i3c-hci: Use physical device pointer with DMA API")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
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
