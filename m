Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD37C982D0
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyJpTIMVYxpUxtAVZTgjEgLsbxWGRQWyojXFROE6Fyw=; b=PBxRdOhIGEetfG
	pXApDxS/zbUka/jE1K5+7Y9CwG6X5mRgYgK3KnF8LIRb6vsTSXih7DdRtsohFjmMOh4WxZi+7j1f2
	MSf8JA9AIscgejMys7qe/3T9CoA9zpJTnf2Q3DwUsKPpP/8QaEUFD/a8jwiC4D+E0y5hRakIU4uCq
	v+GW7EDyHQt5nWGNIMqOHBOOL0m1Q0c6Et6cwI9Z43c8hcqUb8gu1cDTuFv88zGYejU+xd1OJMMtW
	th1eV002c5b6+wenHtmePMuCx7g4HiE5Y2xZnbn1db021Rn2CzEdxKC8E9ENfhMcpD76i88w8G2qU
	+8jfKMkwOn8i8pQkjlkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYf-0000000CJGx-3IQf;
	Thu, 17 Sep 2026 19:14:09 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYe-0000000CJFz-0rXT
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672448; x=1821208448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SUyc+nMLAwZJvPjjFsQn7tGF2W6VgYi2i1dh4rd6pr0=;
  b=YMMKa6PFjJRlgbEzDxsG7h6cNnVxtGvwuswuB8zCrMxN1DHa7iVDskJI
   ODFKE8bhRxWc741oQXm26imxwQdZcBaJsaFJUWuiuQjsQWBYEF349t3OT
   DnGtZNj+IuS0eeBI2vbwm+MzmvntIa5ElF/ltDuLFDSEmLergm1tgPNC6
   8O7Ftc+Z5fY3Fz898rZ2Lawn/TSXZZI7GjsAKFDc/o2f0pwFa6KG8e9mS
   TRAVL9epftFaBq79aYHzWPUSjKhuS+p9t1UCJ8kA1dhamqG9FXx3Kk2bh
   P2o5slyRaYq/QfHvDxiifOUolfKBsCAtHkeqzz69p4F5HradyljQN3/Ky
   g==;
X-CSE-ConnectionGUID: a2cXjWCnT8etNWeqldIHQw==
X-CSE-MsgGUID: 4N6afgKLQzOFuNak1z/n2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639859"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639859"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:08 -0700
X-CSE-ConnectionGUID: L8ZJvUhpSAKSS05IdkThCg==
X-CSE-MsgGUID: pzCKcvXtQlem4H5tB/BkWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271917"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:06 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 01/17] i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
Date: Thu, 17 Sep 2026 22:13:40 +0300
Message-ID: <20260917191356.133242-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121408_253407_33A3BB80 
X-CRM114-Status: GOOD (  11.54  )
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
