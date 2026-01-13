Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D70D29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbmSly1p7i4gdIEfd3TlRxgAHzUejmV/5tyQAEe56C8=; b=AxKTHPU8yKvdnZ
	uQliJSc1kdkPDST9On9Oe0L7NfOGj/lUt1u2u1eqOkdp2ny6m/4o7uvFZ5tWAdMva2i7jOQecl74J
	DXfR/hcndD4MWu3Ggg3+AFh9pdV0HoLQz4IAgEN0RA3r3vCGwC+kBMUuVALXlyiIW8mVBXxhfqmu1
	TNsn97EZEBM9OTECbbcbG849fXRPcTd1/Aq8u8WPfEwN++DG+6ePzIQOIdZYjM1VxFVk4nCl6Yze6
	aQpLlA6c9FksV3A7iFhnAvF7stKUIcrdWhRkeq5o+mqrUEo7KmMpzJCh3d2CL16tgW++5levS9B6F
	a6ckZCMO1Dq5DgOcPu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYon-00000006ejX-0Fgw;
	Tue, 13 Jan 2026 07:27:57 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYok-00000006ean-2ZcO
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289275; x=1799825275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/WSSgxn+TWsSk6L8grvv51Dmmv37HJ/RhhcbfIoI5hI=;
  b=WZ7/tMrx9PEs0oAORsh5FxDhiPJn1V1y5WWIt3dK4+ZbyeFbeloDyhg1
   owOpo7l3gHgkfK+n6MJk+tNpBpE1Ufig68g4q7yzNddNk/i+vzdRM+l2Z
   gP2ksvA+jXJKeRt6lGWQTOllkf0dv4mwCVRqxZC+3QPHL+NRmgktx1e0j
   nSk6AL7bjfeNY18ug+38rA9+rPkoz6aP7XX2/Xk6TP4WiU7NL/OO36fHF
   Pbt+moK6GlRpCvhuJFtMAQh6v/T2uhyAaV0+3yOYr0F1AY1BW5X6eO+mJ
   u01O9VB46oj31R9ZAbSYgIBlehUjAY6wTcHKDSGr/wyV3DGT+anbAAvD3
   A==;
X-CSE-ConnectionGUID: OeCx4FeaQWaDtZW0R4w29Q==
X-CSE-MsgGUID: IqEMQkEcRNGX7v+FPDXLIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625524"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625524"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:55 -0800
X-CSE-ConnectionGUID: 8ebkg624Sda8b9Z29L8DPA==
X-CSE-MsgGUID: aSMzScExQLqC4J1MGEPfIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021371"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:53 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 17/21] i3c: mipi-i3c-hci: Allow core re-initialization for Runtime PM support
Date: Tue, 13 Jan 2026 09:26:58 +0200
Message-ID: <20260113072702.16268-18-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232754_699130_BAB4C428 
X-CRM114-Status: GOOD (  10.47  )
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

Prepare i3c_hci_reset_and_init() to support runtime resume.  Update it to
handle the case where the I/O mode has already been selected.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c | 38 ++++++++++++++------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8b8e3952d41d..fc0a47a36961 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -681,27 +681,31 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hci)
 		}
 	}
 
-	/* Try activating DMA operations first */
-	if (hci->RHS_regs) {
-		ret = i3c_hci_set_io_mode(hci, true);
-		if (!ret) {
-			hci->io = &mipi_i3c_hci_dma;
-			dev_dbg(&hci->master.dev, "Using DMA\n");
+	if (hci->io) {
+		ret = i3c_hci_set_io_mode(hci, hci->io == &mipi_i3c_hci_dma);
+	} else {
+		/* Try activating DMA operations first */
+		if (hci->RHS_regs) {
+			ret = i3c_hci_set_io_mode(hci, true);
+			if (!ret) {
+				hci->io = &mipi_i3c_hci_dma;
+				dev_dbg(&hci->master.dev, "Using DMA\n");
+			}
 		}
-	}
 
-	/* If no DMA, try PIO */
-	if (!hci->io && hci->PIO_regs) {
-		ret = i3c_hci_set_io_mode(hci, false);
-		if (!ret) {
-			hci->io = &mipi_i3c_hci_pio;
-			dev_dbg(&hci->master.dev, "Using PIO\n");
+		/* If no DMA, try PIO */
+		if (!hci->io && hci->PIO_regs) {
+			ret = i3c_hci_set_io_mode(hci, false);
+			if (!ret) {
+				hci->io = &mipi_i3c_hci_pio;
+				dev_dbg(&hci->master.dev, "Using PIO\n");
+			}
 		}
-	}
 
-	if (!hci->io) {
-		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
-		ret = ret ?: -EINVAL;
+		if (!hci->io) {
+			dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
+			ret = ret ?: -EINVAL;
+		}
 	}
 	if (ret)
 		return ret;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
