Return-Path: <SRS0=52QZ=PG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6885BC43387
	for <linux-i3c@archiver.kernel.org>; Sat, 29 Dec 2018 09:17:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1255B20643
	for <linux-i3c@archiver.kernel.org>; Sat, 29 Dec 2018 09:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tqBCRqpR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1255B20643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ocpDex4gvto7opkam0+ODz/s6Sul65V/F5UJl+vo9pg=; b=tqBCRqpR46y9Su
	JObZ7NmDllCGOq4DOaa2XqoHxZqaBBMqwPsU/jEim3f2sCdvcEeQeJPJ63pKAfwzUlp1XVyFS59Ae
	HbbKzVAdNCBRgzJ7Nd36p8gBTG/0Gz8cK0ca/MMydlXhiFJMKqfYQwUy2bxqiYqB1ylJiGIeXGwHe
	1oEP/iHap+MrRQWJcW/kY/eCdCAxL5hUXi2Bza/OSmWAtsKmg0fqO8Uv/0Opm5f/iXQRwssc03cGL
	fm9A+6OMHPEsOKDwQj3ut5C6UmvDgWS6/jmSam4IfSwyZ0C8Uc8/joqg/sNGHUBA4wkqflRP3RcTg
	PIGoR65jIxh20BQFlaiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gdAk5-0005Cy-Cx; Sat, 29 Dec 2018 09:17:13 +0000
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gdANw-0006Tp-1X
 for linux-i3c@lists.infradead.org; Sat, 29 Dec 2018 08:54:22 +0000
Received: from localhost.localdomain ([90.126.241.217]) by mwinf5d85 with ME
 id Hku01z0024i89ZE03ku0uR; Sat, 29 Dec 2018 09:54:06 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Dec 2018 09:54:06 +0100
X-ME-IP: 90.126.241.217
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: bbrezillon@kernel.org, pgaj@cadence.com, yuehaibing@huawei.com,
 gregkh@linuxfoundation.org, arnd@arndb.de
Subject: [PATCH] i3c: master: Fix an error checking typo in
 'cdns_i3c_master_probe()'
Date: Sat, 29 Dec 2018 01:05:40 +0100
Message-Id: <20181229000540.25283-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181229_005420_369076_3E441397 
X-CRM114-Status: GOOD (  14.82  )
X-Mailman-Approved-At: Sat, 29 Dec 2018 01:17:12 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-i3c@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Fix a cut'n'paste typo.
Checking 'master->sysclk' is expected here.

Fixes: 603f2bee2c54 ("i3c: master: Add driver for Cadence IP")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i3c/master/i3c-master-cdns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index bbd79b8b1a80..8889a4fdb454 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1556,8 +1556,8 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 		return PTR_ERR(master->pclk);
 
 	master->sysclk = devm_clk_get(&pdev->dev, "sysclk");
-	if (IS_ERR(master->pclk))
-		return PTR_ERR(master->pclk);
+	if (IS_ERR(master->sysclk))
+		return PTR_ERR(master->sysclk);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.19.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
