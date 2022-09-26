Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A25C433FE
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Oct 2022 02:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzt5XHBhU9V2eLC7PlqkTY2jkv/ziyxKmLDCiUDZZ0E=; b=wrUpsVCtz7SB6+
	+GBP9MXrSd/LSnFYctWccHltE/2LkriUpjJeIgSjyDg4bIZZGQAFnewLbdKxwoE0vzNfPJKqqCwgn
	nSW0jatm8LhQ+TBrWzuBuW/K20SYAvaE+zL5bXeEXU68G4DWCUgxF4cDfE5cisFAmFz67iOz19ViW
	tPiNn5+uxXwMHPYzgLWHfW4qKXvBn5IHW3giPIdmZ9jNJXrrBer212l5j/nop0vPFGbux/IEANl92
	JtiMozuGWmPBy5kbZqBi9BhkJgiEXhEl5zpqPsJRnMf03G/bQh6ey771UtdW+T+p4CQo+adZ15mmN
	fgboyquzdkXBj9RTIcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBXR-003YLy-Pk; Mon, 03 Oct 2022 02:50:37 +0000
Received: from twspam01.aspeedtech.com ([211.20.114.71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclhr-004JZj-3c
	for linux-i3c@lists.infradead.org; Mon, 26 Sep 2022 10:51:25 +0000
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 28QATomF057044;
	Mon, 26 Sep 2022 18:29:50 +0800 (GMT-8)
	(envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Sep
 2022 18:50:57 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 2/2] i3c: master: Remove the wrong place of reattach.
Date: Mon, 26 Sep 2022 18:51:45 +0800
Message-ID: <20220926105145.8145-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926105145.8145-1-billy_tsai@aspeedtech.com>
References: <20220926105145.8145-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 28QATomF057044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_035123_494469_0A39B884 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 02 Oct 2022 19:50:36 -0700
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

The reattach should be used when an I3C device has its address changed.
But the modified place in this patch doesn't have the address changed of
the newdev. This wrong reattach will reserve the same address slot twice
and return unexpected -EBUSY when the bus find the duplicate device with
diffent dynamic address.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 6349ce0ce835..351c81a929a6 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1911,10 +1911,6 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 		i3c_master_free_i3c_dev(olddev);
 	}
 
-	ret = i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
-	if (ret)
-		goto err_detach_dev;
-
 	/*
 	 * Depending on our previous state, the expected dynamic address might
 	 * differ:
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
