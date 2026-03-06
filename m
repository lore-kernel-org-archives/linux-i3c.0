Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA20BF01804
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHQJMw/eV3WcirioC0SPsFhc0A3Mg/rF+SF6kTrhyu8=; b=awfkgbkYkQBNze
	3eRlJSic5TbcbiwnSNvP6UE9dxVgSAtT4FxN2ppY8+U2pSrDZOd6MnlrVhM+omcNH0eoc8TJ8l6Vb
	5BM1l9a/rqU9Nmxgu1MFHCNeA5Pqjtwo1oVrOGza6JDXOCb8aGbBNkEyGrt/VQxoiiz/zV/kiv6BV
	iF4eUFo6h2avdx4rHVHc8273gb29XB8+6pmHXIJmwNyAWDqaOxMUuHkA3PyRE1o0Ok+icdfAkWTo0
	M8dfkTlgmk8803Ae6M/aZin+1ql0CZIa5NTExBfiiQavjFWp1IKqq61vJs3fqbdHBAhvITjBUodPJ
	7rHfwgwLm7bigQD7+VBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYg-00000003989-2Zfr;
	Fri, 06 Mar 2026 07:25:14 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYd-0000000395H-237q
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781912; x=1804317912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=izQsnF3hRQ4+5zDUwDZEeNPVXmzY6TEtDSyjGb1zZt4=;
  b=bVc27h6ExrzF6FjgopGsqKHPoVJt+UjgeZ9Ck/jiIbJ3rqs3DWwwFoQv
   2U8WosJy95gaYemLA15J1wQFBO/7tyD7Em8fktf+hyoAwMtliVdc9/kM8
   eZF9KlGLJMlY8twbGKW7Cpsxhu3SBoC2JVj+RCsM/o5N+4ct36xp+0pfL
   dF/+JKvl9Eg1F5isNqAZzU3OV37XDQmYdLb7TppNeBPjv7hSsEfb89PIG
   cNSUarx408bngiE9estieoWbG2BHq+C6XvRDIwoYbb4W/RSNAGrt4iBWo
   ujd7GbplcwdyY4EtG6OZu+TMG06UZaFnlr2hNoAym4eTqLA6wkScfijAY
   A==;
X-CSE-ConnectionGUID: DAVAKIVbQFulouShrbeyWA==
X-CSE-MsgGUID: 4CGO0waVRcmYOcaVvWWvcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461328"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461328"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:11 -0800
X-CSE-ConnectionGUID: NlmQxdLRRGmFFEtfpdN8ig==
X-CSE-MsgGUID: 3oSRyQepSSmVvWIuxHJUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419910"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:09 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 05/14] i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers
Date: Fri,  6 Mar 2026 09:24:42 +0200
Message-ID: <20260306072451.11131-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232511_557587_10179FF0 
X-CRM114-Status: GOOD (  15.02  )
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

The I3C subsystem allows multiple transfers to be queued concurrently.
However, the MIPI I3C HCI driver's DMA enqueue path, hci_dma_queue_xfer(),
lacks sufficient serialization.

In particular, the allocation of the enqueue_ptr and its subsequent update
in the RING_OPERATION1 register, must be done atomically.  Otherwise, for
example, it would be possible for 2 transfers to be allocated the same
enqueue_ptr.

Extend the use of the existing spinlock for that purpose.  Keep a count of
the number of xfers enqueued so that it is easy to determine if the ring
has enough space.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Refactor of hci_dma_queue_xfer() to do all DMA mapping first, is
	now a separate earlier patch: "i3c: mipi-i3c-hci: Factor out DMA
	mapping from queuing path"


 drivers/i3c/master/mipi-i3c-hci/dma.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 2442cedd5c2a..74b255ad6d0f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -129,7 +129,7 @@ struct hci_rh_data {
 	dma_addr_t xfer_dma, resp_dma, ibi_status_dma, ibi_data_dma;
 	unsigned int xfer_entries, ibi_status_entries, ibi_chunks_total;
 	unsigned int xfer_struct_sz, resp_struct_sz, ibi_status_sz, ibi_chunk_sz;
-	unsigned int done_ptr, ibi_chunk_ptr;
+	unsigned int done_ptr, ibi_chunk_ptr, xfer_space;
 	struct hci_xfer **src_xfers;
 	struct completion op_done;
 };
@@ -260,6 +260,7 @@ static void hci_dma_init_rh(struct i3c_hci *hci, struct hci_rh_data *rh, int i)
 
 	rh->done_ptr = 0;
 	rh->ibi_chunk_ptr = 0;
+	rh->xfer_space = rh->xfer_entries;
 }
 
 static void hci_dma_init_rings(struct i3c_hci *hci)
@@ -470,7 +471,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	struct hci_rings_data *rings = hci->io_data;
 	struct hci_rh_data *rh;
 	unsigned int i, ring, enqueue_ptr;
-	u32 op1_val, op2_val;
+	u32 op1_val;
 	int ret;
 
 	ret = hci_dma_map_xfer_list(hci, rings->sysdev, xfer_list, n);
@@ -481,6 +482,14 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	ring = 0;
 	rh = &rings->headers[ring];
 
+	spin_lock_irq(&hci->lock);
+
+	if (n > rh->xfer_space) {
+		spin_unlock_irq(&hci->lock);
+		hci_dma_unmap_xfer(hci, xfer_list, n);
+		return -EBUSY;
+	}
+
 	op1_val = rh_reg_read(RING_OPERATION1);
 	enqueue_ptr = FIELD_GET(RING_OP1_CR_ENQ_PTR, op1_val);
 	for (i = 0; i < n; i++) {
@@ -518,22 +527,10 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 		xfer->ring_entry = enqueue_ptr;
 
 		enqueue_ptr = (enqueue_ptr + 1) % rh->xfer_entries;
-
-		/*
-		 * We may update the hardware view of the enqueue pointer
-		 * only if we didn't reach its dequeue pointer.
-		 */
-		op2_val = rh_reg_read(RING_OPERATION2);
-		if (enqueue_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val)) {
-			/* the ring is full */
-			hci_dma_unmap_xfer(hci, xfer_list, n);
-			return -EBUSY;
-		}
 	}
 
-	/* take care to update the hardware enqueue pointer atomically */
-	spin_lock_irq(&hci->lock);
-	op1_val = rh_reg_read(RING_OPERATION1);
+	rh->xfer_space -= n;
+
 	op1_val &= ~RING_OP1_CR_ENQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_CR_ENQ_PTR, enqueue_ptr);
 	rh_reg_write(RING_OPERATION1, op1_val);
@@ -601,6 +598,7 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 {
 	u32 op1_val, op2_val, resp, *ring_resp;
 	unsigned int tid, done_ptr = rh->done_ptr;
+	unsigned int done_cnt = 0;
 	struct hci_xfer *xfer;
 
 	for (;;) {
@@ -632,10 +630,12 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 
 		done_ptr = (done_ptr + 1) % rh->xfer_entries;
 		rh->done_ptr = done_ptr;
+		done_cnt += 1;
 	}
 
 	/* take care to update the software dequeue pointer atomically */
 	spin_lock(&hci->lock);
+	rh->xfer_space += done_cnt;
 	op1_val = rh_reg_read(RING_OPERATION1);
 	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
