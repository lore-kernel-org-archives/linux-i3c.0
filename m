Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28128F8D762
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbXhCXT1hIQU6pwbB7Ce7ESYxnTX0tfW056JVJvPxCw=; b=sghDJSl8SEkeno
	v5KiqpoksszfkFA+Ia+bSS3mIeUZvFRMPpSfRiCVr9cTegK5mOFT0byi0TjYH7jYCYaIHYcbP0MdS
	a083XIF+qEFgyQFgLH0l3uFwxAkHoV/6oRCBbojrrx7gCWheG9MVrFgRTgyMoNSwUGimdwBWgrjZZ
	xrBVxnAIOnvV662VjEBGUdTit4CVMH8B/mx0N0CTAMdYwyJO8qaRtqlO0lK4ygS5KZDgcqKpcN8Xf
	cYfhczhVR1k7wvZgv4MlTlrEZv3IC7+MGBBVRUjYzv8r5amim1uXjMSCbUf7NHNczzcDsMES2r9bH
	cmx/zN6WYeNLOXb1355Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQy8-00000002jkp-3ndC;
	Thu, 16 Apr 2026 17:57:36 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQy6-00000002jix-1LkC
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362254; x=1807898254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=77W6GA+stdUcVskIr+bUAiS4B7iVgT27x26wIyOlJOA=;
  b=NFPD53UmGOb3w0Z0MI3NkLj1SBEcJ/v+u/Ion0NE5BnXGjrS7UvNI1jt
   bFge+8rTHuIqCRW6Z9wl6OlTFDKn85BuCqhlHqhBBGnSlOiwECXp5Ys+m
   aRtYD0fncft5RzGwQ9IXvr2jeAWgc+HFAhutlHfUWT2p9H+ZJAWgeJwWR
   k/2dMqERUzc5IE3z1b9UPy0Ko+3K4QXTTOge4qEimBe7b69wldfm1eHyd
   3ZLT6VK7MZm5bpgW/+1iqL6gG17b8fyEJ+uDma92QNIxiKZ34qnK6Nu5B
   BPdTAwIhdywGx0poW6APjXkYtcnzoDmRJVzrscD4So3Sds5ISevofp5PX
   Q==;
X-CSE-ConnectionGUID: bS30lCu2QMybDJ/hur1zNg==
X-CSE-MsgGUID: XUwBlaY/TV+gRuFhPnfA9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778397"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:33 -0700
X-CSE-ConnectionGUID: hMpLphOhSRa9BsKs6eRD2A==
X-CSE-MsgGUID: LW5nAciqTGGEuS4nylNihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784598"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:32 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/16] i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
Date: Thu, 16 Apr 2026 20:56:57 +0300
Message-ID: <20260416175704.41217-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105734_430056_DE150C83 
X-CRM114-Status: GOOD (  15.03  )
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
 drivers/i3c/master/mipi-i3c-hci/core.c | 15 ++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  9 +++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 5e1bc6d819cf..84fb03e918b0 100644
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
@@ -1043,7 +1055,8 @@ MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
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
index 5b394220a509..26533d3cc8bf 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -597,6 +597,13 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	rh_reg_write(RING_OPERATION1, op1_val);
 }
 
+static void hci_dma_abort_requires_pio_reset_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	if ((hci->quirks & HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET) &&
+	    (rh_reg_read(RING_STATUS) & RING_STATUS_ABORTED))
+		mipi_i3c_hci_pio_reset_all_queues(hci);
+}
+
 static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
 {
 	if (hci->enqueue_blocked) {
@@ -638,6 +645,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		}
 	}
 
+	hci_dma_abort_requires_pio_reset_quirk(hci, rh);
+
 	hci_dma_xfer_done(hci, rh);
 
 	for (i = 0; i < n; i++) {
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 527345a995ad..352effc468d9 100644
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
