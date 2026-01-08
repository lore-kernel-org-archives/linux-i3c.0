Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69499D148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxBd63McOf/NbYTJ7/1/vkWPWFHHmp7CJBTQn2IbrFg=; b=BMofcs2oQCEHpv
	b5qxUVBJe5T/R2P8L2+n7+kSbJRcLx7X9HIAannsYK5yTcz0y+ik7WAC+tqZLF6PAY78BpHNPoPTa
	w9U1MzzGq0YaO0EnD83/W9kcAnRkkT6Ty9X2CWij5N5ekH/DYUGmRgY6v1+dpkPwDaMlT6NESzU5U
	VoPeIhEg7WSqwTNbQeYYlJ5ouKSShLJKRKaRvU79f46qpwbWpMsHMsqUlipc0bfrgIZ5smTOZxTlP
	ofAebkpVhKw+MiDHjLbuR6K7h89IyUmuKGsuiiloWYtNo2vSExQ1yr7JkajoMomJ+/8XAdfQpNsIe
	tw1GNFf0znQn0O9ySGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2H-0000000GD82-0j8B;
	Thu, 08 Jan 2026 08:06:25 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2F-0000000GCzw-2EUM
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859584; x=1799395584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=60Xrvon63mVrTb1tYT0/BkydnlTVmTKfP5P1Wryw1Xs=;
  b=WyOdE9QQ7J5MEe4IykB0/8s+w6E51nLOYFEi2XaBunRwf27dJ+CvqjEe
   3JMKc46ASjHqw3X1rfnWP5Agm2wN5zyRndoIMh/Cp5iYZJfqQvJEygffm
   3S7zyrdcEELatOdZu4K5NxUUEHVOuvlaKyWFCz3WTp2VDP+nHKlxwZCWw
   9yZVGdDLJDw/aR6knBfbZcSZkN1Ako7fdJQVWXqB2UpFWKxMx8NsbGIsV
   s4v6EFNGQxu3ssFfN+WW0cSRCdBavUiScMm4nNpB4TFOnB40gJJ0huyMT
   1s8ZRG4u4KxlAQxd+vNd9BuX8BS3Su/3HsKuv1cxxVPjPQl63Nw3frROV
   A==;
X-CSE-ConnectionGUID: ZTPfsz3KQMCqHofoTFAMKg==
X-CSE-MsgGUID: hdVl6ChNTf2S3xsxJyhKIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792287"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792287"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:23 -0800
X-CSE-ConnectionGUID: rGGzH+eJTOyQEloDk83T6Q==
X-CSE-MsgGUID: 5/vp8pv7SJukjQug9Au3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413588"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:21 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 06/20] i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
Date: Thu,  8 Jan 2026 10:05:44 +0200
Message-ID: <20260108080558.21767-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000623_583207_DCDBFA20 
X-CRM114-Status: UNSURE (   8.13  )
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

The driver already uses managed resources, so convert the PIO data
structure allocation to devm_zalloc().  Remove the manual kfree().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Remove 'use' from commit message
	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/pio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 90dca56fc0c5..3d633abf6099 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -140,7 +140,7 @@ static int hci_pio_init(struct i3c_hci *hci)
 	struct hci_pio_data *pio;
 	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
 
-	pio = kzalloc(sizeof(*pio), GFP_KERNEL);
+	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
 	if (!pio)
 		return -ENOMEM;
 
@@ -220,8 +220,6 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
 		BUG_ON(pio->curr_rx);
 		BUG_ON(pio->curr_tx);
 		BUG_ON(pio->curr_resp);
-		kfree(pio);
-		hci->io_data = NULL;
 	}
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
