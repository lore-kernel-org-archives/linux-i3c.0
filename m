Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9341EC47258
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jan 2024 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0Gr06l3c3EZmk3vF87eedzNUCyzfosS2SDPNAM7Iyc=; b=q6vnFkHAz8bv9J
	bfhW2dsOsf4QMKpcCinQFPPBOiQ4052k6EkLxvwqjjA/Ap8RDDona7xcJlkUOmTOx0F6J6YLx/6N4
	QIdCcrrmqj5Rj9LBEzu+6UDJ6k3QSXKUR+0Yz754pvc2JfQ4Zs1qST1r9EhxPYKnBPe+3MjMsXP/L
	TIWEo4l1QSLq7HHGGFGMNSWF8RLr1rc3zi8QcH2VKtlTue51HXVe1stj3SW4xgfRXkNGw7Uvqz2Gt
	M4/vnMi4n24Wj13f985VtzqsLevsMlIzREth1D8vajRiXKKPDwiX1ph7q0TWclbz8PsIwAPnvexPD
	dVE/DHrum3R4wQpDb1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0mm-00EmGO-0R;
	Wed, 17 Jan 2024 07:56:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0mj-00EmDr-0Y
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jan 2024 07:56:30 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50e741123acso13162142e87.0
        for <linux-i3c@lists.infradead.org>; Tue, 16 Jan 2024 23:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705478185; x=1706082985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1ikojdbGs7xDo7niT+1oLSnQGCDtDxb/MkgvOzMnfQ=;
        b=ZJisb9Ah3+HtNtgY+vyYZ6Zfwv3VcGu1Q9DOw3+iRrzwa6PTYNEGRUdhSruicpkQPQ
         +4F9lDk7T3m9YRfSk/2XCpFQOkrcvY55kBNBMTqgK2eqotkinl59gqiSxgVVtDGAMQBH
         7DJNtevxaS3aLOIt8f6szwidQTd3Euiozqu/7hyY8kp6MdOoD6SXAqADoboV9VU5iUyX
         x0XvwhqXAhHz4zypdLaHY4aJRzxglivOFpQaYXADFJ+lncVrgqih4mMYfVMf0nfQ7IBE
         KzcKeSgxWUykNTt1fteHopw+LrvQtB7S2XpC/VsoqS+3RSunCIA61grBZkXGYuRfciSi
         SxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705478185; x=1706082985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1ikojdbGs7xDo7niT+1oLSnQGCDtDxb/MkgvOzMnfQ=;
        b=iaXMlKXt7kb+1ogbkihmhK3UuPpPCDIJztLUyqUHrRPBQCNCCgH/F7qvUJ+3ARg6st
         EF7pmIFpvz76Qsl9Bzy7W4l61o2sni33eFJ1p41VcXnpYE17gst0DUS6tec7y/1HGCNN
         wk26sr5bo4s4lN3zqbplgi55/6+c5qbnaqTmyNOFLNgLh9s3u2W87H625rVjipj98Gog
         VvEmwq+Biqyq9O4csV6jbWxZjLPFBMtsAMMBpNVLpggk5CxQXpeTX2JMbmGYPDJzH3oS
         7VHoXGbb7h/cdpUwDbCYsWKyQYB2odeM7hXVX5kSFcAOocmlgZq/9Yf8rAUfIkko5Nrc
         Pafg==
X-Gm-Message-State: AOJu0Yx8DiBjIzMXFPWV+fAi/Uofg8sPeEHBV26wRn1syJ7EnbW3wswB
	8dewYZgbEoFyu3RsXwXVL45R2o3SGJmZIw==
X-Google-Smtp-Source: AGHT+IH1lZmQtaAndRJ+LXGucJE38oBaOnStf0fj+tk7FqnFGzgsPeytlARYdgzXocquwH2AHk6E9w==
X-Received: by 2002:a05:6512:e91:b0:50e:7fd9:11 with SMTP id bi17-20020a0565120e9100b0050e7fd90011mr4391489lfb.83.1705478185190;
        Tue, 16 Jan 2024 23:56:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005593c83bdafsm3911729edb.45.2024.01.16.23.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 23:56:24 -0800 (PST)
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
Subject: [PATCH 2/3] arm64: dts: imx93: drop "master" I3C node name suffix
Date: Wed, 17 Jan 2024 08:56:17 +0100
Message-Id: <20240117075618.81932-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_235629_212129_64E5C373 
X-CRM114-Status: GOOD (  11.58  )
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
 arch/arm64/boot/dts/freescale/imx93.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 8f2e7c42ad6e..601c94e1fac8 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -294,7 +294,7 @@ tpm2: pwm@44320000 {
 				status = "disabled";
 			};
 
-			i3c1: i3c-master@44330000 {
+			i3c1: i3c@44330000 {
 				compatible = "silvaco,i3c-master-v1";
 				reg = <0x44330000 0x10000>;
 				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
@@ -671,7 +671,7 @@ tpm6: pwm@42510000 {
 				status = "disabled";
 			};
 
-			i3c2: i3c-master@42520000 {
+			i3c2: i3c@42520000 {
 				compatible = "silvaco,i3c-master-v1";
 				reg = <0x42520000 0x10000>;
 				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
