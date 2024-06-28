Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1552C3064D
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ee+w9vIPN09vZJfEiq4GZTlZeojhaby3DYPp8JeN/4=; b=StUEY53MSRiZDn
	eUtIcLcO+tDBUS2rIxGgwiZKQfrqAspEui/lR/FJ6gYGxYQyiFaedmagJhh/vatayvZo6GntmY3jF
	d+bT+dYVNdtWKcpcZEX9fJqbXIowlS9hp/sURjNufWjUnpcJrAGZdNVCK6z3jjStGQt1OaNCZe61c
	4OT6FbkcMP169mw8wlQmHahA3vuksb94+Dj4ex3ONOwAnU6WvYhNUeuQEHUVuGOA3Zn+4vHYcm5st
	XBkLYYQcWwO4wA4WbkUKJsWoEL7zSbyEhYlcf5YJcrHpRLLV26Yogv1H7XxRWE0iai5SPW2Pa/cNF
	hQFrxh9u/IKbMNFs0PsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBTG-0000000DnRp-1EwX;
	Fri, 28 Jun 2024 13:16:58 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBTC-0000000DnPX-04D8
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 13:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719580614; x=1751116614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JGeu7VXXdsbIAF/roxcLS+MKjkW09l3gYPODT6BnB7E=;
  b=bNVtbLi8G4hYklpmQFus5nH3er4w1kMfV37j5d8/BOEUqh8BTIq2n/8E
   DeiobDxsVfLNDjYdx0duUzwP6XIRyZJCevV9jlYIK6ExRGx19M9ybpJ2K
   +kuBxdyNShTMxtElxrxSaOMQa0bhkM9eTgk6pbnKHdVkFZA+59eM570Rg
   2XlaazNJA47oldpyA01bxQ/PPxW1sESl9YaxUfuxoaMu6Md4mGZi3zHbY
   p5LbkEUEU5fQBoDmCCn0wJWluKEC48ZGIqioaKcbn+dPTdTqBGJ7Mpk08
   v+atYITSxLcyUAO7Uqc68H34La+4fnI9tcZEBPfLm3r+dkXmT2GyDcILh
   Q==;
X-CSE-ConnectionGUID: iZmNQ0GZR3KF6+ANhDFYKw==
X-CSE-MsgGUID: rpigACmnQMSEnO1rY2tvnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34300183"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="34300183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 06:16:50 -0700
X-CSE-ConnectionGUID: C0kDplXTSYO5mPT59ZD75g==
X-CSE-MsgGUID: FyGRJNAeTMC1Oz/gh0xJNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49213804"
Received: from ehlflashnuc2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.57])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2024 06:16:49 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/4] i3c: mipi-i3c-hci: Set IBI Status and Data Ring base addresses
Date: Fri, 28 Jun 2024 16:15:57 +0300
Message-ID: <20240628131559.502822-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
References: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_061654_117055_7F0C2DCE 
X-CRM114-Status: UNSURE (   6.79  )
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

IBI Status and Data Ring base address registers are not set so HW
obviously cannot update those rings after In-Band Interrupt.

Set them to already allocated and mapped ring addresses.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 6c5964e727b3..7a56ae4a5ddf 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -300,6 +300,11 @@ static int hci_dma_init(struct i3c_hci *hci)
 			goto err_out;
 		}
 
+		rh_reg_write(IBI_STATUS_RING_BASE_LO, lower_32_bits(rh->ibi_status_dma));
+		rh_reg_write(IBI_STATUS_RING_BASE_HI, upper_32_bits(rh->ibi_status_dma));
+		rh_reg_write(IBI_DATA_RING_BASE_LO, lower_32_bits(rh->ibi_data_dma));
+		rh_reg_write(IBI_DATA_RING_BASE_HI, upper_32_bits(rh->ibi_data_dma));
+
 		regval = FIELD_PREP(IBI_STATUS_RING_SIZE,
 				    rh->ibi_status_entries) |
 			 FIELD_PREP(IBI_DATA_CHUNK_SIZE,
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
