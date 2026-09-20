Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722E1C982DA
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZR7iiqUBUCYsfRdwyCN7AIy5mHZhnu/pmV8uDJdJQM=; b=KE5x8PJURVVKI5
	BjDv+Q4AcuQrwr3Tl2sdLynJb9kyNQ8PTqRh+uY7SQiX+zN/3gLMP7dnpjQzHW2WPn4hKvSBKUM5X
	4figJFjzpFZIrPq1URG7xvPE8SmkjBJQhvSUu39tPYRJ+V7y8OeJVtXFdpr64kVESiI8KgUj7Hkgk
	J602ZOkwgzS/8TK7+lO182B+F1SVOAfwfTv2p7Ksy+q28VG9+2+aWvwJ9HhSrJUx2HblrfaCPWs0d
	DOvC3vg8liomFFJ4f5/gXZEw/GDwKDiMBkke2s3D8q1Nj32//FzQ0wrXDM3D9pp8pxMegOw880Bfc
	3z0xGUz8mQRHbqBJsxkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JE0-000000002QD-0jWX;
	Sun, 20 Sep 2026 15:13:04 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JDy-000000002Pc-0Utq
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917182; x=1821453182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+mvbro4HcpH31cszgyyMFbMU0IezP7BRdwSi2K06DJg=;
  b=khanKkdY5Ad/YJmLLqzycfCgVJjsHPd4LkrgrrMNO/6nqvKRIEt0JFOI
   VgrAxPffLfCN1Po1Xw66X1ZcfDoaTQ+SEV63Ok9Ps+vxUang+gnUU/Z+S
   gYclLDd0DnAZg/1kkUp7q4EvLOXHbmq0rDSp6dhtoaLk6dC5W6tMz2l56
   kFYRiBEzhTN8an7zQ+6CxDCI7U4dl8XiWEKBZgk7caaxzqNgb2kqknjDq
   DABF+myVf9cUZ5JBwSPcfM+kOu7cMM8l6+mzsCeuTILeq3lgl7AEZfyQi
   VpiWr85OrOYLnBn+1i3Y0uPopw3XpM6hskAqVHeCAwH1GCO01tvtnEj3U
   g==;
X-CSE-ConnectionGUID: IKJXH7FKRlmX6/z89X5zZw==
X-CSE-MsgGUID: voTVXXObTumJemyOH0iVkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548406"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548406"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:02 -0700
X-CSE-ConnectionGUID: xjHqLrnXTGukPC4pRtnCGw==
X-CSE-MsgGUID: fHmtMA16RGeQjjS7Fr30ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352366"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:01 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 01/17] i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
Date: Sun, 20 Sep 2026 18:12:31 +0300
Message-ID: <20260920151248.46936-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081302_164621_7BF86DE3 
X-CRM114-Status: GOOD (  11.59  )
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

When a bounce buffer is required for DMA_TO_DEVICE transfers,
i3c_master_dma_map_single() rounds the DMA mapping length up to a
cache-line boundary:

	map_len = ALIGN(len, cache_line_size());

It then allocates the bounce buffer with:

	kmemdup(buf, map_len, GFP_KERNEL);

kmemdup() copies the full allocation size, causing it to read map_len
bytes from buf even though only len bytes are valid.  This results in an
out-of-bounds read of up to cache_line_size() - 1 bytes past the end of
the caller's buffer.

Fix the issue by allocating the bounce buffer with kzalloc() and copying
only len bytes from the original buffer.  The remaining bytes up to
map_len stay zero-filled, avoiding both the out-of-bounds read and
exposure of unrelated memory contents to the DMA engine.

Fixes: f8d9e56aeb87 ("i3c: master: Add helpers for DMA mapping and bounce buffer handling")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index afcd7a21a3e6..f9a6c8560fab 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2216,12 +2216,11 @@ struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
 
 	if (force_bounce) {
 		dma_xfer->map_len = ALIGN(len, cache_line_size());
-		if (dir == DMA_FROM_DEVICE)
-			bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
-		else
-			bounce = kmemdup(buf, dma_xfer->map_len, GFP_KERNEL);
+		bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
 		if (!bounce)
 			return NULL;
+		if (dir != DMA_FROM_DEVICE)
+			memcpy(bounce, buf, len);
 		dma_buf = bounce;
 	}
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
