Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC73C28B2F
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Mar 2025 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3rn22Ma6AljhSGX5AF7bIa0lYyXbozl94/KFu/9NPM=; b=pwSTvRlZxU19nK
	Kq00PyWGHJabUdV5rwczKVoRFZ20KOInej8pwrTvX6qq11lPAUZqWGkvRIghqQBFnoEgQGGEhTCr6
	gTc8rn4Ox+1dyYWj4KqY9okZz+PtnjBK3AFBLfkiiJwbqWPR+4duY6gInYYRTu3oPmqX9aeDyPsQ2
	ReBO3f3m/d73SL2Nhwewtuz/ho214BxpWxcsptVMkVFCRJV1RfSy6OwaY6Rq3ovoumfELhtaBt3QM
	ERVxmvwDeR8R17m4cYOix9qek/ybuuKR3YmTkX9bOLjjs+rN0RWzoAMzIRAI2ZcGEeiD+zngT+0uL
	lDucS7ix//wpmERcfD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK7q-00000008EeE-3DAo;
	Wed, 12 Mar 2025 11:19:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJzF-00000008DVQ-2mqp
	for linux-i3c@lists.infradead.org;
	Wed, 12 Mar 2025 11:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777858; x=1773313858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=egv/OiQTJ5Ecz1Ei26e/0uj7Ad0zFGpITVeF2p2MKbo=;
  b=idZfJJ6Nr1v147Bd7U95Q119BfAa6ZvH0SpkkzB/M1n1x8KkRz0z0cpe
   f7qdMBCNg6QIsnZwhzBGfzbdI2ZkjkJWycgWaugoQ9b5nhmdL9rAPpThk
   ojb/pSRNRm5qZpcs07ERdykJpiehYZdTdWkCAE14+juQDzb0lAzOKX0m1
   YIRP7gDMOI+HohQhJCKE0e0/mtSpw3JEh7Tw2msy2rMedQcFPF+ZahzOh
   ZTNWlQT83GL5q9fLc62XOFSMoLiYPLytY2A1LkzwBQhdR45QgQpS78qWO
   FjL83WzG8A7F7RC/grDw0znVwYxE/c2yoPMCREH2TgJgInk0h0JG1aj9z
   Q==;
X-CSE-ConnectionGUID: 4fAZjm7ETvCQOJSAT9uF6w==
X-CSE-MsgGUID: S721YXa0S0C7jlw6siqfXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42983460"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42983460"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:10:56 -0700
X-CSE-ConnectionGUID: XU94ZA8EQ/KXxKaVZmQ3zA==
X-CSE-MsgGUID: fjtSXebTTie2YM4UV0fAhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120310866"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2025 04:10:55 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 3/4] i3c: mipi-i3c-hci: Change name of INTR_STATUS bit 11
Date: Wed, 12 Mar 2025 13:10:48 +0200
Message-ID: <20250312111049.197855-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
References: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041057_712915_1CB7AF67 
X-CRM114-Status: GOOD (  10.50  )
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
