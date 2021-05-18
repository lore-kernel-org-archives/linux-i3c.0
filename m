Return-Path: <SRS0=hVZS=KU=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1879C2B9F8
	for <linux-i3c@archiver.kernel.org>; Tue, 25 May 2021 09:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0DA61360
	for <linux-i3c@archiver.kernel.org>; Tue, 25 May 2021 09:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0DA61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wNdOzhiwOAWQu+MSrjY78wgui5J4VzctS3wpqcY1WWE=; b=RONEUohJNZQa2Z
	vqZK7AhkG9tgx0jw9/C6+LyFMLH/9eR3BP2WPPp/yjPLW3XT8xgqxBewuNi5FhG2WV2G5o+G4eEKR
	CdsViTTcLKnw9qM4bjpiV3oE5J5t3qesGVorLf7WzelUqExWRaTT+cVUpcc+G8DXDXfxxvEOITrpG
	pVzx5ZMH/bJzf4rkCuBLVNOUqdP9j6u0llTPrflq4EBuGycqunoINk5hbMoKxH2YQDUCF8o/foj8g
	e4wQWgXYl/f6lhjXXiZulKSvvNTUmY2X6s99Ze/OKyfT/RI0JKaADu7OPrEeSnCMt+KTpURWljsCE
	ww5acWb+XdBHJVgg4DUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llTUy-004PyY-Ka; Tue, 25 May 2021 09:37:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lizTQ-000qDq-AB
 for linux-i3c@desiato.infradead.org; Tue, 18 May 2021 13:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=H0QekIxKNKlGeD7/ndYNd/O8SXhN9rH5apiBESkQwn4=; b=LluU/VHxQUCJlk9iRAl86JG7D2
 MUL2V4t7LhK8LnPEl7wyLnm7e6wsJH7Eqk0yq4qXQn9Vn4Fn3xpcvmQY1HP4+WXEBFYmmAddNpXK5
 6pq+b/IiKErNKyQzZDBudQJ1yqYNQQZuRa+gjCpMO7o2ywKKQ2GOKp+K4125pE/I7+0SsKy0S3uPZ
 DTW+S/08TfeCbBLKJnAljdD98U7D1Iahz3KtQ7yBwdk6tCQ0vqYx66fz/AqhHRWnGmcdXt2oUUcTo
 RyQ0QElN9hekgoiwL6Zq44HPlkgM84H+SekUOgzAqMw5suVMTONFC9gdlBBPMHtr1mmqWoYaLaHnX
 6vVQmEJw==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lizTN-00Efke-0O
 for linux-i3c@lists.infradead.org; Tue, 18 May 2021 13:09:22 +0000
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fkx9D2CGLzlg38;
 Tue, 18 May 2021 21:06:56 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 21:09:11 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 18 May
 2021 21:09:10 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>
CC: <alexandre.belloni@bootlin.com>
Subject: [PATCH -next] i3c: master: svc: drop free_irq of devm_request_irq
 allocated irq
Date: Tue, 18 May 2021 21:11:27 +0800
Message-ID: <20210518131127.1308550-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_060921_233064_EB16FF05 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 25 May 2021 02:37:15 -0700
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

irq allocated with devm_request_irq should not be freed using
free_irq, because doing so causes a dangling pointer, and a
subsequent double free.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 1f6ba4221817..761c9c468357 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1448,7 +1448,7 @@ static int svc_i3c_master_remove(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	free_irq(master->irq, master);
+	devm_free_irq(&pdev->dev, master->irq, master);
 	clk_disable_unprepare(master->pclk);
 	clk_disable_unprepare(master->fclk);
 	clk_disable_unprepare(master->sclk);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
