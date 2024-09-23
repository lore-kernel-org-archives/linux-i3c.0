Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F34CF9C71
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Sep 2024 21:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RsM6w5ZPHVN47BOh2imktnibKp97kWxSQXlRPEZDa8E=; b=jti8EBR9duNHEb
	h/AD/H8dq82lsYK6RCgFi6KT1ZkdXxNavN08z3Yz2qrjNCEy2vOmRe3J2q+EPl1shiD7+qgROW93o
	It5DM8kicxQYyfssZ6l3jkfKZ8hu59YJJW5B2rO1IJyj/1aq+fQm5PaSIcnu/ePgZnvnVMGYdyb7z
	8Pk2gRzUx0KjoSBtiIvbGyWK7pzpQ/wdjYfA0qyaHixU0NdZZEBTLTByS1FuNgXUGP/5dEHJGmGru
	d+x/+7y5M15aSzbd+betoERitg2VVNeJ2eoV8wUV7HOwR5td1XzEhUxV/2/h1Odu7JKcPsr3A4ARn
	uMflhFz2tT4+30cVHLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssql9-00000000Wes-1teo;
	Mon, 23 Sep 2024 21:38:19 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssZnY-0000000GDlN-1AOd
	for linux-i3c@lists.infradead.org;
	Mon, 23 Sep 2024 03:31:42 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XBpPd0xYvzfcTp;
	Mon, 23 Sep 2024 11:29:09 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 35605180113;
	Mon, 23 Sep 2024 11:31:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Sep
 2024 11:31:24 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <miquel.raynal@bootlin.com>, <conor.culhane@silvaco.com>,
	<alexandre.belloni@bootlin.com>, <jun.li@nxp.com>, <xiaoning.wang@nxp.com>,
	<linux-i3c@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] i3c: master: svc: Fix pm_runtime_set_suspended() with runtime pm enabled
Date: Mon, 23 Sep 2024 11:41:22 +0800
Message-ID: <20240923034122.3007984-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_203140_535069_3FE5D5F5 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 23 Sep 2024 14:38:16 -0700
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

It is not valid to call pm_runtime_set_suspended() for devices
with runtime PM enabled because it returns -EAGAIN if it is enabled
already and working. So, call pm_runtime_disable() before to fix it.

Fixes: 05be23ef78f7 ("i3c: master: svc: add runtime pm support")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 0a68fd1b81d4..575b337a5052 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1762,8 +1762,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 rpm_disable:
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
 
 err_disable_clks:
 	svc_i3c_master_unprepare_clks(master);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
