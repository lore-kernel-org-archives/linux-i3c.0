Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B01D148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHV4OuNnSarmNkL2ssliNcReQOq0z4x6aD0+R+YFK54=; b=LgsG6k6m2VcCpe
	Xe6jDWMXgWhMw9EYropDq0w6K58/7TpQgBKoemD5fGneAbES6aPr+xYylxbEJBJJtvG4rLpgymkTH
	Vj58iEfOMlcX1OOT5lHaurNjycrcbZYCHHcHRBMDTWr6ili7Z9oCwTM9e+X2KZr1MM3Choj4Yh5Bd
	3wYuqo3Lal11G1guX1w07G8xw9MA4eCzMlRPgGko+vWvpz9iGx8bNMnYHCuHa4XuINtDkIVcl6g0C
	yZHHt+Zgu2KUbZ7Lf14jrTnfWV0LXCoux22cZHTpCuW5eVhtpW4Do8J4Uk+OpTibt9DI0bFT6qz76
	4VpNf0mPUGuRsNmBCVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2P-0000000GDDa-1fVJ;
	Thu, 08 Jan 2026 08:06:33 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2N-0000000GDC0-2CHT
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859592; x=1799395592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9qF5MFXyUAnVGGnYBtR4U1lQHI3ANUwNCt8ht2St/7A=;
  b=K5KbHD6950QNiqn9AeXzDdGUkkoiNJVP0qVzbHkZf0cbCgubNiwMSIK6
   aHZvjxYp3cTbL/2/D+Lwd+6Yf6CEQEI51FinZpmthztIJ6sl4MR7R9Z49
   DUCDu6VaxqaVVxn5C5cSVKWOl6WvcOQI4Q426itTPmzVitmgadBJ5zQD2
   sqonGtAZlLsVkNbZdGwsEXuR7+nuBcGpjzegJtG/Wh9illJfPNXRVO9y1
   I/nj8snU2KvyZe/Y88GNfAp1GxNIlNiJO2cLx9hQJ2ZgE47eYx2K0r8vh
   T5GeMxPozZeGRNPGUTAR+OaVgUfO7WaPvP1jDGK8i4UGLFBlI8s4fy2As
   w==;
X-CSE-ConnectionGUID: bwg+aYp6ReeqDWpN/gMOgw==
X-CSE-MsgGUID: n1rrVjKkQjincJJQGp0xJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792310"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792310"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:31 -0800
X-CSE-ConnectionGUID: OCCqFheQSWu/EKg7kvKvDA==
X-CSE-MsgGUID: voGe+gEaTOqZJ3GYbvYkCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413602"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:29 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 10/20] i3c: mipi-i3c-hci: Extract ring initialization from hci_dma_init()
Date: Thu,  8 Jan 2026 10:05:48 +0200
Message-ID: <20260108080558.21767-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000631_576535_BB03BD42 
X-CRM114-Status: GOOD (  14.41  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 118 +++++++++++++++-----------
 1 file changed, 68 insertions(+), 50 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 4999cf3d9674..9ed69da52977 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -210,6 +210,71 @@ static void hci_dma_free(void *data)
 	hci->io_data = NULL;
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
