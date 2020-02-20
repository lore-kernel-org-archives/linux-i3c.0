Return-Path: <SRS0=uEpj=4I=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E9AC11D0C
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C62924673
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itWkpneK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C62924673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNODXUQNxhVMyNHyHzIkazTPvKuMu3+uUO1vp/+rLkg=; b=itWkpneKYGmk8T
	o1jMo2qeL+4P98cHa0zjNLumRqtx3QneCXUOK43CDRZkXtk1zfn6EWKlF6KUgA3HQaO3XXeqbcTcZ
	pbHbAWVIO5HnlrCNZ5kEOpE8qAk0f53lGbM31PzsA5S9i6Hol+FSXHp7WrJB6L4/5CVx5wwNG0bVk
	PAk4CpguhjOgucGwswX3hyWBq9GaYeP/QGf2LuaPqCx8Zj3/Oe9ty1GassWSgAzEdKI3hYVeyuFlp
	wVhfdWLCnpdLiN5z+i3P9RrY/wkiHlvOr/tz8u8szze5iRzhjgYc8bjTaMRU+AY/+V8Sc7piK1LOt
	UxJpBUcyuIDVqvI3nxGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4pan-0007qx-6A; Thu, 20 Feb 2020 17:26:29 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4paK-0007NX-4x
 for linux-i3c@lists.infradead.org; Thu, 20 Feb 2020 17:26:02 +0000
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
 by pokefinder.org (Postfix) with ESMTPSA id 4E2892C1EC1;
 Thu, 20 Feb 2020 18:25:53 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH 5/7] i2c: of: error message unification
Date: Thu, 20 Feb 2020 18:24:01 +0100
Message-Id: <20200220172403.26062-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_092600_372549_1E18866D 
X-CRM114-Status: GOOD (  10.13  )
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

- don't prefix the device if %pOF is provided. That information is
  enough.
- move the prefix to pr_fmt
- change prefix from "of_i2c" to "i2c_of" because the code was moved
  out of the of-domain long ago

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-of.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 710704cd583e..74b9f3fbb5ef 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -8,6 +8,8 @@
  * Copyright (C) 2013, 2018 Wolfram Sang <wsa@the-dreams.de>
  */
 
+#define pr_fmt(fmt) "i2c_of: " fmt
+
 #include <dt-bindings/i2c/i2c.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -28,7 +30,7 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
 
 	ret = of_property_read_u32(node, "reg", &addr);
 	if (ret) {
-		pr_err("of_i2c: invalid reg on %pOF\n", node);
+		pr_err("invalid reg on %pOF\n", node);
 		return ret;
 	}
 
@@ -66,7 +68,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 	struct i2c_board_info info;
 	int ret;
 
-	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
+	pr_debug("register %pOF\n", node);
 
 	ret = of_i2c_get_board_info(node, &info);
 	if (ret)
@@ -74,7 +76,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 
 	client = i2c_new_client_device(adap, &info);
 	if (IS_ERR(client))
-		dev_err(&adap->dev, "of_i2c: Failure registering %pOF\n", node);
+		pr_err("failure registering %pOF\n", node);
 
 	return client;
 }
@@ -88,7 +90,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	if (!adap->dev.of_node)
 		return;
 
-	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
+	dev_dbg(&adap->dev, "walking child nodes\n");
 
 	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
 	if (!bus)
@@ -100,9 +102,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 
 		client = of_i2c_register_device(adap, node);
 		if (IS_ERR(client)) {
-			dev_err(&adap->dev,
-				 "Failed to create I2C device for %pOF\n",
-				 node);
+			pr_err("failed to create I2C device for %pOF\n", node);
 			of_node_clear_flag(node, OF_POPULATED);
 		}
 	}
@@ -243,8 +243,7 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
-			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
-				 rd->dn);
+			pr_err("failed to create client for '%pOF'\n", rd->dn);
 			put_device(&adap->dev);
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(PTR_ERR(client));
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
