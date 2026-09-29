Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A6ACA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYtgXkz/4RXmGZBy3HwLEDMIAbWaXZPhYsrn2k8VUJ4=; b=QXeDKbtrQPUTiq
	WDCDA0QnpPYN3zU3YoxyeOyWhDHU0s3HtHlNV/pZ2oCkNvOiXRv8oe49JlB75Re1ZwWNz3p5xBYI7
	YA16yBtlARXyuw+65Ugk19NCblgiRS5u46+dKzaeIZWYtC4KjuVwaFf9BGVVYdMhSPmm1KOhG7ABH
	eKjC4paeM/0iQhzwpUl4W0MIhZ1PogoaKXNo5srjlBJDP1JbOWkqoYtmZxmW4wwE5v/DL2nLEO1gA
	ZXAAQ2Jihc+h5GP4l1+X5N0V+sp6c+j2kaDf90KqdQziprr+u5uJTpeoLUFLVQRNcFrsjWHnUJTTs
	6asG6x7sSckELJhERLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRRK-00000002TLV-44AK;
	Tue, 29 Sep 2026 06:35:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRR1-00000002T9F-1ish;
	Tue, 29 Sep 2026 06:35:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C5E843E12;
	Tue, 29 Sep 2026 06:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181B31F000FF;
	Tue, 29 Sep 2026 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663727;
	bh=qs7Pv/6laLnorp25cTK04GRAniiFvRyeZMCFj2Hg7g0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EoKMsw2doFkOWRT2sHbm3G6UhGfoq2bAumyM5KJxUCsLkuYRg1NuxFFoVwVomaWFn
	 pS6qXmVVUHgY1hR9XkUQ7JNsJkMkALujuBYsnyZXJzTVvyzjbK8kj9uuBqRZZvPai+
	 2dmoH5oY5GOCkQbUzrcGveWEaMPUKM33mwra1xX0wtXo4ucuzttAVRNE07ASHA99Pf
	 Pd/pYKFkzfov6kN+XLCVvNTiizA/uwFyFyxOEQJ+I//5BaX6wRL/oqy76OyJa73KAo
	 rnerS2hl3AFMNcvmQBORlA7qenVDjlmaxYWrUMlotr0LLZdI206sUwrT0wBY7AbZzz
	 gDPnIMSmhWaqw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/20] pinctrl: berlin: enable module build support
Date: Tue, 29 Sep 2026 14:14:08 +0800
Message-ID: <20260929061417.20733-12-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
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

For Android GKI + vendor_dlkm deployments, where vendor-specific
drivers must be kept separate from the GKI vmlinux and loaded as
modules from the vendor partition, we need to enable module build
support for berlin pinctrl drivers.

To acchive this goal:

1.Use devm_* APIs to alloc memory, so that we don't need to care free when
unloading.

2.Export two symbols which will be used by SoC pinctrl drivers.

3.Add MODULE_LICENSE and MODULE_DESCRIPTION

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/pinctrl/berlin/berlin.c | 27 ++++++++++++++-------------
 drivers/pinctrl/berlin/berlin.h | 15 +++++++++++++++
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 7971339e269f..0c2179b98629 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -215,7 +215,8 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	}
 
 	/* we will reallocate later */
-	pctrl->functions = kzalloc_objs(*pctrl->functions, max_functions);
+	pctrl->functions = devm_kcalloc(&pdev->dev, max_functions,
+					sizeof(*pctrl->functions), GFP_KERNEL);
 	if (!pctrl->functions)
 		return -ENOMEM;
 
@@ -230,13 +231,11 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 		}
 	}
 
-	new_functions = krealloc(pctrl->functions,
-				    pctrl->nfunctions * sizeof(*pctrl->functions),
-				    GFP_KERNEL);
-	if (!new_functions) {
-		kfree(pctrl->functions);
+	new_functions = devm_krealloc(&pdev->dev, pctrl->functions,
+				      pctrl->nfunctions * sizeof(*pctrl->functions),
+				      GFP_KERNEL);
+	if (!new_functions)
 		return -ENOMEM;
-	}
 
 	pctrl->functions = new_functions;
 	/* map functions to theirs groups */
@@ -257,10 +256,8 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 				function++;
 			}
 
-			if (!found) {
-				kfree(pctrl->functions);
+			if (!found)
 				return -EINVAL;
-			}
 
 			if (!function->groups) {
 				function->groups =
@@ -268,10 +265,9 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 						     function->ngroups,
 						     sizeof(*function->groups),
 						     GFP_KERNEL);
-				if (!function->groups) {
-					kfree(pctrl->functions);
+
+				if (!function->groups)
 					return -ENOMEM;
-				}
 			}
 
 			groups = (const char **)function->groups;
@@ -327,6 +323,7 @@ int berlin_pinctrl_probe_regmap(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(berlin_pinctrl_probe_regmap);
 
 int berlin_pinctrl_probe(struct platform_device *pdev,
 			 const struct berlin_pinctrl_desc *desc)
@@ -341,3 +338,7 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
 
 	return berlin_pinctrl_probe_regmap(pdev, desc, regmap);
 }
+EXPORT_SYMBOL_GPL(berlin_pinctrl_probe);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("pinctrl library for Synaptics SoCs");
diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index 7e7096842eda..8ff70d682593 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -20,6 +20,8 @@ struct berlin_desc_group {
 	u16				offset;
 	u8				bit_width;
 	u8				lsb;
+	u16				conf_offset;
+	u8				conf_bits;
 	struct berlin_desc_function	*functions;
 };
 
@@ -28,6 +30,19 @@ struct berlin_pinctrl_desc {
 	unsigned			ngroups;
 };
 
+#define BERLIN_PINCTRLCONF_GROUP(_name, _offset, _width, _lsb,		\
+		_conf_offset, _conf_bits, ...)				\
+	{								\
+		.name = _name,						\
+		.offset = _offset,					\
+		.bit_width = _width,					\
+		.lsb = _lsb,						\
+		.conf_offset = _conf_offset,				\
+		.conf_bits = _conf_bits,				\
+		.functions = (struct berlin_desc_function[]){		\
+			__VA_ARGS__, { } },				\
+	}
+
 #define BERLIN_PINCTRL_GROUP(_name, _offset, _width, _lsb, ...)		\
 	{								\
 		.name = _name,						\
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
