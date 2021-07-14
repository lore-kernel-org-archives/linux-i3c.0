Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA22CC25AEF
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F9F60F26
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76F9F60F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZ6OZM1rRfkCUgN+pxZhJ0atX6dykdEKtLpzyJ5MgDY=; b=o8w//kcHcyCxm+
	LnOeSfM8ubt2jjIo7TWYreUVnKvRODjSowJNhqkuAZP6AiGfm7vhTK6hrWB7ETVpdT/lzgr4rSwrM
	PXR0FVzCUB7jK37tpAVdyeFllPZmC6FU5YrWOBAl7kcp9fjyfoBf9btZHZHA12eNwj6jRtu5zfAxd
	7Jc9/alCf/JZ48PeKLIkXxm4W/SU5o6RDnfOjbPe5eb2Q7VUrgonPDASGa1e/v/EhKsiR4WkBKBix
	2btjOE9mURh5SR9jQ2tp0YSyGlxrmq6NNANvkCxIlwILqNp5MzyiwPi3fzD5bJodVpHvSIXPi3BrH
	3wiKYDt8WItR0xVVL1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YN2-00A8dh-L4; Fri, 30 Jul 2021 19:40:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3kln-00EdyH-2L
 for linux-i3c@lists.infradead.org; Wed, 14 Jul 2021 19:42:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E052E613ED;
 Wed, 14 Jul 2021 19:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291730;
 bh=6+Wlq+NCWafYBSgguk87hl6FjEhjLQXdS/RTcB7OM0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OEdaPhG53U6TiX/UgUiho1GdHUWijDEU68J1f1Gs6CqZEl+4L2kmQWVoGEj4jd1GG
 /k8L//u0B8JtUob0ZSHbuvsxSWgWXbkPIM5S8oXTyIklwTpeIQ6AD/9rL+jGLQEq1+
 leJOq0U6NikoPH6Fd3nJ4cAt7RJplwrgr62Px7NoyonNSIBd3Ef8gwLTeZCSs0yMJH
 1nWNUDDOnEdOFARUeZ88PcVF4zsU9+4rpiwBEWZab2dpjy8gUcRmuuM1yI6GxeZ40Y
 F9WrqQfQKVQ85n3NqmDc4Ixl4LW1VAOYi3XTNMMY3SxwJhahMIb0KEkMX15nYjpkqr
 B7nrZE9P+TTkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yang Yingliang <yangyingliang@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sasha Levin <sashal@kernel.org>, linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 066/102] i3c: master: svc: drop free_irq of
 devm_request_irq allocated irq
Date: Wed, 14 Jul 2021 15:39:59 -0400
Message-Id: <20210714194036.53141-66-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194036.53141-1-sashal@kernel.org>
References: <20210714194036.53141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_124211_209071_88C8EE0E 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 30 Jul 2021 12:40:20 -0700
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

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit 59a61e69c4252b4e8ecd15e752b0d2337f0121b7 ]

irq allocated with devm_request_irq() will be freed in devm_irq_release(),
using free_irq() in ->remove() will causes a dangling pointer, and a
subsequent double free. So remove the free_irq() in svc_i3c_master_remove().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Link: https://lore.kernel.org/r/20210602084935.3977636-1-yangyingliang@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/svc-i3c-master.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 8d990696676e..014936120f4a 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1449,7 +1449,6 @@ static int svc_i3c_master_remove(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	free_irq(master->irq, master);
 	clk_disable_unprepare(master->pclk);
 	clk_disable_unprepare(master->fclk);
 	clk_disable_unprepare(master->sclk);
-- 
2.30.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
