Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6ADC5B555
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 10:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWRIjoo8aD4AjGVKtzF4QRjn0xWdWPNHhSzQlbkM3No=; b=UOW8DB9Tz/lZKH
	QbV9CGNNfP7ag5nD8QFx3r7Q1Lhw60hnF/OBSVp5MqvzM6jgI9KSf32Ir8/7JET0ozg3pfRp2uWcL
	rmgE6NmAqvhlApWlyaSKFCL6kz53/Nw4TnkHLQ34jsEGyg1OsyDdEGKUp7u9eXt9YmeIPq0+oxRhG
	lYEjqNe18DpX1/9+5AwwyiRVAGeRqqzv8HHunp5DENwr4ebtPcBNjbVmH8vU7DZf3nkqjNdoIa7/F
	HyfbgyIo37MdGstJqE+EJzzOp6gOcfhkdCOzOuWxAqt4dddILi7sa5BW46qPhYDt7CyFEocIaQQ3D
	g5nh4xx6+/061CRjzxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCq-0000000D789-3AVr;
	Wed, 04 Jun 2025 10:18:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCl-0000000D73k-2R5O
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 10:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=aqqVqhjIn/qLsrw7WRb3mCG8m2QvWy6ovxJwUgCCw/g=; b=eKuqdk
	pLVDYlZRqGowZbRtqeUMVVpd/YvikmqaWS2zJIo4ymnRiR6N5GbmNxXw1B0m4Ywd
	litNkMzQe7IrbQiN5T618I9EujZ/ZN41r4kmRVttpIEEWBR48wuADCAP1Su9n/bw
	UGDKhagz7j/KbitjVemAVSL1El7cg6y/TkesjzggqPvvrFFNp/Uc4W0XAy/WNGQY
	KKjlafw74ONgRCTB6jyzv977ikkV2AGDSWeOLU7720fdfkPcKgFbYKZvU9Hux1uN
	OUbw5Qq5K5FMGnuuOekxix4IlkvreEhJ454bJDuZwovLpDwFhqZG6S+PvtZfaZxq
	Izc/vmL5CYz1JjiQ==
Received: (qmail 629272 invoked from network); 4 Jun 2025 12:18:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2025 12:18:39 +0200
X-UD-Smtp-Session: l3s3148p1@5rcTUrw2nqogAwDPXx36AJSQ3b6GkO36
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	imx@lists.linux.dev
Subject: [PATCH 4/4] i3c: master: svc: use adapter timeout value for I2C transfers
Date: Wed,  4 Jun 2025 12:18:30 +0200
Message-ID: <20250604101831.56585-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_031844_496385_EF3C5664 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

I2C adapters have their own timeout value which can be changed by
userspace if desired. Use it for I2C transfers. The default is 1Hz, so
the default behaviour is unchanged.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7e1a7cb94b43..6d0eea80ea34 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1708,7 +1708,7 @@ static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 
 	mutex_lock(&master->lock);
 	svc_i3c_master_enqueue_xfer(master, xfer);
-	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
+	if (!wait_for_completion_timeout(&xfer->comp, m->i2c.timeout))
 		svc_i3c_master_dequeue_xfer(master, xfer);
 	mutex_unlock(&master->lock);
 
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
