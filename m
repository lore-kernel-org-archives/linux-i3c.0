Return-Path: <SRS0=88uS=5D=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3122C5ACDD
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2020 15:01:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 826092077A
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2020 15:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PCvknFLX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 826092077A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVn/I8g1Kn+T5cBAhg2DKweqaibGu/8uGCu6q1r2Kio=; b=PCvknFLXXHiuSo
	xx9wLED43xT73d3uZmLSWL+kMbQ2CVDvGwxv+tYfYADtFLfeLNOBr3DJpgA0r5zlb7icJWtWSLnjz
	ferM/rhXOez1mW52ImuhdqPTlVaR6GP1M4Zs5+Gcz60NK7PWCCABxTCJw17IzyNp1wM/ZI9M6Pc7S
	R6o5/QNskzDpdsCA4BQCcDMR2KRMfLA8wRFahKqkQJQCpjTnAEuXXXJe4DdwC0UnSs9iXOuDypmxG
	vtXzN8f8+vmWSQZI2+Xtu00g3h+zzrzCb+4pNFw6tsIMDhqs9wsGkpDkKdwtwEeE9lNtp0g+3LhZX
	qk1h/e5yTQFxFxAPet6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEaCE-0001VG-MA; Wed, 18 Mar 2020 15:01:26 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEaBx-0000ZM-Ma
 for linux-i3c@lists.infradead.org; Wed, 18 Mar 2020 15:01:12 +0000
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
 by pokefinder.org (Postfix) with ESMTPSA id 960812C2E7F;
 Wed, 18 Mar 2020 16:01:06 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH v2 4/6] i2c: of: error message unification
Date: Wed, 18 Mar 2020 16:00:57 +0100
Message-Id: <20200318150059.21714-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_080109_881760_793E0F5D 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
- drop error string for callers of of_i2c_register_device because it
  already reports enough (thanks to Tang Bin for the report!)

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/i2c-core-of.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 710704cd583e..f2d09ea0d336 100644
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
+		pr_err("failure registering %pOF (%ld)\n", node, PTR_ERR(client));
 
 	return client;
 }
@@ -88,7 +90,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	if (!adap->dev.of_node)
 		return;
 
-	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
+	dev_dbg(&adap->dev, "walking child nodes\n");
 
 	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
 	if (!bus)
@@ -99,12 +101,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 			continue;
 
 		client = of_i2c_register_device(adap, node);
-		if (IS_ERR(client)) {
-			dev_err(&adap->dev,
-				 "Failed to create I2C device for %pOF\n",
-				 node);
+		if (IS_ERR(client))
 			of_node_clear_flag(node, OF_POPULATED);
-		}
 	}
 
 	of_node_put(bus);
@@ -243,8 +241,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
-			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
-				 rd->dn);
 			put_device(&adap->dev);
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(PTR_ERR(client));
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
