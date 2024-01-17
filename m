Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C9AC47422
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jan 2024 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sTBXNPxEiyEax4DEN++CE5NVJ8pB0/WWiSDzaol0GE=; b=sA1ZPeez8mIjoU
	BNVv+Yu/N3woMPxHmWa7xLuaI8Mnshc+2VHHrMNXppemlC2GNHuTFBhIq9/adiD/7uaVvOCTCwK8V
	6t765evfQ19N7anGT7SymyEf3dEssqgARxzY2QzazCAevRssQi5kWsFD9zPUfEOtoCrYCfnW1f/AN
	uvn6f0C0cfBxNc8WLYPZomXdt4EV5qZ45GWpIakorcqedA/5t5kx0IE4SveRjKXjYI4WP8RM/CTGy
	ogCAV806ymu2foVNi9bdopI022A8LxwqWzhuDaAfnAzDyUQzOvrPgZHSn7bGpM/iP/blkr/gFSy20
	4uDK4AtpFTrrBgUFNF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0mp-00EmHo-1E;
	Wed, 17 Jan 2024 07:56:35 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0mk-00EmEX-1p
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jan 2024 07:56:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5578485fc0eso10033872a12.1
        for <linux-i3c@lists.infradead.org>; Tue, 16 Jan 2024 23:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705478188; x=1706082988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XwkSEcICpe+ea0RQFV2DwhY0p5bgvvp7tE8xUKgZWE=;
        b=YCv6nByHRM8l6KRBEtoEKJ53bSof6fNmjzive4D+p0C+ncAWFY9Xq+cCbLGQs0JA56
         f73ZWpwyBTAHUId5kIcxR370Wp0PGtANR6ZXLhnjHcNBVyg78+C5E43DxfYEybb67JW5
         dQEBm/jNaMGxv+tu44vyX6OjAD+727J6RGV2Dc5IM6ROUr8VNXvOY8z0oSM+SSCNBV0c
         eWBDEAlkuNpipgnzHOZjXvKOaFdqRCEnAPcuAPmaTwjgl9cxceuB8o2uq7z3pxik/txg
         1vCJAXzXY4yUQUcNOWndKx8lQD3TJgCye2PLtNNJXvCOvqq2DChONpNFWOUeK/ldgBAs
         hzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705478188; x=1706082988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XwkSEcICpe+ea0RQFV2DwhY0p5bgvvp7tE8xUKgZWE=;
        b=Ox5JgLz7Nphx9mSKrdNzpkUW1zzwssJ5QFGEMqWwzyLvndHpSYdjqeZVwOdrqzs26z
         8OW/l7FjJM0+wXjTosJiLtMXdQ9wmkypI4ag6tOYXYjTi/0T3w/ev8wc3cqOj7WbG/uQ
         AsdpVKEdJka30BFpHftUBr2xXD7921K+ts1xWQzj4He7z9bFIbS5jeumsC+le4sGvSGP
         zs9Dgs9QAAL2L2HxvrUvZvmbLhKTZrM8kZ61LhZKdZiGf4J6cNjKuEQeNau3vy5bqe33
         wjwtft2YEDv+k4z3b/CodJQgNVxRiGNbZq5IrE9klpRaL7unxvWivExrwKHp69cOApWK
         S7jg==
X-Gm-Message-State: AOJu0YzEjpwZFkzC51UjSxtIFviE6YWvcqe3E3+1GsM+7L13FK7799lD
	3URgLqIer2iQrYJqKNs4jOBydKbO7mH1hQ==
X-Google-Smtp-Source: AGHT+IHkw9HZFsdb6DKFrLoeYbHMisIsEIxTQf5ZInpVZB2TZbqsfkwq85KIqoqU8GUl2wPwxTB3zQ==
X-Received: by 2002:aa7:d589:0:b0:559:ba2a:68ce with SMTP id r9-20020aa7d589000000b00559ba2a68cemr928382edq.41.1705478187767;
        Tue, 16 Jan 2024 23:56:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005593c83bdafsm3911729edb.45.2024.01.16.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 23:56:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] arm64: dts: intel: agilex5: drop "master" I3C node name suffix
Date: Wed, 17 Jan 2024 08:56:18 +0100
Message-Id: <20240117075618.81932-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_235630_605261_9782A58A 
X-CRM114-Status: GOOD (  11.51  )
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

Following change in the I3C bindings, the "master" suffix in I3C
controller node name is discouraged (it is "controller" now) and not
accurate (if device supports also target mode).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

The change can be applied through independent trees, if the I3C bindings
change is applied.  Therefore please take it once I3C bindings is
applied.
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index d66d425e45b7..1162978329c1 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -202,7 +202,7 @@ i2c4: i2c@10c02c00 {
 			status = "disabled";
 		};
 
-		i3c0: i3c-master@10da0000 {
+		i3c0: i3c@10da0000 {
 			compatible = "snps,dw-i3c-master-1.00a";
 			reg = <0x10da0000 0x1000>;
 			#address-cells = <3>;
@@ -212,7 +212,7 @@ i3c0: i3c-master@10da0000 {
 			status = "disabled";
 		};
 
-		i3c1: i3c-master@10da1000 {
+		i3c1: i3c@10da1000 {
 			compatible = "snps,dw-i3c-master-1.00a";
 			reg = <0x10da1000 0x1000>;
 			#address-cells = <3>;
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
