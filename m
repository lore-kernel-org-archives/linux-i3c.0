Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC72F8D762
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZQ4HnxgB/fVzENLYYRgeFvXBKIZgcBxrv/JgYb5P1c=; b=DqELepFqSlZkH/
	VvM6NFIDOKNadaa9hh8NbLEh/mfAR64IDobfNw3Zb0ZqbtlivGpz8iGVMHePXlApXHl+l4fZoY6P2
	MudoBlEvQ52cXEGfeKUw01D2moyZBu0aQ7eLc/CotvktYdDW+dG+wJfPkk5w16z+c38EZNiYlfkH4
	Da/I5El8UBrc2ZOqPEHT5UoYp56xd7yFFIqc218n1RDqiLAnxRU+Oev9SUhHVvIdSl6TSOOa5f9eH
	V7d9sLJjja2nMtKX793PcpmoWPGlWPPAX+vxm8xbQIisFAwrTyDmw4Cm4F+8Y/jbMfV5cpeW3M7f2
	78XoyFP4l1d8gSD/Kogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyH-00000002jpy-1YPU;
	Thu, 16 Apr 2026 17:57:45 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyE-00000002jnu-1lqk
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362262; x=1807898262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Y2nxEL6jV2W8PeNejUxwCcclg6edU8up5isXjh2UGA=;
  b=O3ydQhkXL0UC9qA118RBTBoSMMwxQV5s+yp2TjqSg8LTAAWWKDGiXqPL
   il20qlTK2pbA+FEci5CaO/D3XdVPGJsdbMVF9+gSXaGRfOBSyr7Y61BQB
   /KfrdhjIrvRvmtoEq/ybhBPRGOvZ28TsTVhGsuFvCix8PDI2KL+OKiW2M
   FFrFpZ5Tf/PxqOdbNFcW6hoOvTOC9XCErHjMUtwC3pl6a/4krSdN0uL8l
   y3jl2WJiLz7RIcmFxcDBOMAHpdN4lkpyUYnY6ASUAT0gYwA2oA0Uuky2E
   EKTc304EKIMQEun9pGwgN/3HJKuayJSg2BzlLCwNmWUG/eZXzBwYSt7ii
   g==;
X-CSE-ConnectionGUID: cVm2WXe2TMyXRrrnJOY6vw==
X-CSE-MsgGUID: 9sW6GBwUR4O8c3D5k2eLiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778416"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778416"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:42 -0700
X-CSE-ConnectionGUID: nZfkRGf4TIO0pbdargS9xQ==
X-CSE-MsgGUID: MPkW7JR6Q4CTISSNmIuRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784651"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:41 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] i3c: mipi-i3c-hci: Wait for NoOp commands to complete
Date: Thu, 16 Apr 2026 20:57:01 +0300
Message-ID: <20260416175704.41217-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105742_524384_923870E7 
X-CRM114-Status: GOOD (  13.37  )
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

When a transfer list is only partially completed due to an error,
hci_dma_dequeue_xfer() overwrites the remaining DMA ring entries with
NoOp commands and restarts the ring to flush them out.

While NoOp commands are expected to complete successfully, they may still
fail to complete if the DMA ring is stuck.  Explicitly wait for the NoOp
commands to finish, and trigger controller recovery if they do not
complete or report an error.

This ensures that partially completed transfer lists are reliably
resolved and that a stuck ring is recovered promptly.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 37 ++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 6811503c869e..053e487b6257 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -694,11 +694,33 @@ static void hci_dma_recovery(struct i3c_hci *hci)
 	dev_err(&hci->master.dev, "Recovery %s\n", ret ? "failed!" : "done");
 }
 
+static bool hci_dma_wait_for_noop(struct i3c_hci *hci, struct hci_xfer *xfer_list, int n,
+				  int noop_pos)
+{
+	struct completion *done = xfer_list->completing_xfer->completion;
+	bool timeout = !wait_for_completion_timeout(done, HZ);
+	u32 error = timeout;
+
+	for (int i = noop_pos; i < n && !error; i++)
+		error = RESP_STATUS(xfer_list[i].response);
+
+	if (!error)
+		return true;
+
+	if (timeout)
+		dev_err(&hci->master.dev, "NoOp timeout error\n");
+	else
+		dev_err(&hci->master.dev, "NoOp error %u\n", error);
+
+	return false;
+}
+
 static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 				 struct hci_xfer *xfer_list, int n)
 {
 	struct hci_rings_data *rings = hci->io_data;
 	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring_number];
+	int noop_pos = -1;
 	unsigned int i;
 	bool did_unqueue = false;
 	u32 ring_status;
@@ -706,7 +728,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	guard(mutex)(&hci->control_mutex);
 
 	spin_lock_irq(&hci->lock);
-
+restart:
 	ring_status = rh_reg_read(RING_STATUS);
 	if (ring_status & RING_STATUS_RUNNING) {
 		/*
@@ -762,11 +784,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 				*ring_data++ = 0;
 			}
 
-			/* disassociate this xfer struct */
-			rh->src_xfers[idx] = NULL;
-
-			/* and unmap it */
-			hci_dma_unmap_xfer(hci, xfer, 1);
+			if (noop_pos < 0)
+				noop_pos = i;
 
 			did_unqueue = true;
 		}
@@ -799,6 +818,12 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	wait_for_completion_timeout(&rh->op_done, HZ);
 
+	if (did_unqueue && !hci_dma_wait_for_noop(hci, xfer_list, n, noop_pos)) {
+		spin_lock_irq(&hci->lock);
+		hci->recovery_needed = true;
+		goto restart;
+	}
+
 	return did_unqueue;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
