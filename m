Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55FDCD4F25
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0EHlYgcyyRDmqNqfUTRX1LDQ4Lt2CKuhprpDDG4Ga0=; b=1JbOzch1iR/Rf1
	i0hxxHnL0L06mEOhrZ2vie/jzMffuuTLQN2J8ff2jSchiJ/+GIbgkHEyM0PW3kxMFNfRPRzwIb5cQ
	PdwZdIA1Xd05Pgt+yhLd6jr2Nr5g0NQO06A7/Ftg46e/f6Mxf+DXsr7/UAxOq+XvKpThm6ehohqjT
	e1WMidnK1br+mbYqlPoXc3FuU5I9aK8b58QjQD9eM76qwpY6NVVy0eQwC5jbT/ESUjkouT/JQyt74
	eY5AgyHXAcJhvDhlxM9W6wbmwPbVmv6+cVbO6yd9buCv7+7j4x2P5qqpYV612eqq/VdPxtmLfV9mN
	8iIb8tQLrWkBzzgaAErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNR-00000008rcu-2Omn;
	Fri, 15 May 2026 16:27:05 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNN-00000008rJ2-0Ixp
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862421; x=1810398421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K0FaceN76BW9oMyI5NTtJOg+RiTxX8/HuQ0RxbmIDM4=;
  b=GU5pTZCnowGrfMCrWngvR4Y2OfzICzM7Q9H0iWb+wsPjTw5jZAmEjW6s
   DsgtuKrWAM7cL57n8zhgzfaIpZDjqZU0KVVQiWU1O8R+LSaiiOdY0g589
   wCv5tfYSooQmRcuHMki/ExWfiI9T//O0aTbk8Vm5mJTHQ47aOzjpJijhy
   RRkB+1EcfpOL76hTKJTJeK/Kd9MRTmA2B2dS5bXghU9eB6pKSBTvuIZK6
   mCmZM/s+MdV0ox6lG9AOla55PPiMqCSLEEEzF1n6AudQVEdCfQKTV78vb
   FmkB91A5wF5hxD/ccTyVh4qWuSL/2lJ8dMjPvZrtiCNjjlx8ocEbfyKoZ
   Q==;
X-CSE-ConnectionGUID: a94efrxzQlm+KsqDZqJfWw==
X-CSE-MsgGUID: GCfqoe85TYei0dfdwI+LvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785299"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785299"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:27:01 -0700
X-CSE-ConnectionGUID: 3eRbHB/8TO+zMHQOtQztAQ==
X-CSE-MsgGUID: +uyVVrBTRNKrDjaGaUpQog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857283"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:27:00 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 14/17] i3c: mipi-i3c-hci: Wait for NoOp commands to complete
Date: Fri, 15 May 2026 19:26:18 +0300
Message-ID: <20260515162621.57719-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092701_157271_6178347B 
X-CRM114-Status: GOOD (  13.58  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	None

Changes in V2:

	Rename completing_xfer to final_xfer
	Add missing reinit_completion()


 drivers/i3c/master/mipi-i3c-hci/dma.c | 39 ++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index f39a6ce2aad5..0fd56bbb84ef 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -686,11 +686,33 @@ static void hci_dma_recovery(struct i3c_hci *hci)
 	dev_err(&hci->master.dev, "Recovery %s\n", ret ? "failed!" : "done");
 }
 
+static bool hci_dma_wait_for_noop(struct i3c_hci *hci, struct hci_xfer *xfer_list, int n,
+				  int noop_pos)
+{
+	struct completion *done = xfer_list->final_xfer->completion;
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
@@ -698,7 +720,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	guard(mutex)(&hci->control_mutex);
 
 	spin_lock_irq(&hci->lock);
-
+restart:
 	ring_status = rh_reg_read(RING_STATUS);
 	if (ring_status & RING_STATUS_RUNNING) {
 		/*
@@ -757,11 +779,10 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 				*ring_data++ = 0;
 			}
 
-			/* disassociate this xfer struct */
-			rh->src_xfers[idx] = NULL;
-
-			/* and unmap it */
-			hci_dma_unmap_xfer(hci, xfer, 1);
+			if (noop_pos < 0) {
+				reinit_completion(xfer->final_xfer->completion);
+				noop_pos = i;
+			}
 
 			did_unqueue = true;
 		}
@@ -793,6 +814,12 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
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
