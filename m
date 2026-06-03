Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD85CD6E6B
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsD2/RHxnxiv3joMaj/HIVWmD0D8gjIvMmqWbB8t78g=; b=4lbDvERlNDftTk
	zCX3zW+mqHVHuVGBzPbawjocqJ32mBDW9BGnOMC7hRktIprpaXYTiNwESTeHTpKpHkLLO7IDRJwh6
	6rm6AGLKKiy066kuUmpVmkBZafyJay78AvOL927hyc9gHDq+WIXFdlMpvjSI33YT+g8svfUhREkKb
	zV8mBpgnQJ81RYQ+AMf1ZGgrHwwlcIpS/G8eyx88SxO6bHScq/n7hP9oR4zkzFEFEooEgSzhOdnsO
	7orHlS93W2vC2wgj0nNvOVAlwvZ2V+q8RY1oZWLbVho+JPGfSWYewmqJxXDZDpJUM7KpGdDYNx5wA
	Dk6DMhufJaox9c9Y+vEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaI-0000000EfkQ-2dZi;
	Wed, 03 Jun 2026 09:08:22 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaF-0000000Effy-48eR
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477700; x=1812013700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FrOJT+GMlFZupkFUGhXMbzwd+H6FKn1hNvq7sark9fs=;
  b=A6AC6HXmDHnsd0zwnKOMfBXR7geJdnHildGI47LOBHJPYEpgtLKeTaU4
   mRx0xWUMYevOX49A/y95HQJBNbSKVV2dhtHFZOwVQiTVzy2ZeOLj5XvW5
   q6hRQ0T2tNTFpZzG24VvqRD3genDPeMvzF7GzXAsdwjtBFOsP+ZBBhpJ9
   1oITkBQ3QiiBbAMIlnI64augxorVkwn8ejvkoffRqsZ6rW5njbLWiP/E4
   PE2noHTY7YyAgxysPwGoyL8VX0EPhJ55V9TirSJyhvrkMnJigbKvB2iiG
   uWQaHY4V2S8P28aZauTGQ0e1zJLdpYk4+zIDj00gfIxqFOUqnkkM4rEig
   A==;
X-CSE-ConnectionGUID: RvKONSW9RfCT2DQPETmyyA==
X-CSE-MsgGUID: rO0+xon4SjqMUOnTz11KNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852613"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852613"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:19 -0700
X-CSE-ConnectionGUID: m8tyBmAaRlaTx1atbB/jOQ==
X-CSE-MsgGUID: 79qOXMN5QGyzRMZpz6f0tQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 05/17] i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
Date: Wed,  3 Jun 2026 12:07:42 +0300
Message-ID: <20260603090754.16252-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020820_073614_27F8CD39 
X-CRM114-Status: GOOD (  11.88  )
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


Changes in V3, V4 and V5:

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
