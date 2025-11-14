Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D386ECE8D70
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkgqzjF7A0yHQ5i5reJlxP5GDIUJPKi1Q5G41VaS9IY=; b=uuLS/5MHUXcthd
	HYOFRexkwCnscqtHby2x4ypeL2NWxR79bkhkkQIA2y4scNa5GKNnyxItYiSBqiCTcUFhBbiFDaILP
	ot644W4BkDYMBOG9DqyZQswpFofvDqv9ZdGUPA1WpSa9aByjSa1lo90ewcklNJ8HiZ7DWikeAH5oh
	6lLkAr2IaAYrS/jWdlyssmHR7+LKFiXbyel67+neXcpyGN6wgZcf9N0y2x/762o7Wi03WUVHRYH7q
	PqVn/+TBtQFq5sS/j8Pp/KqClvs42YU9tVdDbd0zePyilmyQotBd9eWBfXzhvwuJrgdiY2vuZr+L/
	vQZ3tqsr/DCPtZhtvEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJX-0000000CwU7-2Ysj;
	Fri, 14 Nov 2025 18:14:27 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJU-0000000CwON-2qqK
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144065; x=1794680065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cgSsfL0DsAHOVHaNbzikhvq0b4+53n6k4BrU77bxXgA=;
  b=O8O6QHLdCxnF6/xe82Y6Rg01/jQNxLU4Q4xFAOC+CO7a5UQaMo8BSm+L
   EJsIMvvgPPTHlCwPua8ohUHXhd3+zW/vwTnkoJEii3jKkUFHtQrrw+hf4
   l6th2B1S7MwBrTT/edtWE3YpCZSqUpsygz0aN8XHt7cDynZS2RLMmz/21
   WO6NvmBU9A1BF5CDH37ihZexkKjF58OhF81AhbXTtmnpN9pgePsx6q79J
   Exssj+JspzbO6vIr+ReFFvUxTKzAhH2DlVklvbjJgIMg+inj2ILsQd9S3
   ZWUMxkRJZVjgJErOJQC4YuDpuwlC4fqDJRJP4KIBURAmfdFH09t86yGEm
   A==;
X-CSE-ConnectionGUID: 7M3urcarQTGMvRcwQXEKyw==
X-CSE-MsgGUID: Rcnj0qPZSseKZnPGZZrKBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129383"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:19 -0800
X-CSE-ConnectionGUID: 4zm8Rd1PSZCqc7z5pm6bVw==
X-CSE-MsgGUID: tjIJ5AdfTUi1fK/LqNeEHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189668985"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:17 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 06/13] i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
Date: Fri, 14 Nov 2025 20:13:49 +0200
Message-ID: <20251114181356.66515-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101424_763932_DEC042C6 
X-CRM114-Status: UNSURE (   8.38  )
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

For neatness, factor out private registers ioremapping.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index abc7bad5e069..1e1f2c42bd74 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -27,14 +27,18 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
 
+static void __iomem *intel_priv(struct pci_dev *pci)
+{
+	resource_size_t base = pci_resource_start(pci, 0);
+
+	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
+}
+
 static int intel_i3c_init(struct pci_dev *pci)
 {
-	void __iomem *priv;
+	void __iomem *priv = intel_priv(pci);
 	u32 reg;
 
-	priv = devm_ioremap(&pci->dev,
-			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
-			    INTEL_PRIV_SIZE);
 	if (!priv)
 		return -ENOMEM;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
