Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B77C6379F
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHEJ+QjgzUFIL1gIXyfVjBdSIPcw68YQx1Xaax9NbaI=; b=qmNW3FJs6fOwa5
	D0LlkfbeW+d/lL+Fhy2ncwamHRXLyGMLu66P4BQq6x0eR5Rv6SkPd014qXFdmOKeR4XyVw+bobq/g
	OPSJ/dNv5B+2FIX1DAWoELEE5vh5jD4fQ1KXGBCzfU9YvNrFjw0FrPi3qx8QExzSLOQoj+5Mw0W32
	PNtrzGfBl8GVBG7to8IhKh9vUYDu4/O8WFkMKAjcW6hhMBY7aJoeR1/2VjtYsGpWihKX1wW7qYYPa
	evRrszvq2kbnKbWtbhxzDybac+/Qfd6RUsap3Timc0xNcjJUH/eM070drFwHlqfazZcXF1D+NRSQ2
	S3MLK4M/4j2NYjqNmcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSa7N-0099Ij-0C; Thu, 16 Feb 2023 08:59:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYu8-008q9Z-9w
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 07:42:11 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 3FC012024A; Thu, 16 Feb 2023 15:42:01 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676533321;
	bh=nEz8ZwbZq4uv4GNC68L/J2QzHskqfAQiUHEbxZNxSGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RUszN14YWY6naxENAcAJoIIZQBU49k8A+C7WnAEzCiiPM8+BW/Z13Jl1hZpfDl6Ce
	 etUM/dvOr32V40DqnICZr1mg+dwXD93fUIP3qTiNGnsiy/1ZGEQ6sMdUQmRMx5GWvI
	 fmqmwR86cw61Cuhyuj7+UsoHb0F06BOPLJ7Gnr8khlgCk1RdrAn2O3nNRH2c1N4xO2
	 DPKA98xMF1VMbQn6hBf3NI9/Jr0mZoOHnan/QS7YmDEkfeULWADJKFNPBS/ThQuNs/
	 QA5gRpsFIbfOpugPM7AR8Z5cBnqNloHpoMhKZGnVHth505qvPgUYCRg2cZ72UQYBMp
	 szJtg+HZfiyzw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vitor Soares <ivitro@gmail.com>,
	linux-aspeed@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/4] i3c: dw: Add platform operations
Date: Thu, 16 Feb 2023 15:41:53 +0800
Message-Id: <eb90bc9ee9f72efc2012abce3e4e50186552e194.1676532146.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676532146.git.jk@codeconstruct.com.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_234208_587104_372579C4 
X-CRM114-Status: GOOD (  15.85  )
X-Mailman-Approved-At: Thu, 16 Feb 2023 00:59:51 -0800
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

The dw i3c core can be integrated into various SoC devices. Platforms
that use this core may need a little configuration that is specific to
that platform.

Add a little infrastructure to allow platform-specific behaviour: a bit
of data on struct dw_i3c_master, and two hooks to the probe and init
calls to enable this.

A future change will add new platform support that uses these hooks.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 42 +++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d73d57362b3b..49b891449222 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -241,6 +241,17 @@ struct dw_i3c_master {
 	char version[5];
 	char type[5];
 	u8 addrs[MAX_DEVS];
+
+	/* platform-specific data */
+	const struct dw_i3c_platform_ops *platform_ops;
+	union {
+	} pdata;
+
+};
+
+struct dw_i3c_platform_ops {
+	int (*probe)(struct dw_i3c_master *i3c, struct platform_device *pdev);
+	int (*init)(struct dw_i3c_master *i3c);
 };
 
 struct dw_i3c_i2c_dev_data {
@@ -612,6 +623,12 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	u32 thld_ctrl;
 	int ret;
 
+	if (master->platform_ops && master->platform_ops->init) {
+		ret = master->platform_ops->init(master);
+		if (ret)
+			return ret;
+	}
+
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
@@ -1128,8 +1145,15 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
 };
 
+static const struct of_device_id dw_i3c_master_of_match[] = {
+	{ .compatible = "snps,dw-i3c-master-1.00a", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
+
 static int dw_i3c_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
 	struct dw_i3c_master *master;
 	int ret, irq;
 
@@ -1181,6 +1205,18 @@ static int dw_i3c_probe(struct platform_device *pdev)
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
+	/* match any platform-specific ops */
+	match = of_match_node(dw_i3c_master_of_match, pdev->dev.of_node);
+	if (match && match->data)
+		master->platform_ops = match->data;
+
+	/* platform-specific probe */
+	if (master->platform_ops && master->platform_ops->probe) {
+		ret = master->platform_ops->probe(master, pdev);
+		if (ret)
+			goto err_assert_rst;
+	}
+
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
 	if (ret)
@@ -1213,12 +1249,6 @@ static int dw_i3c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id dw_i3c_master_of_match[] = {
-	{ .compatible = "snps,dw-i3c-master-1.00a", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
-
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
 	.remove = dw_i3c_remove,
-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
