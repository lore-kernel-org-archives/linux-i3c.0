Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEE4CEFC2C
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Oct 2024 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxJ6dAZUB2So35ZjePQp1tPezkmwCSqTSz0BR0lZERk=; b=GVv/0K9yTuv1/M
	eyLTnyGFSCTEuCbyzjjLIToiFeTpeYKHftX8qme+hrr4rL29VOucTGHt2Qc4HI1trjwl1RZMNAoK8
	Qjy/YwXAzk2LncEQix+Fn8C7O9AFrmE+59SH8wWUopMUw9kpRVR10WZyqWpFOHNVFywiTC8qF4Fh/
	2bmmV0T/PJJI6w9gaz9VK4Zzfqy6CuvGKFCT/qObHgzvFzt2AL/yIkbXKJSaySdQpWvJiiCmlhxqT
	Od2eJWQ4rAnMdgmTRmYtq1BOMKE1tEVWTIS/aCkjwX0HzOc88KH+KCQVDrgtKTkBryNHoL1c/EmVG
	zCcvC9Uto3GDB9MN+Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syCW6-00000006PnL-3GGQ;
	Tue, 08 Oct 2024 15:52:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swmx3-0000000DgAi-3N24
	for linux-i3c@lists.infradead.org;
	Fri, 04 Oct 2024 18:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1052A44CC3;
	Fri,  4 Oct 2024 18:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2BFC4CEC6;
	Fri,  4 Oct 2024 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066172;
	bh=NpFwHIc43h0KX6FekzSz+SQmAEBtDGBPknm+Mi89JxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QfB1OTB+N44cT557qLQK4qIq77EhvjchVQXitKBC+8Wk8fPLeu2MMynwJcPHuua6n
	 Q3A1Ysu9ENjadUwTM4COxSUzlpv+8qaxlAJ1DBWZcfLqntvanjeFvTVcfE07tsPkrr
	 CFmxQljAvRETCeWfpw4ctyrKNdGJMrIxPQ0EpxBFD4iSfKADYWzvbUd3vubl+005AG
	 7Vp/83HTMBz1iFJ+Ndc0LkHWLbDunGxX7GLfm8TFt/NVcXe5CA4EbRigR/ZgynKsMK
	 Sg0plikMoqEiy2yBSFqjlOIXkML43gduLYUnYFW2C7KTfTo4w4F4i3sTeRc6prXlhB
	 zLMueP3HUxt2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kaixin Wang <kxwang23@m.fudan.edu.cn>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	pgaj@cadence.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 29/70] i3c: master: cdns: Fix use after free vulnerability in cdns_i3c_master Driver Due to Race Condition
Date: Fri,  4 Oct 2024 14:20:27 -0400
Message-ID: <20241004182200.3670903-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182200.3670903-1-sashal@kernel.org>
References: <20241004182200.3670903-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_112253_915312_3C3FF9C5 
X-CRM114-Status: GOOD (  10.55  )
X-Mailman-Approved-At: Tue, 08 Oct 2024 08:52:51 -0700
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

From: Kaixin Wang <kxwang23@m.fudan.edu.cn>

[ Upstream commit 609366e7a06d035990df78f1562291c3bf0d4a12 ]

In the cdns_i3c_master_probe function, &master->hj_work is bound with
cdns_i3c_master_hj. And cdns_i3c_master_interrupt can call
cnds_i3c_master_demux_ibis function to start the work.

If we remove the module which will call cdns_i3c_master_remove to
make cleanup, it will free master->base through i3c_master_unregister
while the work mentioned above will be used. The sequence of operations
that may lead to a UAF bug is as follows:

CPU0                                      CPU1

                                     | cdns_i3c_master_hj
cdns_i3c_master_remove               |
i3c_master_unregister(&master->base) |
device_unregister(&master->dev)      |
device_release                       |
//free master->base                  |
                                     | i3c_master_do_daa(&master->base)
                                     | //use master->base

Fix it by ensuring that the work is canceled before proceeding with
the cleanup in cdns_i3c_master_remove.

Signed-off-by: Kaixin Wang <kxwang23@m.fudan.edu.cn>
Link: https://lore.kernel.org/r/20240911153544.848398-1-kxwang23@m.fudan.edu.cn
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/i3c-master-cdns.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index c1627f3552ce3..c2d26beb3da2b 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1666,6 +1666,7 @@ static void cdns_i3c_master_remove(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master = platform_get_drvdata(pdev);
 
+	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
 
 	clk_disable_unprepare(master->sysclk);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
