Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D981CD4F49
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtcR8D+GqVl9p4DF6hh/bOFGFcsLg53ZDagfbH+2DBA=; b=PU1VbxScGQCy3Z
	5Rioh2+KIoHdQk9aScC2eLugC/we3bYvDW8HOD47dexNPZ++p0ZB46J9FzpHHIPe/0COm2tS6rk7+
	UplZI4EQELsUZ99mR3Fpsp1DmG4zvG25dBb1S15EkFiiahaxRBgeLbkPj8gIAiODj1u0m9iJ6w27t
	AkTOEcRj9zHmz90H7xJVB8sZGrGmCbFRT2H0m9Aq4AACtMYVIaWuydi1jwy/NRh/iSwx4/3lrqfB3
	K2EdfZTxNzQsJGIeiDG6j5kHA0pAXb3e241sRP2JfSBvxwoyOpyfQR7I2wA6Cj/iggbNW8rSNm/y4
	/BoY/J2NyW031EEYoLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN8-00000008rNw-0Fyq;
	Fri, 15 May 2026 16:26:46 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN5-00000008rJ2-2D1C
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862404; x=1810398404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=211AEh4Pq5WMRP3XSH8i3Q0DXrtefLFwgHUDVvOKiQo=;
  b=QAdViaYvksBGdMhqYvuATxqewaQ+yWNBT3/5MJkKdLO8VgS70+Va83tl
   bG2nX62dMXr9ZrUOHIwTZ8XGYiktyIeWEBV4Q9VMzDlCaqKZByW/Lq9L7
   JBu7UW5Urif8AsSf13VNdmI4nq3mTZXXIm3O+4MJJeK0pthDaIJq16lBv
   W7UVdNhbOjNO4xcHedmrfLgaM6ximjMHvb76jnXvDCm364CBcRvuPiHqa
   ugCHO/kh1GgQf47hM134F/b4h8N7MAMjSQ4LpNuUPVjuQLmNOwf/VbJN9
   3lZku8SrQqJhzPDhDnWr593Oq3PO7Vxe8ccFyhHFWc6xhe7devqhMUNJQ
   A==;
X-CSE-ConnectionGUID: arv43vr/RAebn088SkGFNg==
X-CSE-MsgGUID: yNqLWpWOSZusfyMoJKg6xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785242"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785242"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:44 -0700
X-CSE-ConnectionGUID: LHOzoov2QkW0QUT73aIGvg==
X-CSE-MsgGUID: fJf2opkWQnG7RLTYuOu6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857186"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:42 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 05/17] i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
Date: Fri, 15 May 2026 19:26:09 +0300
Message-ID: <20260515162621.57719-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092643_610476_B6481FCC 
X-CRM114-Status: GOOD (  11.83  )
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

Move hci_dma_xfer_done() earlier in the file to avoid a forward
declaration needed by a subsequent change.

No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3 and V4:

	None

Changes in V2:

	Added Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 98 +++++++++++++--------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 3b14bc87bdf6..ad47bb2890d6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -545,6 +545,55 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	return 0;
 }
 
+static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	u32 op1_val, op2_val, resp, *ring_resp;
+	unsigned int tid, done_ptr = rh->done_ptr;
+	unsigned int done_cnt = 0;
+	struct hci_xfer *xfer;
+
+	for (;;) {
+		op2_val = rh_reg_read(RING_OPERATION2);
+		if (done_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val))
+			break;
+
+		ring_resp = rh->resp + rh->resp_struct_sz * done_ptr;
+		resp = *ring_resp;
+		tid = RESP_TID(resp);
+		dev_dbg(&hci->master.dev, "resp = 0x%08x", resp);
+
+		xfer = rh->src_xfers[done_ptr];
+		if (!xfer) {
+			dev_dbg(&hci->master.dev, "orphaned ring entry");
+		} else {
+			hci_dma_unmap_xfer(hci, xfer, 1);
+			rh->src_xfers[done_ptr] = NULL;
+			xfer->ring_entry = -1;
+			xfer->response = resp;
+			if (tid != xfer->cmd_tid) {
+				dev_err(&hci->master.dev,
+					"response tid=%d when expecting %d\n",
+					tid, xfer->cmd_tid);
+				/* TODO: do something about it? */
+			}
+			if (xfer->completion)
+				complete(xfer->completion);
+			if (RESP_STATUS(resp))
+				hci->enqueue_blocked = true;
+		}
+
+		done_ptr = (done_ptr + 1) % rh->xfer_entries;
+		rh->done_ptr = done_ptr;
+		done_cnt += 1;
+	}
+
+	rh->xfer_space += done_cnt;
+	op1_val = rh_reg_read(RING_OPERATION1);
+	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
+	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
+	rh_reg_write(RING_OPERATION1, op1_val);
+}
+
 static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
 {
 	if (hci->enqueue_blocked) {
@@ -636,55 +685,6 @@ static int hci_dma_handle_error(struct i3c_hci *hci, struct hci_xfer *xfer_list,
 	return hci_dma_dequeue_xfer(hci, xfer_list, n) ? -EIO : 0;
 }
 
-static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
-{
-	u32 op1_val, op2_val, resp, *ring_resp;
-	unsigned int tid, done_ptr = rh->done_ptr;
-	unsigned int done_cnt = 0;
-	struct hci_xfer *xfer;
-
-	for (;;) {
-		op2_val = rh_reg_read(RING_OPERATION2);
-		if (done_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val))
-			break;
-
-		ring_resp = rh->resp + rh->resp_struct_sz * done_ptr;
-		resp = *ring_resp;
-		tid = RESP_TID(resp);
-		dev_dbg(&hci->master.dev, "resp = 0x%08x", resp);
-
-		xfer = rh->src_xfers[done_ptr];
-		if (!xfer) {
-			dev_dbg(&hci->master.dev, "orphaned ring entry");
-		} else {
-			hci_dma_unmap_xfer(hci, xfer, 1);
-			rh->src_xfers[done_ptr] = NULL;
-			xfer->ring_entry = -1;
-			xfer->response = resp;
-			if (tid != xfer->cmd_tid) {
-				dev_err(&hci->master.dev,
-					"response tid=%d when expecting %d\n",
-					tid, xfer->cmd_tid);
-				/* TODO: do something about it? */
-			}
-			if (xfer->completion)
-				complete(xfer->completion);
-			if (RESP_STATUS(resp))
-				hci->enqueue_blocked = true;
-		}
-
-		done_ptr = (done_ptr + 1) % rh->xfer_entries;
-		rh->done_ptr = done_ptr;
-		done_cnt += 1;
-	}
-
-	rh->xfer_space += done_cnt;
-	op1_val = rh_reg_read(RING_OPERATION1);
-	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
-	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
-	rh_reg_write(RING_OPERATION1, op1_val);
-}
-
 static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
 			       const struct i3c_ibi_setup *req)
 {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
