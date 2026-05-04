Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EDFCD342C
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KN8zg3t1D/69GYWFfyQabsu3oLtF/MkssM+o5zLcCj4=; b=Ia3OO4id+uiYDu
	eiJg06VU7S4c3nVeEkNPdwJ3jRNWelKH7naJA1WSbYZB1BLCJFtKlLzF38FpLngHK/Ngl5cPlKegd
	mWhkK33tBuZ+vmeszSLVnAwdh+DKZuQc6e+OE7TFG01tl6EpHfE4XwDWHhFnJru/WwZy4DP9dpvaJ
	wUzF7Xp9wo4Fr2yHmMLJ834Atl+a3Ei4hF8jM1ao0HlXdjRkJkpwZFtEYVcyZ6nBJxIZuR4s1qDhD
	D6y+oiubZlp/gWGm4x4T3T08DHT/y19LYCt5JYxQqEVEbTMt8Pw+oUXReMDK53t12cp4iiHlN3blT
	cC37PRCNSb+hjTElamgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZG-0000000D3Wu-03qV;
	Mon, 04 May 2026 11:34:30 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZC-0000000D3HH-2ft8
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894467; x=1809430467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dSs/OjFxjj0Jz+Gc4GvWeID34N7C3MTiYL0AhV70tf0=;
  b=mC+shWsgX2IGktunatKXJyNm8bUeVXEDXrcTo4fGnGHIBPFtRjrQpYae
   1xYbUs3X9qFgbs6f7AsUWIzEsXTkh72LaDER0YmZT5NUBbwL2CAYHLlAn
   tIoLpOSXgOfYhcAozShpvAoaBHw+qDG99nC3oljpe1d4/YOkdThwhIigf
   +Gu2SEDe8cz+eXdN1g6/tbBJ33UacKXXz8QGtdvgH9IcXjTV/h7T+RgtM
   xXVDXQbJefGyEJyn+tL0n2PqKt/ifXUfVcQOtl5EZ3XA14RaT4u/OZcZE
   NCO0UubCg5EbXd6MZE4WgpomrkMxfcij6WQclqsk2h28QNKNbxQBCSY86
   w==;
X-CSE-ConnectionGUID: 9GoJPwNQR1qsR4X0VPvbaw==
X-CSE-MsgGUID: NLKf+6DvTq6mr675VUKfbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315259"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:26 -0700
X-CSE-ConnectionGUID: NN/uMxxgS3CPdUWcI9XPpA==
X-CSE-MsgGUID: OjZylFnrTk+9T7wjTk4sRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478306"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:25 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 13/16] i3c: mipi-i3c-hci: Wait for NoOp commands to complete
Date: Mon,  4 May 2026 14:33:49 +0300
Message-ID: <20260504113352.38490-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043426_688217_0AFF230B 
X-CRM114-Status: GOOD (  13.82  )
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


Changes in V3:

	None

Changes in V2:

	Rename completing_xfer to final_xfer
	Add missing reinit_completion()


 drivers/i3c/master/mipi-i3c-hci/dma.c | 39 ++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 376062c0fcbf..90fa621c9d56 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -696,11 +696,33 @@ static void hci_dma_recovery(struct i3c_hci *hci)
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
@@ -708,7 +730,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	guard(mutex)(&hci->control_mutex);
 
 	spin_lock_irq(&hci->lock);
-
+restart:
 	ring_status = rh_reg_read(RING_STATUS);
 	if (ring_status & RING_STATUS_RUNNING) {
 		/*
@@ -765,11 +787,10 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
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
@@ -801,6 +822,12 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
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
