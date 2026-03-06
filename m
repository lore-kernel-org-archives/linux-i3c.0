Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7489EF01801
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ireKeN2X6eGQdnFeUrUv55q25MI2P2AU5Qho4FCBk1c=; b=G7F1L0QpgByqeW
	WpJJGTbkXiYLnEESYmL7XQozDICksxwRmqMpBqXdnvvrueo3jWDp4tplGK4zSOEcWE/U93+OiUb16
	DdzLvPwO40AYB11FC6IvStYIiLQET8N0jkHqvdMPCzOyIp7p9ESSk3ud+xk62ncdQx+1YdATao7vJ
	rDJiSmiruJKbVlXMDwh2Nm5epwvtMj3tG1NjrsR4ccNip0bj124Oog2/IHUsbqPK+EnUQ8NNuA25w
	8qsq+yl0HngMos5vLPwtPt8uyUJyByRcq4/ZVO7Y3Cyouji7pEy12mplE3Ge9MeHdNtUdIiPikoWD
	C6mfHSvnjPiJ0yOVJWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYq-000000039F4-0Y4w;
	Fri, 06 Mar 2026 07:25:24 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYm-0000000395H-1ILL
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781920; x=1804317920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C8/NROcFn5eiENdY10iDG0yyha/bukcuBpM5ac9ZElg=;
  b=WMopvOa/12n9ykKns20qIX73wDzzo71WyufgFRUw/z8rGhSaygAWXwem
   JLD3MO5E0N8IAaBZ3/WdFjx2f2wdDOQaM9c8q/Pr6x+kiY7atlgShP5F6
   awt92LV//17dw8qC/fpdqoPTogb8RUN2G3KOnoo0sk+Pnv3YViLZt3pUG
   lTxsUCZx6nSZnGaxaIz757RekWpgKji1zHLBG/mADzg7vooCOC0hpXm2H
   aimsPw60r139BicOjwrU5JH8jtB/2VI3YrKqKi8CqZuy+6Ghl8W0ffjvh
   BD6vzXFOuY85WihNB7VIY7pdkG7zYgG1PY4+uBBXOLSa0VXXcfe/fuKbV
   g==;
X-CSE-ConnectionGUID: 9vueiuu8SjalqcrtS2nIpg==
X-CSE-MsgGUID: e4RO9Q5pScykCb1fbhgNjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461349"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461349"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:20 -0800
X-CSE-ConnectionGUID: I9PMKYiITseCjGqqwZRfNQ==
X-CSE-MsgGUID: 6lxIepuyQX+3Ov74H2qdTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419956"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:18 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 10/14] i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
Date: Fri,  6 Mar 2026 09:24:47 +0200
Message-ID: <20260306072451.11131-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232520_360986_49816C82 
X-CRM114-Status: UNSURE (   7.69  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 239a195df7c7..41b83f07fdab 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -600,7 +600,9 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	}
 
 	/* restart the ring */
+	mipi_i3c_hci_resume(hci);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
 
 	spin_unlock_irq(&hci->lock);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
