Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D4CCD4959
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59JqQKvq0xBut97jRZ0If1gC3zxNNxXV1ihqhu+RTLU=; b=yDvvISNRFGIeHO
	Ju3PqTLn1FnQibPfGbO3WH2eqsm52C+XDmwUAQqv3k2BdDOKIbQFjGLFNeWtTPHfVj1Kz8aYzyVsU
	tuvAnB4EMajDPaxO6mMwEqIuU3CUlS/hbDD5CVM9o/Anwr3/e+xRSKE5dmSfZu0Y6s+gcMJrID/n3
	Y9Zvb/sSG6xbGvyXGjG9NRV5dRaYKSRHsQQVS/T2Y69X5livzIMWWiSUDtnvFq6jlUdf9V4eM/MdU
	TnbjvmmvFVgA9iVCTYtd75S+C62AHtjviVEGEUPiHoYiNc5yEnEg/TrkdYHcj+wqFfoPsWLy+1kRk
	WCww7SNeo70M+J/br0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChY-005Dvn-1Z;
	Thu, 21 Sep 2023 05:58:12 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChU-005Dq5-2z
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275888; x=1726811888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n7TnChVZZDKyvjDqT1im7V8qwHEQethEb4GulsQ10/0=;
  b=UBYLUqFc1IgaIK+TY1X1xx3EYrM+jzr6rAwycY5IXyiuHvar3dBWaQpL
   9mgVfz44QEiF4NGNF2/8b8w4t+XRLfcZ46PQ98LLzeQdWwuQywCdeqtwz
   gaIhYqou/DnouLc3j/Sazdrj2/pDXJrdazLjyQMeVIg1TXa7BwjOkxTaR
   FXDlPo4JsR5VUT0Cu5XEAaqcZbbdJc7yJVBmYo6dIClJMSbSXeWNVGoqx
   PtE0Mx4dlMv/QiDLqKm+4I2cI8ouI1+e/Um0NY6953pFP7aHeGkru9mdG
   u2vzDSQ7SACau72pahWPd5tLw0eeSwQ8ZkKurnGSqHkbITHwlktZcx80i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678497"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678497"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771262"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771262"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:57:59 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 05/12] i3c: mipi-i3c-hci: Remove BUG() when Ring Abort request times out
Date: Thu, 21 Sep 2023 08:56:57 +0300
Message-Id: <20230921055704.1087277-6-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225809_026264_EB85E29A 
X-CRM114-Status: GOOD (  10.43  )
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

Ring Abort request will timeout in case there is an error in the Host
Controller interrupt delivery or Ring Header configuration. Using BUG()
makes hard to debug those cases.

Make it less severe and turn BUG() to WARN_ON().

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 71b5dbe45c45..a28ff177022c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -450,10 +450,9 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		/*
 		 * We're deep in it if ever this condition is ever met.
 		 * Hardware might still be writing to memory, etc.
-		 * Better suspend the world than risking silent corruption.
 		 */
 		dev_crit(&hci->master.dev, "unable to abort the ring\n");
-		BUG();
+		WARN_ON(1);
 	}
 
 	for (i = 0; i < n; i++) {
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
