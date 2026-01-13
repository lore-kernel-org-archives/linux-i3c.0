Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2092D29DE4
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7zAWZb4Xv2KYZLfINJJymMn9oFZOCblq8NIdXB/JyU=; b=ANn05EQucca2Pq
	DT3ait5dzuyxU3ms0W9QUeFD8/KKJCqVm2y/1p4bGQZ9nFihkzsN425d/UItHS4yE0gq6QD2WXN+b
	SHB0wMcoZXTIJpFZviIuExUcWCLJmLs6mP4AMWUdV2tIkXYgxoONagbd5PTmmhn/loIMcNY9Bw0tO
	EM03wVrKPti491WRa3gIqi2mGPeHO/S8Xhn9j/hNkQZMLgcYVDEazHB4HNw8tRnVwzBGiZ11wgcri
	g6cwTBMeBL+7Stwkmcs+smB42Afab5Neh5dxgOOnOLiIz7NfzfyJlqc24fcfxTOCkFwMaz7ZGLnTG
	Nf7b4joHQze0M4fUeWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoc-00000006ecP-2F5A;
	Tue, 13 Jan 2026 07:27:46 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoa-00000006ean-196W
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289265; x=1799825265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S1CNfvKhLyMMQdHvYVJg5T+3wDuOvZ+tGQshp8LF6fM=;
  b=KHCRzuGOInqVNOBr81D9kFGXVGDzdrqtmcZfKO7EXJ5i2tf4+YvT7Xbe
   tY6ttCb0neY1jVYJ6KbxV9oDFVC6usAVAdzWFzUdL+VBNQpWmmF960F8A
   vNX6cgySJD2x5j34ZtsMJX+2tuCT4D5G0kW+w0hUaovpVRjE/st7YIuSx
   hkJVxcWfe4vRpaovQlDozuHBEd+E0eY35oPzYSgovgQA+CdIjreIcio2Z
   a7SioChppzmkOzttqPP3e/RgAeAgSWa1svGHj1m6O2cKbUASY/deOjVPL
   Z1idAic3/zBGC8fbqHxIYwBaZYtXgk7qWZtaQuSRKxuUUKrli0Dp5xocP
   g==;
X-CSE-ConnectionGUID: p490X6KUQBGMGQW+rGnl+w==
X-CSE-MsgGUID: JLjEguEwTWOWLZ5LuiS8vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625494"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:45 -0800
X-CSE-ConnectionGUID: LCVRNwD2QASX61QE5Qotdw==
X-CSE-MsgGUID: kaLgJQI6RbeceN9mJkfB5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021299"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:43 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 12/21] i3c: mipi-i3c-hci: Refactor PIO register initialization
Date: Tue, 13 Jan 2026 09:26:53 +0200
Message-ID: <20260113072702.16268-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232744_358519_930FDCF3 
X-CRM114-Status: GOOD (  10.61  )
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

Move the PIO register setup logic out of hci_pio_init() into a new
helper, __hci_pio_init().  This refactoring prepares for Runtime PM
support by allowing PIO registers to be reinitialized independently
after resume.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/pio.c | 45 +++++++++++++++++----------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 3d633abf6099..52d9f01d9ca9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -135,27 +135,14 @@ struct hci_pio_data {
 	u32 enabled_irqs;
 };
 
-static int hci_pio_init(struct i3c_hci *hci)
+static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 {
-	struct hci_pio_data *pio;
 	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
-
-	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
-	if (!pio)
-		return -ENOMEM;
-
-	hci->io_data = pio;
-	spin_lock_init(&pio->lock);
+	struct hci_pio_data *pio = hci->io_data;
 
 	size_val = pio_reg_read(QUEUE_SIZE);
-	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
-		FIELD_GET(CR_QUEUE_SIZE, size_val));
-	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
-		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
-	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
-		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
-	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
-		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
+	if (size_val_ptr)
+		*size_val_ptr = size_val;
 
 	/*
 	 * Let's initialize data thresholds to half of the actual FIFO size.
@@ -201,6 +188,30 @@ static int hci_pio_init(struct i3c_hci *hci)
 
 	/* Always accept error interrupts (will be activated on first xfer) */
 	pio->enabled_irqs = STAT_ALL_ERRORS;
+}
+
+static int hci_pio_init(struct i3c_hci *hci)
+{
+	struct hci_pio_data *pio;
+	u32 size_val;
+
+	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
+	if (!pio)
+		return -ENOMEM;
+
+	hci->io_data = pio;
+	spin_lock_init(&pio->lock);
+
+	__hci_pio_init(hci, &size_val);
+
+	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
+		FIELD_GET(CR_QUEUE_SIZE, size_val));
+	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
+		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
+	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
+		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
+	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
+		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
 
 	return 0;
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
