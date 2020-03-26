Return-Path: <SRS0=1xoH=5L=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DABC43331
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Mar 2020 21:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1E402073E
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Mar 2020 21:10:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MwFGrJpR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1E402073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMKVXX46sa7y2q283vt8fBVA98DV0G73w0qprPkjh9Q=; b=MwFGrJpRHpGaTb
	XlR6M1aBPmsmm6wOGd8siEfOhZF16x2ovt/Zr8JY2MfVyq9HA7lIG40fM3N96mMa3kFOs5RXHFgnh
	rd08TMSAVeAh44Ha+azzbXlQxm3pHYddHi3XL+usW3HPAoOm/uxMsh45A2Aje8Qv8kbDrySmVz6ZL
	ev7KXOhcau8qPmwVzcoE52nbQ4S+ByZv21IIlXzEwE5yziUkWoB1w8twhIfUloaU5F8mTG00TnOji
	bVnfhNxFywFZ3ng+0A1VCbGAFAVD1uglYs+fya0RqOrj4Jgkz9uu2/XI2+8CzY9X3Qk3UIXjSmEN1
	ijHXKtw9WnrviUKWJl1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHZlT-0000jB-3j; Thu, 26 Mar 2020 21:10:11 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHZlQ-0008Fx-ML
 for linux-i3c@lists.infradead.org; Thu, 26 Mar 2020 21:10:10 +0000
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
 by pokefinder.org (Postfix) with ESMTPSA id AAAC42C1F90;
 Thu, 26 Mar 2020 22:10:03 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 1/1] i3c: convert to use i2c_new_client_device()
Date: Thu, 26 Mar 2020 22:10:02 +0100
Message-Id: <20200326211002.13241-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211002.13241-1-wsa+renesas@sang-engineering.com>
References: <20200326211002.13241-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_141008_879699_E01C1E3D 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Move away from the deprecated API.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 925e1ed18a2a..d79cd6d54b3a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2160,7 +2160,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	 * correctly even if one or more i2c devices are not registered.
 	 */
 	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
-		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
+		i2cdev->dev = i2c_new_client_device(adap, &i2cdev->boardinfo->base);
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
