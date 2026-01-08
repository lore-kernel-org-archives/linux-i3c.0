Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C9CF6BE5
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vZKYijcbRGqljxQMjxIx9gudEvd0HQVpiStIQZ+h/4=; b=KDUndKzv9R5a0Q
	R+6N+H/du48oor3J1PAPOd0hBhF9ohiJe1lZiIaP3kSTf/TrEaPHxn4ID1McxwpSlL8rra5tln5Zk
	PMqL+eXBoQTk31tL6w/tyC+ckNanOeLh9zrCAH6BnqTo2u/s2ZFyiDMAsxuY6cdaRhv46FhoGeWd+
	FlfMcqbQM7o3i+oyShXYPCThxY0+fKNCrDG2o4YDvltmFNb9igjhgCVDYFlqBil3+PtEcqBar7RmO
	TFhG1Hrzs4gwX0hmlx3hiU+GjJ5EIb74o3mIT72pV86QJpYQfKMyBEMU3pdWN2T0PxfiMEKL52RoK
	8EI4hCiG4nW38E/dUGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2A-0000000GD3g-1gLU;
	Thu, 08 Jan 2026 08:06:18 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl27-0000000GCzw-2UVH
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859576; x=1799395576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JbM9kunbOos/9Xc/rA8jc2nis9O0iQfRHKEbUgnbJFI=;
  b=TzvVSbIfv3WSOMl0SuTHVhoilzh6yyeyUgpSVgQNyvYsvf6dmOp137ra
   EKdnkg9BIKX5+vk825JewTcb8GE8rmGkX1XeyTUkMJdz2DIB6p+oWJhMz
   TB+BzMFR5jxu0kiZKfE5N7ZOdDVWLkY6cGSCZm7LrEXlYM4cmQoTjlKYp
   RfVoku5kdqD5ZywBlBaM5oO26aiPoRSS/Mkv2PqWVVGLnwzYzjj5F6u8L
   go5qtMij2/b1vzkZxDn/8i81cVPJuCZQ5SujmX3F2b2RZTWVpuyRsralP
   y/4NxMlGDo2CiTi9PILFS/PFPerzWjklKz0kqtLqHfcD00CuJkf8Lp4I/
   g==;
X-CSE-ConnectionGUID: vxMU62ahSz+UAPv9ekr8Ww==
X-CSE-MsgGUID: EuqdqqJRRxixpjyfvL2TcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792253"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:16 -0800
X-CSE-ConnectionGUID: 3Ez+50YESvCRLLPFt1LSzA==
X-CSE-MsgGUID: 0FsKyl3PRdK3h1PmoWxV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413565"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:13 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 02/20] i3c: mipi-i3c-hci: Ensure proper bus clean-up
Date: Thu,  8 Jan 2026 10:05:40 +0200
Message-ID: <20260108080558.21767-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000615_964697_54E0FF98 
X-CRM114-Status: GOOD (  12.98  )
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
