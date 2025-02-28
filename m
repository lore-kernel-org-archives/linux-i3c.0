Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7296C282C1
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2025 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3rn22Ma6AljhSGX5AF7bIa0lYyXbozl94/KFu/9NPM=; b=BaXrD6crwkGQWO
	9LUwlVjaruJ5Fepoa0X34ReVZfTlWyK/WJoqCSNYnhA2ow+Xpm5MxZEu2JZyFOnqXgmLyEE52/wHc
	hzzSzFkKg0AbUV5SKy9B6xUMamhSBKDFix3OGRUNcTggL7XSuHB05OMij18l0342kxqGblEiiVezo
	wFNzvd952lI8xevk7UdzYSyrc52I2AjtQDsU8N/xtqACL+rulN1M++JbWli8jOeEt4/nZ7KKxCP2K
	xQpY6RMgm+1dWnQeIuxnmUYRws2cgzGHUdjfyTvhjSMHU4PZa1gRGODan7UWIqcVmOg2ubdNM2tvT
	1nV686Iy6CHjixi712Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Xy-0000000BIoS-29Tg;
	Fri, 28 Feb 2025 14:41:02 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Bq-0000000BEAO-2MqW
	for linux-i3c@lists.infradead.org;
	Fri, 28 Feb 2025 14:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740752291; x=1772288291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=egv/OiQTJ5Ecz1Ei26e/0uj7Ad0zFGpITVeF2p2MKbo=;
  b=DU3bNW+R13qWaL3/TTILR4TSTBazjvQ3J2hIs7WjsOE57GJFUFXvhE6X
   WH+DGUleaQ23cYiEgrEMwWRemWrihtPYm8xbfYyPH4hqIZpwo7CHa9M9N
   Z2Ros7TKs5aG071LqXVO4yRoJBVQaXVVeeHLJiSzwPA3npe4u9zTj6HzD
   I8sgg+P5LRXRUpf3AWmg3s7a3aF9R529ZYOfX6kb8C+PyFZSghq4E89VE
   ffvGZIvdZkJQ5p9kZstGf+kirUJgll9+oNzpJQfN+qF3Rs9U6U+TxoDGN
   Aub2KOWFKpph7MXcKn/UDIK49YvuBRvuvnEjLKEDcMuNdrC7IF8BpE/Mj
   w==;
X-CSE-ConnectionGUID: 2nNvxmfFTtS2CRZa3jNFFA==
X-CSE-MsgGUID: zfnxFHK8TuOW1afc9ibH6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45600744"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="45600744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 06:18:10 -0800
X-CSE-ConnectionGUID: ws+F/uBMSCGM63/d52C8NA==
X-CSE-MsgGUID: IZJ8qv9tSjyQEKB1hh/UVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154517445"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.59])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2025 06:18:08 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 3/4] i3c: mipi-i3c-hci: Change name of INTR_STATUS bit 11
Date: Fri, 28 Feb 2025 16:18:01 +0200
Message-ID: <20250228141802.1344453-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_061810_614867_C7921DC9 
X-CRM114-Status: GOOD (  10.22  )
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

INTR_STATUS bit 11 INTR_HC_RESET_CANCEL was probably projected for the
MIPI I3C HCI specification version 2 but was not ever implemented.

This bit is first time specified in the v1.2 as HC_SEQ_CANCEL_STAT
"Host Controller Cancelled Transaction Sequence". Update the definition
and debug print of it accordingly.

While at it, change DBG() print to dev_dbg().

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e5593b6e897e..84c372740020 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -78,7 +78,7 @@
 #define INTR_SIGNAL_ENABLE		0x28
 #define INTR_FORCE			0x2c
 #define INTR_HC_CMD_SEQ_UFLOW_STAT	BIT(12)	/* Cmd Sequence Underflow */
-#define INTR_HC_RESET_CANCEL		BIT(11)	/* HC Cancelled Reset */
+#define INTR_HC_SEQ_CANCEL		BIT(11)	/* HC Cancelled Transaction Sequence */
 #define INTR_HC_INTERNAL_ERR		BIT(10)	/* HC Internal Error */
 
 #define DAT_SECTION			0x30	/* Device Address Table */
@@ -597,9 +597,10 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 		result = IRQ_HANDLED;
 	}
 
-	if (val & INTR_HC_RESET_CANCEL) {
-		DBG("cancelled reset");
-		val &= ~INTR_HC_RESET_CANCEL;
+	if (val & INTR_HC_SEQ_CANCEL) {
+		dev_dbg(&hci->master.dev,
+			"Host Controller Cancelled Transaction Sequence\n");
+		val &= ~INTR_HC_SEQ_CANCEL;
 	}
 	if (val & INTR_HC_INTERNAL_ERR) {
 		dev_err(&hci->master.dev, "Host Controller Internal Error\n");
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
