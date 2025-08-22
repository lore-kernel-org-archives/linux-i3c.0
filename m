Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DBFCA0EED
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Aug 2025 21:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18S8ebtXp1+B4ZdKYyOWwaCOiojEQDnUNKA71opBEak=; b=p94RXYzYDo3t7w
	Najjth8CnCcc9+U+uUa3Qg+VCi9PR+vrvaG0/vajOn/MOIdOMWR89HqYLDHWKqDDgxmkF7hXh8xsk
	IaBVpecVBzuyqAI8luQpfzVzT44yumQWh+cqeFaYoan49cshW7FF/hMyIIg1vlcyDVEWJOeMNKDEt
	JcKebGbb6VDZpQuuw/whXH4gc2R1Jg4E9JRpPt1yqktirR5iTIj/ACTon4lYqdCzzvs4x5Tm8Fu2r
	nW65CHA/S97+bwZZfbCdoeneclcdU0KwY5EzzY6PU+lTgahdWmcR706fumOdEJB2MmE1FGPLStx8/
	7CkPe0AdV4NV+trJwmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZcU-00000003Yqz-45Ru;
	Fri, 22 Aug 2025 21:48:23 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPRs-00000002Fxu-3Woq
	for linux-i3c@lists.infradead.org;
	Fri, 22 Aug 2025 10:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755860205; x=1787396205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=chnnKCS/jgoeXGXddFxYjGPkRKf9EkiZKCm/bdDaVTA=;
  b=LEFK8S4cA7cGx8aS9b7z7pPfjljahtjg/3xukHciRyEJTER0kp000nGh
   NNpd8u8g6U71CdUEh4jiK5jbheCAmw5W2SMX71Vf6Bh9STD7yowwyp9An
   qCxmymddVs5wiTIGux1dTwmzeoB6TONxNNPtLwTfKmLBKFCGnjGtp3hWG
   yA7C3Rq7vmK7eK51faUH1Tx2lgnruACRSRUhCCvoO0AgKOtYSCsb3/1uw
   h6hn3G4FTnSsD6t5JmlQlDVB8QBFpaOz8kcO+tWFU3S8ngGD2pusEFgz9
   iA1daGsgNaWGR8TPDEgRsE9XJaf6IPpOvBKsAhr4a1UoysdJMGmza3wp3
   A==;
X-CSE-ConnectionGUID: GuqxXeCnSwC9wPX7L6+PKg==
X-CSE-MsgGUID: UV5JLjW3RjaCYOxzCvgzQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83581126"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="83581126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 03:56:40 -0700
X-CSE-ConnectionGUID: ACw8RW/bQx6NSvuR3ICQwQ==
X-CSE-MsgGUID: rnSVn1HpRy+kXnSThNogfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169079979"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2025 03:56:38 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v4 4/4] i3c: mipi-i3c-hci: Use own DMA bounce buffer management for I2C transfers
Date: Fri, 22 Aug 2025 13:56:30 +0300
Message-ID: <20250822105630.2820009-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
References: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_035644_920449_32566574 
X-CRM114-Status: GOOD (  10.08  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
