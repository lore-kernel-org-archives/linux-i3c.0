Return-Path: <SRS0=88uS=5D=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3129C5ACD8
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2020 15:01:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 898042077D
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2020 15:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c77FTwas"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 898042077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8eCn6sMiHeFt0bCUW2N/T5+vIf81w90p5hTrE8uW1M=; b=c77FTwaskZ+FHq
	gr4fkEroJ7hXBwDN3ATbO78XzdM1Kn9++BPx7MFoFIJ/CEUJJsGk3HstVCXbfstHtUFXay0j7nIuF
	yF129yirgV7VnJL6i45EBnnsd8EzMNprxoo2YBX5GyFDSungQwXGUn8cY0ZXo1gJ33dWU1HVzXwZp
	uyjieacc5sp02iANSCPMWi3G6ms3apBPxhdd01G5snKWZDxA7OHg/nxYQkOeO7d72VknU1p04vo0H
	YXh3oVlvG/RVCMYV+jFyU0nnl5N7Ldb5YLQuIQjmAsbXsD+USviIwnqpOKwjuWYnNRPgPfsXhi6Qk
	vpp2QDOCZ7Pu+hot3piw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEaCE-0001WT-Vk; Wed, 18 Mar 2020 15:01:26 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEaBz-0000md-AJ
 for linux-i3c@lists.infradead.org; Wed, 18 Mar 2020 15:01:12 +0000
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
 by pokefinder.org (Postfix) with ESMTPSA id 79B7A2C2E85;
 Wed, 18 Mar 2020 16:01:07 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH v2 6/6] i2c: core: hand over reserved devices when
 requesting ancillary addresses
Date: Wed, 18 Mar 2020 16:00:59 +0100
Message-Id: <20200318150059.21714-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_080111_503129_6D0764B6 
X-CRM114-Status: UNSURE (   9.96  )
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
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

With i2c_new_ancillary_address, we can check if the intended driver is
requesting a reserved address. Update the function to do these checks.
If the check passes, the "reserved" device will become a regular "dummy"
device.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 84464e439df5..81fb320de28d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -974,7 +974,9 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
 						const char *name,
 						u16 default_addr)
 {
-	struct device_node *np = client->dev.of_node;
+	struct device_node *reserved_np, *np = client->dev.of_node;
+	struct device *reserved_dev, *adapter_dev = &client->adapter->dev;
+	struct i2c_client *reserved_client = NULL;
 	u32 addr = default_addr;
 	int i;
 
@@ -984,7 +986,25 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
 			of_property_read_u32_index(np, "reg", i, &addr);
 	}
 
-	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
+	dev_info(adapter_dev, "Address for %s : 0x%x\n", name, addr);
+
+	/* No need to scan muxes, siblings must sit on the same adapter */
+	reserved_dev = device_find_child(adapter_dev, &addr, __i2c_check_addr_busy);
+	if (reserved_dev) {
+		reserved_np = reserved_dev->of_node;
+		reserved_client = i2c_verify_client(reserved_dev);
+		put_device(reserved_dev);
+	}
+
+	if (reserved_client) {
+		if (reserved_np != np ||
+		    strcmp(reserved_client->name, I2C_RESERVED_DRV_NAME) != 0)
+			return ERR_PTR(-EBUSY);
+
+		strlcpy(reserved_client->name, I2C_DUMMY_DRV_NAME, sizeof(client->name));
+		return reserved_client;
+	}
+
 	return i2c_new_dummy_device(client->adapter, addr);
 }
 EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
