Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDA8C83F11
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Aug 2023 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ToZWFOQHDwp+xldT+xNykguXJPPHg0AHrckjx7Zj7RA=; b=e+hoNz0eQkj3rK
	ijmb9Q2FuLmz3ZL1o59xAZDYhzDzdW4F0Fs9exWLLAFEgBBeG/7lkeG6TrzEW8oQR/e+J7CKfatOH
	9zSYRvveERkoPnM1QD+udBEq876QyU0n7Lp2gt9R3nRH4G4NekNY4FOgkzkxlF+a811j8DV0/rJ9H
	Ozgs2lZtfhRcBCG4lz0r68A8Z8Yah9UiTcXxEcb1bWD73l4YqhKUseNHKWbDVildgGZGVfNGMZA7x
	Gz163hIrUPcOxGd9083tBlvOf9IM3Y0ft5hNy9yBIZyaQLsXwTw5m72T12baswHQrlIYGOQMQqPWZ
	4wh2YoKnL6FrC/FLnfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qadyd-009mQH-2a;
	Mon, 28 Aug 2023 15:16:27 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qadyZ-009mLg-0J
	for linux-i3c@lists.infradead.org;
	Mon, 28 Aug 2023 15:16:26 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 223EF7FD3
	for <linux-i3c@lists.infradead.org>; Mon, 28 Aug 2023 23:15:41 +0800 (CST)
Received: from localhost.localdomain (161.142.156.149) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 28 Aug
 2023 23:15:38 +0800
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: <linux-i3c@lists.infradead.org>
CC: Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: [PATCH] i3c: master: cdns: Fix reading status register
Date: Mon, 28 Aug 2023 23:14:58 +0800
Message-ID: <20230828151458.15085-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [161.142.156.149]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX166.cuchost.com
 (172.16.6.76)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_081623_306515_A4CD0042 
X-CRM114-Status: GOOD (  10.87  )
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

IBIR_DEPTH and CMDR_DEPTH should read from status0 instead of status1

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 5b37ffe5ad5b..4a49c75a9408 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -192,7 +192,7 @@
 #define SLV_STATUS1_HJ_DIS		BIT(18)
 #define SLV_STATUS1_MR_DIS		BIT(17)
 #define SLV_STATUS1_PROT_ERR		BIT(16)
-#define SLV_STATUS1_DA(x)		(((s) & GENMASK(15, 9)) >> 9)
+#define SLV_STATUS1_DA(s)		(((s) & GENMASK(15, 9)) >> 9)
 #define SLV_STATUS1_HAS_DA		BIT(8)
 #define SLV_STATUS1_DDR_RX_FULL		BIT(7)
 #define SLV_STATUS1_DDR_TX_FULL		BIT(6)
@@ -1624,13 +1624,13 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	/* Device ID0 is reserved to describe this master. */
 	master->maxdevs = CONF_STATUS0_DEVS_NUM(val);
 	master->free_rr_slots = GENMASK(master->maxdevs, 1);
+	master->caps.ibirfifodepth = CONF_STATUS0_IBIR_DEPTH(val);
+	master->caps.cmdrfifodepth = CONF_STATUS0_CMDR_DEPTH(val);
 
 	val = readl(master->regs + CONF_STATUS1);
 	master->caps.cmdfifodepth = CONF_STATUS1_CMD_DEPTH(val);
 	master->caps.rxfifodepth = CONF_STATUS1_RX_DEPTH(val);
 	master->caps.txfifodepth = CONF_STATUS1_TX_DEPTH(val);
-	master->caps.ibirfifodepth = CONF_STATUS0_IBIR_DEPTH(val);
-	master->caps.cmdrfifodepth = CONF_STATUS0_CMDR_DEPTH(val);
 
 	spin_lock_init(&master->ibi.lock);
 	master->ibi.num_slots = CONF_STATUS1_IBI_HW_RES(val);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
