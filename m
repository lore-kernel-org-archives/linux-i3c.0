Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D93C369A4
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Apr 2025 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZ22aaYC3fbkWbovXnLNq2qkAWAMiQsDh0lI+gRij7k=; b=LwZfdV2+Xlqm+O
	Hc8gb/ZPatXJkl8Ra7sx03qdasVkWPq0op0R598v1Y4yXvdh5jWODZIJaf3xS1puys6C9W8dj3KKe
	HNwevkIC46EvCDpz3+ZwM4KUTbW1WPgn0WuMz2DW4/I/AkzaKaUrvip8qqK5ysQiMLUeu4Sl5b8IA
	afCNriYTj2IoV43Cmmu3OQUzQeAhYdz2KJkVeQ2SWcda5BXMvjCN4y1Wa39CEcTrka4MA+qt1d7pN
	w1jUXl3E4x1Uvx7j788z98Adi2sK5fSViqlDVULIBEuP3/fn+FzH7oMFIhCDAPfyydehMgC03sCWf
	tpYuei+ps+S3Lm4M2d9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WbG-00000007Uvq-0v4m;
	Wed, 09 Apr 2025 14:40:22 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W2C-00000007Ntx-0FqQ
	for linux-i3c@lists.infradead.org;
	Wed, 09 Apr 2025 14:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744207448; x=1775743448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qb+cFqLWc6yOJUsyaatoRUQIf3Q7vDCtn1Kpi4WGVo0=;
  b=T+INoNOWVkWw1ceBxHdusx/lTz9zdn0/XdjMTE1RmDpi1AGi1MmXPeKO
   VqlWqxz7Bl+qdrWN+Va/dUVkWYnNmXsEVramnALrQgctRg9VmW+cJVEl9
   Pt0aLCJY1Q+vSiJLyziKcrwHbNCMPKp4yel4e74F69yd04+7fXNvEXknp
   1cvjPtTtIK44xi6bEr03JZui64MrbzeKMjtfcV16kMG/4CfIbLySpmCE4
   zTOl625NoH91Jm12C4o7eY8e9asX7OrtJNvdT4sVk9JxK95p485DAoZTq
   S6GhlhQSOt9vrp/yZFCXZ9ovfN+tisuCbq0C4TI2C1walGrcZKk35ygSn
   w==;
X-CSE-ConnectionGUID: Efq6mfuMQ0Gzxr4/S988OQ==
X-CSE-MsgGUID: +47mH0WVT0iKtgEX8XkJ4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49531261"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="49531261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:04:07 -0700
X-CSE-ConnectionGUID: zPyOcXEjQq+67Q6/tOfKRQ==
X-CSE-MsgGUID: CM5lNggjSD2b94KK50BwWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129116631"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2025 07:04:05 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 2/5] i3c: mipi-i3c-hci: Fix handling status of i3c_hci_irq_handler()
Date: Wed,  9 Apr 2025 17:03:58 +0300
Message-ID: <20250409140401.299251-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
References: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070408_107881_D3D99DE6 
X-CRM114-Status: GOOD (  11.33  )
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

Return IRQ_HANDLED from the i3c_hci_irq_handler() only if some
INTR_STATUS bit was set or if DMA/PIO handler handled it.

Currently it returns IRQ_HANDLED in case INTR_STATUS is zero and IO
handler returns false. Which could be the case if interrupt comes from
other device or is spurious.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v3: Added Reviewed-by
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index ba7aa6bbcec5..780e9db7e21e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -594,6 +594,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 
 	if (val) {
 		reg_write(INTR_STATUS, val);
+		result = IRQ_HANDLED;
 	}
 
 	if (val & INTR_HC_RESET_CANCEL) {
@@ -605,12 +606,11 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 		val &= ~INTR_HC_INTERNAL_ERR;
 	}
 
-	hci->io->irq_handler(hci);
+	if (hci->io->irq_handler(hci))
+		result = IRQ_HANDLED;
 
 	if (val)
 		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
-	else
-		result = IRQ_HANDLED;
 
 	return result;
 }
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
