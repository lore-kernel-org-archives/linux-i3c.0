Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6BBC52D6F
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Aug 2024 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ToBVNJneBxobJQwhJAsmUUDvdTS47qSmzaGjLPo3wM=; b=Dm0PmYGErjLLbA
	D22kOdqfGOR5uoU2rq2FVe6iSdp8dWY6ZVLJpgFeylot4EKlbMMrMA+HSFe/MP16FUH0NDgYahrYg
	VDdbq7hc/w6xokd/rwYB4Bv9mhcl5x57iDnaHqeVa3jM87FeRE2qoQ9t38XrxwtL44YaL0vR7cyga
	KB/ghqvEl+ZC26DWs4Uv9uTPnFTpKxZ17gvBo6XQjGVwCzNmjsQJYHc2+odenyHrk5UBo61xT9a3B
	EjXCpQZaOkomSBRBlWcXiAq9wx740Ad8k6a1nIumGH4THEFkAahOEO0vPu4KCAuVM+go7lT+CjoR3
	v8udw1y0nKMwU1ZzFTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sis8n-0000000AVsy-0kOc;
	Tue, 27 Aug 2024 09:05:29 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZ8u-00000007NT3-1Loj
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 12:48:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wsr6g3pk6z14J95;
	Mon, 26 Aug 2024 20:47:23 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 30DBE14037E;
	Mon, 26 Aug 2024 20:48:09 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 20:48:08 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <pgaj@cadence.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH -next] i3c: master: cdns: fix module autoloading
Date: Mon, 26 Aug 2024 12:39:57 +0000
Message-ID: <20240826123957.379212-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500020.china.huawei.com (7.185.36.49)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_054820_649954_B8A05E0D 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 27 Aug 2024 02:05:28 -0700
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

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index c1627f3552ce..ee555255f1a2 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1562,6 +1562,7 @@ static const struct of_device_id cdns_i3c_master_of_ids[] = {
 	{ .compatible = "cdns,i3c-master", .data = &cdns_i3c_devdata },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, cdns_i3c_master_of_ids);
 
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
