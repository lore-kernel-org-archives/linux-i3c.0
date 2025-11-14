Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA28CE8D70
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RB2baXEkJP0o6pVy0xXny4Yf17j/R4JO7c0WjKg6ZYQ=; b=W59Nw5HWXDknce
	/g4B1SHgS0iQnnpT3ZUSvntphyz+YYFjMgB21ST6RzXOhqOyFqj0BetEsLLtSnk5WUvG1GIn30uNG
	ErErIleAPVLwN/jZT++jHO9MZyvNMPRkgQKEyT6KPDoXI1ttQSWm9yGO6zEsajjVRdBMPM71ouNC7
	qGPZCzCl5DLSmiJVY6PCLy1XwniZzaB77p5z1flZD6lUiaAFghrfyaTY7nA4u59eYY+aVl3GAHMtt
	9LKu8eHRL1S0hFYrLVGpB7UB0PwETBZO7nBCLgiH3Gfk1+Mld3SNyD0ujepUbChWaOfxRJocPxvFI
	V+70cIlNr6qCJJF5vvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJU-0000000CwRx-3c3K;
	Fri, 14 Nov 2025 18:14:24 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJR-0000000CwON-3ziq
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144062; x=1794680062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lEE9Ep7SF7mfMM9MVMJOpjKranXQq6gKmhMKZqNN9qY=;
  b=BXyGsRthln5/EwUZQeg9Fnes921m3RVhAdA4HbvhFtq3mrVPznsLVQML
   q8a5ASvbnjKF4D93mxwVF8CQTyS3DgTaQ/w8rNyTiTs3huSQQIDJlzSEO
   bDrvM/1CPttAXFOx1VSMyilVkRm3EafA8eKW93Txd9LG1NScN3vPnXsR4
   aCu6uAslVdCO98Rmzs1zhb/DB2C+g8OPeQzr6Cxp2uvRHjmT3zIx6gkbD
   ejauDS7bHQ44FfsFG3gOzNlLvNCbBVvsnIN2bbK6/AO4Svde6KyrIFaXA
   RcJvzva85THm5Ab7rsH/9cho3pFLxZ9WTjQWBGqxE/ZjbhjCdItJoz7B5
   w==;
X-CSE-ConnectionGUID: xHecQrw9TAiEeOqG4KS8Bg==
X-CSE-MsgGUID: eIvfPFt0RUmRmBOQ8deQoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129362"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129362"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:16 -0800
X-CSE-ConnectionGUID: u1uBYBWJSCuZCjqyeFUk3w==
X-CSE-MsgGUID: 9KD3YnjiTDmAV611G1nmfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189668978"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:14 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 04/13] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Date: Fri, 14 Nov 2025 20:13:47 +0200
Message-ID: <20251114181356.66515-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101422_405937_E8A28A8C 
X-CRM114-Status: UNSURE (   9.16  )
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

Use readl_poll_timeout() instead of open-coding the polling loop.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Change 10000 to (10 * USEC_PER_MSEC)


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index d434e2962740..30915d78045e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -8,6 +8,7 @@
  */
 #include <linux/acpi.h>
 #include <linux/idr.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -24,11 +25,12 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS			0x04
 #define INTEL_RESETS_RESET		BIT(0)
 #define INTEL_RESETS_RESET_DONE		BIT(1)
+#define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
 
 static int intel_i3c_init(struct pci_dev *pci)
 {
-	unsigned long timeout;
 	void __iomem *priv;
+	u32 reg;
 
 	priv = devm_ioremap(&pci->dev,
 			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
@@ -40,13 +42,9 @@ static int intel_i3c_init(struct pci_dev *pci)
 
 	/* Assert reset, wait for completion and release reset */
 	writel(0, priv + INTEL_RESETS);
-	timeout = jiffies + msecs_to_jiffies(10);
-	while (!(readl(priv + INTEL_RESETS) &
-		 INTEL_RESETS_RESET_DONE)) {
-		if (time_after(jiffies, timeout))
-			break;
-		cpu_relax();
-	}
+	readl_poll_timeout(priv + INTEL_RESETS, reg,
+			   reg & INTEL_RESETS_RESET_DONE, 0,
+			   INTEL_RESETS_TIMEOUT_US);
 	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
 
 	return 0;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
