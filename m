Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4ADD78783
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PotZM0fN6KbYVRP5DWBDSRnwSlnrpHeN7jA7H237c4Y=; b=IjlTDoc3zqctgk
	EHZXjiYuvnApaONONo24yp/USyvUdafYHBw1vDY5+y5KFyj4JrHUwiZKW00tQa1z+uZCgL2X/zvUL
	sd0Ww9VYtG5rhmGtG8WJOAt7R2ASt3u66FmaynFO+dz0XVzHTkmZPNX+mc/Ax/shtXfrsc9WLgWYd
	bfw+y8dv5ReRv4dBcfLzf7K1Kcknnv4dJ3aZWlBBwMDQ9lb4Gm2Kqb7tqowzL675VVKqflK35B+nU
	pzQ5pChsYwiZjCOrEiRXkYJazuXinfZyPUilk6hqT/bEq6LLx8LxHzlhtJr9jHiEV5+SlHEYjM3JP
	sRVl+mWm/m1gN0K3agaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkG-0000000ARbL-1hjP;
	Fri, 19 Dec 2025 14:46:16 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkA-0000000ARND-3msQ
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155571; x=1797691571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xukqR6hUyd1c3NRvmpl29AqhXo5SOzE0NBhWcgjPooA=;
  b=PBzYbH78mKxGPlebjk33eqsoy0QU1d4Ipc21q1qalxYIjLed+hVCUhiZ
   Kb2LJn6QF64nW5rtV4uSDO4tsX36lSF5GvcCWf5gBchCcFJeFfnuURU7f
   ZD5AZ6TBRklUDlNnsdnEUOpet7O43e1u/bK/igGKaDTHWgCm7i07wtCZ2
   qEA+Why75Xjqaa3o/ENvxYoqFQrd10iURnTAXQAPiUJeGlOigomOxcHow
   Fn1AKZg94rEfs7n5d7URvR//+u9JDP25sErwvs8jlny2CQsdbUErPYFnF
   Tur3SzpwgPLSgR6zYMpj1oa7IIvY1nZo54oCjOLaBaJnzO5jNQ2jXAkaW
   g==;
X-CSE-ConnectionGUID: YZRVwep1Stax33G7QfI6RQ==
X-CSE-MsgGUID: zHb+v1FTSq27cG4dXsd/Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588965"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588965"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:11 -0800
X-CSE-ConnectionGUID: 3E0MgANQTLy3vehZ92JtDg==
X-CSE-MsgGUID: vmg1FZSGRcKleWGrf7pz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564045"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:08 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 10/17] i3c: mipi-i3c-hci: Extract ring initialization from hci_dma_init()
Date: Fri, 19 Dec 2025 16:45:27 +0200
Message-ID: <20251219144534.84391-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064610_996868_E0EF328E 
X-CRM114-Status: GOOD (  14.50  )
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

Split the ring setup logic out of hci_dma_init() into a new helper
hci_dma_init_rings().  This refactoring prepares for Runtime PM support
by allowing DMA rings to be reinitialized independently after resume.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 118 +++++++++++++++-----------
 1 file changed, 68 insertions(+), 50 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 703d5cf79d5e..d0fc245f8e8f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -210,6 +210,71 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 	rhs_reg_write(CONTROL, 0);
 }
 
+static void hci_dma_init_rh(struct i3c_hci *hci, struct hci_rh_data *rh, int i)
+{
+	u32 regval;
+
+	rh_reg_write(CMD_RING_BASE_LO, lower_32_bits(rh->xfer_dma));
+	rh_reg_write(CMD_RING_BASE_HI, upper_32_bits(rh->xfer_dma));
+	rh_reg_write(RESP_RING_BASE_LO, lower_32_bits(rh->resp_dma));
+	rh_reg_write(RESP_RING_BASE_HI, upper_32_bits(rh->resp_dma));
+
+	regval = FIELD_PREP(CR_RING_SIZE, rh->xfer_entries);
+	rh_reg_write(CR_SETUP, regval);
+
+	rh_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+	rh_reg_write(INTR_SIGNAL_ENABLE, INTR_IBI_READY |
+					 INTR_TRANSFER_COMPLETION |
+					 INTR_RING_OP |
+					 INTR_TRANSFER_ERR |
+					 INTR_IBI_RING_FULL |
+					 INTR_TRANSFER_ABORT);
+
+	if (i >= IBI_RINGS)
+		goto ring_ready;
+
+	rh_reg_write(IBI_STATUS_RING_BASE_LO, lower_32_bits(rh->ibi_status_dma));
+	rh_reg_write(IBI_STATUS_RING_BASE_HI, upper_32_bits(rh->ibi_status_dma));
+	rh_reg_write(IBI_DATA_RING_BASE_LO, lower_32_bits(rh->ibi_data_dma));
+	rh_reg_write(IBI_DATA_RING_BASE_HI, upper_32_bits(rh->ibi_data_dma));
+
+	regval = FIELD_PREP(IBI_STATUS_RING_SIZE, rh->ibi_status_entries) |
+		 FIELD_PREP(IBI_DATA_CHUNK_SIZE, ilog2(rh->ibi_chunk_sz) - 2) |
+		 FIELD_PREP(IBI_DATA_CHUNK_COUNT, rh->ibi_chunks_total);
+	rh_reg_write(IBI_SETUP, regval);
+
+	regval = rh_reg_read(INTR_SIGNAL_ENABLE);
+	regval |= INTR_IBI_READY;
+	rh_reg_write(INTR_SIGNAL_ENABLE, regval);
+
+ring_ready:
+	/*
+	 * The MIPI I3C HCI specification does not document reset values for
+	 * RING_OPERATION1 fields and some controllers (e.g. Intel controllers)
+	 * do not reset the values, so ensure the ring pointers are set to zero
+	 * here.
+	 */
+	rh_reg_write(RING_OPERATION1, 0);
+
+	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
+
+	rh->done_ptr = 0;
+	rh->ibi_chunk_ptr = 0;
+}
+
+static void hci_dma_init_rings(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	u32 regval;
+
+	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
+	rhs_reg_write(CONTROL, regval);
+
+	for (int i = 0; i < rings->total; i++)
+		hci_dma_init_rh(hci, &rings->headers[i], i);
+}
+
 static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
@@ -247,9 +312,6 @@ static int hci_dma_init(struct i3c_hci *hci)
 	rings->total = nr_rings;
 	rings->sysdev = sysdev;
 
-	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
-	rhs_reg_write(CONTROL, regval);
-
 	for (i = 0; i < rings->total; i++) {
 		u32 offset = rhs_reg_read(RHn_OFFSET(i));
 
@@ -284,26 +346,10 @@ static int hci_dma_init(struct i3c_hci *hci)
 		if (!rh->xfer || !rh->resp || !rh->src_xfers)
 			goto err_out;
 
-		rh_reg_write(CMD_RING_BASE_LO, lower_32_bits(rh->xfer_dma));
-		rh_reg_write(CMD_RING_BASE_HI, upper_32_bits(rh->xfer_dma));
-		rh_reg_write(RESP_RING_BASE_LO, lower_32_bits(rh->resp_dma));
-		rh_reg_write(RESP_RING_BASE_HI, upper_32_bits(rh->resp_dma));
-
-		regval = FIELD_PREP(CR_RING_SIZE, rh->xfer_entries);
-		rh_reg_write(CR_SETUP, regval);
-
-		rh_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
-		rh_reg_write(INTR_SIGNAL_ENABLE, INTR_IBI_READY |
-						 INTR_TRANSFER_COMPLETION |
-						 INTR_RING_OP |
-						 INTR_TRANSFER_ERR |
-						 INTR_IBI_RING_FULL |
-						 INTR_TRANSFER_ABORT);
-
 		/* IBIs */
 
 		if (i >= IBI_RINGS)
-			goto ring_ready;
+			continue;
 
 		regval = rh_reg_read(IBI_SETUP);
 		rh->ibi_status_sz = FIELD_GET(IBI_STATUS_STRUCT_SIZE, regval);
@@ -342,45 +388,17 @@ static int hci_dma_init(struct i3c_hci *hci)
 			ret = -ENOMEM;
 			goto err_out;
 		}
-
-		rh_reg_write(IBI_STATUS_RING_BASE_LO, lower_32_bits(rh->ibi_status_dma));
-		rh_reg_write(IBI_STATUS_RING_BASE_HI, upper_32_bits(rh->ibi_status_dma));
-		rh_reg_write(IBI_DATA_RING_BASE_LO, lower_32_bits(rh->ibi_data_dma));
-		rh_reg_write(IBI_DATA_RING_BASE_HI, upper_32_bits(rh->ibi_data_dma));
-
-		regval = FIELD_PREP(IBI_STATUS_RING_SIZE,
-				    rh->ibi_status_entries) |
-			 FIELD_PREP(IBI_DATA_CHUNK_SIZE,
-				    ilog2(rh->ibi_chunk_sz) - 2) |
-			 FIELD_PREP(IBI_DATA_CHUNK_COUNT,
-				    rh->ibi_chunks_total);
-		rh_reg_write(IBI_SETUP, regval);
-
-		regval = rh_reg_read(INTR_SIGNAL_ENABLE);
-		regval |= INTR_IBI_READY;
-		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
-
-ring_ready:
-		/*
-		 * The MIPI I3C HCI specification does not document reset values for
-		 * RING_OPERATION1 fields and some controllers (e.g. Intel controllers)
-		 * do not reset the values, so ensure the ring pointers are set to zero
-		 * here.
-		 */
-		rh_reg_write(RING_OPERATION1, 0);
-
-		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
-					   RING_CTRL_RUN_STOP);
 	}
 
 	ret = devm_add_action(hci->master.dev.parent, hci_dma_free, hci);
 	if (ret)
 		goto err_out;
 
+	hci_dma_init_rings(hci);
+
 	return 0;
 
 err_out:
-	hci_dma_cleanup(hci);
 	hci_dma_free(hci);
 	return ret;
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
