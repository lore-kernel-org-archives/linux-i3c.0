Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83FBC5B559
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6zJs04YQGpldKWgVs9vnKzRPkxY+0fa6sGQ9HzsKxk=; b=a97Sbi/0lLAiU2
	1V4wkO5cgZmOfyvCcCyeL6qMHOPnw/m3M9rcrU0hhJMIwaCnngYqmMK506dxZ8cpTxlPG7vHblcgZ
	jpmcq0kf3KJGf5odA7YbruHff9rKBt8Q0HTcLOtOVwn30uPGBO65/+YZaoBx2dQM2sOwW41wtYyBV
	h57nvcicat/rUYKc/8sSiKDejjKU+kqHmHvQuNqftwvj2DIal5STPaq65yc9rxz0RfhUJMxBPmiNl
	jTC83ZIGqnb6/gwGxGgp9yLE4/bsyrffjH0bADvWR50owJ7O7f6oxJ2/TuEXjEtxCQrziKZkE/xUo
	UIHI81X0vlSC+nb67qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnhE-0000000DOO5-1D5h;
	Wed, 04 Jun 2025 12:58:20 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMneO-0000000DO1I-3Ppz
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 12:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749041724; x=1780577724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kSIvRjNaB0jMm2EokewwSwaR/yRRifhxGwGBFfjzzmo=;
  b=Xh7sh04Bg2ooIJ1ruRIyh7FNVWK48/a8FcR+aw0VWTmjkw20Ylpbe2Ey
   tMEIqyEIhCSPArJvBCJeAAMWh57tP1pLbpMs9rWtOy8TaRoE++iZ37gqp
   Sg1LNsIfkHmqMiUlk/dO/GSGSxCWDAC82HxSqmATV58HE+O+WgJ4bqRRe
   paH+T8i7tqPjykggo+kg3GsekhxMZu2pXIsbGf4J008sR3Us/qr5jbYa1
   PJ7JIE5dEeWKsUfc5CnFO4cuyMu08pIZw1gJmWM03bmLGOF4Xqg1+BBsW
   Gz2TCVNtGwDALkS0bpjYGqvPNO1dDXGqbePeNBTjjxHvnptIg15QNMaJM
   w==;
X-CSE-ConnectionGUID: cRtAriExQN6ua86bGRwf0Q==
X-CSE-MsgGUID: qvlWAHqcRIiSwjWDmcwz1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50361438"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="50361438"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:55:24 -0700
X-CSE-ConnectionGUID: HaVIha2JRbiTkmXVG4A9yA==
X-CSE-MsgGUID: X0JDqOXoSSm+W5lVozTDyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="146153491"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Jun 2025 05:55:23 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 3/3] i3c: mipi-i3c-hci: Use own DMA bounce buffer management for I2C transfers
Date: Wed,  4 Jun 2025 15:55:13 +0300
Message-ID: <20250604125513.1593109-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_055524_871094_487876C3 
X-CRM114-Status: UNSURE (   9.67  )
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

Stop using I2C DMA-safe API for two reasons:
- Not needed if driver is using PIO mode.
- DMA transfers needs a properly sized receive bounce buffer when the
  device DMA is IOMMU mapped causing needless double bounce buffering in
  that case.

Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 24c5e7d5b439..fa4c0b826345 100644
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
