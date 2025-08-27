Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F69CA0FF6
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNdqUULmqCknPqQ1oYloXCn1hrCxL80RkuUF02YvdCg=; b=qyJ4FRTPxj2J7Z
	kdZZAfh4Vhhx4+MW4odANS5IWnboG9zWXtgMY8jB8In4sArD7cTDA+nl+13IZKRxTCRjjmOsBsnus
	6V727MM9iGpzbosvnv/Y88V300Uqg9KocddQJUWG6AsB/3w+e6z5eo6Wv8H9HceA3YdhN5//ai+as
	iwGIfRFuGaLciF5BgAVKxR46IbBfXqoEW5V1DTQr74ds9gh57p60k0act5fWJjLSM63IFd6dWNadM
	feFaauU4HyBM5YKpMPOfPMyMv3Q3SMe2WLwF4gdpBto+f5tEcyiZmEhJogLD+QzKrC+TgVk86EkAi
	CDErTwE8r/qVAsBuwPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE2Z-0000000FDPX-0d3C;
	Wed, 27 Aug 2025 11:10:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDQ2-0000000F4cs-0WgU
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 10:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756290618; x=1787826618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vAf6pd7Wi1wlNG8htgQOoFjbYmBW1ywimtUt1J7NvRI=;
  b=STIa2zcz4K58/3gyzi5f896SUeeKVu4nTOsQl0JLqh4BCp+m79KoQa5L
   F5fly5L1AHnqehT46g638y9eZa208ezkxWIc+VH7GtimLElNn8CPv5edW
   SSeUFkKQ5Vhvl1wdx63x1Nv2Rmb5daeEPuWV71d3RQOcmksGzK+o7shby
   pjI+CHVx+xHm6b28SXGf8EpiAV83bX8C7zTNd9xsbWsLZ4wZR+ed/7DXv
   QSc5fcNjW2tI9/pq5hoBWALgYZReLvM22l4lY1tx++KjkxW5WlrHsUHFN
   uJO/F/G14qM9fIN6SwM0daeSKS8wySWP6oEYN/Cn07JhqfPL2PmEYmHVA
   w==;
X-CSE-ConnectionGUID: tp1wqTQuRn2wZu4QKeCmdA==
X-CSE-MsgGUID: TCTVIazERYSbxrChUjWyKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57741001"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57741001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:30:17 -0700
X-CSE-ConnectionGUID: ek94RtffQ6yecx9HAK1SDw==
X-CSE-MsgGUID: DEKQNZOhR7aaWN2hCbzRcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200761510"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.51])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2025 03:30:16 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/5] i3c: mipi-i3c-hci: Remove nonexistent ring interrupt
Date: Wed, 27 Aug 2025 13:30:06 +0300
Message-ID: <20250827103009.243771-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_033018_179212_083C8E39 
X-CRM114-Status: UNSURE (   8.12  )
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

Ring interrupt bit 7, INTR_WARN_INS_STOP_MODE was probably drafted at
some point but is marked as reserved in the MIPI I3C HCI specification
versions 1.1 and 1.2 that came out after the initial code and also in
the earlier specification versions so remove it.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index f5f5ab4db172..8bc9de189543 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -77,7 +77,6 @@
 #define INTR_TRANSFER_COMPLETION	BIT(11)
 #define INTR_RING_OP			BIT(10)
 #define INTR_TRANSFER_ERR		BIT(9)
-#define INTR_WARN_INS_STOP_MODE		BIT(7)
 #define INTR_IBI_RING_FULL		BIT(6)
 #define INTR_TRANSFER_ABORT		BIT(5)
 
@@ -278,7 +277,6 @@ static int hci_dma_init(struct i3c_hci *hci)
 						 INTR_TRANSFER_COMPLETION |
 						 INTR_RING_OP |
 						 INTR_TRANSFER_ERR |
-						 INTR_WARN_INS_STOP_MODE |
 						 INTR_IBI_RING_FULL |
 						 INTR_TRANSFER_ABORT);
 
@@ -795,9 +793,6 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 							   RING_CTRL_RUN_STOP);
 			}
 		}
-		if (status & INTR_WARN_INS_STOP_MODE)
-			dev_warn_ratelimited(&hci->master.dev,
-				"ring %d: Inserted Stop on Mode Change\n", i);
 		if (status & INTR_IBI_RING_FULL)
 			dev_err_ratelimited(&hci->master.dev,
 				"ring %d: IBI Ring Full Condition\n", i);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
