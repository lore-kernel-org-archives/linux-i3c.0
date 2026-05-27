Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD293CD5BDE
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 06:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0pp1e1BJ4L9HaHbG8cUpxJ1IwRcVxsbMteasLJeTps=; b=nMhYshWeVb4CBA
	aZWjkESCTMx5hh8F3hTkE4cvNWzIwFDa0b9kIhABAlzBlWYil/bFIWj3shVGov6gKI4A/q3tMrSRU
	sHLhAgdUAxnoYcF1Z1YY6ODMJGcb+XQ1CAs92skioAJE4aAarSvHj/Vjd6ZkP2xXECLqlNw+ATVVf
	k6wtH0v3mm4wyZwOhgPhmsF1qtcMFG2jujCNxwi9M9++uVU959bC/l88TpKRIDLP86rNWa8Wk65S7
	b15UEx1QPQinVTW27QbhYg7buIteOwRoEMmCLWWPnQSvNZ3C1+0dQIilCT6Sl/nmFwt4rET0UH0j+
	qrMZfpk3AVoNKBugBdiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7dO-00000003OLF-0j0n;
	Wed, 27 May 2026 06:20:54 +0000
Received: from mail115-118.sinamail.sina.com.cn ([218.30.115.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7dK-00000003OIY-3QjT
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 06:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.cn; s=201208; t=1779862851;
	bh=V/Y6MuG1dUmeFRhVhwjtGhY2waWpqlhOBuklwr+jydU=;
	h=From:Subject:Date:Message-Id;
	b=jOuJDP2y9UimaviXTynFVKSJH9adVielG/OeUPgxlnKmydWMk1fJtXIS1HAv2cqqb
	 YCLmCaxIUVqoCbbI1sPaLw8EVgyaRZkBZpC0Y9/093UiTYd5qllTHMf577k8cNgg73
	 TheiEjfHU9F+7jEgoGMn7ucWIaessbO0Wlse6t18=
X-SMAIL-HELO: NTT-kernel-dev
Received: from unknown (HELO NTT-kernel-dev)([60.247.85.88])
	by sina.cn (10.185.250.24) with ESMTP
	id 6A168D3800001848; Wed, 27 May 2026 14:20:41 +0800 (CST)
X-Sender: jianqkang@sina.cn
X-Auth-ID: jianqkang@sina.cn
Authentication-Results: sina.cn;
	 spf=none smtp.mailfrom=jianqkang@sina.cn;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=jianqkang@sina.cn
X-SMAIL-MID: 81871510747978
X-SMAIL-UIID: 3EF491FA24E547F983570195DF246D43-20260527-142041-1
From: Jianqiang kang <jianqkang@sina.cn>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	adrian.hunter@intel.com
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	sashal@kernel.org,
	billy_tsai@aspeedtech.com,
	npitre@baylibre.com,
	boris.brezillon@collabora.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 6.6.y] i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
Date: Wed, 27 May 2026 14:20:39 +0800
Message-Id: <20260527062039.3612331-1-jianqkang@sina.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_232051_275908_B7B8C394 
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

From: Adrian Hunter <adrian.hunter@intel.com>

[ Upstream commit b795e68bf3073d67bebbb5a44d93f49efc5b8cc7 ]

The logic used to abort the DMA ring contains several flaws:

 1. The driver unconditionally issues a ring abort even when the ring has
    already stopped.
 2. The completion used to wait for abort completion is never
    re-initialized, resulting in incorrect wait behavior.
 3. The abort sequence unintentionally clears RING_CTRL_ENABLE, which
    resets hardware ring pointers and disrupts the controller state.
 4. If the ring is already stopped, the abort operation should be
    considered successful without attempting further action.

Fix the abort handling by checking whether the ring is running before
issuing an abort, re-initializing the completion when needed, ensuring that
RING_CTRL_ENABLE remains asserted during abort, and treating an already
stopped ring as a successful condition.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20260306072451.11131-9-adrian.hunter@intel.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Jianqiang kang <jianqkang@sina.cn>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 624d00b853a5..61007167606f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -448,16 +448,23 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring_number];
 	unsigned int i;
 	bool did_unqueue = false;
-
-	/* stop the ring */
-	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
-	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
-		/*
-		 * We're deep in it if ever this condition is ever met.
-		 * Hardware might still be writing to memory, etc.
-		 */
-		dev_crit(&hci->master.dev, "unable to abort the ring\n");
-		WARN_ON(1);
+	u32 ring_status;
+
+	ring_status = rh_reg_read(RING_STATUS);
+	if (ring_status & RING_STATUS_RUNNING) {
+		/* stop the ring */
+		reinit_completion(&rh->op_done);
+		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_ABORT);
+		wait_for_completion_timeout(&rh->op_done, HZ);
+		ring_status = rh_reg_read(RING_STATUS);
+		if (ring_status & RING_STATUS_RUNNING) {
+			/*
+			 * We're deep in it if ever this condition is ever met.
+			 * Hardware might still be writing to memory, etc.
+			 */
+			dev_crit(&hci->master.dev, "unable to abort the ring\n");
+			WARN_ON(1);
+		}
 	}
 
 	for (i = 0; i < n; i++) {
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
