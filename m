Return-Path: <SRS0=uEpj=4I=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B10FC11D17
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE6652467A
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZe+5QZZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE6652467A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7i6QdlATm/qtvMFRy09wJygxke9DKmSpOAqILnVVgUo=; b=GZe+5QZZZMmBaM
	IUDH6XftZTRruTp/MZGNVih0lPTJqiP7BBcQ5g1zgV97tWeBUS1NS1nvRnAOvusjV5UhAgI2xlb9N
	aW4mTQIbPRKujnCa3jkHB75MiGckfx0dQoDkwNM5fJ4Ewd8GZgdIIHWCbLCKzuKsQb0ck8tZ3jyjZ
	piBKMIYMTV5SYHpZlLMrc+cusZQTGtRblv+d7ocJUCg2/EKsXWM/bJPZEsNN17iWX+NvsQN8OIVNc
	5imVGTrQYBIOJWTF6LrTPylaFHHkL90qCsmk1S09TkqyIry7KXG2XyhmgNOruUBxOe9Vhhjjuxodg
	Z2wFQUmRd9E/W02/np3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4pal-0007pv-S1; Thu, 20 Feb 2020 17:26:27 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4paG-0007FO-NY
 for linux-i3c@lists.infradead.org; Thu, 20 Feb 2020 17:26:01 +0000
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
 by pokefinder.org (Postfix) with ESMTPSA id 1ED662C1EBE;
 Thu, 20 Feb 2020 18:25:52 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
Date: Thu, 20 Feb 2020 18:23:59 +0100
Message-Id: <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_092557_094324_F2E2D3C0 
X-CRM114-Status: GOOD (  12.82  )
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

Sometimes, we have unknown devices in a system and still want to block
their address. For that, we allow DT nodes with only a 'reg' property.
These devices will be bound to the "dummy" driver but with the name
"reserved". That way, we can distinguish them and even hand them over to
the "dummy" driver later when they are really requested using
i2c_new_ancillary_device().

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 1 -
 Documentation/devicetree/bindings/i2c/i2c.txt        | 4 +++-
 drivers/i2c/i2c-core-base.c                          | 1 +
 drivers/i2c/i2c-core-of.c                            | 8 +++-----
 drivers/i2c/i2c-core.h                               | 1 +
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
index 6b25a80ae8d3..2762effdd270 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -50,7 +50,6 @@ Examples:
 		reg-io-width = <1>;	/* 8 bit read/write */
 
 		dummy@60 {
-			compatible = "dummy";
 			reg = <0x60>;
 		};
 	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index 9a53df4243c6..989b315e09dc 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -21,7 +21,9 @@ flags can be attached to the address. I2C_TEN_BIT_ADDRESS is used to mark a 10
 bit address. It is needed to avoid the ambiguity between e.g. a 7 bit address
 of 0x50 and a 10 bit address of 0x050 which, in theory, can be on the same bus.
 Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we listen to
-be devices ourselves.
+be devices ourselves. The 'reg' property of a child is required. The
+'compatible' property is not. Empty 'compatible' child entries can be used to
+describe unknown devices or addresses which shall be blocked for other reasons.
 
 Optional properties
 -------------------
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8df2fa10c48a..4000a4384306 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -854,6 +854,7 @@ EXPORT_SYMBOL_GPL(i2c_unregister_device);
 
 static const struct i2c_device_id dummy_id[] = {
 	{ I2C_DUMMY_DRV_NAME, 0 },
+	{ I2C_RESERVED_DRV_NAME, 0 },
 	{ },
 };
 
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 6787c1f71483..d8d111ad6c85 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -27,17 +27,15 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 
 	memset(info, 0, sizeof(*info));
 
-	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0) {
-		dev_err(dev, "of_i2c: modalias failure on %pOF\n", node);
-		return -EINVAL;
-	}
-
 	ret = of_property_read_u32(node, "reg", &addr);
 	if (ret) {
 		dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
 		return ret;
 	}
 
+	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
+		strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
+
 	if (addr & I2C_TEN_BIT_ADDRESS) {
 		addr &= ~I2C_TEN_BIT_ADDRESS;
 		info->flags |= I2C_CLIENT_TEN;
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index fb89fabf84d3..77b3a925ed95 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -23,6 +23,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 			       unsigned int num_resources);
 
 #define I2C_DUMMY_DRV_NAME "dummy"
+#define I2C_RESERVED_DRV_NAME "reserved"
 
 /*
  * We only allow atomic transfers for very late communication, e.g. to send
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
