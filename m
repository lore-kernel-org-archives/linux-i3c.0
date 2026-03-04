Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007C3EFCE37
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vh7kAF11rdpQg97uRuzEqU+f0iq6etTGvQ1JfoskvhY=; b=oWVbYU3YbM6mp6
	vPpzrGKZZzZiIsxIbYyDV6vVX4vXZEYvfYu1nCpmph1PIBo46htSqRPEfcgn4LsqphuPasgNshBNE
	8He9bcqELb02duB+rQgjBjwj0fIMoCLT8CEH6MhpvRFmpv3oyXYrYaj/NpaZIj6vuRVx9f21/xEC6
	JiA0iu3Xx99sJHFEKHHKerSx2SA20YWwrpbjcguPwWFeC1h9+VZkkdYPP2TKVkOY80nUZuFtdJyD0
	XthE3pQgZNmplCfHMeaqPXT7vRvbVMKLK7cm4UO4Y5VxihCyPWvLtELBZDt2gIAgk1XoDEi0SFPCW
	viS+MY9q81rgM3KIM5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqn0-00000000KDQ-2vfl;
	Wed, 04 Mar 2026 18:17:42 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmy-00000000K1V-1hCM
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648261; x=1804184261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1gZohki0ecQj23oRlg7+Yq+SnqYD3plF54p35ke/cyI=;
  b=WthKP+FCzfejCP2XHz36ThxnpkmHYFND1zduKzTy14faf8tRixnrZ1dj
   EeyvnSxpeTvOH6trLZ9Wsjq6bBVOmxEKHlR0NJJPHy4b/AHZJHDyV8O2H
   9u9ByYEK8GtpURzvS1CerwzYCRp3qEEfjXz5CuJc4RqUoEoc8dKy1e9gn
   Bges78UQsWMak6femUkTedIH7NEvrvohE3EJesvxDMyRY7VbYz4N4UZa5
   7wnDUUgaUQe8TKyIia022SACqOWt/09pFDAQSKnazVZVR82T5dBOPpjcN
   HVT1Dy1Kw5yWI3mqojDmEhm8qEUOXoxdP1lGRWdTCHyPe04CKtL/TBZWE
   g==;
X-CSE-ConnectionGUID: uRf90BNEQn6pxIy/smPmJQ==
X-CSE-MsgGUID: hUmhcIS5Q0eAXtM+Vg7ZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745934"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745934"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:40 -0800
X-CSE-ConnectionGUID: 4bkWAU/xS363jWocregUkA==
X-CSE-MsgGUID: wMXIpGVuTgaUUloHE8a0/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656781"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:39 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 11/14] i3c: mipi-i3c-hci: Consolidate common xfer processing logic
Date: Wed,  4 Mar 2026 20:17:02 +0200
Message-ID: <20260304181706.143841-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101740_461497_F979FC78 
X-CRM114-Status: GOOD (  16.84  )
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

Several parts of the MIPI I3C HCI driver duplicate the same sequence for
queuing a transfer, waiting for completion, and handling timeouts. This
logic appears in five separate locations and will be affected by an
upcoming fix.

Refactor the repeated code into a new helper, i3c_hci_process_xfer(), and
store the timeout value in the hci_xfer structure so that callers do not
need to pass it as a separate parameter.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |  8 ++---
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |  8 ++---
 drivers/i3c/master/mipi-i3c-hci/core.c   | 43 ++++++++++++++----------
 drivers/i3c/master/mipi-i3c-hci/hci.h    |  2 ++
 4 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 831a261f6c56..75d452d7f6af 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -331,12 +331,10 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 			CMD_A0_ROC | CMD_A0_TOC;
 		xfer->cmd_desc[1] = 0;
 		xfer->completion = &done;
-		hci->io->queue_xfer(hci, xfer, 1);
-		if (!wait_for_completion_timeout(&done, HZ) &&
-		    hci->io->dequeue_xfer(hci, xfer, 1)) {
-			ret = -ETIMEDOUT;
+		xfer->timeout = HZ;
+		ret = i3c_hci_process_xfer(hci, xfer, 1);
+		if (ret)
 			break;
-		}
 		if ((RESP_STATUS(xfer->response) == RESP_ERR_ADDR_HEADER ||
 		     RESP_STATUS(xfer->response) == RESP_ERR_NACK) &&
 		    RESP_DATA_LENGTH(xfer->response) == 1) {
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
index 054beee36da5..39eec26a363c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
@@ -253,6 +253,7 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
 	xfer[0].rnw = true;
 	xfer[0].cmd_desc[1] = CMD_A1_DATA_LENGTH(8);
 	xfer[1].completion = &done;
+	xfer[1].timeout = HZ;
 
 	for (;;) {
 		ret = i3c_master_get_free_addr(&hci->master, next_addr);
@@ -272,12 +273,9 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
 			CMD_A0_ASSIGN_ADDRESS(next_addr) |
 			CMD_A0_ROC |
 			CMD_A0_TOC;
-		hci->io->queue_xfer(hci, xfer, 2);
-		if (!wait_for_completion_timeout(&done, HZ) &&
-		    hci->io->dequeue_xfer(hci, xfer, 2)) {
-			ret = -ETIMEDOUT;
+		ret = i3c_hci_process_xfer(hci, xfer, 2);
+		if (ret)
 			break;
-		}
 		if (RESP_STATUS(xfer[0].response) != RESP_SUCCESS) {
 			ret = 0;  /* no more devices to be assigned */
 			break;
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index adf35b7fa498..4a80671536f0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -213,6 +213,25 @@ void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci)
 	reg_write(DCT_SECTION, FIELD_PREP(DCT_TABLE_INDEX, 0));
 }
 
+int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
+{
+	struct completion *done = xfer[n - 1].completion;
+	unsigned long timeout = xfer[n - 1].timeout;
+	int ret;
+
+	ret = hci->io->queue_xfer(hci, xfer, n);
+	if (ret)
+		return ret;
+
+	if (!wait_for_completion_timeout(done, timeout) &&
+	    hci->io->dequeue_xfer(hci, xfer, n)) {
+		dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 				struct i3c_ccc_cmd *ccc)
 {
@@ -253,18 +272,14 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 	last = i - 1;
 	xfer[last].cmd_desc[0] |= CMD_0_TOC;
 	xfer[last].completion = &done;
+	xfer[last].timeout = HZ;
 
 	if (prefixed)
 		xfer--;
 
-	ret = hci->io->queue_xfer(hci, xfer, nxfers);
+	ret = i3c_hci_process_xfer(hci, xfer, nxfers);
 	if (ret)
 		goto out;
-	if (!wait_for_completion_timeout(&done, HZ) &&
-	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
-		ret = -ETIMEDOUT;
-		goto out;
-	}
 	for (i = prefixed; i < nxfers; i++) {
 		if (ccc->rnw)
 			ccc->dests[i - prefixed].payload.len =
@@ -335,15 +350,11 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 	last = i - 1;
 	xfer[last].cmd_desc[0] |= CMD_0_TOC;
 	xfer[last].completion = &done;
+	xfer[last].timeout = HZ;
 
-	ret = hci->io->queue_xfer(hci, xfer, nxfers);
+	ret = i3c_hci_process_xfer(hci, xfer, nxfers);
 	if (ret)
 		goto out;
-	if (!wait_for_completion_timeout(&done, HZ) &&
-	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
-		ret = -ETIMEDOUT;
-		goto out;
-	}
 	for (i = 0; i < nxfers; i++) {
 		if (i3c_xfers[i].rnw)
 			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
@@ -383,15 +394,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 	last = i - 1;
 	xfer[last].cmd_desc[0] |= CMD_0_TOC;
 	xfer[last].completion = &done;
+	xfer[last].timeout = m->i2c.timeout;
 
-	ret = hci->io->queue_xfer(hci, xfer, nxfers);
+	ret = i3c_hci_process_xfer(hci, xfer, nxfers);
 	if (ret)
 		goto out;
-	if (!wait_for_completion_timeout(&done, m->i2c.timeout) &&
-	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
-		ret = -ETIMEDOUT;
-		goto out;
-	}
 	for (i = 0; i < nxfers; i++) {
 		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
 			ret = -EIO;
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 9c63d80f7fc4..850016e3d4fe 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -89,6 +89,7 @@ struct hci_xfer {
 	unsigned int data_len;
 	unsigned int cmd_tid;
 	struct completion *completion;
+	unsigned long timeout;
 	union {
 		struct {
 			/* PIO specific */
@@ -156,5 +157,6 @@ void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 void amd_set_od_pp_timing(struct i3c_hci *hci);
 void amd_set_resp_buf_thld(struct i3c_hci *hci);
 void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
+int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 
 #endif
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
