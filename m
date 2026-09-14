Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4790C88E50
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rANAZCkWGaj/ccSEh+DKfvkbsxkRGj9yp8xJEFINvVQ=; b=AJq0K6ZEe3G0gQ
	k3ws8rFCafUx81B5pEAewC2dUc2/vmjf0mZsOyn/EKQGVNf3O9gBhwtWqjdG0sptREhjE76q0YwBn
	fiWuChd4gqrupywiM0ooe6d6VpShDoYO0zBgDUJMjaRb9woJcszvyXFKKNWbVO65n3/moPc25Oj3C
	w8BtRBClV1wR+FOBNvluhVxWIMgYCeekJ9ykk2IPOYVKfCoBjU7jaMo4AjTzyWFODV6wPj5o+IAw0
	4V7+nTa100IqOmueYZcz6Kc6RHuUtLFVOmQ4zt+QBoyi+gNR0mJqEXjZylyeXxmGVeAES5TweiSfu
	nyUn4yH99tbXVgl/UbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tT-00000003FDv-1Vso;
	Mon, 14 Sep 2026 11:30:39 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tQ-00000003F69-2pgc
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385436; x=1820921436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7PFCDBL1XCn5xWL3dGQDx2EHjE+3ttPehJpb2mg7c5U=;
  b=IFVgSjj2wMlOVgma+1RP6PNwcBpoL4eRgamIOwebD2kGZx2yjFDmVQmP
   Fzmko/VwfPai6wiTEHjNCaH/h0DtXC599xCP5Ez+kyYXWZuU5dynL8soR
   jIIIpGVwPp7Rt8yGuJWcjgyP+4vdpjmZo0rbH7DvCaGXU7tbhIyHoGF6E
   WqFDmFkuzAS2vcfQ5quVQb84dJC2Zhsn2duNv+eaf55mK4u+Zwg4B9BtP
   DC6S4sON/Dls75kL9ylPrm3eLpzz9618FAMt/aOm1JkSnvTNldA3Fr25j
   QnBqMf4grxjfaa4tD7yR3WNcxTso1uLCR8hNN62dmtsR7SDRoD21rmJPK
   w==;
X-CSE-ConnectionGUID: JCY5AWjeRwWdfxAFcDKktw==
X-CSE-MsgGUID: UUbPX7tjQYue26TMAsHUhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864468"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864468"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:36 -0700
X-CSE-ConnectionGUID: BXjy2mclSPudj4jP4c+Nig==
X-CSE-MsgGUID: VOtHFmdqScmOysEwpiToVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133133"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:35 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/17] i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
Date: Mon, 14 Sep 2026 14:29:56 +0300
Message-ID: <20260914113003.183150-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043036_853314_245B5831 
X-CRM114-Status: GOOD (  10.17  )
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

Relocate hci_dma_suspend() and hci_dma_resume() closer to the DMA IO
operations table in preparation for upcoming changes.

No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index a798b0648922..ec4b469abd33 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -273,29 +273,6 @@ static void hci_dma_init_rings(struct i3c_hci *hci)
 		hci_dma_init_rh(hci, &rings->headers[i], i);
 }
 
-static void hci_dma_suspend(struct i3c_hci *hci)
-{
-	struct hci_rings_data *rings = hci->io_data;
-	int n = rings ? rings->total : 0;
-
-	for (int i = 0; i < n; i++) {
-		struct hci_rh_data *rh = &rings->headers[i];
-
-		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
-		rh_reg_write(RING_CONTROL, 0);
-	}
-
-	i3c_hci_sync_irq_inactive(hci);
-}
-
-static void hci_dma_resume(struct i3c_hci *hci)
-{
-	struct hci_rings_data *rings = hci->io_data;
-
-	if (rings)
-		hci_dma_init_rings(hci);
-}
-
 static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
@@ -1075,6 +1052,29 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 	return handled;
 }
 
+static void hci_dma_suspend(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	int n = rings ? rings->total : 0;
+
+	for (int i = 0; i < n; i++) {
+		struct hci_rh_data *rh = &rings->headers[i];
+
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+		rh_reg_write(RING_CONTROL, 0);
+	}
+
+	i3c_hci_sync_irq_inactive(hci);
+}
+
+static void hci_dma_resume(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+
+	if (rings)
+		hci_dma_init_rings(hci);
+}
+
 const struct hci_io_ops mipi_i3c_hci_dma = {
 	.init			= hci_dma_init,
 	.cleanup		= hci_dma_cleanup,
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
