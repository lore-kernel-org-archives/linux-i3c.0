Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D581BD29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANToVfreB3xOwhy9ouKGmFUfZ6B+zigaSwz1cYLjtWk=; b=ZjOqa9dblO9gCF
	Xdc3PRNf9CL3ycUEvKEEeBnqRm+I1BdB/PWBimCavyDMxhv1nc7pwKdvhDOg74PnFHvB1shLKXp0r
	jNIMKnilWCG5F9KgMCdJFeOPpz20mmTxJyQBWSOnXNk9ISOaAM0VsDq+sXsapq8nmc7+mSKQ5JE5v
	npHTJOFRr3NvC2nF1bL0S0lFKLFjyItrJh54Ls9U82HgkPym80Yxkg2owzAzY9m2sJ4Krm0kWHVlB
	oFrBEh1Ab5bWK5/nMPj66tUFSBuxCP1NZtuhi4mbsgF2J9GVQEKg9Sh8Y3TYs3HbBOe0rFc2c/t1h
	AL8Nc6XjEd7pEpLVaKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoI-00000006eQk-1eg6;
	Tue, 13 Jan 2026 07:27:28 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoF-00000006ePX-2Dn1
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289244; x=1799825244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mBmpa+6EhQce/rgiY4Xp4WoL4Tuk7HIgaxiPmvzqktM=;
  b=aLQaRZKwZVPdGQaRFfDHj8MC3fj5E3t/bTIMZWVxf4fXhqwtlTBImod3
   UBcvV4dtnkrfR3nHjCQf3PWQAxNjPqYt3wJmWdQ3lKRT0SG/VN7IvUt48
   nVxUSOfyDdu2Ev5/lvORKWqz5oAP6X9FWuwzNyP1U5jK8V39mfs5NypGY
   G2NC7lC5xoI1a7WTtDkhI007sK3th9LBNxzfxYFd0xnn8lx7l8g2jELv9
   8O39rspq5pVReAAj9OQh3aZWZy90KvFedNcT2eyaTdgp/D9eJH6N5J24I
   dmNO+iQveRVg1fUuDsJsSy5KJgvwRosjKzsS5q+VuSSesV5HP93qANWVj
   g==;
X-CSE-ConnectionGUID: T9ExZiKsREStu3+6U2fKTQ==
X-CSE-MsgGUID: PaiTopXXRySO2fH3hJrXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625424"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625424"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:24 -0800
X-CSE-ConnectionGUID: xxBLffYOTQSQ1xYYpI0CHQ==
X-CSE-MsgGUID: sGmO5qkuTGyvLovNDorO9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021135"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:21 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 02/21] i3c: mipi-i3c-hci: Ensure proper bus clean-up
Date: Tue, 13 Jan 2026 09:26:43 +0200
Message-ID: <20260113072702.16268-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232723_615231_D80E58F5 
X-CRM114-Status: GOOD (  13.44  )
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

Wait for the bus to fully disable before proceeding, ensuring that no
operations are still in progress.  Synchronize the IRQ handler only after
interrupt signals have been disabled.  This approach also handles cases
where bus disable might fail, preventing race conditions and ensuring a
consistent shutdown sequence.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/core.c | 32 +++++++++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  7 ++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 drivers/i3c/master/mipi-i3c-hci/pio.c  |  2 ++
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 6da5daf18166..0d3ec674878d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -151,13 +151,39 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	return 0;
 }
 
+/* Bus disable should never fail, so be generous with the timeout */
+#define BUS_DISABLE_TIMEOUT_US (500 * USEC_PER_MSEC)
+
+static int i3c_hci_bus_disable(struct i3c_hci *hci)
+{
+	u32 regval;
+	int ret;
+
+	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+
+	/* Ensure controller is disabled */
+	ret = readx_poll_timeout(reg_read, HC_CONTROL, regval,
+				 !(regval & HC_CONTROL_BUS_ENABLE), 0, BUS_DISABLE_TIMEOUT_US);
+	if (ret)
+		dev_err(&hci->master.dev, "%s: Failed to disable bus\n", __func__);
+
+	return ret;
+}
+
+void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
+{
+	struct platform_device *pdev = to_platform_device(hci->master.dev.parent);
+	int irq = platform_get_irq(pdev, 0);
+
+	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	synchronize_irq(irq);
+}
+
 static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
-	struct platform_device *pdev = to_platform_device(m->dev.parent);
 
-	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
-	synchronize_irq(platform_get_irq(pdev, 0));
+	i3c_hci_bus_disable(hci);
 	hci->io->cleanup(hci);
 	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
 		mipi_i3c_hci_dat_v1.cleanup(hci);
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 5515ed740ca4..54849aa98fad 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -160,6 +160,13 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 
 		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
 		rh_reg_write(RING_CONTROL, 0);
+	}
+
+	i3c_hci_sync_irq_inactive(hci);
+
+	for (i = 0; i < rings->total; i++) {
+		rh = &rings->headers[i];
+
 		rh_reg_write(CR_SETUP, 0);
 		rh_reg_write(IBI_SETUP, 0);
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 3f88b67bc5cc..fd08b701d094 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -142,5 +142,6 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 void amd_set_od_pp_timing(struct i3c_hci *hci);
 void amd_set_resp_buf_thld(struct i3c_hci *hci);
+void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 109c6c5d83d6..90dca56fc0c5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -211,6 +211,8 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
 
 	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
 
+	i3c_hci_sync_irq_inactive(hci);
+
 	if (pio) {
 		dev_dbg(&hci->master.dev, "status = %#x/%#x",
 			pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
