Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1548CEDDA4
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEh41io8D47b3udxj9Wryz4XErezMG2QHJP4NcWU6a4=; b=oiK4y0Ozali7DC
	XfCoQGtbKDFKgiL1Cq1UdDu3b4I70v7+dpnApE0ljNDxV4VlI9zUWDPD9PEPyKUbLZ+zToNt2pMz4
	MNqnsYcmkWvwC2MgfMhQ2UBzsbSG0oUeUV21t7B2sbnExQIxgMKTeX9UNzEuenOa7YrjaXAGfZgaa
	v2fAVJeaWxqCBSHrvxt7lSKQvzlnBkIdmBudOaOE3u0t8fmjz5JV93LTxYimwolyZw/1rsr6RVKV/
	mZpt79l+eVCv0aOWgws9lBphRFr2/EsHUQzbn3KOrdvy61x9Sof1f/Bh5D5DXlM2B/f08zNw/o3ti
	FQ5jiBn6YskBnQ7PSOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpS-00000000lvv-38Cr;
	Tue, 18 Nov 2025 16:45:18 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpQ-00000000lsT-23hq
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484316; x=1795020316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2wpZk68SfM6oOCLqVEO/QSQS4m7tGvOCul3Te3+foi0=;
  b=f8Fi7OiTYy0G1HRoY4V8S3m7AJk2aPo4c1I97XsJeJXyVp8mD/XUnSKF
   iMZ70jXtDA1UAvrtUlbu+OKsPvhH8N2/X78UgGm83Kb0yNCcu+dyNCNqn
   6AWmigD9rSXGOMlnZbOI1iUg9eer65w7ed0dpf4eV6vLHEOUlPt6CmIV8
   Mc4jKeRrqZdBaRTIAuCrGHP2yUdl7YmhEm576GQfa/3ki/5EKIcMEQikN
   0x6JcYTJ7uP9+M1NRsWI73eP3oCKaBhchjv+cLb18on/HfbaLiQDKO9qz
   CbOoEIJZChTpoSfPNpk1TIO9VQQAZNINjTtB+YVTLO0OtyERCZpNNYh28
   g==;
X-CSE-ConnectionGUID: PlxFrkV+SWmzr3YMT6ON6g==
X-CSE-MsgGUID: OVH18ZnpSRSs1F7BYDC0vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510684"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:16 -0800
X-CSE-ConnectionGUID: MECLVgiITR+QDj8D3JKcFw==
X-CSE-MsgGUID: pB8UVyzyQr6+tMGvnJIIlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221462934"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:14 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 04/12] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Date: Tue, 18 Nov 2025 18:44:45 +0200
Message-ID: <20251118164453.55532-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084516_552247_455712A2 
X-CRM114-Status: UNSURE (   9.23  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Add Frank's Rev'd-by

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
