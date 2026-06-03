Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276FCCD6E64
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mw9HJdvHqdtDIESFswIeS2RjFIH6l2XjbHOX+ZYVLUI=; b=kvltCFuagJo/8A
	JvCB20EL53lRUFyTtH/ZDiuq9m279erVqKXu4jctmg2pIJl+SXHDX0iDCTktxvIHRkZJ+/6tuZfoq
	BUfDBnBsAD2SWh6Eq4IKwxb9zwKZEKY0IdYslawGyeQu0nclisnuy7DvPXLWCM2aBgNcoBxFzK21n
	4t7JkjGcR6wR9KzNuFDG1RWPYO5FHEoOKth69L3LAN8m+2hpc6HnfigLvc/Uctf/gwr/XR1xwUxfg
	t0hSrYJmyXjbgO5dPb1+Zn7U0PioNIT3CJSKwdogNJkZXbcpbFX8vXGZTmz4gXpc7ShDKE8cPrSjx
	sfVXU8EStxzTEPuLbWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaP-0000000Efql-3ooT;
	Wed, 03 Jun 2026 09:08:29 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaN-0000000Effy-2DHH
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477707; x=1812013707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6RRaJreBve6mu8ti+xens3YsDLsfCy9RNn77rU5QanU=;
  b=hO521fnUjScrMptUqfvlRRY+nbsVowim80CeYALgWxKS93fLLP/WCe6H
   +VPhfaCKP43vpgxbOaFdZYCrj1xXDvG3TJJ9pkVaES6akGCAAgIWhf7uW
   nrPyE0zv50jKOL+siZRuqLpy4CfZBZn69m3xkuRE4SkCueGYn3nD0LPi3
   f0PT7QpmXzCb/yOTKMvVxxCwgk/tMwSWHiInYnxGrk8eKGFAv+hyFxKAP
   Yt7ZZnepOhNqumyTkA/Gy2S5vS3x7V2Z2CBPCs3/HsRCuxujYH4zI0tDp
   Qy1GFDKu5kahhd49qTIU4DfJdMTgjgJBh4PUiFRLsymEPvIfzDrvAW8XB
   w==;
X-CSE-ConnectionGUID: ZWbG1qroSwGikG0QKebrmg==
X-CSE-MsgGUID: 23f+ZHB6TDah/nUY0UsNZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852640"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852640"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:27 -0700
X-CSE-ConnectionGUID: 1Abb0JRZR7q72dnxBmwMtw==
X-CSE-MsgGUID: HfR3/B5/QSWWqvhzM+ZQ9A==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:25 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 09/17] i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
Date: Wed,  3 Jun 2026 12:07:46 +0300
Message-ID: <20260603090754.16252-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020827_577309_92A31CE0 
X-CRM114-Status: GOOD (  14.76  )
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

Some Intel I3C HCI controllers cannot reliably restart a DMA ring after an
ABORT.  Additional queue resets are required to recover, and must be
performed using PIO reset bits even while operating in DMA mode.

This behavior is non-standard.  Introduce a controller quirk to opt into
the required PIO queue resets after a DMA ring abort, and enable it for
Intel LPSS I3C controllers.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'ed-by

Changes in V4:

	Inline HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET check at call site
	instead of using a helper function

Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 15 ++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  4 ++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 44617eb3a3f1..770235ad6b25 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -240,6 +240,18 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci)
 	reg_write(RESET_CONTROL, RX_FIFO_RST | TX_FIFO_RST | RESP_QUEUE_RST);
 }
 
+#define ALL_QUEUES_RST (CMD_QUEUE_RST | RESP_QUEUE_RST | RX_FIFO_RST | TX_FIFO_RST | IBI_QUEUE_RST)
+
+void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci)
+{
+	u32 regval;
+
+	reg_write(RESET_CONTROL, ALL_QUEUES_RST);
+	if (readx_poll_timeout_atomic(reg_read, RESET_CONTROL, regval,
+				      !(regval & ALL_QUEUES_RST), 0, 20))
+		dev_err(&hci->master.dev, "%s: Reset queues failed\n", __func__);
+}
+
 /* located here rather than dct.c because needed bits are in core reg space */
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci)
 {
@@ -1040,7 +1052,8 @@ MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
 static const struct platform_device_id i3c_hci_driver_ids[] = {
 	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
 				    HCI_QUIRK_RPM_IBI_ALLOWED |
-				    HCI_QUIRK_RPM_PARENT_MANAGED },
+				    HCI_QUIRK_RPM_PARENT_MANAGED |
+				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 8e27fb6f18f5..906de7dbfdb5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -638,6 +638,10 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		}
 	}
 
+	if ((hci->quirks & HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET) &&
+	    (rh_reg_read(RING_STATUS) & RING_STATUS_ABORTED))
+		mipi_i3c_hci_pio_reset_all_queues(hci);
+
 	hci_dma_xfer_done(hci, rh);
 
 	for (i = 0; i < n; i++) {
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 83d4f13a68a3..01237b12d32e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -156,10 +156,12 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
 #define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
 #define HCI_QUIRK_RPM_PARENT_MANAGED	BIT(7)  /* Runtime PM managed by parent device */
+#define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
+void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 void amd_set_od_pp_timing(struct i3c_hci *hci);
 void amd_set_resp_buf_thld(struct i3c_hci *hci);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
