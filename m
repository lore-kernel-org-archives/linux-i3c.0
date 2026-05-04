Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A17CD3436
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmohQ0VjZMg6VfUPDjAUqcmoy0vpQqVywWsmzIERcAU=; b=WcBwJDYnncU3aU
	0sLESoeA8OqFR8oixJ6Sm9ZyvolPSR2rgC5a1qApViXWz4/YkD81o9QOeTkzxG9tK7qVfsvZl4u82
	jk4Rcqr9mqrlZBnhiEZLkjCPSxeYulJolm9Hc5IFHcMLgv2cSaYDlq5l7YmJN4o4EudNEg0Ov8xsu
	V/3a+8s4TD/Huk3EJTCLt++Ls5OA+ds/n3pA4WolEwkYQdZQR2yn+Xr7mKoSNd0H4xl72puNOIEXN
	V4f1i4JemCGVbqO2oZHeuMSRndS3eHWAOO+6YgSe10L7FAfCQRPa+1xc+8mNG8pS1w13mT9l5i1fn
	p/Q+d43McPy1+Zl1N3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYx-0000000D3JE-0oA2;
	Mon, 04 May 2026 11:34:11 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYu-0000000D3Hv-3BY4
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894449; x=1809430449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tBQeJbD6frPT216scr5vXTjp7lJDChruCq8wEw3Bl4k=;
  b=D3wgxPnfryJbOQ22ipH/p/XOB7s5L4kkyBLCxryUKpiDSK/kNodLXTfk
   13rq5dTEIhLoPy2WapoDrwLXiVhcNKJku4gnLY0s4vxcbGfpPP7vEJbaW
   v4IoP/eCs0R0c1Yn3n56j0LEJ46wZHBQkSe8XeTLH+aPOukCIM3Ov/2Cu
   SDptggNxDi9BRHnNpvTEc10rgqUuA+T6t0VE5/UgAXtZ++esfCiyW9517
   zTGiqeMg1kS4QiFy5JBuU0W60UEi8RYztxqN58E1SfqaZNaCdYmSa+vz/
   PxVbkG18LDfwL9nnclE1YIbK5WmF8YM9A6IReSw73PtqJOLB9r+IhxuIw
   Q==;
X-CSE-ConnectionGUID: W6fskvk9RsODw7VOo06a4Q==
X-CSE-MsgGUID: f4+Tz4ePS52wTi7+vJZEVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315147"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315147"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:07 -0700
X-CSE-ConnectionGUID: pkkDYiE6S7C6x9EkmxHqUg==
X-CSE-MsgGUID: gSL30k/bTvmv+R55amxWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478194"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:05 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 02/16] i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
Date: Mon,  4 May 2026 14:33:38 +0300
Message-ID: <20260504113352.38490-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043408_934667_A961CA98 
X-CRM114-Status: GOOD (  12.58  )
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

The MIPI I3C HCI specification does not require the DMA ring RUN bit
(RUN_STOP) to be cleared when issuing an ABORT.  That allows the DMA ring
to continue to receive IBIs, although an IBI is anyway not lost because it
can be received once the ring restarts if the I3C device has not given up.
Note, currently ABORT is only used on a timeout error path so the change
has very little effect in practice.  In the more common case of a transfer
error, the ring (bundle) operation is halted by the controller anyway.

Adjust the RING_CONTROL handling to set ABORT without clearing RUN_STOP,
bringing the driver into alignment with the specification.

Fixes: b795e68bf3073 ("i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's rev'd-by

Changes in V2:

	Improve commit message


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index e487ef52f6b4..4cd32e3afa7b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -554,7 +554,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	if (ring_status & RING_STATUS_RUNNING) {
 		/* stop the ring */
 		reinit_completion(&rh->op_done);
-		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_ABORT);
+		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
 		wait_for_completion_timeout(&rh->op_done, HZ);
 		ring_status = rh_reg_read(RING_STATUS);
 		if (ring_status & RING_STATUS_RUNNING) {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
