Return-Path: <SRS0=uEpj=4I=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBE6C11D13
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17AC62467B
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNnMTUmH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17AC62467B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGf9nSVS/wyaUcXTfdvRdMfOPdzez0mB9W+avFeXrCg=; b=BNnMTUmHSemrgN
	HlCMVVMKhLxRWOBp5uvGWOqpRz+qu6Pd16tqltQ0Hv7qzZH2mVYIrDGmXC50n2Tx4d20gJo8Q6Bki
	K2URljjv5OXFy6mleUxx7zMKuQFzG0ZjSMKD5g61UwMfg8oKoO3Po6lLCtHHeJA9geuAIrYbH+A8C
	DtoadIyFKQ6Kaf7sDrybspqTToQaopumQDvGB3lOun884773FQQonzir5YrXcwSXRV9jDOdmRlmLW
	lpSbdlarFX9nJkqSZto0ReTx7Ajbf4EHzdObt1P8C35nDyFLINilDQ72rD5qHA9R699R9V7zJr3Ph
	wwPTLIsIulfgA7JRu12A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4pao-0007sA-Gc; Thu, 20 Feb 2020 17:26:30 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4paK-0007NR-36
 for linux-i3c@lists.infradead.org; Thu, 20 Feb 2020 17:26:02 +0000
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
 by pokefinder.org (Postfix) with ESMTPSA id E09212C1EC3;
 Thu, 20 Feb 2020 18:25:53 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH 6/7] i2c: of: mark a whole array of regs as reserved
Date: Thu, 20 Feb 2020 18:24:02 +0100
Message-Id: <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_092600_443327_8B2D8F80 
X-CRM114-Status: GOOD (  12.05  )
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

Back then, 'reg' properties in I2C DT bindings only contained one
address and this address was assigned a device and, thus, blocked.
Meanwhile, chips using multiple addresses are common and the 'reg'
property can be an array described by 'reg-names'. This code enhances
I2C DT parsing, so it will reserve all addresses described in an array.
They will be bound to the 'dummy' driver as 'reserved' iff the first
address can be assigned successfully. If that is not the case, the array
is not further considered. If one later address of the array can not be
assigned, it will be reported but we don't bail out. The driver has to
decide if that address is critical or not.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-of.c | 68 +++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 74b9f3fbb5ef..316db0c3b3c8 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -21,20 +21,12 @@
 
 #include "i2c-core.h"
 
-int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
+static void of_i2c_decode_board_info(struct device_node *node, u32 addr,
+				     bool first_addr, struct i2c_board_info *info)
 {
-	u32 addr;
-	int ret;
-
 	memset(info, 0, sizeof(*info));
 
-	ret = of_property_read_u32(node, "reg", &addr);
-	if (ret) {
-		pr_err("invalid reg on %pOF\n", node);
-		return ret;
-	}
-
-	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
+	if (!first_addr || of_modalias_node(node, info->type, sizeof(info->type)) < 0)
 		strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
 
 	if (addr & I2C_TEN_BIT_ADDRESS) {
@@ -51,11 +43,27 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
 	info->of_node = node;
 	info->fwnode = of_fwnode_handle(node);
 
-	if (of_property_read_bool(node, "host-notify"))
-		info->flags |= I2C_CLIENT_HOST_NOTIFY;
+	if (first_addr) {
+		if (of_property_read_bool(node, "host-notify"))
+			info->flags |= I2C_CLIENT_HOST_NOTIFY;
+
+		if (of_get_property(node, "wakeup-source", NULL))
+			info->flags |= I2C_CLIENT_WAKE;
+	}
+}
+
+int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
+{
+	u32 addr;
+	int ret;
+
+	ret = of_property_read_u32(node, "reg", &addr);
+	if (ret) {
+		pr_err("invalid reg on %pOF\n", node);
+		return ret;
+	}
 
-	if (of_get_property(node, "wakeup-source", NULL))
-		info->flags |= I2C_CLIENT_WAKE;
+	of_i2c_decode_board_info(node, addr, true, info);
 
 	return 0;
 }
@@ -64,21 +72,33 @@ EXPORT_SYMBOL_GPL(of_i2c_get_board_info);
 static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 						 struct device_node *node)
 {
-	struct i2c_client *client;
+	struct i2c_client *client, *first_client = ERR_PTR(-ENOENT);
 	struct i2c_board_info info;
-	int ret;
+	bool first_reg = true;
+	struct property *prop;
+	const __be32 *cur;
+	u32 reg;
 
 	pr_debug("register %pOF\n", node);
 
-	ret = of_i2c_get_board_info(node, &info);
-	if (ret)
-		return ERR_PTR(ret);
+	of_property_for_each_u32(node, "reg", prop, cur, reg) {
+		of_i2c_decode_board_info(node, reg, first_reg, &info);
+
+		client = i2c_new_client_device(adap, &info);
+		if (IS_ERR(client)) {
+			pr_err("failure registering addr 0x%02x for %pOF\n",
+				reg, node);
+			if (first_reg)
+				return client;
+		}
 
-	client = i2c_new_client_device(adap, &info);
-	if (IS_ERR(client))
-		pr_err("failure registering %pOF\n", node);
+		if (first_reg) {
+			first_client = client;
+			first_reg = false;
+		}
+	}
 
-	return client;
+	return first_client;
 }
 
 void of_i2c_register_devices(struct i2c_adapter *adap)
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
