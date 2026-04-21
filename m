Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B342DF94CA5
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHKHzwe/CR6/+YLZ9lH8hEynSUXfrQCd5FuTyCKap0I=; b=TE3/005COVWLh1
	VFqGhXq7ArMsTMNJ+ABHkZb+MEZFf0I6e30EktOoSGbE0gRxPLPjcqj+r5ZOGs6dRD2Js1f4Knu8b
	ypRq3KU3LDMhteoegytdNIel3pw7Qr/BlUquzhB/Vem0eJhmuI0XrJ+CDsSnAHsEOSC0lKYmx/k1h
	h9/4cyxUXNWUkV+o4VLx9LTg6v4pR9m3EMbjgjCC96n7805QPyofomLgidn96rILntLohLSIz+njJ
	XZqRfpLAFYohtdPZzmefy5Dohy84qkpDZUr/Ha1AQh6tf01IeOmo2K1AL+v9+BHVzEf/pmiPRditp
	dmdSvBtfwGUbXoUQdIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJI-00000008zUc-0wVn;
	Tue, 21 Apr 2026 17:54:56 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJG-00000008zSH-0jXr
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794094; x=1808330094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SjOF/6kJJSGB4kLdvP4pLaiiXGH1FK07/910HTlSe/4=;
  b=hgIl6bR59RhDLZlpKGvmqGTE7bnrwM2zZZC9xo6ozJDhX5/yeuUicMkE
   JOMVq7/y8eqo/racM3WXlhG9vSH3PV+D/DizJUbrO+30ZX/NA0sJ6xK+P
   wervnMFoGjLJpRrmVJywo4j9iorVqkJgtkOxp5KanDzfmVeYsdzpWFHs8
   e/HsAEoAjnwoO2vlwZ/DuScJI5lFUB1f6wGIewmwx3OOICktGcW32Ibhs
   vDLXzP7rYs4H7EHg7j8xmQQ1e8KEacUrrtSjIHnnGKtSBLEgXiUDLsfqg
   JQY9PiNxumre6wPzgdW5rNGcsyKUdFStU2T7cdPKraTFUu83b8yUtWhwN
   w==;
X-CSE-ConnectionGUID: 5UbY4IYUQ3C+/5yLXecMCA==
X-CSE-MsgGUID: ON2IXYDgQb2793oBnsMpbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651354"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:51 -0700
X-CSE-ConnectionGUID: gFrRyNQxQd6myaYR/Lmn1Q==
X-CSE-MsgGUID: 651dHA4iSlSrfeHmQZV8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227494859"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:50 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 02/16] i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
Date: Tue, 21 Apr 2026 20:54:21 +0300
Message-ID: <20260421175435.122094-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105454_251695_9AA88C66 
X-CRM114-Status: GOOD (  12.79  )
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
---


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
