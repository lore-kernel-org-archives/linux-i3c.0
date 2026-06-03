Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D951CD6E69
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7S3AKEuoDKjhqUcQlhk5HClqBLNlfJkfD2JdG/aaWM=; b=KdHwChTjz/OnVd
	vhG8VwmU3R2SJfYwmsVOQSMGa0M1894+I4IxI+Gl8E1NFICXnxzY+lMe8KFmwP/k0O2CTvAPvztj6
	07Tf7dpMlxuXy+4ewBWAj4vv3pPFVsPrOtJkv4YjCE3YBNNsb1HphglJxJS5HENV/kLFx3QChOhXR
	9SdMd566d0TcYDu0F9y7EzNoDLPt08/zFOTADtVOy7q64hj/SFLER/EofjhkzxdHCRFcgkZwSgF+3
	3wAi5geSAuFiDtbjfhRzFxkJ1+revhZvu1WU8kVxEvrrtmq6q5pMjD1McQgpV5c8qQnG1TdPdKJXd
	blVkXN7avOvF0Glmvp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaN-0000000EfpB-3dHr;
	Wed, 03 Jun 2026 09:08:27 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaL-0000000Effy-3AN6
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477705; x=1812013705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rw7N7Pd11uGRr4oX7ZhsDrNgVcm9Fa3zHLK8UBO3wuE=;
  b=LreF385LOcYWAidFgojPy9+f0My/oX5znbeznBTN4gx77WB5pQoYvHFQ
   SwkHWXNcItNrmRLQp3DXER9UqLD+0Et3SatrcGXu+q9UqiS80BpMeay8q
   IswY27tLyHmyO4uy7rie7EuqmvPG7tldJ24ZPlnOdz7HWRMMgDXBkt9CS
   z9tewdqJFHXsTzMuDyLMnnrpdQXMFzFuS47c0iQfWhWyw5qKvPz4PlRgd
   UCQe22MhxoKW6aLKA2KQSh31cwlZXDwlQDRfn3a2tgL6o2ZCtDBUOIBRL
   vL7Fn3p4M6wGjyDNF0PMSUnCkKhEHsq7gwSu4ySevxcKCEmoo8uflUi0G
   A==;
X-CSE-ConnectionGUID: y5GFcai2SA27oYwqt7pAqQ==
X-CSE-MsgGUID: BPsqLohvTWW+Pja5NWOwWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852635"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852635"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:25 -0700
X-CSE-ConnectionGUID: s7J3NR37TmG4UpmO9XBmcA==
X-CSE-MsgGUID: nYLlYqNRRh62lecRkDor4g==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:24 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 08/17] i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
Date: Wed,  3 Jun 2026 12:07:45 +0300
Message-ID: <20260603090754.16252-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020825_816123_8332077E 
X-CRM114-Status: GOOD (  15.36  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'ed-by

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
