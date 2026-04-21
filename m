Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A9AF94CA0
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVVPl4QUg1LLlUUsFq1PacgaaDmVH+OJPzD4rky2EM8=; b=W/9AGbobTmyO4A
	W+NS/378SpRZXYxkQrVBbMzGau1cNcoRyNGhRp+nJlg3c7ccaxe49qqJfT1KKQhMdF/DxwoMD4iLl
	OLyLWrfniLlOVxhRfowdFQ6nCzO+j47AcLipKrR3hzs1MOACc/YK9AhBZT6NH8lzZtQAaXetZT2oE
	OObScO3H1SGbL+x2EHif4Bip3u5//0O1+9cCh2AamDj+N+O428khdMtL/F1u2F1Fk8G+VRwvuZGsJ
	dGaLraW9fSqp6avPRz9Y+WvmEYXSzI2EmGcVAlDctck2QqC30noCjwRNnlwIglMOG6h3wGhoX6ngj
	Uj56iQtY9RT0MB0vI6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJZ-00000008zgr-2VZO;
	Tue, 21 Apr 2026 17:55:13 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJX-00000008zV1-0usf
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794111; x=1808330111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VEMJQSVWiv8Ut4r0YhnM9hE8GcXB84xb68oN61wxZN8=;
  b=NErMk4XLzm+hVkl+9KeEjJ9NCd9Xp+zaX2p3vBRLTp2ZyW/GG2BCRuyp
   QqpgeWTmNc30ZYs1aZrKRdTtnAIX7EeV1shSYO2A0KrQ/fUlYuW2qWH0p
   SZ3UlcDQX9txzlQoiXRHkw9JFtos50j3mUwb2yOJwLaGNGvyofz8Qf7Ho
   1sis3xuowemaN4ubFXgHQXFbevATDoEWSsEoEwGsT8ux7YkjwrF9pYPA4
   NtOsYTGshw3imRDMzp1I6wINJXAesYxXKs45lljuT/wpBOuIaBDpLYYcS
   Ajo9yAicxJ52HIIJPajCnP/euwzA89R3KuIrVhcw7FKMAhHMo4fZeGtlr
   g==;
X-CSE-ConnectionGUID: OebmmjePQ2CYaDyZtXiqhw==
X-CSE-MsgGUID: hzBEH2rHSsmeknnum8cZfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651415"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651415"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:11 -0700
X-CSE-ConnectionGUID: NHvxbIiNQM+52/8UBxlXkg==
X-CSE-MsgGUID: LTK5Ne4IRUSGA1NEY1S/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227495064"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:09 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 13/16] i3c: mipi-i3c-hci: Wait for NoOp commands to complete
Date: Tue, 21 Apr 2026 20:54:32 +0300
Message-ID: <20260421175435.122094-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105511_315230_65332C0D 
X-CRM114-Status: GOOD (  14.05  )
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


Changes in V2:

	Rename completing_xfer to final_xfer
	Add missing reinit_completion()


 drivers/i3c/master/mipi-i3c-hci/dma.c | 39 ++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 4ea623dbed52..dfc91de66ba5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -694,11 +694,33 @@ static void hci_dma_recovery(struct i3c_hci *hci)
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
@@ -706,7 +728,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	guard(mutex)(&hci->control_mutex);
 
 	spin_lock_irq(&hci->lock);
-
+restart:
 	ring_status = rh_reg_read(RING_STATUS);
 	if (ring_status & RING_STATUS_RUNNING) {
 		/*
@@ -763,11 +785,10 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
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
@@ -799,6 +820,12 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
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
