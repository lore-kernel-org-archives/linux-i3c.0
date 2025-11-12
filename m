Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B93CD13D2
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrQlpB4RvHpzhf6X/Vs0hp3k8+qax/iN2ToFrAFXRlY=; b=S86UB/qDYfUGk7
	/5qf5sqeTHzrUH467ZUFD4UiVNRzxwiKEz6hK5IuEJBxTPbVrgNIdJBHhkQ3PFko4K1BS2/XgIL/e
	BcqkkBxtk36IE9Hr080Hp9r2TRfa5D4JCmtKxD+Uehk/Wu+xPdidOV16uPZoP2MUmL1jDx4xPWkFT
	1oXLXLW42mZWDq5173/swxwdm93n4DfnEFLbKWkqJpSDi+fgQe6eiZPBfxqkC3cozdlqd1hR6y7zV
	j2bB4glqTSWy9vRim7ZKD27hL64hiSWet59BId/M5RSzq1wGiWvOuHTf+jNSEdHN4uqupeCFKZyFC
	1UObdGi4HuQQt4yLhMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hn-00000008WMV-3dbf;
	Wed, 12 Nov 2025 10:03:59 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hl-00000008WKj-2sMW
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941838; x=1794477838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cgG70BV3RuoT+YtAzsLh2isYKTZ/OSzzV04cayRyY8s=;
  b=eC9tRm1bQvvPTrPQW2Oi6M/UF5J7XfpaXF+XGBMh0FAIrn3eHfPqHVRG
   BdY+7kl4fWzZO02wZfGYDPxuYOClC5BgeUhpPpXokMTc98UCUvOe2Xvfr
   et27Cn+TO2Bo0w0reNg3kp7pitr6D/N3os4V5aCvEFBmw1bD/5fNS7RtF
   AE0QlF9jLVjsBZ09MMcUoUgFvIQcgp1SSaThlhidEQ4SPyviVZdqHnxX4
   4ok2wKZb84ePGj+E2QSgaF27i9Ed6SchJs4XydBIDEeJNmtaZar9nNjz1
   cjlMYyFtZ5aTQLOgx/s3G/mn0UY2EkpI/bQgaVCwQlMIFIHsJssnccndR
   g==;
X-CSE-ConnectionGUID: lXVfnkGiRL2zseXjbR6EPg==
X-CSE-MsgGUID: FSCBotwLTQ6oyHaQZL5AMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616210"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:57 -0800
X-CSE-ConnectionGUID: NhkEdSp0SQOuxWK3TPOQkw==
X-CSE-MsgGUID: t9X9tyqISoa6jF04ujEpGg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:56 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 03/13] i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
Date: Wed, 12 Nov 2025 12:03:29 +0200
Message-ID: <20251112100339.51726-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020357_731729_4C13797D 
X-CRM114-Status: UNSURE (   8.97  )
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

Rename some Intel-related identifiers to ensure Intel-related identifiers
begin "intel_" or INTEL_, and for brevity.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 617826628dc4..c74cc511a344 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -21,11 +21,11 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 
 #define INTEL_PRIV_OFFSET		0x2b0
 #define INTEL_PRIV_SIZE			0x28
-#define INTEL_PRIV_RESETS		0x04
-#define INTEL_PRIV_RESETS_RESET		BIT(0)
-#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
+#define INTEL_RESETS			0x04
+#define INTEL_RESETS_RESET		BIT(0)
+#define INTEL_RESETS_RESET_DONE		BIT(1)
 
-static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
+static int intel_init(struct pci_dev *pci)
 {
 	unsigned long timeout;
 	void __iomem *priv;
@@ -42,21 +42,21 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
 		return ret;
 
 	/* Assert reset, wait for completion and release reset */
-	writel(0, priv + INTEL_PRIV_RESETS);
+	writel(0, priv + INTEL_RESETS);
 	timeout = jiffies + msecs_to_jiffies(10);
-	while (!(readl(priv + INTEL_PRIV_RESETS) &
-		 INTEL_PRIV_RESETS_RESET_DONE)) {
+	while (!(readl(priv + INTEL_RESETS) &
+		 INTEL_RESETS_RESET_DONE)) {
 		if (time_after(jiffies, timeout))
 			break;
 		cpu_relax();
 	}
-	writel(INTEL_PRIV_RESETS_RESET, priv + INTEL_PRIV_RESETS);
+	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
 
 	return 0;
 }
 
 static struct mipi_i3c_hci_pci_info intel_info = {
-	.init = mipi_i3c_hci_pci_intel_init,
+	.init = intel_init,
 };
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
