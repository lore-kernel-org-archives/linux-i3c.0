Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D68DF94CA1
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxjFhkSbU9DvYnGGBgwg+Ksqf/N+zWfB04Mun6N1rJY=; b=NMIOu+Iz+Mgx5s
	dKgJVa7GCPM/O2VYZzWPTtP5oTVYo6yrwz/xtpmebmHfX43s8EmOqxLo/RZAIBEY4JS4CL4NAw1mJ
	RH7SSB/XJbiSwZb0/atab3SHckROjgFwle6CbwLPKrKOKJxHGVLM978GytxdL1cUfe/K0CpOBbRkh
	+oE6JRMN8iSPN+yv7Ld1AqKN2Yq4YpchBcdnjHZJpa02YeJ9dgDD+DHgWb01eoodFT0pAeS3rbVjT
	/19pvgsrxov37b2bdzXQT55OC7mXeYtZh6w/z4VUL0duJW+b5M5UY7F+Gd0RslEtmBCycNKbP94fE
	heq/9IegdqvOYgCfYkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJN-00000008zXx-4Bm7;
	Tue, 21 Apr 2026 17:55:02 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJJ-00000008zV1-1329
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794097; x=1808330097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=21Nmu5DErPUi5uJFOhMPfpCk7QS82TPLuGrGDAhoejg=;
  b=mW+dXJW/9fSjn3jtmkD6QTeexoOWE19fRFgHID+ghbCdUKxxA8nCWJ5U
   Af5hhddcbyCN8NTUjc2bu2fT999YxFAkeLFigU+n+gWcXxF/+Njx09zFe
   E1jsc/+bLXhWmmqcyULzn2LfltspA3SqQiXc5U70MnB4iXWV7wNM9Mq3c
   4Fpx8R5q+oE8ja8cGmnbqpwY9YdJJG7IlngP1aT5Ez53/IOYKWs8BOhSU
   R3i+ACwzwS2z9Lst5zwBBNO0kCl6YA+xgZdBKxPug/zRNhqy6vEtA2PF/
   o8zCNCSrDtOpQIAnPhxRv3m0Twh0vOxgaSbVGTe44KmQ/MiiZoUtmIDAi
   A==;
X-CSE-ConnectionGUID: wV7NRX4jTtKiTALu36BqiQ==
X-CSE-MsgGUID: QWuMaoGiQvSOud4TSKHghA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651370"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651370"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:57 -0700
X-CSE-ConnectionGUID: Y9af/oA4ScOhSi1oBzVBgA==
X-CSE-MsgGUID: 20Bl7tAkSja3/xqUhJ5c/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227494897"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:55 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 05/16] i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
Date: Tue, 21 Apr 2026 20:54:24 +0300
Message-ID: <20260421175435.122094-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105457_340644_A66EA2E0 
X-CRM114-Status: GOOD (  12.04  )
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
