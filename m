Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D121CCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/iZJWjq0/le+GFECjs9ZLEbgjWQNYLVaqrPZRffkc8=; b=gQArQRa9MXuTVg
	9V9qtqK8oZH9C0iBN2VLVImeXCGXDUoQpjBw2Niusw5PcX00BvB+9yKZgWP7wSHiKwyQC4f81NU5u
	VGXame+FfE1zmrSMSvElu9iWA8LrSL4CRz1yWBOBxQMva9FEtVuvJk5n4pFqSQn3vN8v4fO7MQfKK
	5YGEbitRGzyOanJoQ+hHSw9y2k+BroV1kaGn4Zwo2Kznp4xqzfpSI03gxBmiLT/WVsq4V1ZzAtTYS
	0p70WMHfUNSdKthP4jucFd6/gY5VqMd1k30wX5WcwpexAUBForQjRkma17QCqcugsgwtLw5bONxXP
	HUkQzkhDebgzvN9j847w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hp-00000008WNC-0Y1Z;
	Wed, 12 Nov 2025 10:04:01 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hn-00000008WKj-10iB
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941839; x=1794477839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UqgRY3enMA3sOFnU4FbGoAHccFjpiy7+9SvtTO3N31s=;
  b=l8CjzTFYVQNhQ1bzi8f3BWgOdLBCkrdX18Pg1rkmN6AF5MmgIjeJ1DOt
   XjIXK3hLEMT8cARes/Z4E7nrXuSE+bk29xg5ELgiAtBJFFmQW823O6onO
   H2XXqrcDgeimPyAvdLr+xot0tz2Cg1z1y7Abw29rTX88tarV4Tfpoltkm
   gRm4xQS0GnXfN0wMzWyu0ZRQEzqkGi5JBvCs9sq+6uvQkPHCoWzE0ZLZp
   y2wYwlDP3nvr/DyaxAIhUapdYm5HmxEq0fV7f1SzY7NPtTb0rNb44sObw
   OKMuGQli4bTritUXlsLGRyXp7+iUf9+HF395l+2TTearlNrYawjxmsVbw
   Q==;
X-CSE-ConnectionGUID: yajWQCUsRfq0beu+09UB3A==
X-CSE-MsgGUID: hqseKoWFTsCiW1xwRG06jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616213"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616213"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:59 -0800
X-CSE-ConnectionGUID: rql1Kvi4TRqcHG1wxc5WbA==
X-CSE-MsgGUID: xWrCbZlPSBy/hwJUmrruSA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:57 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 04/13] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Date: Wed, 12 Nov 2025 12:03:30 +0200
Message-ID: <20251112100339.51726-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020359_287613_BC3EB5FE 
X-CRM114-Status: UNSURE (   8.72  )
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
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index c74cc511a344..c15e0556a691 100644
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
+#define INTEL_RESETS_TIMEOUT_US		10000
 
 static int intel_init(struct pci_dev *pci)
 {
-	unsigned long timeout;
 	void __iomem *priv;
+	u32 reg;
 	int ret;
 
 	priv = devm_ioremap(&pci->dev,
@@ -43,13 +45,9 @@ static int intel_init(struct pci_dev *pci)
 
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
