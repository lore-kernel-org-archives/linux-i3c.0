Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E0C001B0
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Aug 2023 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NCm/NW4PoqfXkU5oQwpTeqSL0zTfFbO0nvt/zrVgajQ=; b=MUUYltxe34eh4x
	ariflwBk+YgYGhcqwTSdW9k5ucEjAt1IXSOM4+Vi9P8Y/nAyJD9rfA3512Yj7Pq+DrPSYEKMro7+1
	qe+cW8ZwRmOyXe/xbWZ/UUp30n/4379DVQDBXelZCieIqlf9HWUVAxWhFXvspoqYFy4KETfzNXqKT
	mUZr5bo//ODLWhdtizNRkQY4jUnBmb0jAI0KA5ZnCnwFdy5tiyOpvdcHP1E4XdICQudWkPel0yXLo
	ZiBTs7UPlCwgxeP+DaMhSSIiPsWJidrgbQEaB0k3p46dpDxAfj8npx27/uP5UxtIrnw9dUiOGfnWh
	8f6bil4ofKwRqgyA2PCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNHb-002iLG-2d;
	Tue, 08 Aug 2023 14:01:59 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU4a-0074zL-0c
	for linux-i3c@lists.infradead.org;
	Thu, 03 Aug 2023 08:52:45 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RGjJ35FmKzrRyr;
	Thu,  3 Aug 2023 16:51:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 16:52:35 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <linux-i3c@lists.infradead.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] i3c: master: svc: Do not check for 0 return after calling platform_get_irq()
Date: Thu, 3 Aug 2023 16:51:49 +0800
Message-ID: <20230803085149.149248-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_015244_516050_9E139398 
X-CRM114-Status: GOOD (  10.49  )
X-Mailman-Approved-At: Tue, 08 Aug 2023 07:01:57 -0700
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

It is not possible for platform_get_irq() to return 0. Use the
return value from platform_get_irq().

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/i3c/master/svc-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 0d63b732ef0c..770b40e28015 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1518,8 +1518,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 		return PTR_ERR(master->sclk);
 
 	master->irq = platform_get_irq(pdev, 0);
-	if (master->irq <= 0)
-		return -ENOENT;
+	if (master->irq < 0)
+		return master->irq;
 
 	master->dev = dev;
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
