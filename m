Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C600D29DDE
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XidzPh7X3FXBL/GCk2hla8iw6c8tqGQDTWHv2xTkiBw=; b=BF/yOsVhoj7/4P
	amLAQHKOtzFOfRpQnQKORTHRkKZbIDz44PmmABs9Z7CEm7qmju8egG9lXgUTJ22enSm3BHlRuCi5Z
	Ti7PV2XEbyq48FSD0brFOBKsoFUakxnay1U3PiAByZ7w0UICSIODBgqfC+ck7Ov+vkCxBkRqrj79j
	SDn8TFHNlICBoys3M2IsAH+AqoZRD2sDdfw+eEzQD6+LNLZxXub/N6BS6TxTj8Obay9z/joQs5pLS
	AWT6fRaH9oymg8AdhnlhYhkx+x239+BLcudT5Ez/VEI0j3ubWpsRcEqW/6058x5LmFkH162B+cFMd
	px6FoWfmfn8JsPfWgqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYob-00000006ebK-0BQv;
	Tue, 13 Jan 2026 07:27:45 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoY-00000006eZU-13Ok
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289263; x=1799825263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yuEEOj5K5tCQQCm/cLHfkjUoSN+BzX/2Xmn4+60su3o=;
  b=NMYNoP7ZQZER5/jEI4WVX7rdJmSRIL8DIDskj9mQrBy3Shhg0IXYUdk7
   E3R1zmhV9IarPkTlhgv2cYi7rnTo4uLGfgHd3dN5SiqLuvtj1PWpd+vyY
   wVkgysQFVG/hqgEEXg7vtpU4PepJH/c9SJOBk/5/waeAmnPycE7UdHyJW
   Tj+EADaFU2YY/X1rzQ9fo6zvUNzPil5CP7OwyEIUF4zq8BYlc55/l+w1S
   bpLeTPNU20nWYp9Bf8oSwKmpUXUNO6qZnnkX3gWwbdy1dLBhPgCCrYOFo
   KDO2ZGl/W/weRK+Lh5cx9IIwJ1Rl7+EIG6pSlp4gzLe+8mXnnqCU2GJX9
   Q==;
X-CSE-ConnectionGUID: CWWtaVU6RNiaIBk06Z9Nvg==
X-CSE-MsgGUID: ze1kZZOHQE27OcR5dknRqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625488"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:42 -0800
X-CSE-ConnectionGUID: z02FW8C9RPip9B+PVb9oxA==
X-CSE-MsgGUID: oJojWc6MQ/qvP7rz1hUrTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021285"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:40 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 11/21] i3c: mipi-i3c-hci: Add DMA suspend and resume support
Date: Tue, 13 Jan 2026 09:26:52 +0200
Message-ID: <20260113072702.16268-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232742_882546_A637F5C4 
X-CRM114-Status: GOOD (  10.95  )
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

Introduce helper functions to suspend and resume DMA operations.  These
are required to prepare for upcoming Runtime PM support, ensuring that
DMA state is properly managed during power transitions.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 25 +++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 9ed69da52977..2e5b4974d431 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -275,6 +275,29 @@ static void hci_dma_init_rings(struct i3c_hci *hci)
 		hci_dma_init_rh(hci, &rings->headers[i], i);
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
 static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
@@ -865,4 +888,6 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
 	.request_ibi		= hci_dma_request_ibi,
 	.free_ibi		= hci_dma_free_ibi,
 	.recycle_ibi_slot	= hci_dma_recycle_ibi_slot,
+	.suspend		= hci_dma_suspend,
+	.resume			= hci_dma_resume,
 };
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index aa8a03594e64..38f927685d3b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -125,6 +125,8 @@ struct hci_io_ops {
 				struct i3c_ibi_slot *slot);
 	int (*init)(struct i3c_hci *hci);
 	void (*cleanup)(struct i3c_hci *hci);
+	void (*suspend)(struct i3c_hci *hci);
+	void (*resume)(struct i3c_hci *hci);
 };
 
 extern const struct hci_io_ops mipi_i3c_hci_pio;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
