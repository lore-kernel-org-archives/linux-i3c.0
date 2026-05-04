Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A21CD3430
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyiF58okI6lCOqdXR0O6kXAiRmrD71jmUZbLga36jn0=; b=QpVqlTIzVN3Jdn
	BtUpnKRhGxy7EjB5L9bQCiKdscvDD8tLjswu3W4n8xGsTGwVvYTzwWcwwIGYlCKm2nWRvlER8X2sa
	9dOQodBsYKljD9c6g/B3AZgEdV1G/PHB169vwnqnw9NZCD0jUC9+a7OvEAGDWyfI4VgG9BFGPIzEX
	but7SsuPkYmj+S+zzoG8iBUgqe9ANuojjfYOiacZ1Qi3/J8qW9YBffuS6H9Z3V15wEh4SsWIWjkPp
	shNt0p4In0zjlTI9TyUfdK1lc+trixiNiEfBqWwSKUz0jlKaCljyfizyR/wt7n21oLFNsmBmM6VNP
	EsP9SF9ShopIVZctvUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ9-0000000D3RT-3uSA;
	Mon, 04 May 2026 11:34:23 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ7-0000000D3HH-0wwE
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894461; x=1809430461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f86i4XDsGlrKjm0Br2d3/oiMsI6uFn13A5Ha901yOGw=;
  b=hl+1tkJn5Vvo6IXvU7sAQ49Lc3lwr66G8cQNug20QWYLmesQy7QDzeyR
   XnCGZdhdGBlsZLSMUHojZnOFfCxMLupG9umMJLOd09CqKjHIk6vb22j2p
   OBzt3/YFzQ2eWz+RHbcTQTTPDG5kMnFSrEuCbyblJguQWm2Y7qQDOfcvQ
   /arAil/q6lR2i7Vp3JaBdiuq52IKQu9bbBfeuJGq2x9s+M9WQV5m8SuMb
   ezPU/7hxHS7m+nwPQzFRbyTSsg1A2CwqBHQDG/ZLUapZG8o5+IHU20f6G
   sLLUAhf3RocFuUgDakHPdu5/QHt5V1LZLvLnoi5hxo1Crd1opV837JF2k
   A==;
X-CSE-ConnectionGUID: /vtpY48BQ7W3vWotDWlLeQ==
X-CSE-MsgGUID: W2jC0+H1S+2nDNj7OvxePw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315217"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315217"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:21 -0700
X-CSE-ConnectionGUID: /MlSrEC4SAGno5/F0ihhAA==
X-CSE-MsgGUID: lxqSgeOAQSyJ7R23HxMF5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478277"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:19 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 10/16] i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
Date: Mon,  4 May 2026 14:33:46 +0300
Message-ID: <20260504113352.38490-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043421_278137_153A9C82 
X-CRM114-Status: GOOD (  14.65  )
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

DMA rings can be aborted either per-ring via RING_CONTROL or globally
via HC_CONTROL_ABORT. The driver currently relies on the per-ring
mechanism.

Some Intel I3C HCI controllers require HC_CONTROL_ABORT to be asserted
before a DMA ring abort is effective.  This behavior is non-standard.
Introduce a controller quirk to select the required abort method and
enable it for Intel LPSS I3C controllers.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 18 +++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 770235ad6b25..8274c84b16be 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -231,7 +231,20 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 
 void mipi_i3c_hci_resume(struct i3c_hci *hci)
 {
-	reg_set(HC_CONTROL, HC_CONTROL_RESUME);
+	u32 reg = reg_read(HC_CONTROL);
+
+	reg |= HC_CONTROL_RESUME;
+	reg &= ~HC_CONTROL_ABORT;
+	reg_write(HC_CONTROL, reg);
+}
+
+void mipi_i3c_hci_abort(struct i3c_hci *hci)
+{
+	u32 reg = reg_read(HC_CONTROL);
+
+	reg &= ~HC_CONTROL_RESUME; /* Do not set resume */
+	reg |= HC_CONTROL_ABORT;
+	reg_write(HC_CONTROL, reg);
 }
 
 /* located here rather than pio.c because needed bits are in core reg space */
@@ -1053,7 +1066,8 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
 	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
 				    HCI_QUIRK_RPM_IBI_ALLOWED |
 				    HCI_QUIRK_RPM_PARENT_MANAGED |
-				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET },
+				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
+				    HCI_QUIRK_DMA_REQUIRES_HC_ABORT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 699c6d523eed..41bbd912df7f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -597,6 +597,29 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	rh_reg_write(RING_OPERATION1, op1_val);
 }
 
+static bool hci_dma_requires_hc_abort_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	if (!(hci->quirks & HCI_QUIRK_DMA_REQUIRES_HC_ABORT))
+		return false;
+
+	reinit_completion(&rh->op_done);
+	mipi_i3c_hci_abort(hci);
+	wait_for_completion_timeout(&rh->op_done, HZ);
+	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
+
+	return true;
+}
+
+static void hci_dma_abort(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	if (hci_dma_requires_hc_abort_quirk(hci, rh))
+		return;
+
+	reinit_completion(&rh->op_done);
+	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
+	wait_for_completion_timeout(&rh->op_done, HZ);
+}
+
 static void hci_dma_abort_requires_pio_reset_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
 {
 	if ((hci->quirks & HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET) &&
@@ -630,9 +653,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		hci->enqueue_blocked = true;
 		spin_unlock_irq(&hci->lock);
 		/* stop the ring */
-		reinit_completion(&rh->op_done);
-		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
-		wait_for_completion_timeout(&rh->op_done, HZ);
+		hci_dma_abort(hci, rh);
 		spin_lock_irq(&hci->lock);
 		ring_status = rh_reg_read(RING_STATUS);
 		if (ring_status & RING_STATUS_RUNNING) {
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 01237b12d32e..97c31a315a6e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -157,9 +157,11 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
 #define HCI_QUIRK_RPM_PARENT_MANAGED	BIT(7)  /* Runtime PM managed by parent device */
 #define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
+#define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
+void mipi_i3c_hci_abort(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
