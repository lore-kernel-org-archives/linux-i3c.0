Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93E2F01806
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4cOI1Afy+GQ8o2gKPOdCPxhQ+1DxrYXthizhedYlXk=; b=OsarFvoWeNi0Ee
	SD/La0+Hjrb1TmM8wyXMT24IinwAYxZr4ximOHqX1XmeS+r8llXPs9D4XBm2ocOexo8Z0wmZCYY4l
	M1aY/0qQAuQBdcWM8xP6eLxvd3ezuCR1edEEfGefmzMUEKvuH6b1HwKDhyE5RPUyckAH++fndg0EZ
	bzis2ZZPe2E/gmqsYTAvfe6clBNivUAp4YJ9/l9wQLieE7MZv4AAlFx+vLKCkILbGkHNE2X/zxrnD
	ARxzGLhx9LhLeZ3ymHZLXsYLE8hpuQI+GAwJn9RDU4aO7Im/ZpnMypYqDov62eCMU/HLj8KNQHXZt
	MxYCQTGJbUtvgiGisZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYq-000000039FQ-1fXE;
	Fri, 06 Mar 2026 07:25:24 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYo-000000039Dj-08eu
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781922; x=1804317922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PJeczhSaV43lhqaod3u2SOBvtD9menOcjwrjAxBTrkc=;
  b=RunLVusG3/OL2w4SHu0MEhMuKSfPB6R+xG6Zdv4p/x27k3eCUmKa5pHG
   lDTzQc9YrZQb13Z9hr9DkQRN3K/ieRfT5cqZg5oJgVKlz40HKnkVR8Kkv
   8x8Tx7yLQTzN4F8yLgFv+vMe42P4LVlmeqztfEBsn7wHQ4NVEnb0Ao55M
   PkK11Rc+qDt0IL0zK/2onA+oe7Rtub2iSHsrbd6l/rsieIo8qcMKOzEgJ
   7QNmZBszXK8I+8vP2ru2xOF6vxPFX52Zunml9mb9JsrWPkciPWQOYk3D5
   oZmxWZ//gzRrofZrvpYGR/33b1C4rKthEREpamzoy2ByURHGMS+PZ+5i8
   Q==;
X-CSE-ConnectionGUID: N/BTSPC2T/OMflRCCeJVJQ==
X-CSE-MsgGUID: utZkc6s6THGKYSVwnDE15A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461353"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461353"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:22 -0800
X-CSE-ConnectionGUID: 58nUwALTRiWedD78/ZlTZg==
X-CSE-MsgGUID: 1rfNveX+R7KCv+GDh00pDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419961"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:20 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 11/14] i3c: mipi-i3c-hci: Consolidate common xfer processing logic
Date: Fri,  6 Mar 2026 09:24:48 +0200
Message-ID: <20260306072451.11131-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232522_106228_1CE5FF9E 
X-CRM114-Status: GOOD (  16.16  )
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


Changes in V3:

	None

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
