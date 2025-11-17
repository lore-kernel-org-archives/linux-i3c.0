Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B378DCEBF91
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZasonKvVjBbD4LXCxNd8SpuIRz+/3sqCGHZg2rhkMMA=; b=CKHc2ik5PD93Pz
	UaOjVM2W3PX82t0vEGuyWwlBIQlll0hW932ZH9T6aZhKKdy2nhtrKyc4xUUCc3Y5F6EM0sBxBmV79
	zoc/d//wiVd/GBFD2yrePLXaPU6l8oS5hkWGza/IQZ2HCVQw16adPXutjnsYgTeEQ3NUbvc7pdGPZ
	SsuJUgX1P2JSvDiI4gMo2Vadk27onahHaXeXL36k8jgKWEfnuWJAa/u1IleABGqt6L0uV7GfLcFN5
	yuInCHljju9kzVvCMXlbT4bGSh1xbS1JPmElH4w8Y/2M/51dbk6inHQiU/jSbpF/kut0GqfCi46ga
	M4NgnufbI8yMPfvVd88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5t-0000000GAAR-1xBD;
	Mon, 17 Nov 2025 13:16:33 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5q-0000000GA6C-2c2w
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385391; x=1794921391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ctNkfMcgAeqFcDVXLY1IY0VwKyPzqj1iuHGs+8QXPPw=;
  b=hbPDd0kGvFj/5hBv/j5LdoaIP/OnN/SqoSddzjR9dlt2noVZgKYDiuBa
   1hCOwc8aUkWiZxBttxyMiAUn/377ZBzrGtH6+bffHWq6fLWBmlNYEXbIY
   LhStSc/tSd/SnSrOlxgwQFDjImR5rxkzT56qIHKdnKSYtCbCpw5ErRODe
   ZNSuQmGU9suQiAkFfD+QZ6Y5YDRgUqnCHoqMzvT7JDRMU0RG3sOm3rWiC
   SXdS0ylw6q9gbD4ovzG8WEIjZUi2GYvxcA312TPgdKAsbp63J7Y2uKld4
   UnHCSb1h87Osl095j83MJOMmpxX56IKMQmRdENG7h1oX2GJMs1fnqdJvc
   w==;
X-CSE-ConnectionGUID: W83+ZTJTRDGbe1mXBeH+cw==
X-CSE-MsgGUID: mzRkv25HSfqRX0aWDzOrYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009077"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009077"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:31 -0800
X-CSE-ConnectionGUID: HOXwi12aRXeApUCvajhwNw==
X-CSE-MsgGUID: 5mfmFco5S26mAueTP5wxxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549339"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:29 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 06/12] i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
Date: Mon, 17 Nov 2025 15:16:02 +0200
Message-ID: <20251117131609.65988-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051630_670300_5E94C6B8 
X-CRM114-Status: UNSURE (   8.65  )
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


Changes in V3:

	None

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
