Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59107FEFB5C
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJxrGXvA6amyGHjGSVwlvpw5qaInDzVH46iAYA0g/yk=; b=qw2oluZhN5UkW+
	2aw3TIN0UUHsjEa9/oKuSoRWw2NmJPOGTnfkezdJREvi9U4f0d1AmQfy4IeFmrhSupdlvyMBNId4g
	io69EEH1WPiDoplOXOADOxpdcE6/abD2AEbgpOR4gm7BOQ8DMNXQpONDZBnY8RjDFKdepWn9otuDU
	YSqpqGQr8EgRQAglnJc+7nc4LRv6v7COhqr4iSkIYVXJXf4PR2eWfiWBBO9aEwvdkT8r7/UYoMzBG
	vh5YdZ1GQcF5hyY9WTYc/1bfv8OW8ZfWFqomB+I2C0kiu2qnhJGrWRTbf3HrJXrx6/ec5Hf2sVXns
	5C3IQQxjGZZSCAxUGzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZm-00000008TXZ-0JZG;
	Fri, 27 Feb 2026 14:12:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZi-00000008TRw-3D9r
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201535; x=1803737535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xkd4bx5g9Tk62c/rRKgs4itaaPxNMa5XUPNhJ9PiFPI=;
  b=Y1rKI6V//FqdILCrWFpWFefU2gwnXEoEzNQtSpM4pOmLg3c1tmt6JuIS
   Dq2AP8IbcIJfT3Q4PMYwWu1PfpyRRKPKkhw+BhmQ5b+DEYBU2ezAeBjZ/
   reRRSVgpdNoXU8+wp0HMuegPlmhdcR+Tnj72bzp2gsEIwbWCAbNfpo6yE
   /FuU8mr69j0j6kv/k+qjsX4oKov39It7LMkjvybNCr3u6j+e4Zh3jCIqe
   KOTlO1g+Us6tev9Y5TmbCIVqbw9XwC+wpEtrNWxMCHFbXIX3h4AEhll38
   /tEe2an/XBd/4SDcevjBb5El+kJrksi1YlBMKsbyCbt8f5AXytCkaLgiF
   Q==;
X-CSE-ConnectionGUID: RE6K3wKWSuqet5YjeO/bAg==
X-CSE-MsgGUID: V69RtjQnTiujkVHGInF3JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750045"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:13 -0800
X-CSE-ConnectionGUID: z2xTfkYPQJ+5IHrrSrHA9g==
X-CSE-MsgGUID: Glyy1sv2RlOicwAVZVWu7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015723"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:12 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 08/12] i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
Date: Fri, 27 Feb 2026 16:11:45 +0200
Message-ID: <20260227141149.184980-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061214_810503_8EA1D0BC 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

The DMA dequeue path attempts to restart the ring after aborting an
in-flight transfer, but the current sequence is incomplete. The controller
must be brought out of the aborted state and the ring control registers
must be programmed in the correct order: first clearing ABORT, then
re-enabling the ring and asserting RUN_STOP to resume operation.

Add the missing controller resume step and update the ring control writes
so that the ring is restarted using the proper sequence.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index a11d0743fb80..323c5ead82a5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -604,7 +604,9 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	}
 
 	/* restart the ring */
+	mipi_i3c_hci_resume(hci);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
 
 	spin_unlock_irq(&rh->lock);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
