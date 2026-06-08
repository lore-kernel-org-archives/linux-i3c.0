Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A3ACD8C8E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R47PIFT8vuyXLgEclGVHp+PRAlkYw3k3B17SMskDd0g=; b=FSyQA6fafL39h9
	bEpbSuWhxSyKbX8Oa81cue2TUffHRQCNQ65noJKXHML+w5nR1csgvvGPVMEVSPrgUquVVQdE7BsoN
	Ywk5iVXhyEUbrVm8n5bCZNTPvP1kUJq/OzcQ8XAdkq2JRNfMwBHLKtCBA3Khmi9LGXiK2GKZbvAJp
	Jb0x1qJ4jO7betrseSx7hB9oehk3sWmVsWDvFyjPznclHac4id47gzmgQVDPCnN7F53O82X+yfclG
	svWO6zGuQZ+6zEVMWo6Ul6aH5U7fC9/CEBQX6xulx/auQb4wQCz1FHPUxJ8Ov9JbePV/0TQzx3/Rx
	o4CTi9FSlU4eZ46wTZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlz-00000002qyQ-3nYn;
	Mon, 08 Jun 2026 05:43:43 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlx-00000002qr4-3ZHW
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897422; x=1812433422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7VHYV2bZu3Porwj0TuQLE+9A1Y+MGMUcHwFPdf21XE0=;
  b=AhtIYN92yU8g5KKcbQlnkKK9SrynayyTE0Q9l8NmSqjHgUI302Jed/KU
   7iV1a9Fddg+C6FdgJTQ9gEM7Vzi5nvSz2rTK2fLdcUVSAuExdm3ZC5omM
   I6F320n7eP2rHnu0ciT4j9bjSdL/yjHRWTx3C7ETbfk9LzPjTZ6KobZ8h
   ZU04/Rup2kIoylbXCbPSFcHFttVu0OTmOznLUMYpT/TiobfaMP6cPwkRT
   eZcinrlAGxllxFlAx/VLlDL9YicXa1IXk/lNZPpi8XFhocvSdgG+MXthK
   XnN6pbSfqpTjNkb180i0fsYGAL1y0E8LENOJZGN1ZeATDQvDnqyvidq4Y
   g==;
X-CSE-ConnectionGUID: /lrtWozyQVqJkCpsgBkOkQ==
X-CSE-MsgGUID: mS2vp80ISXOnCEO/wCeezQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284073"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284073"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:42 -0700
X-CSE-ConnectionGUID: zM6OP8QdR1KSt6QVBGSCzg==
X-CSE-MsgGUID: clC6zJTcQbyEJZVhCoFneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505708"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:39 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 8/8] i3c: mipi-i3c-hci: Add Hot-Join support
Date: Mon,  8 Jun 2026 08:43:12 +0300
Message-ID: <20260608054312.10604-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224341_927417_7B7E8650 
X-CRM114-Status: GOOD (  19.21  )
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

Wire the MIPI I3C HCI driver into the I3C core Hot-Join framework to
allow targets to dynamically join the bus after initial DAA.

HCI hardware ACKs or NACKs Hot-Join requests based on
HC_CONTROL.HOT_JOIN_CTRL.  This was previously left in the
NACK-and-DISEC state, effectively preventing Hot-Join.  Implement
the ->enable_hotjoin() and ->disable_hotjoin() master operations
so the core and user space can control this policy at runtime.

Also issue broadcast ENEC HJ when enabling Hot-Join.  This is required
because the controller may have previously DISEC'ed the Hot-Join
event, causing targets that were NACKed once to never retry.

Acknowledged Hot-Join requests are delivered as IBIs on the reserved
address 0x02.  Update both the DMA and PIO IBI paths to recognise this
address and forward the event to i3c_master_queue_hotjoin().

To make Hot-Join usable by default, enable it once after the initial
DAA.  This is gated by rpm_ibi_allowed, since otherwise keeping Hot-Join
enabled prevents runtime suspend.  A new hj_init_done flag ensures this
one-time enablement is not repeated on subsequent DAAs.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd by


 drivers/i3c/master/mipi-i3c-hci/core.c | 50 ++++++++++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  5 +++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 drivers/i3c/master/mipi-i3c-hci/pio.c  |  5 +++
 4 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index c6edbbedfdd7..53797841b63f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -392,11 +392,52 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 	return ret;
 }
 
+static int i3c_hci_enable_hotjoin(struct i3c_master_controller *m)
+{
+	struct i3c_hci *hci = to_i3c_hci(m);
+	int ret;
+
+	reg_clear(HC_CONTROL, HC_CONTROL_HOT_JOIN_CTRL);
+
+	/*
+	 * Broadcast Hot_join enable, so that an I3C device that has previously
+	 * had its Hot-Join request NACK'ed knows to try again.
+	 */
+	ret = i3c_master_enec_disec_locked(m, I3C_BROADCAST_ADDR, true, I3C_CCC_EVENT_HJ, true);
+	if (ret) {
+		reg_set(HC_CONTROL, HC_CONTROL_HOT_JOIN_CTRL);
+		dev_err(&hci->master.dev, "Hot-Join ENEC CCC failed\n");
+	}
+
+	return ret;
+}
+
+static int i3c_hci_disable_hotjoin(struct i3c_master_controller *m)
+{
+	struct i3c_hci *hci = to_i3c_hci(m);
+
+	reg_set(HC_CONTROL, HC_CONTROL_HOT_JOIN_CTRL);
+	return 0;
+}
+
 static int i3c_hci_daa(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
+	int ret;
 
-	return hci->cmd->perform_daa(hci);
+	ret = hci->cmd->perform_daa(hci);
+
+	if (!hci->hj_init_done) {
+		hci->hj_init_done = true;
+		/*
+		 * Enable Hot-Join by default after initial DAA if it does not
+		 * prevent runtime suspend.
+		 */
+		if (m->rpm_ibi_allowed && !ret)
+			m->hotjoin = !i3c_hci_enable_hotjoin(m);
+	}
+
+	return ret;
 }
 
 static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
@@ -652,6 +693,8 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
 	.enable_ibi		= i3c_hci_enable_ibi,
 	.disable_ibi		= i3c_hci_disable_ibi,
 	.recycle_ibi_slot	= i3c_hci_recycle_ibi_slot,
+	.enable_hotjoin		= i3c_hci_enable_hotjoin,
+	.disable_hotjoin	= i3c_hci_disable_hotjoin,
 };
 
 static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
@@ -833,8 +876,9 @@ static int i3c_hci_do_reset_and_restore(struct i3c_hci *hci)
 	scoped_guard(spinlock_irqsave, &hci->lock)
 		hci->irq_inactive = false;
 
-	/* Enable bus with Hot-Join disabled */
-	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
+	/* Enable bus, restoring hot-join state */
+	reg_set(HC_CONTROL,
+		HC_CONTROL_BUS_ENABLE | (hci->master.hotjoin ? 0 : HC_CONTROL_HOT_JOIN_CTRL));
 
 	return 0;
 }
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 5c6ae2055618..87622d6f817e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -960,6 +960,11 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 	}
 
 	/* determine who this is for */
+	if (ibi_addr == I3C_HOT_JOIN_ADDR) {
+		i3c_master_queue_hotjoin(&hci->master);
+		goto done;
+	}
+
 	dev = i3c_hci_addr_to_dev(hci, ibi_addr);
 	if (!dev) {
 		dev_err(&hci->master.dev,
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 30297823ca85..41d31a53abd3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -57,6 +57,7 @@ struct i3c_hci {
 	bool irq_inactive;
 	bool enqueue_blocked;
 	bool recovery_needed;
+	bool hj_init_done;
 	wait_queue_head_t enqueue_wait_queue;
 	u32 caps;
 	unsigned int quirks;
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 6b8cc5f2b4d2..b5ae1cfaa9e0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -862,6 +862,11 @@ static bool hci_pio_prep_new_ibi(struct i3c_hci *hci, struct hci_pio_data *pio)
 	ibi->seg_len = FIELD_GET(IBI_DATA_LENGTH, ibi_status);
 	ibi->seg_cnt = ibi->seg_len;
 
+	if (ibi->addr == I3C_HOT_JOIN_ADDR) {
+		i3c_master_queue_hotjoin(&hci->master);
+		return true;
+	}
+
 	dev = i3c_hci_addr_to_dev(hci, ibi->addr);
 	if (!dev) {
 		dev_err(&hci->master.dev,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
