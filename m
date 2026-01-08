Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3889CF6BE5
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xWCbaJDRO7A6zOUNP2ltfnFDisaHSITyddqH9hGlo8=; b=dgmh0PaPJh6J4y
	2xvWgtTxsz4mAitVspOZP0n2rbynQYHO/HxAWlan4trISLsf2TDdwbSOk1MtiSaAmeKvDE+ZrIaP0
	QO5miPwOQXvLXFz3NBpCN+NGYGm/ulCFNTyJzpg4eog0abyrmV1EPpZ8NQfKsswspq5vbe0AFP26W
	jlK1Zj8qCsBpQEOl/E7LzR/3QvdlJzWe4yUEz3gFAkeHKkRt63+qJFEz38BSW9JGDadtOLBrGpyYK
	M7YZju7LKFGYm/llayAALqan2222ZvuWDo7v3H5p/oiF6MMX7Wx5Z2mGGwawn1VVUs9Fc/TBVLsbj
	AFEwqIFfz06acgjIC0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2S-0000000GDG5-2mQi;
	Thu, 08 Jan 2026 08:06:36 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2P-0000000GDDX-1fkr
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859593; x=1799395593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t6S8ExrBYu6ar3F9YMvGiBEJizZcSwF3AS49tMrmAx4=;
  b=RUuinRepWZT54VVafDKiSU38h/pYA4BaUdORHKE3e8UFAOu7Rn2iOTVF
   xbjb6ADDBtjJYEbphs9fY/+XX9jpbYEyZ/QgMp91BKmZ2ZukRlxOwbaa1
   u/zyMFlEYm6S//5/LynREtxfFMJbx7JCwj2jvZNjsX8gEJuurzJUe8paQ
   i/tyVNhpQI5TsIcwecOPm3Sf8051zaqThJYyUB8AdzWDNW8jzOdnS+Df/
   CXYD0dUVfKUfAPNXJ1nN89EozbRrpbSyP4LR5ZkcrA2dRTPb5UGjZRuRW
   clZHbejig26E3KeF2WoafCmRDWXkS0lSyan36jTrsIfhkKZspfUXVPWos
   w==;
X-CSE-ConnectionGUID: llKEXmnmQxqaZ3gkWdyzIA==
X-CSE-MsgGUID: UM+d2a0ITyG3uSt5zNV6Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792315"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:33 -0800
X-CSE-ConnectionGUID: PfLPRON5QwqBbIifS9uQHA==
X-CSE-MsgGUID: n2Ww31//TJunvh9+k8Pqow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413606"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:31 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 11/20] i3c: mipi-i3c-hci: Add DMA suspend and resume support
Date: Thu,  8 Jan 2026 10:05:49 +0200
Message-ID: <20260108080558.21767-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000633_448943_882CE0BE 
X-CRM114-Status: GOOD (  10.41  )
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

Introduce helper functions to suspend and resume DMA operations.  These
are required to prepare for upcoming Runtime PM support, ensuring that
DMA state is properly managed during power transitions.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 25 +++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 9ed69da52977..2e5b4974d431 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -275,6 +275,29 @@ static void hci_dma_init_rings(struct i3c_hci *hci)
 		hci_dma_init_rh(hci, &rings->headers[i], i);
 }
 
+static void hci_dma_suspend(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	int n = rings ? rings->total : 0;
+
+	for (int i = 0; i < n; i++) {
+		struct hci_rh_data *rh = &rings->headers[i];
+
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+		rh_reg_write(RING_CONTROL, 0);
+	}
+
+	i3c_hci_sync_irq_inactive(hci);
+}
+
+static void hci_dma_resume(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+
+	if (rings)
+		hci_dma_init_rings(hci);
+}
+
 static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
@@ -865,4 +888,6 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
 	.request_ibi		= hci_dma_request_ibi,
 	.free_ibi		= hci_dma_free_ibi,
 	.recycle_ibi_slot	= hci_dma_recycle_ibi_slot,
+	.suspend		= hci_dma_suspend,
+	.resume			= hci_dma_resume,
 };
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index aa8a03594e64..38f927685d3b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -125,6 +125,8 @@ struct hci_io_ops {
 				struct i3c_ibi_slot *slot);
 	int (*init)(struct i3c_hci *hci);
 	void (*cleanup)(struct i3c_hci *hci);
+	void (*suspend)(struct i3c_hci *hci);
+	void (*resume)(struct i3c_hci *hci);
 };
 
 extern const struct hci_io_ops mipi_i3c_hci_pio;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
