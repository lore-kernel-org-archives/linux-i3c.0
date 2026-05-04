Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01F1FF885A
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ur3H14epaWljLcLjf4fFvrV6vlJ6qXBM6C74rubfqXg=; b=GLWaZ+ztvxcs4G
	9xSVvN7kK8AmGCFI/juzXO6TU1YNtEqNszq2276/+4Q80YcL4G1ytdktkFhFlPVn2vLOd8HraESIJ
	B9LICJ9OVqPdXPBqgR70100yXe3AEaeu+pjXMU4Js/RsU116ZvZ3jGYl9NZlReeRuqgJYM1oEs5uz
	YnvcgAQwgx7PGXu/+lrWeaLPcWo4GXTPV9LyttjxztQh3xEADXGM7kv9BgyF/xV/YuoXDYS3kiwPq
	s/hfz2Msxj/qka8q8wpKdPD6OgiQycytlKd8owI8fevfWLtV+kvh7mYi/82xp6WfZMe/eFiG5EUfU
	JAy9ksX9uIZkEzwyC6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ8-0000000D3QA-0Q7c;
	Mon, 04 May 2026 11:34:22 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ5-0000000D3HH-1qD3
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894459; x=1809430459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wGhnE9vCekc+VegggAQI+J8l9oPFvKZCRqMb1M0F6Aw=;
  b=cam5dATRqFWZLdFYauN/yfEH0tivNns/B2E26UW32P9DUUdjIh2IBotd
   BmuWoj0QHTNWJupk0xbbmMZQB9ehX7hcg8Eoid3R/l/kjLhF9JLyGPYUb
   BwNmZYmbh5So0KIaMndeFY47ieKH0l1VJYGOTGYBg75iKm0BQmi+Y4TVK
   XLI1MzQoz3LuGFifuKqMskouJ6JXsh5/tSapdBrkGpV7gV5ab7+7GfHpg
   ctKBNLtx6egHbAX8v5910txddhEX/9ab63qoY7yxKKCyXY0TabS/fzvYU
   HmoBXf9u38OjhZhartMmK5UYmaq6YWEo4wL3FGTc90Hjau5GjBjrDygbj
   g==;
X-CSE-ConnectionGUID: H2ybHTXxTwS9n73Uj8qmbg==
X-CSE-MsgGUID: jx6S8PiZRqiSAkXcvc8oYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315212"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:19 -0700
X-CSE-ConnectionGUID: bo+0hXPwRl+O81SqtKv/Pw==
X-CSE-MsgGUID: XOW0gjZYQiOptIfd1KL3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478266"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 09/16] i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
Date: Mon,  4 May 2026 14:33:45 +0300
Message-ID: <20260504113352.38490-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043419_489283_19F624B4 
X-CRM114-Status: GOOD (  15.23  )
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


Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 15 ++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  9 +++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 25 insertions(+), 1 deletion(-)

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
index 268f54b32101..699c6d523eed 100644
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
