Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B5DCA0EEA
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Aug 2025 16:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0KMnviJ2oQ6TTzPVAetOx5rkW0MawMkV0wyr7J645Y=; b=PcWOtCeu46JoLp
	JjbEne6BC0aZbmherYC7z0+Jzwvm9dbcMwm9k395qygm1d99tmjOROU8TOV6oelgRAORSZOX9c7kF
	59Dvvp8kE1FduznljrM+7zcPR0cg9LsQiqHAtqyUzS1MwW18xADrddKx7x0bKog5Z2/6qyQDtHeZA
	WkQ6fwIuymhyb8IYXTXI7ui/pXcsMDPtyk5robfcRUFNfW53Pr2qd2rTNcdTwjN0jEpLzNHuCnfU0
	aI72ZcKWHskC7NTnbSORjkZPEKSKJrdpNsw/ZjR5pVXJGgUFOStl7KFb/Mo3MGy/IPYXSxXUWOF3H
	FM1839A/4NkEBgYY+XvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx44-00000002wTE-1r4W;
	Fri, 15 Aug 2025 16:14:00 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvAs-00000002gds-2iPE
	for linux-i3c@lists.infradead.org;
	Fri, 15 Aug 2025 14:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755267174; x=1786803174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2jo9adPepMq459y5F3zM44m2hIV7b9MAzSraJvIK1y4=;
  b=FYeJN5aqrRV36l1Ajnfib/5R/88gRt8NwEkkdT5G9pYyZezbrCH22d0i
   urTdniDMjVf5/Op6iEr2Q5ywWVzEzu463EsNelGehatsuUxYoWKBawhvz
   fnK9vI+rnqP7zVymCY5Q/5BjfSqdyPodslEX+pBbBqCWTpHTuFUQFU60F
   LYFWdh2LrEsN8jxTLcuvnxvRF51xCmPtJAXuk9cSvXzUiqtonZsEAxtBe
   0q/yAKUrYnAO3UqNFFAVFEASErWOG1RDtP2hx9RxJnwemtQqvVSVFvIf5
   5JQD5fMk+JU+3O364UD0Q9T7w2ePDHdPt3QoYITdSciFX2LzfkzBXoht9
   Q==;
X-CSE-ConnectionGUID: S0qdrgskQG+n50MzzUtcoA==
X-CSE-MsgGUID: bGWOXjJlQVq57ritgisgag==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68292250"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68292250"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 07:12:53 -0700
X-CSE-ConnectionGUID: eEoAOL+AQr+/iP+uAxahHw==
X-CSE-MsgGUID: KPCphkCMR4K+4uwQzDFOQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171474991"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.50])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2025 07:12:51 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 4/4] i3c: mipi-i3c-hci: Use own DMA bounce buffer management for I2C transfers
Date: Fri, 15 Aug 2025 17:12:42 +0300
Message-ID: <20250815141242.2013767-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_071254_693888_16386CEA 
X-CRM114-Status: GOOD (  10.21  )
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

Stop using I2C DMA-safe API for two reasons:
- Not needed if driver is using PIO mode.
- DMA transfers needs a DWORD align sized receive bounce buffer when the
  device DMA is IOMMU mapped, which is causing needless double bounce
  buffering in that case.

Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b2977b6ac9f7..7a467ef65787 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -348,7 +348,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < nxfers; i++) {
-		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
+		xfer[i].data = i2c_xfers[i].buf;
 		xfer[i].data_len = i2c_xfers[i].len;
 		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
 		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
@@ -374,10 +374,6 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 out:
-	for (i = 0; i < nxfers; i++)
-		i2c_put_dma_safe_msg_buf(xfer[i].data, &i2c_xfers[i],
-					 ret ? false : true);
-
 	hci_free_xfer(xfer, nxfers);
 	return ret;
 }
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
