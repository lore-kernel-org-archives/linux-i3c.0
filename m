Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771D3C47258
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jan 2024 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQr7ykmPONgqgYxi37YzEo4xG5YDAISdVtGtRJ/qodU=; b=YFSjoKUttpzSbq
	U0gOASjCycjDmcU0W2420ukKOgbS40aZjFpI1qWJlGGwTDn7/qpV9XeZ/pzvofsw+Ncl+/IaAzayg
	yUb/YajjZ3NWd0Ilh12ZpnYxCNRfugBrE7/TkHPlfmpUTH0x0U4Pjg8gZip1nkfcx6RwOKKb9alDA
	As1/2Kh6CEK5ikNElUyMthWQvNobPcM5eLqdS6pHnq7OQ08ay6ouwKSFc0SBUNw8XTdMgeeqwyfx7
	5f2XRrH8L97RL9R+5yasnqfaikRhNYtfV0F/44k6fhqdUcA54P4+uJaibzsj9F+Q3IDhJZwFEG3ES
	kETfV9iNwJKmYkP68AeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0mh-00EmEH-1w;
	Wed, 17 Jan 2024 07:56:27 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0me-00EmDa-17
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jan 2024 07:56:25 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5534dcfdd61so18921300a12.0
        for <linux-i3c@lists.infradead.org>; Tue, 16 Jan 2024 23:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705478183; x=1706082983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FNavL/OTqrT8QuQmqYgzyRhF/X5aNJJnuSYES95gWA=;
        b=PjeF0tT9pwc2Rt2hOgWyY1kMieSWZyRTCWArDFaru5zWkLzCeZuSPwfyS8ygVoXo28
         qdM1OK7Awh3qkmHTjeSaswQhIcZ3QzJqtrxIZ3qg2niKq9Oca7srSBrjsp2iN83D5jLy
         bOjSULJW54LnftV+xOCLznnNHjHy70V6ot+HO42PhhPda/hwKsNhn9gERacSE8GHmVkf
         3k2GueUWdKP6OX1oozu0Prb/SPZ0WVMecJbWnkBne7qddH9bTLC0WPeDa7xRuYRTroIh
         ErPBQjvH2JFteLE+e56HfVmS6/BNiAmAZVj3Xx+2GPWjhADENk3EWW8rsr76VDDY+Gb+
         8vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705478183; x=1706082983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FNavL/OTqrT8QuQmqYgzyRhF/X5aNJJnuSYES95gWA=;
        b=TrRqhFda2SBjEpvRzUuf4Di3Fwi9qYMf/VHKVKxavq2WOUUhGHvjPYpMVUg6gv+JWe
         AYPH6DUHll9OLXir0T+hjHUst5fk7nzjWYViW37AzEs1U/PIhCg6E59/whqafYYjH8hg
         xW8r0zLiyjqfQXUmworwveKeGeYfpoHfrZClA49L9cjTwfFwSoeHYIFYYgDsIRMCZkwR
         qKlpW1qV4Y+6KpEQby+9qCk7xQ9gea0yEmzVxw7iKIue2UzWNFkP7zGYp2Xs34ziuOEq
         WU3e1Q8n7Ps2XrwVSrln1G+3cTNBsZsx63ui5/PW9HGCBhCDWS2Xxj6ul0c6XL+monlE
         qopw==
X-Gm-Message-State: AOJu0YzMq1NPpA5RX4nCc9z0hjDOhmjqMyNk31RPhE4i2DoYffvxhg8p
	0810YoezIZIWHUFbwksZ2jvBYuewnlFfqh9CWArRzaYwrEmlk0+RI8Fhe8Snw5M=
X-Google-Smtp-Source: AGHT+IHZ7LpNoKqKOFo0lwT6GfpvlUHssOiVpCXLrPHhVFLIt2m/9etyIrgUMWQITv4qPN0OPi517Q==
X-Received: by 2002:a05:6402:959:b0:559:4572:72e1 with SMTP id h25-20020a056402095900b00559457272e1mr448379edz.16.1705478182863;
        Tue, 16 Jan 2024 23:56:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005593c83bdafsm3911729edb.45.2024.01.16.23.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 23:56:22 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Date: Wed, 17 Jan 2024 08:56:16 +0100
Message-Id: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_235624_392040_011A341D 
X-CRM114-Status: GOOD (  10.51  )
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

Drop the requirement of "-master" suffix in node names because:
1. "Master" word is discouraged and MIPI Alliance renamed it to
   "Controller".
2. Some devices can operate in Controller (Master) or Target mode, thus
   the name is not accurate in such cases.
3. Other buses, like I2C controllers, use simple "i2c".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml | 2 +-
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml    | 2 +-
 Documentation/devicetree/bindings/i3c/i3c.yaml                | 4 ++--
 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml       | 2 +-
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
index fcc3dbff9c9a..47be5d9a32d4 100644
--- a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -57,7 +57,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    i3c-master@2000 {
+    i3c@2000 {
         compatible = "aspeed,ast2600-i3c";
         reg = <0x2000 0x1000>;
         #address-cells = <3>;
diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index cc40d25358ec..cad6d53d0e2e 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -41,7 +41,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    i3c-master@d040000 {
+    i3c@d040000 {
         compatible = "cdns,i3c-master";
         clocks = <&coreclock>, <&i3csysclock>;
         clock-names = "pclk", "sysclk";
diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index c816e295d565..c7900a1da8d9 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -17,7 +17,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^i3c-master@[0-9a-f]+$"
+    pattern: "^i3c@[0-9a-f]+$"
 
   "#address-cells":
     const: 3
@@ -153,7 +153,7 @@ additionalProperties: true
 
 examples:
   - |
-    i3c-master@d040000 {
+    i3c@d040000 {
         compatible = "cdns,i3c-master";
         clocks = <&coreclock>, <&i3csysclock>;
         clock-names = "pclk", "sysclk";
diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
index 5dda8cb44cdb..39bb1a1784c9 100644
--- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
@@ -43,7 +43,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    i3c-master@a0000000 {
+    i3c@a0000000 {
       compatible = "mipi-i3c-hci";
       reg = <0xa0000000 0x2000>;
       interrupts = <89>;
diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 133855f11b4f..c56ff77677f1 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -48,7 +48,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    i3c-master@a0000000 {
+    i3c@a0000000 {
         compatible = "silvaco,i3c-master-v1";
         clocks = <&zynqmp_clk 71>, <&fclk>, <&sclk>;
         clock-names = "pclk", "fast_clk", "slow_clk";
diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 7a76fd32962a..c0e805e531be 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -35,7 +35,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    i3c-master@2000 {
+    i3c@2000 {
         compatible = "snps,dw-i3c-master-1.00a";
         #address-cells = <3>;
         #size-cells = <0>;
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
