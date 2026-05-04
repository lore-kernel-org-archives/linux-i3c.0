Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69729CD342C
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uAQnBSOfJWe75PnIESE1uKEUV7lRpG2wRiHREOLuDU=; b=Bt8tXdbHjy3Gn4
	pxA6ytAY+tGVUeuBuYe+z+eOlReLUAxnsXES19JnCc7FXUOztnKXWCWdsG+tiS0TgLgW0t3gs2zUH
	rtmCWWQZD1x5ZfE50rzPDr8lQ+EC3AfRr+XSYzKXhPBPcWAFrTplcaVfY9hIjpD6cdvTK2F/BMbJQ
	lED5U6gUCxF9XGJWdS5R1iHzCtrS7aYQclYDowKD+J8RfOuy2209p06KMVYrEoZ33HI+KMxC7MP5c
	yhoaXYos94L5NEmQPNu57/MIm3VyJT2drO/aXUayJxcRyFgl7t6NORPrMXqln2VGTMKuHP6caykbB
	ALhmbJLjai5K1tAE2FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ6-0000000D3P7-0kdE;
	Mon, 04 May 2026 11:34:20 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ3-0000000D3HH-37l9
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894458; x=1809430458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mTzeDX/vaawzq5dQWkCtrOafbvlVzBe74prFohLgREk=;
  b=jefatEtCZl4vTOE0UI/8miIWYBXRJWkMcm+iJB56Rxg+Eft8zQ9cfOUX
   aE1G9Lpr7vjqgw0/uIqbokC0XMHPKJTcgj1h6zQAeEICB7xyQl4CghPS3
   veaTl4lvYFjk3BzUUH3ixBJX1m3N//pNhBXKVGJ97r0ZeGGlGiIJvxw5c
   o5rW1CDZrdIHWODgh4OtnfrnATc1wEcQDAH3fM9A0Y4KaEv8wBKSQu2Lb
   Jd7fgBXIgZob06jEcyDGOvy0ZQck7GQ1z8i8IQgrqesiXLqNBnSlaDYgR
   lAaElZ1oEajwCBqXYQuVUOr1lQ0smBfFzL+3cjND86yHON57C+6JfqKWa
   A==;
X-CSE-ConnectionGUID: TctsrRI5R/W5hVElxN8pXw==
X-CSE-MsgGUID: 1WD25CMnSK6eZmnZjdKATQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315187"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315187"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:18 -0700
X-CSE-ConnectionGUID: yIEtuRmFS+OV9eskvkts7w==
X-CSE-MsgGUID: jl9eTMPKTnitPjBmhL1hEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478257"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:16 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 08/16] i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
Date: Mon,  4 May 2026 14:33:44 +0300
Message-ID: <20260504113352.38490-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043417_793541_58197CE0 
X-CRM114-Status: GOOD (  15.50  )
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

Software ABORT of the DMA ring is used to recover from transfer list
timeouts, but it is inherently racy.  The intended transfer list may
complete just before the ABORT takes effect, causing the subsequent
transfer list to be aborted instead.

In this case, an incomplete transfer list may remain in the ring and has
not yet been processed by hci_dma_dequeue_xfer().  Restarting the DMA
ring at that point can lead to unpredictable results.

Detect when the next queued transfer is not the first entry of a transfer
list and does not belong to the list currently being dequeued.  In that
case, skip restarting the DMA ring and defer recovery until a subsequent
call to hci_dma_dequeue_xfer(), which will safely restart the ring once
the incomplete list is handled.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	None

Changes in V2:

	Renamed completing_xfer to final_xfer


 drivers/i3c/master/mipi-i3c-hci/dma.c | 15 +++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 899fdf6555a8..268f54b32101 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -503,6 +503,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
 
 		xfer->final_xfer = xfer_list + n - 1;
+		xfer->xfer_list_pos = i;
 
 		/* store cmd descriptor */
 		*ring_data++ = xfer->cmd_desc[0];
@@ -669,6 +670,20 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		}
 	}
 
+	/*
+	 * A software ABORT may race with transfer completion and abort the next
+	 * transfer list instead. Detect that case, and do not restart the ring.
+	 * It will be handled by a subsequent dequeue.
+	 */
+	if (!did_unqueue) {
+		struct hci_xfer *xfer = rh->src_xfers[rh->done_ptr];
+
+		if (xfer && xfer->xfer_list_pos && xfer->final_xfer != xfer_list->final_xfer) {
+			spin_unlock_irq(&hci->lock);
+			return false;
+		}
+	}
+
 	/* restart the ring */
 	reinit_completion(&rh->op_done);
 	mipi_i3c_hci_resume(hci);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f07fc627d4d2..83d4f13a68a3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -107,6 +107,7 @@ struct hci_xfer {
 			struct hci_xfer *final_xfer;
 			int ring_number;
 			int ring_entry;
+			int xfer_list_pos;
 		};
 	};
 };
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
