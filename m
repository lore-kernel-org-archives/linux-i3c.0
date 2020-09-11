Return-Path: <SRS0=qFpp=CX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AB5C43461
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3BC214F1
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJHanYBN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D3BC214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ab/sIBxU9eeIJiUVRQ7iYEzRlQC0MOLVH+ognRcBaLw=; b=JJHanYBNCBJDB55z7qPkNVzwZo
	47moEufP25CQtlcX+ZG6w89p6DKiGARIJGU7rjKwir5tw9POsWdXhvd3a/zmto7VYddIsRsIFcscR
	4pGnvKcok7vJVQmuVspWCl1BYzQKODoM/1FEHNU9bUEA13m1A8o2UrpOTSOO1h+tMxr5eWTTL/ppP
	xBWh1MDkoWLY6oDc12MXc17zCZbAS6CpofvRMXJTK1Lrx0NFvC7xr6NVh6WOXhpH1hkxnFKuZQJlc
	JI4AS4xXS+neTHyIbmvhbkR2JeJ7KzQ5pxqFgycf41HP6Q9CSh3FTH6Fv3U8IF2Ee2lD/8A9yAbt7
	Ke+3s+yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHiVt-0007rD-0N
	for linux-i3c@archiver.kernel.org; Mon, 14 Sep 2020 07:02:57 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGZoO-00049h-3D
 for linux-i3c@lists.infradead.org; Fri, 11 Sep 2020 03:33:21 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9CAF2E9ADB58E230A09D;
 Fri, 11 Sep 2020 11:33:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Sep 2020 11:33:04 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <pgaj@cadence.com>, <bbrezillon@kernel.org>,
 <boris.brezillon@collabora.com>
Subject: [PATCH] i3c: master: Fix error return in cdns_i3c_master_probe()
Date: Fri, 11 Sep 2020 11:33:50 +0800
Message-ID: <20200911033350.23904-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_233320_378747_958DE9F0 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:02:53 -0400
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0.

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 3fee8bd7fe20..3f2226928fe0 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1635,8 +1635,10 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
 					 sizeof(*master->ibi.slots),
 					 GFP_KERNEL);
-	if (!master->ibi.slots)
+	if (!master->ibi.slots) {
+		ret = -ENOMEM;
 		goto err_disable_sysclk;
+	}
 
 	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
 	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
-- 
2.17.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
