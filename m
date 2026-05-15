Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE00CD4F47
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wbpxvAbmHUCc57XCa/EsYH2wm6/g9XxzH0qyaS7uYs=; b=q950jqDD7yNPFq
	wLYmeOB5bXkbgzKm6iyKzLGwIluI1dBjXI/znwxmsCnTI+xzA9M+eAHVQfbZo6foLCgQah07gwJeA
	J8i9GNjA9N3FZSdTZv4eBb+GKrKFUFY+TXoioO0w1462YfOMgL8c0pu/dlv3J8kgYTB9GfysOUjtN
	is8fJI8iq3kbAHUpG6NXyKaSEPPaZRcYFi53ACapV8f78c0k1bWRqLb+vRlFzZtY9ENW5ddCwycTK
	pmDn/qNhRoWvuU22R8I4uxX2vPjuvfVJdT1iYKe2GAwjoYR1sly3g0TGN3V2QXr3l3jfKBUg91yQu
	r86GC9P0ku5/dwtr62Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNE-00000008rSC-0pLJ;
	Fri, 15 May 2026 16:26:52 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNB-00000008rJ2-1g4t
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862410; x=1810398410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cy9JCgl78HKFpC/wm/5a98l6Dzm9pXxRhKkJ8NoUOu0=;
  b=Slh9PBoCW6HmbCmeW155aoMWyyURqfXYePxWO8CsG3fQRPZcGir2PWjd
   GGIyRtCseL+j/zr1yauZfRcvpoFDiLX8CuYXCTbMOnstDsSL+YdrsjVZi
   HfO2syRl/aWei+jtYVSfYACNj+HXGNhjrIntqfcBIH40z/DSGQcTvNHB5
   FcEy0DNmZEM1qfOxIqwXOSEz2P8nhwVLX0jCVjlPbh6H2jQrN74kVu6RY
   Rf+DKscLUFun6bo17vU3hM7I2T8TD3Tat6R5er23PbUXpKUHSttVuAzSP
   36oxh1Qh1Qk3r4HuN0XnwIHk/FFlJAD2P16tPBqVRaWjc6ezj9nErwOD1
   g==;
X-CSE-ConnectionGUID: oNXbLl1YT9GBjXgjfqW09g==
X-CSE-MsgGUID: ZvckGrLRSUmImoE6aByD8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785262"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:50 -0700
X-CSE-ConnectionGUID: +rk9Hd1mTgWkKeOB9pC7KA==
X-CSE-MsgGUID: 1v5jWdO8QKGtKaLRqICEng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857220"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:48 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 08/17] i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
Date: Fri, 15 May 2026 19:26:12 +0300
Message-ID: <20260515162621.57719-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092649_505383_D227A79F 
X-CRM114-Status: GOOD (  15.40  )
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


Changes in V3 and V4:

	None

Changes in V2:

	Renamed completing_xfer to final_xfer


 drivers/i3c/master/mipi-i3c-hci/dma.c | 15 +++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 83b553e1ab0b..8e27fb6f18f5 100644
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
