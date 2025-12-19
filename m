Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693DFD78787
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqVF+1XFYfsFsTq39y7kusEzmQkLE31YSCc80nVEngg=; b=AuBUKTBm/3PLYA
	YuPNyddFazSTVjrbuAGCFgXx067ImTNgzTyq/z6rixyJwfy/C+xka6RO3Ez/z3zXIvE2vHLCmHj4C
	DE+D3PONjwHq9+6kCn/UL0/GKrTGhNbc1cxJZ+lRRaUfrXEO0RgwSht/gDPGS+cVvlhq7SohfKaIB
	P9jODX1AKjQiyL7zJf/8PIyIJDeWkwvSnogzW8us1KC6UevN9clJOSVt+V8MoKuNwuFScA/GsmrqB
	07v7snKtrkXq4ZHRBaXtAO+r0q94/KgJUFR6x/uMOIAjf0+N60fqja4FPWK3dmyc/7FQSKOESl18n
	FsAl3aiMlHDn6Jk5/Ubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkI-0000000ARcn-0f61;
	Fri, 19 Dec 2025 14:46:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkF-0000000ARaX-1RR7
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155575; x=1797691575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ej4ctbx6prT3zUbWMxxgKpvCGi0KpyZbwrL13IAhAGA=;
  b=FhthXQ2YiTipd7PcosCRGstudm5b4QMWa2IokpKHnQRTVsrCN2t1UKh8
   viB1iN3KTP8LI1w+wf+mc8QMvZHNXl2OpsrC6tIaWwK6wciLgxfWFK0Ew
   G+bQfSQKNCcFCLKlOjthpZ5BUZC8Mz6VNLDY66hSFHDkT3ulobIf3YWoz
   EEGGLiKXdXbPiM1tJNRrue22xSkEXil6HNi/ODksW0xElgJOQZuG4Zc8A
   1PjU3o3uOWkWKEwErR5gdDiRd6+Qg2KeY2/kmq78kmHJYmZbeCqFh7vAU
   LUv6DQyzAafQjYF4GMVrdxVxf0ht/mzrfoP227sDE9C0MXkRCKPYtI8mY
   w==;
X-CSE-ConnectionGUID: mgyjTcevSdOK4W75R+cOLw==
X-CSE-MsgGUID: Tvga0Z7VTNWmsspcu+QO4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588978"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588978"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:15 -0800
X-CSE-ConnectionGUID: 5zbGiyxBTbORbq848ql/Iw==
X-CSE-MsgGUID: QJS2YaOyTIOxKgdqyjFPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564069"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:13 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 12/17] i3c: mipi-i3c-hci: Refactor PIO register initialization
Date: Fri, 19 Dec 2025 16:45:29 +0200
Message-ID: <20251219144534.84391-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064615_393593_39CD73A0 
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

Move the PIO register setup logic out of hci_pio_init() into a new
helper, __hci_pio_init().  This refactoring prepares for Runtime PM
support by allowing PIO registers to be reinitialized independently
after resume.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
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
