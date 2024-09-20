Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3B2C78854
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Sep 2024 14:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76m0sGj+2umXqIq5obJqxSkhFUbLvFV43KoZA+qLFnY=; b=n62vWsAtLMlxff
	IrLlwEbrVv61cKxe+YwW1W0GQdpewrAmGXhvyUKN1WOg7m2h1AG/MO+Kxy6IojKvaeehu3jrbRFst
	ves7dsjJug6iIRH9SqB3s9+2PH46QGEVOeV/TadNks9pATpmylOW1a1erWbezLJ2exrqUnOJD6HMY
	S9N4EzxMn5J5HDLW9PBnbOxnyZG6x96NyTUPi+DtEFJyleAsltpqugXs+e6ke+to4UopTs3yK+2F1
	u9G6rzbvOmLqeTuxnj2Yk0XCpkPxUnRsichFQaL6DawGetYPFdLXxog8L5muHBfGRHVANSwWjCIT/
	D92Sr2YlzUXwWucg8mKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sresH-0000000CPXt-3xAA;
	Fri, 20 Sep 2024 14:44:45 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sresF-0000000CPWn-1yay
	for linux-i3c@lists.infradead.org;
	Fri, 20 Sep 2024 14:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726843484; x=1758379484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=thAt3IdGuq8OScFkRF3EeZjE1XHAAIv9sE7x0inyaf8=;
  b=RNEDQQFfkbSFJ5JLYok0SdPjHxHEoq+xewJhCN8yeunjOtFCzYX0gKYg
   +eMCaD+myiOf5uMG0G3xohdDbwl9et3K0bGTmUp1YMRZjjCLDgjM/G/RA
   399yUMrAq/UBDO7j4wNLjluRRQYW9Yk92m5pWRG40yjIjlMhTB028riNf
   OyBjwQvf2pSwB4b2nwZH+kYx0lhSUrV7lmf0Xnk1xR0myNFUoqLPtTIUv
   7UXzH7I2/WYF0bAKdsqSjjqjNquEHArpScp/U8kaduQJAFJ+GN3GnYV5I
   s717KKaw67SlFKA8dZ32JFVfjUkjfYzJ7rjMcT+0P0dRfdHZ4vKH565Cd
   g==;
X-CSE-ConnectionGUID: H0fC+f2RQWGhHtnOuY8+zA==
X-CSE-MsgGUID: 3QFWHSfJRGKqMvQ5cI6gcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="51271281"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="51271281"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:44:41 -0700
X-CSE-ConnectionGUID: jYTReqjrTYuRUx31GF7wvw==
X-CSE-MsgGUID: PhBo6liJTjm+bobLUQi/Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70751962"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Sep 2024 07:44:39 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/2] i3c: mipi-i3c-hci: Handle interrupts according to current specifications
Date: Fri, 20 Sep 2024 17:44:32 +0300
Message-ID: <20240920144432.62370-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
References: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_074443_555658_7BE71E1C 
X-CRM114-Status: GOOD (  17.72  )
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

Current MIPI I3C HCI specification versions pre-1.0, 1.0. 1.1 and 1.2
don't have cascaded interrupt bits for the PIO and DMA (ring headers) in
the INTR_STATUS register as implemented currently in the code. Instead
bits 9:0 are marked as reserved with unspecified reset value.

To my understanding they were planned to be introduced in the version 2
and the original commit 9ad9a52cce28 ("i3c/master: introduce the
mipi-i3c-hci driver") was coding ahead according to a draft. With
remarks though.

This is causing that the DMA handler is not called until at least one
reserved bit 7:0 is set in the INTR_STATUS.

Since it looks that idea was dropped in later official versions and to
make able to handle DMA interrupts on an HW that is implemented
according to current specifications call assigned PIO or DMA IO handler
unconditionally.

While doing so remove cascaded interrupt bit definitions and the mask
argument passed to the handler functions.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 16 +++-------------
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  8 ++------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 +-
 drivers/i3c/master/mipi-i3c-hci/pio.c  |  2 +-
 4 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a82c47c9986d..b190401c89c9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -80,8 +80,6 @@
 #define INTR_HC_CMD_SEQ_UFLOW_STAT	BIT(12)	/* Cmd Sequence Underflow */
 #define INTR_HC_RESET_CANCEL		BIT(11)	/* HC Cancelled Reset */
 #define INTR_HC_INTERNAL_ERR		BIT(10)	/* HC Internal Error */
-#define INTR_HC_PIO			BIT(8)	/* cascaded PIO interrupt */
-#define INTR_HC_RINGS			GENMASK(7, 0)
 
 #define DAT_SECTION			0x30	/* Device Address Table */
 #define DAT_ENTRY_SIZE			GENMASK(31, 28)
@@ -597,9 +595,6 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 
 	if (val) {
 		reg_write(INTR_STATUS, val);
-	} else {
-		/* v1.0 does not have PIO cascaded notification bits */
-		val |= INTR_HC_PIO;
 	}
 
 	if (val & INTR_HC_RESET_CANCEL) {
@@ -610,14 +605,9 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 		dev_err(&hci->master.dev, "Host Controller Internal Error\n");
 		val &= ~INTR_HC_INTERNAL_ERR;
 	}
-	if (val & INTR_HC_PIO) {
-		hci->io->irq_handler(hci, 0);
-		val &= ~INTR_HC_PIO;
-	}
-	if (val & INTR_HC_RINGS) {
-		hci->io->irq_handler(hci, val & INTR_HC_RINGS);
-		val &= ~INTR_HC_RINGS;
-	}
+
+	hci->io->irq_handler(hci);
+
 	if (val)
 		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
 	else
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 13adc5840094..e8e56a8d2057 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -733,20 +733,16 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 	rh_reg_write(CHUNK_CONTROL, rh_reg_read(CHUNK_CONTROL) + ibi_chunks);
 }
 
-static bool hci_dma_irq_handler(struct i3c_hci *hci, unsigned int mask)
+static bool hci_dma_irq_handler(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings = hci->io_data;
 	unsigned int i;
 	bool handled = false;
 
-	for (i = 0; mask && i < rings->total; i++) {
+	for (i = 0; i < rings->total; i++) {
 		struct hci_rh_data *rh;
 		u32 status;
 
-		if (!(mask & BIT(i)))
-			continue;
-		mask &= ~BIT(i);
-
 		rh = &rings->headers[i];
 		status = rh_reg_read(INTR_STATUS);
 		DBG("rh%d status: %#x", i, status);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index aaa47ac47381..69ea1d10414b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -115,7 +115,7 @@ static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
 
 /* This abstracts PIO vs DMA operations */
 struct hci_io_ops {
-	bool (*irq_handler)(struct i3c_hci *hci, unsigned int mask);
+	bool (*irq_handler)(struct i3c_hci *hci);
 	int (*queue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 	bool (*dequeue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 	int (*request_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index d0272aa93599..2fc71e696911 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -979,7 +979,7 @@ static void hci_pio_recycle_ibi_slot(struct i3c_hci *hci,
 	i3c_generic_ibi_recycle_slot(dev_ibi->pool, slot);
 }
 
-static bool hci_pio_irq_handler(struct i3c_hci *hci, unsigned int unused)
+static bool hci_pio_irq_handler(struct i3c_hci *hci)
 {
 	struct hci_pio_data *pio = hci->io_data;
 	u32 status;
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
