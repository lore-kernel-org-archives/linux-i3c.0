Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA66D78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVD+bO/2zjJsrmhcQaVV0n//ApA4rHdkfDsK2ZIg+gQ=; b=uQlfpR4ba44nb1
	btyqCMkl42VbKe5vIWFun/gkDJk0NaU9sy9+uXt/e1pdbOSA9UgpmXutrsSC6SEl8PNOtKxmYFGJ6
	vwc3eQG5Dxx3BCFTfI/uayQ6wuLGU1eZ5VupLvM6D7oUgTYzsL93O2z2SRdKpxBaPgD59rC5Vxah5
	dM3c5mUqYNH+kTUDEFOfsf5kg+fhozDEP6IbT6SWX6mfVI6qS9myDvmjnsSd2egefMu7nOoVJSLev
	+l/4iWnHBgXmaUSNzeRNIsaKMWD3/CwoElTjtDPCK1caSpbVUF3HMGv+RPmhwIVyZBfDstNoRYkRh
	khtQCUl+KZt1iwLVBSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk7-0000000ARUo-0BRQ;
	Fri, 19 Dec 2025 14:46:07 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk4-0000000ARND-1oEf
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155564; x=1797691564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Kkau2PIc3pS747ea8fqNdxvkiPVC56dUyd4IZDUt/Q=;
  b=UfV91AvrbM4MJkQqa51qHSlegOXyHiCTfs+glLv10q/XIAJ4bYxSVHTi
   W8KnUT5yJekK6kQg7Ns2CsasbopcRQGByjfcsVsZo6iVQIYfpYyX18f4U
   XWmzWvzQEGz3oRr2a9HMxZVqmsQv48ONc8fhj2uYVonceJC9RBmKJjOMr
   yk8k2OyrWILr5pdT9vRofaEaCOuvoteB/QBNkhPKsgUrlphr0unOUfQL8
   3p0uSBHW8vwRJZ6QNMxkl1JX1LxNtAopJfkOr1G5FMzxkSk7cz8TlSG0/
   U3Ui2x4sPyd9r57jhniND9B2PAqk63pPoWg2ZLY3D7wDdfY4sbGyR4ppA
   A==;
X-CSE-ConnectionGUID: J1SVf/NIRQe1gDEokUwDeQ==
X-CSE-MsgGUID: b2/1xIJyRCi7rNwNisUJ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588946"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588946"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:04 -0800
X-CSE-ConnectionGUID: sI3UneU4TGiek+pK0rDt3w==
X-CSE-MsgGUID: KgtMLUiASQ664DVeWj1JsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229563998"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:02 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 07/17] i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
Date: Fri, 19 Dec 2025 16:45:24 +0200
Message-ID: <20251219144534.84391-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064604_488680_CD9BFC5C 
X-CRM114-Status: GOOD (  13.37  )
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

The driver already uses devres for resource management, but the standard
resource-managed DMA allocation helpers cannot be used because they assume
the DMA device matches the managed device.

To address this, factor out the deallocation logic from hci_dma_cleanup()
into a new helper, hci_dma_free(), and register it as a devres action.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 53 ++++++++++++++++++---------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 54849aa98fad..703d5cf79d5e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -146,30 +146,18 @@ struct hci_dma_dev_ibi_data {
 	unsigned int max_len;
 };
 
-static void hci_dma_cleanup(struct i3c_hci *hci)
+static void hci_dma_free(void *data)
 {
+	struct i3c_hci *hci = data;
 	struct hci_rings_data *rings = hci->io_data;
 	struct hci_rh_data *rh;
-	unsigned int i;
 
 	if (!rings)
 		return;
 
-	for (i = 0; i < rings->total; i++) {
-		rh = &rings->headers[i];
-
-		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
-		rh_reg_write(RING_CONTROL, 0);
-	}
-
-	i3c_hci_sync_irq_inactive(hci);
-
-	for (i = 0; i < rings->total; i++) {
+	for (int i = 0; i < rings->total; i++) {
 		rh = &rings->headers[i];
 
-		rh_reg_write(CR_SETUP, 0);
-		rh_reg_write(IBI_SETUP, 0);
-
 		if (rh->xfer)
 			dma_free_coherent(rings->sysdev,
 					  rh->xfer_struct_sz * rh->xfer_entries,
@@ -190,12 +178,38 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 		kfree(rh->ibi_data);
 	}
 
-	rhs_reg_write(CONTROL, 0);
-
 	kfree(rings);
 	hci->io_data = NULL;
 }
 
+static void hci_dma_cleanup(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	struct hci_rh_data *rh;
+	unsigned int i;
+
+	if (!rings)
+		return;
+
+	for (i = 0; i < rings->total; i++) {
+		rh = &rings->headers[i];
+
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+		rh_reg_write(RING_CONTROL, 0);
+	}
+
+	i3c_hci_sync_irq_inactive(hci);
+
+	for (i = 0; i < rings->total; i++) {
+		rh = &rings->headers[i];
+
+		rh_reg_write(CR_SETUP, 0);
+		rh_reg_write(IBI_SETUP, 0);
+	}
+
+	rhs_reg_write(CONTROL, 0);
+}
+
 static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
@@ -359,10 +373,15 @@ static int hci_dma_init(struct i3c_hci *hci)
 					   RING_CTRL_RUN_STOP);
 	}
 
+	ret = devm_add_action(hci->master.dev.parent, hci_dma_free, hci);
+	if (ret)
+		goto err_out;
+
 	return 0;
 
 err_out:
 	hci_dma_cleanup(hci);
+	hci_dma_free(hci);
 	return ret;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
