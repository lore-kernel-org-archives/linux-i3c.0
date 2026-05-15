Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDE8CD4F25
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcDn7ZVFVwefkro4QaLLPzVfks4ZIJnccP711wHcwyY=; b=DUGFiXouDqI6M7
	I9mSFEK5YWHop/LdFiEbCc34SD1B+8J1xHLRnoqFiF3pZSLNRno9pCayjv/6mRfTfk/SbXI77jvyC
	Ye5witbXc3IGY0of1jo+SuYocjC6NkIVowTMshq/JDPbul2ijIOGpaBYlZXsxpRizJs3MarUrEuKJ
	GJP5NH0XMRCr+qsSI403NxVbHlo7oGvgLaL3sOwraBhDcUtJ7HK2ev25Spd4IVWD6qXB+JO9R1d5I
	NOQXmadfdlpwgy7WyzGKdH9ew1Y0QOTXoqZOGGzY+gPu7HRkUkF6nFmiT3zTiJlBKcVO7kGKYL62J
	ry/GzFh69OvL6VVW8mdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNG-00000008rTN-0msy;
	Fri, 15 May 2026 16:26:54 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvND-00000008rJ2-1Mak
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862412; x=1810398412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hG9wfkwAaz+u19uqN8A9JPhHYm6btu6rZ1Ynz0/WCXM=;
  b=dOOIGcFA57QAv0wbFjmtGkSmStkn9NonedOMcmwrbWFuL5mx25jRrAgU
   hT/i7p++5PU/d1SN0ZcyJB/NyDqHO2sLCqYFnNaQTAzDztvmcG4qrG1uF
   5xDeijqRwvaVCZP65zxUZ1yZ7Syq5mEqy7XX2yTTCOEY17PbQ/g7A8Q79
   iI7Ox6oQ1LTWDWqbbH4Me/clQJPQhRez+PSNz77cC+2BRteJY/ZKTme83
   Y62zR+voEAdom/1wnrEOmhSECChokZ1ZjmaEx87OgnuwyZPImVaqE+QAS
   TCbIt6XKyap8YW10Xy/zRKV6hVg+gDrActdhAgy6KYA5dYH3fQd4SboYj
   w==;
X-CSE-ConnectionGUID: iBkHbC3eRc2GfE2uRxTDfw==
X-CSE-MsgGUID: f/kf6ZQYT5aPydze6Gwcig==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785270"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785270"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:51 -0700
X-CSE-ConnectionGUID: 9Ka0mOSHRpq2bBc/GVzjTA==
X-CSE-MsgGUID: IzC0DjdXShiPFaUIjcZASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857232"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:50 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 09/17] i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
Date: Fri, 15 May 2026 19:26:13 +0300
Message-ID: <20260515162621.57719-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092651_429720_35E7763A 
X-CRM114-Status: GOOD (  14.86  )
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
---


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
