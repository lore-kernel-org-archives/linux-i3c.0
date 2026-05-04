Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A43FCD3430
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eI5un76G/iTZBo2fZGNr1bESCfRBiNJwVghrvZ6CGH0=; b=ReJSMPY3cp5wL/
	P8/Hn/kd6+fmlE1Wmv3s4xM97hHnCvUQtaBLuoNLu+K+PsvEdnsXI5ZbQ49mkzVd5vCxHO/Cu6s7/
	jSkheVRuXy7WJYSUndReuY1R0bYmh7p98N6JHhTA2y1ONF7lwmQQDJncwXR+nvU8TayPBl5WlL4Ef
	XxJYkivMUPpQ05iYeteUmHEO00DygMFhTlzat91+JUnzU5jQGsOVr2zZJmujv9Wms32eXH1Uhscd9
	FCl4heNngOFG8MqSCP9ZjJlGNTSlgqZ6abEWj7L7LzpW8J+SgKTgkfeofasTAFIr2NqvgI396CBIq
	BWatILkO72Ofg49hlorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ0-0000000D3LS-1MM8;
	Mon, 04 May 2026 11:34:14 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYy-0000000D3HH-1Bp8
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894452; x=1809430452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iN2shRNkaK73UGBWmJekGQhMx/1LLB+5eDkZTDYKB9E=;
  b=arWQYVCv1agSxQrpI7qLFQe5mGK5Uq9U7upVji1CxfCoG5QfSzEwI3ua
   g7oR6VrUkwMtLYdG44XF0c2S321AMT5lf2kZXnzVhv4WeMhUVaMdgCBac
   OB+wkgj9xHbhkXBRINxYpBBKyKmdlpNjp78vqcMomZleeytflqNkp96bZ
   fP4IkhnNY7iiW0Xs8hRcmmnlN6imQ5g35tiAILze9YaB5/8VVvtK/JHsk
   nkBPZ6KuHIgcoRqBZidiLg53qlxdDyInPuEd8D9o4sfMsdttOO5Cs2gP5
   vCileT5aKL2quY4SsMUx5lnQ7NKxTjwpw4chbfZgIa09+5k9NfLOVc6T+
   g==;
X-CSE-ConnectionGUID: s577HnySSIiVvCCjoPuPIQ==
X-CSE-MsgGUID: 99xBHLIWTs2DFqiB0nAhVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315164"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315164"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:12 -0700
X-CSE-ConnectionGUID: F65BLUX5TNuHr+OZwqy18A==
X-CSE-MsgGUID: wHuAfmDmShmVfb+YCEU3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478222"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:10 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 05/16] i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
Date: Mon,  4 May 2026 14:33:41 +0300
Message-ID: <20260504113352.38490-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043412_351008_514014D6 
X-CRM114-Status: GOOD (  11.93  )
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


Changes in V3:

	None

Changes in V2:

	Added Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 98 +++++++++++++--------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 28614fdbf558..c9852b85d6b0 100644
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
