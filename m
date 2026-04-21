Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7F7F94CA0
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XT78nWBEOz7GyByLlrdSYWwYlKE52E92gPfC+cX6AVU=; b=ZUaz6+lT9wYhv8
	74olwsRQ/hXPbwAF/gmpphSVSON6dR9FzWeYbgihr+zznrDy5Vj7eRUThIHzCq3HLhVmx6zLvvTXM
	R6aGOYmnGQndYr2sZzOABaImLwOtqZd5DONIB1cy5DsP4oA3R6jXNKlEXemzAs06n8TBCFLsaT2IO
	y6O+rVbXn1Zqx+uuh5+2R0Qa70NMkJa75f5o+Gr2ZZS9o4RC/HbRKXU7Dvs+EO7ilBEqD2pn6HgQ0
	3PnOFpnwMO/B5O0KYfJKFb5YhMTO6ro2BFwv/UFzJDRkAZh5N+omm0oe0EZKSme1lRxa88gzJPa2r
	lIjIlkrNpq1ylBTqoC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJR-00000008zaW-0Bsv;
	Tue, 21 Apr 2026 17:55:05 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJO-00000008zV1-1eE5
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794102; x=1808330102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xxelxfnOqKgCX1CUYpTwvXJMX6Jd7zw74OCgqfemx5c=;
  b=ffyy86uywClA4e/dOhnKPp6Lpzpb3lVwqFzlA1SghB4lw2diJVhHJ6rN
   /CCBk2CFqLNYPjslksxTHBqGTuDLDHVyz2c27IEguEtbm8qlYVvKlAB+V
   RnHruyvPAhJZWl1ittXgoGZOXfG1UHVTCSBZrh0tWBo38WBPySDuDryKg
   eY8w9Dize5a/rR7kMKY9NEGnoxnZwba0vFdrpeUcTBx4F3Y3boTc+ysxd
   5NvkqLboV43nYXhYlYxalZ9jp/808cQW9zemt92el9XzFnnJy/e+BhU2w
   YLRwNjjHhtw/WvbND9WfAgsjriy9zwDcSTKU6o2kMIbWTfjbhtvQVfj8W
   w==;
X-CSE-ConnectionGUID: 8IxO1rIAQMOJ5FUM8XJYSg==
X-CSE-MsgGUID: OcAPwF/eTk6DENoSArbkUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651384"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651384"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:02 -0700
X-CSE-ConnectionGUID: +lpqxnjvR9OBHBjiBX6xwg==
X-CSE-MsgGUID: SbSf12NiSKSyv9XDpKqEEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227494932"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:00 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 08/16] i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
Date: Tue, 21 Apr 2026 20:54:27 +0300
Message-ID: <20260421175435.122094-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105502_480801_703619EE 
X-CRM114-Status: GOOD (  15.61  )
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
