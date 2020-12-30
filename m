Return-Path: <SRS0=dXGV=GD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9A5C433E6
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Dec 2020 17:38:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF83F222BB
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Dec 2020 17:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF83F222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UYcjUXeXGq80yHCWtlb5B8rh79g+ftDo9T41jb/xXSM=; b=pM7DaYH9ItvtXwvmEv2FOZXO0
	b7MduyI5Zb7KBKN+HjMsVMTMIE4ZGDrQXpOwwPS7nQ7yQVL9HKMMqT9w01U31oE4N8CMXkxq8eqG6
	jx8jzFy4blHiyGV3K5t14euJZBOZru2URgPKt+0KenqSSZV5V56IiNEHtdPWLDg3uY3ytLTtKBJeu
	n9y1fpwZtBw2YuMGYM4Be3x14+9w9IU5Nn6l++f2BfqPlJoG8EnXlrqc/KYoKhj0SG8o0EMq1KvTL
	Yf8u9IRq8iFrK+yAI5BCvvf/gOOq1cRXY7/FlqAimhxMgoO096k2VNCwry+KXlKfzEfXbZiOyj7Zo
	Uhp69fYtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv1te-0005gI-Fy; Thu, 31 Dec 2020 17:37:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kub8P-000863-2o
 for linux-i3c@lists.infradead.org; Wed, 30 Dec 2020 13:03:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE64A2226A;
 Wed, 30 Dec 2020 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609333404;
 bh=28q/yNFrBweLKIPH/r6/kqkxmdVWeYWc9WRZ5w203jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QMvuKys6WUK/XCVZkuzXhDTv39ebHgNCK6899O6BY2vGDxWMNqQM61ZKq5aNghdqc
 fUPD+64CdbGfsCFsp70R+e5YphmFnF8zceq8tbgF0glHDR92X1nCalbqup4WIVHmyI
 dRGqRoRYrHTh3lPhKegKPiHCKXrBPWlhSc2IAVJ1x+7rbFzp37WTC6J7fYrlbfrig1
 UM/uKeNkPFzZMmDaqyeVcdB58T2nQrbXdudN6BKHuogdZAW4dUx1EQqMNHqkODOKK/
 xuAWzhcUf+P0iLqdZ+CeQHq0BTAEMOELawj4JiF2w1+dCSYDtcAxx+LXjPI+Y5MApL
 qj5wo9P6rqs2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 07/31] i3c master: fix missing
 destroy_workqueue() on error in i3c_master_register
Date: Wed, 30 Dec 2020 08:02:49 -0500
Message-Id: <20201230130314.3636961-7-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201230130314.3636961-1-sashal@kernel.org>
References: <20201230130314.3636961-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_080325_238191_6ED57CEE 
X-CRM114-Status: GOOD (  10.09  )
X-Mailman-Approved-At: Thu, 31 Dec 2020 12:37:56 -0500
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
Cc: Sasha Levin <sashal@kernel.org>, linux-i3c@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Qinglang Miao <miaoqinglang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Qinglang Miao <miaoqinglang@huawei.com>

[ Upstream commit 59165d16c699182b86b5c65181013f1fd88feb62 ]

Add the missing destroy_workqueue() before return from
i3c_master_register in the error handling case.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Link: https://lore.kernel.org/linux-i3c/20201028091543.136167-1-miaoqinglang@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 1c6b78ad5ade4..b61bf53ec07af 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2537,7 +2537,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	ret = i3c_master_bus_init(master);
 	if (ret)
-		goto err_put_dev;
+		goto err_destroy_wq;
 
 	ret = device_add(&master->dev);
 	if (ret)
@@ -2568,6 +2568,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 err_cleanup_bus:
 	i3c_master_bus_cleanup(master);
 
+err_destroy_wq:
+	destroy_workqueue(master->wq);
+
 err_put_dev:
 	put_device(&master->dev);
 
-- 
2.27.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
