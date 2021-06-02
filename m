Return-Path: <SRS0=i7vZ=K6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38765C4743F
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Jun 2021 20:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17F761404
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Jun 2021 20:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17F761404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TWproBKtMPXYqDZREcFg7fDj76sLhmIkk0R06C4kF9c=; b=rGJm+MpfcgCAcX
	GeHbeTumJwPKoadSLacVIf8Z30JiG08ultt2Tq3XGtguXsFC5e4MtcpahuAh6e9eYvMo4I8/MT5ja
	1VqNG2jieNybzUuRo9K9zSdLp3Lm7ttLOpZnyGnGHzfjEj4wYxlvLiB5SISaMRY7hIomj7j53qDBi
	Fsb4HYlUe32g6TXPwkYI+xHeoQH0FoiqbyMQaHYMqxRC7RvVqVS0/oNKj4nKu2HQJE4ridr75AGLI
	rHXq5oshYv9v9Gku1Rf/EnK6PA1s4S0cN3dwXn+LgGmD3cOx1YlIJH6OHmwaD9TfIZIW2nocGchFn
	HH0nZoLPcUsuiBQJ2Thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpGkS-00FAYX-Dz; Fri, 04 Jun 2021 20:48:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loMV6-002kr2-CI
 for linux-i3c@lists.infradead.org; Wed, 02 Jun 2021 08:45:22 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fw2b71p7GzYnPj;
 Wed,  2 Jun 2021 16:42:27 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 16:45:11 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 2 Jun 2021
 16:45:11 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>
CC: <alexandre.belloni@bootlin.com>, <miquel.raynal@bootlin.com>
Subject: [PATCH -next v2] i3c: master: svc: drop free_irq of devm_request_irq
 allocated irq
Date: Wed, 2 Jun 2021 16:49:35 +0800
Message-ID: <20210602084935.3977636-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_014520_633666_39ABF2E1 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 04 Jun 2021 13:48:54 -0700
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

irq allocated with devm_request_irq() will be freed in devm_irq_release(),
using free_irq() in ->remove() will causes a dangling pointer, and a
subsequent double free. So remove the free_irq() in svc_i3c_master_remove().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2:
  removing free_irq() instead of using devm_free_irq()
---
 drivers/i3c/master/svc-i3c-master.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 1f6ba4221817..eeb49b5d90ef 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1448,7 +1448,6 @@ static int svc_i3c_master_remove(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	free_irq(master->irq, master);
 	clk_disable_unprepare(master->pclk);
 	clk_disable_unprepare(master->fclk);
 	clk_disable_unprepare(master->sclk);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
