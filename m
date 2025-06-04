Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF21C5B543
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Cc3ErctdpMX6RXlzGzMGngtCiBz5vTyuv0Ld+YO1Ys=; b=Dsb/6iJvyHnZjH
	MMmZE7RkMU3U37OUlkSM46767cNWdGyy8CT7Bxcu5Brj/huhyyW87G57MSnZRXjsjJBdVwxU3ls/1
	AU0mAJFXN79syVoixcnjsAPor7TF2jDig33MnYIR6xUiIq26WIcX5WyW/Df5kZdiADNniZT/y7vdk
	cYVuqLvzt5lY29BwR6bs8h0ECUJ7AMAUMGzz+xHMcsIw5wpoYiBA54ehNEyVBjv4BOS2M8aX2AI6u
	kQWBEmW44doeSSgVV7+B7LmmB7NtYXJUJbxW6n62XQGnVxiWgmCaHYR6lEhPqCZJSLHgSvqrCa9zX
	ETLdvZVbMgKn5beWPvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCt-0000000D79c-1LY9;
	Wed, 04 Jun 2025 10:18:51 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCo-0000000D73S-3gsC
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 10:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=98RJHoiyxvmeeQ3yIfjtKRG7M+AUIpUczEGrzWypOxM=; b=e/2zO8
	EBjH1fiiKlVH0iaJUYBzpkx7+ijoer2/N7+j5iZ49S5oy22EeoT8KvTWK4FsHkq9
	RhoAfkE094Y3/Y13f6MHX5Ym5lcQUtx4apsusZKMU3igFOtB5CAAlF9op62EEJod
	V/aDkrkkx4MZSW00i6xUPKJOBEXiEtNHC67xOKdXWayS2NDprkpz35sL7qAkV42S
	A1m58FRgKFribpsF6IBZTLyJz5ydDvVRgDCTY/l5RoGscdBpsgLlSrFhyZeI1l67
	a6pKZGaMc/lHPzjIJ27A8HLxCzaPAt2+mZ8ytGSy4LGq4hMMm7DC612iRJtQ/yaM
	RRs2xs7xnRV4tGDA==
Received: (qmail 629220 invoked from network); 4 Jun 2025 12:18:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2025 12:18:37 +0200
X-UD-Smtp-Session: l3s3148p1@u+X7Ubw2kqogAwDPXx36AJSQ3b6GkO36
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 2/4] i3c: master: cdns: use adapter timeout value for I2C transfers
Date: Wed,  4 Jun 2025 12:18:28 +0200
Message-ID: <20250604101831.56585-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_031847_213719_EC4B600A 
X-CRM114-Status: GOOD (  10.03  )
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
 drivers/i3c/master/i3c-master-cdns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654..562e49e930b4 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -863,7 +863,7 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 	cdns_i3c_master_queue_xfer(master, xfer);
-	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
+	if (!wait_for_completion_timeout(&xfer->comp, m->i2c.timeout))
 		cdns_i3c_master_unqueue_xfer(master, xfer);
 
 	ret = xfer->ret;
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
