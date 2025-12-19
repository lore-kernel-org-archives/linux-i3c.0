Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA71D78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYknyFES+ow/59QKCezPAdvVFKkJ2bCxSbrqbb/3Qms=; b=MqdZ1fDiF+2Rrd
	dVgOvTk5gNkiTxV6VeQlKqpM9iK0QLxaIYXfwawP/NQ+787Fa3H73k8ANN1PCi42ZMtqN21hHfE71
	klO3oXGRsmxLqmveri7fsOzXZuK36ORcdbUMH0BqAaXqpspQs+e5iiV2jbV6rdZSF0ZsC+0nYoEPU
	tuSIb6LRoAMjWgm2dNMWdVmhh0iRpF/8UGawq7oRPxMqxMCOQ+6sfuAPpnWA9R8srHrT/KxNHYctX
	gJNTDsjsh/8S8muT8RS2EV0n/qD5Wxf2W7yPgTzJGKGRM4T3vsn10NCEs+5FDta8AT4b0pIwitb1/
	YJ7cxtsFdx8B4n/fPQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbjw-0000000AROR-29mn;
	Fri, 19 Dec 2025 14:45:56 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbjt-0000000ARND-2T5a
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155553; x=1797691553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xmgLTeRGrynxeh41WljI1JfzmR3CoNZzLmirrn5GYaA=;
  b=N9/BD447U/7PcnQ7Yu6KET3HGYX5y901SVx/UDWskRH20z9O3EJZgMBn
   iNyBYl8ciwNsc6H3c+Z6M+WQCQsCfUnQS9TM3+Q3QWjqM5BIjWYAnM0yi
   RhRgNoCxyWwBjtMfsc4yV0M3TUW/Xnvt0xz+1cGBUdeeAt96sFPUnZ7oy
   zOtGYnv9vqcw5RSB3qpBDPZxOA1/9rRUsm9G2cD3EnXANb/GZzWxTuebf
   XjCy3vQi/DH4yeQA3Xx3ZVhAMoJVjGuT1R/2ndMoxPyiM4injuokKHdKR
   fzJGuzUPPKoNee9nJqKGndtsMfumWhooqQt5Hwt6gyVWZuuPpjDABo+EU
   A==;
X-CSE-ConnectionGUID: QHk43uD1TiuKz7GUR2JlNQ==
X-CSE-MsgGUID: nZvlv/T0SH+QJuKyyBnb+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588912"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588912"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:53 -0800
X-CSE-ConnectionGUID: G8Ey8zkCR1SSxKEVktUj/w==
X-CSE-MsgGUID: 9gAwCYeTRFGrn0gXvMA0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229563931"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:51 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 02/17] i3c: mipi-i3c-hci: Ensure proper bus clean-up
Date: Fri, 19 Dec 2025 16:45:19 +0200
Message-ID: <20251219144534.84391-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064553_670104_DC5E98B0 
X-CRM114-Status: GOOD (  13.29  )
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
---
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
