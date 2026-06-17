Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EDFCD98E4
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jun 2026 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FFbQbVuBaohuiQ9g2VOM4Zrh6t08tqWSfg01Cg5LOtw=; b=pt/SeeDYfIPXYo
	/27FbrYUwS2KpCnHKBn9vJK3U2XjsomjsARRk0Xtd7NdKETkEMguJO4VP3vFT6yWOeUTnS5hrm4dO
	oM/zZ/g1T83Lj+NR7ee+vjitDowHbWzuQOXBVxf44lpsICUR08EP8n57s236zboeW03aOGFjr6Jxa
	9E2KkndEBWIDxx1rnrusuLzD+YeIiB5o1o4xgUuE0eGH66P1/ev4snf7tPGPUt59DBpq1tBKJ0oCl
	2lQCG3Nr7cVAmjyo0zXjCJmPlC4NwbWWoyW9PquJd/rHgb3jLY/w2hpqyKiUP1/Eae562d0Sbd1cP
	n6rsMzRQjcYyfHJxuEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrmE-0000000HWYH-0jLX;
	Wed, 17 Jun 2026 15:02:02 +0000
Received: from mail-m128163.netease.com ([103.209.128.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrmA-0000000HWXT-3keN
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jun 2026 15:02:01 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42c696515;
	Wed, 17 Jun 2026 23:01:44 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH] i3c: master: adi: initialize the lock before enabling interrupts
Date: Wed, 17 Jun 2026 23:01:38 +0800
Message-Id: <20260617150138.628578-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9ed61a3cb903a1kunm30aede3e71fad
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGUpNVkNJHk9PT0NJH0wYH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=mg4p7HEHY8vmP8MknhhjbKoZBcw3shn2hzBZBbfIK7chKfApm6cwCjHgmcGiuCUmK+zVBVtBTdAhYZTz3+gW1Z5r1Wx2q5llxdusNFsh66S9cmKxggnXcvCB8RsRBXwWRQCcCKTzZ797VQsN7i+BBIXJiCD80Svx3/O0tG6qpvI=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=oP+7Fqj5obiHqmRzGIe8ikds8jQUQ2UQELMJxvRP8PA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_080159_621671_922355B9 
X-CRM114-Status: UNSURE (   7.80  )
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

adi_i3c_master_probe() requests the IRQ and unmasks REG_IRQ_PENDING_CMDR
before the controller's IBI state, transfer queue list and transfer
queue lock are initialized.  A pending CMDR interrupt can therefore run
adi_i3c_master_irq() and take master->xferqueue.lock before the dynamic
lock has been initialized.

This issue was found by our static analysis tool and then manually
reviewed against the current tree.

The grounded PoC kept the probe ordering and the IRQ path
adi_i3c_master_probe() -> adi_i3c_master_irq() -> xferqueue.lock, with a
pending CMDR interrupt arriving after REG_IRQ_PENDING_CMDR is unmasked.
Lockdep reported:

  INFO: trying to register non-static key.
  you didn't initialize this object before use?
  lock_acquire+0xbb/0x290
  _raw_spin_lock_irqsave+0x36/0x60
  adi_i3c_master_irq+0x32/0x56 [vuln_msv]
  adi_i3c_master_probe+0x5a/0xf47 [vuln_msv]

Initialize the transfer queue and IBI state before requesting and
unmasking the IRQ.

Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/i3c/master/adi-i3c-master.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 82ac0b3d057a..cf873d46e10f 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -967,17 +967,9 @@ static int adi_i3c_master_probe(struct platform_device *pdev)
 	writel(0x00, master->regs + REG_ENABLE);
 	writel(0x00, master->regs + REG_IRQ_MASK);
 
-	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
-			       dev_name(&pdev->dev), master);
-	if (ret)
-		return ret;
-
 	platform_set_drvdata(pdev, master);
 
 	master->free_rr_slots = GENMASK(ADI_MAX_DEVS, 1);
-
-	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
-
 	spin_lock_init(&master->ibi.lock);
 	master->ibi.num_slots = 15;
 	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
@@ -989,6 +981,13 @@ static int adi_i3c_master_probe(struct platform_device *pdev)
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
+	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
+			       dev_name(&pdev->dev), master);
+	if (ret)
+		return ret;
+
+	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
+
 	return i3c_master_register(&master->base, &pdev->dev,
 				   &adi_i3c_master_ops, false);
 }
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
