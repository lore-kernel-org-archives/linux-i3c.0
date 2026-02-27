Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DF2FEFB5D
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mt8VtAfv8rncSsGW7xWnVf3iyg7pr/XClC0iYpbvLCc=; b=cxfLxR+7hecoRs
	DBxEb4iV0zieUlRpLzQoF7RBKMpn4yM3BbbnV3B1b4zNM1filwL309PjoUNScYR8Xt3kX3DpPWHs9
	5nQvbLOJ1pXAyzVfP7NhIKSOBZ26//DbckcWwzZgzyIc03mxjkQompY13dbFDjdYSJ4rU//8afiJa
	ij6uwrVe9Iwi+t+TyrfNmdEMQ0YewFhTTc8gikBlab+VQY2Db9XgBFDiTMZppiw0uHSLE9gwyU2Pe
	qQbdiCJZDEAXWaWke0Em0bot09D83f9lAL7w8FJbme04RHeIj2X6zufjshUykZ4LRBizWv3fEx3jH
	2s3UkUj0xTJL9sPPpXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZm-00000008TXp-1O7y;
	Fri, 27 Feb 2026 14:12:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZj-00000008TRS-1veK
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201535; x=1803737535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1BhbE7a+6PGUzFHwchK7XXQH7a88UQlCj4UQ8be1238=;
  b=gDE2HHxVwjtruWlfCBiPebE1O3ftFz5VZUSAxBchmTEHwtBn2V6/BBH8
   MX2kkRENYHnuWSdCImRB3eRSdTb2I5Ohh/hLNKBbRk2gmecH2KPqCKtVP
   90Pa6IjUnNh7eQEA2zDemYaiqH5KFhtQZ9FHG+8sIHZ8pv+5j48e2aBIB
   pPYOiDxFLysn6SuUlLv6Q0OZGXnTK5sOqxbCPI4BMIlhCj/tYJikvNRmy
   FiqYPlz0Q1BJjFfHsjYYfgsc/JyJL8GRQpEFmSA3ZXdSSghXNya1Rfe7F
   UtF3DsC+/TwB7j+p7dVVyTBvb6i2CPJbCEKBTCgcVSMYZOdKn5Q5rAA+M
   A==;
X-CSE-ConnectionGUID: ym5pOr++T7+2cptAhdmSlA==
X-CSE-MsgGUID: e9Cp7pSuQECq3oLQoJXQxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750048"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750048"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:15 -0800
X-CSE-ConnectionGUID: GR8IqlhERU2G94jpBPEfhw==
X-CSE-MsgGUID: eONRBf8gSW+xCvSK8i/TIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015746"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:14 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 09/12] i3c: mipi-i3c-hci: Consolidate common xfer processing logic
Date: Fri, 27 Feb 2026 16:11:46 +0200
Message-ID: <20260227141149.184980-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061215_516668_6746A3FC 
X-CRM114-Status: GOOD (  16.29  )
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
queueing a transfer, waiting for completion, and handling timeouts. This
logic appears in five separate locations and will be affected by an
upcoming fix.

Refactor the repeated code into a new helper, i3c_hci_process_xfer(), and
store the timeout value in the hci_xfer structure so that callers do not
need to pass it as a separate parameter.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
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
index 4877a321edf9..9cfe12fb9a0e 100644
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
index 337b7ab1cb06..6680b8640c5a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -87,6 +87,7 @@ struct hci_xfer {
 	unsigned int data_len;
 	unsigned int cmd_tid;
 	struct completion *completion;
+	unsigned long timeout;
 	union {
 		struct {
 			/* PIO specific */
@@ -154,5 +155,6 @@ void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
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
