Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65ECCFD376
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3mYCpjRQ6NFEQhBgOjaK+OhT0YPxnpxxEtDUvSRCuU=; b=HVGAWG26cPCv5h
	AMsSJKWwQ8cNU8yOJnz1UVcrEl/nMn6de5gV/K/MvesxkPHgIFEhL5QkzdrTBgQeVN5ocYsoo4UfB
	2nzXmWttDMGiw5pOwEumB3sYUdMImtBqYUIX2uqLLX9b+XPHP144TSl35+PjVnzVhlz+edIm1rswL
	Urmk7mF0iiDa+2Figbng45Gb1CpJmuerkSyJupWlGh1/ywRjEf22vbWk88yP/4xCh6uUxwH1OkTwE
	RAomz6DuFHFeDgdNDzgf1RCxNmDhrYPGQXAMCaUsVI/3B9JCUk572YjWtcSU85Ma2hryPzvrZbBdD
	qgkX+SIt0u8wZcDICp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAA-000000003Sv-1jAy;
	Fri, 28 Nov 2025 06:41:02 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA6-000000003Oi-1pC4
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312058; x=1795848058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b5HsWeGF16rYBhuDPnjuzDJcxx3OD1xOS29y7b3dTvY=;
  b=hfIEQdRg+YCBjvY2yFBEpxKS/EqrAxf4eaWkgfiM5dwFnzRb+YIWfcGD
   2lWCQWRZ4IVEUxvq8QNeAWeeN+IwK6Fzhi+ZsNjGsTuoO4/UpbapWa0fX
   gnj9NY8ACjLkp9nEhiMwR1MX8KnMmUQUOd/ZEMaXLiVGbW4Uubdol6673
   BXUYlrkeuua/XJnwi+987hsFuiTvQpQ/wIuscwzUXScNIWm48+kPLPFsk
   Px2tF+QHnsyCpP5lPo8T8iRv6484ELDiq8DYBTYWWx31V7srS7a2oO19y
   NShB0HwB6LinHLD+EjmDUZtP7n7RKk7DpBzrcMewjmvbDXm+Q7rAYzt0M
   Q==;
X-CSE-ConnectionGUID: xT4qK+QJQO6AShB99/8pIA==
X-CSE-MsgGUID: MD8pKgS6RDaZU9PxrZh9sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059938"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059938"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:57 -0800
X-CSE-ConnectionGUID: slRJJDwnSmmDgV/m4f1Vjg==
X-CSE-MsgGUID: 1SL6NH0lTB+OV4ukM6goNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348066"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:55 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 04/12] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Date: Fri, 28 Nov 2025 08:40:30 +0200
Message-ID: <20251128064038.55158-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224058_515222_2DE54D7D 
X-CRM114-Status: UNSURE (   9.05  )
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


Changes in V4 and V5:

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
