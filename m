Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A485CCD4F54
	for <linux-i3c@archiver.kernel.org>; Mon, 18 May 2026 11:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQQo6c9ULFy7D1ZOKE0fA5FuHWdC3frIPS4rexSbisk=; b=Rvf9D2iJ3WPsu4
	qLpJIzUVjWjmX0pjERSuzY6sTK+fC3uBCvVirvVTAOyvWAU389pE6fsyh8qsashO/8OH9T2RYB+sT
	1o91+IH6wv0pK7v/LV8Ow6WEmSCrRe1bNmwribWmfwRbSS7wtYg7/NcUum/n4ZmwO1jJ7Sj9wKv1b
	0Be2G3QqHMWV2OVnsDr95kFuP80K92px4PFpWEAAiyFBh5irkVOVJFS3f2t+KXc1qrb3/GHVtDRDo
	0BrRj66wfwunNIzkJJd5+G1TrUbjcwd7zrZ09voJ+gYJq34IIvBYR2Ve3NNdow9nUzKL23D7OqdB5
	lWn0Tzfs8Q6mNf2ZsWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZi-0000000FWFE-1p9W;
	Mon, 18 May 2026 11:55:58 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZf-0000000FW3B-3q9v
	for linux-i3c@lists.infradead.org;
	Mon, 18 May 2026 11:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779105355; x=1810641355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0bL8ulieysntLRvRnDmRzhbLwv2zaHH4mGscI66FhyI=;
  b=j3VzyBVBFJJBygDnpIfyxJsjCA0pXD/FILhxr6eF/6qf0rz6Xn5RG7Pf
   bsAXKbyvj55xsGbeCOXtLXoZY9Z7IIfjIpsBteke43GDWfpGFKtuNE94R
   dTF7eCos1ASpl2lfaibN/4kGj1lUQ6NMCQfSf0F+XLp72DSwOFwBBEoPp
   NiVf+s74T9SSL57zBd36nzZUNveAaY8r2pwFEDysU5w0HWdEkV+4fAVNw
   X7RWMl9698j+mPc+ZZ/gRYI3ijFyitcyD+s4cQg9/5BceaqE/C3hMLdPF
   MmD6/p9fK/nWhvtbf9pBRcC43tERZvP4j3yLBOzrDSI8u5g/UPYaNyWM9
   g==;
X-CSE-ConnectionGUID: gJ9sDCv9RE2c7JSQa5onQw==
X-CSE-MsgGUID: tDWzKnX4TkSLEu4eLvuhMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91347105"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91347105"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:55 -0700
X-CSE-ConnectionGUID: fiMkYgZ1TxSjmm6Iat4Qtg==
X-CSE-MsgGUID: C1HPnQMJRTyz+XZRsEOfkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239663437"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.220])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:53 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 8/8] i3c: mipi-i3c-hci: Add Hot-Join support
Date: Mon, 18 May 2026 14:55:19 +0300
Message-ID: <20260518115520.98335-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518115520.98335-1-adrian.hunter@intel.com>
References: <20260518115520.98335-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_045555_965808_814B8F86 
X-CRM114-Status: GOOD (  19.31  )
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
