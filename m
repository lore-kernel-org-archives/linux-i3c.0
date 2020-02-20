Return-Path: <SRS0=uEpj=4I=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AF2C11D10
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB2EA24673
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bjHZtHqh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB2EA24673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r4pWOkF1Wgb0J31iqnN8HUmNjVfA1Yo9kJSuJl2k50=; b=bjHZtHqhzVfOH4
	peBfFxa2A8vkje7E+QRQFkmJO1R12gRR1rv0oUkiTY/QFr+G6BDE5SmG7HTXkMlh5gUWf/uGt6VyX
	ftT8yO/YjaevRLYp/fzZLzu5mcub59MJ5rhtMFO4fe0EB4bXQNaZ8ws9y1D/Yp0lYwJFfXuwowyLB
	/FYaMiwLj4E0rtcvtjE3LEOfPKIipPQfpy8DuycSS1QF7Xv6VJ7exVmM+ADtUnWsBTkCIcCJxLcT+
	Ns2+/w7g69AMgChRiay5OQrfPD9Elk7/bnMQddeDR0PIlg5+t2aS5rCZX2OfcwXnHF8eAQjVJoGSO
	2QWc4wP5+K9H4epVkZZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4pan-0007rT-Rq; Thu, 20 Feb 2020 17:26:29 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4paG-0007F2-8E
 for linux-i3c@lists.infradead.org; Thu, 20 Feb 2020 17:26:01 +0000
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
 by pokefinder.org (Postfix) with ESMTPSA id 80B0D2C1EBB;
 Thu, 20 Feb 2020 18:25:51 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH 2/7] i2c: use DEFINE for the dummy driver name
Date: Thu, 20 Feb 2020 18:23:58 +0100
Message-Id: <20200220172403.26062-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_092556_542246_65CF66B1 
X-CRM114-Status: GOOD (  10.97  )
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran@bingham.xyz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca@lucaceresoli.net>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

We use it in multiple places, so make sure it is consistent whenever we
need to change it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 8 ++++----
 drivers/i2c/i2c-core.h      | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8f46d1bb8c62..8df2fa10c48a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -853,7 +853,7 @@ EXPORT_SYMBOL_GPL(i2c_unregister_device);
 
 
 static const struct i2c_device_id dummy_id[] = {
-	{ "dummy", 0 },
+	{ I2C_DUMMY_DRV_NAME, 0 },
 	{ },
 };
 
@@ -869,7 +869,7 @@ static int dummy_remove(struct i2c_client *client)
 }
 
 static struct i2c_driver dummy_driver = {
-	.driver.name	= "dummy",
+	.driver.name	= I2C_DUMMY_DRV_NAME,
 	.probe		= dummy_probe,
 	.remove		= dummy_remove,
 	.id_table	= dummy_id,
@@ -896,7 +896,7 @@ static struct i2c_driver dummy_driver = {
 struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
 {
 	struct i2c_board_info info = {
-		I2C_BOARD_INFO("dummy", address),
+		I2C_BOARD_INFO(I2C_DUMMY_DRV_NAME, address),
 	};
 
 	return i2c_new_client_device(adapter, &info);
@@ -1487,7 +1487,7 @@ static void i2c_do_del_adapter(struct i2c_driver *driver,
 static int __unregister_client(struct device *dev, void *dummy)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
-	if (client && strcmp(client->name, "dummy"))
+	if (client && strcmp(client->name, I2C_DUMMY_DRV_NAME))
 		i2c_unregister_device(client);
 	return 0;
 }
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 517d98be68d2..fb89fabf84d3 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -22,6 +22,8 @@ int i2c_check_7bit_addr_validity_strict(unsigned short addr);
 int i2c_dev_irq_from_resources(const struct resource *resources,
 			       unsigned int num_resources);
 
+#define I2C_DUMMY_DRV_NAME "dummy"
+
 /*
  * We only allow atomic transfers for very late communication, e.g. to send
  * the powerdown command to a PMIC. Atomic transfers are a corner case and not
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
