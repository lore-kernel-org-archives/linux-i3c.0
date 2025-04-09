Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128ADC369A6
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Apr 2025 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6Kll3YbRNcDRGKBbU3BS7trQXNh/asI/thfqBIM0ZM=; b=LtD92Ncl3j7sOk
	3yh584hnkvA5ZF4aOpHhTOOn7CA0+kV1l4pAmxkvGzQZw3x87JztewJ4Q66BbDv9F2CjvNDEkzFJ3
	VGRX8g7BXyEBRAP7N3ipMdJGkd8QDsiVsKiX8PErjIdvcSIwxprvtbUfdLX6/YfKcSmNMXcyJAxU/
	K/+0jFxLWHrZ//OOsJKG0CA/ZIe59BRjyzsm+lCTzIEnihQKL1QT4lDShPuxxS/X/jL7/dPLo5GoO
	4nvdoJpiQqIQHhKeMi28X50V7ueYfbjiWk6i+zdZ2xZ5TnbV4BOXdxz+kuqEDzfJpvWMNJVSzbuY+
	BuCq70LuW2NS3LdKR43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WbG-00000007Uwj-3S7f;
	Wed, 09 Apr 2025 14:40:22 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W2E-00000007Nvh-1g4W
	for linux-i3c@lists.infradead.org;
	Wed, 09 Apr 2025 14:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744207450; x=1775743450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W74Wn8xvDiTGdSm64W4uJQGEJljkOp3EDzOJ2Gv5S3M=;
  b=ivug6zrT4HLtBpYPFjLIbqKIHB8gvbzuGTC7w4zzcpgbk23t/J7WK9BZ
   QLrpS7RpU5XxA1tTVp93Gnoh2R7EthaqJqiBILZmET5ThS/mcPf0nUCzB
   vAiDgU/ioO1JKcCO6FwHxxssS8F0VpLVNbgaqZgdVrxrVvKyKU/Mo9qQH
   wyPFYhh4xBDb+4KT8fYCpuFqaafRgcjo0To8meRv34A4hnBkByboYZCNC
   ftGA9pLlECaAruLnI2qnWINyQoWm5LJifqY1FmrsBQEZRUMD6WrOIkc/U
   BSE8RTYag49wy0wg9Attl1cdrO52WAnpAoZJlRmiDU8L/K/s5ydPB5ev/
   A==;
X-CSE-ConnectionGUID: 4AMc4vgfQruDQRDyGVkcFw==
X-CSE-MsgGUID: M11cSfv0Sq6ZSvSqb1/5Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49531270"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="49531270"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:04:10 -0700
X-CSE-ConnectionGUID: dHCbM81wT2i+Y4Yng67SeA==
X-CSE-MsgGUID: I2zZ6PouR9qEVNdV+F6vjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129116641"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2025 07:04:09 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 4/5] i3c: mipi-i3c-hci: Change name of INTR_STATUS bit 11
Date: Wed,  9 Apr 2025 17:04:00 +0300
Message-ID: <20250409140401.299251-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
References: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070410_467125_13644152 
X-CRM114-Status: GOOD (  10.14  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v3: Added Reviewed-by
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 4c4100d2d9af..0bb74173ca94 100644
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
@@ -596,9 +596,10 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	if (val)
 		result = IRQ_HANDLED;
 
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
