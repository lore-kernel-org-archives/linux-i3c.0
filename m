Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FB3C636D4
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vF1nEOICzxpvZAP4iVJSmxHwCoFzL7YooHqCcBSWfig=; b=Xo4IEFlUPfPvLC
	4Cw/HfKedoB3s2Po2r3J5ptKprlBFU5W/5Vwbqwz2t5gTL+wJEG7RSlsNUuMWDvo6gbSikCjU/65f
	viQmredmwL0LUsChtwrlrzGgTvbE+MnZeVBoYIRIgI15KszlAmlubnFFZ0zyg+8bmO41UqZ819VLk
	z02e8KIydINl+2z3XuB5I4XEPEDAF4l7lBP8IIY8lDj4u5xHG91IRKoD7PmXEmFgmKoHpss/LBeDb
	jifa2+OgvWDpckH42MxRF7v/CXyR+jLG7Z7JvzFAIOrd6IVtpkhxhSNeUzcmM14It1JsVDjQeexcB
	XLdfsw3SbdKn0nAAvV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWEy-00E8oB-HP; Mon, 13 Feb 2023 10:39:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRTU0-00DT92-Po
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 07:42:46 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id F2D1B200E3; Mon, 13 Feb 2023 15:42:22 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676274142;
	bh=Gac3PppOPjYLz3RFgIIfbWPmQu5Mk+Pg0GDUNnRwP4E=;
	h=From:To:Cc:Subject:Date;
	b=c2yd1IFcixnbYvx10pSFloY8TVzM4S4/w12Ewfdg1qBxrRnf3V4gTP0rx+kEcbyy1
	 3f47Zts8DxFOuG89imjJctCO3MmQk1qRCim38z/HUyhg7Ck96ZaxIBtwGgHbSOxkNA
	 Tqk0A9WHlHfk7G9OXBKwWOZ4QJ7puRvXS/QqO+NNiM2q8gv5ak0Po8/eoRTyfVAvtt
	 a97NxRpI7rpnaNJPm9KOwaI1rUN+Soq9XXBA89R5dAxnMRbmbgQnc0mIApozMQttaw
	 6Rnpn6GoDuvjcIeRFMAQbqgIsbw3w1P6gCjmUoKgbmkfDyNfp93Dx+lfK7WZZVhxX1
	 1aVibyQQcqylQ==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: devicetree@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org,
	linux-i3c@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Date: Mon, 13 Feb 2023 15:41:52 +0800
Message-Id: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_234243_669451_57D577D5 
X-CRM114-Status: GOOD (  13.50  )
X-Mailman-Approved-At: Mon, 13 Feb 2023 02:39:18 -0800
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

This change adds a devicetree binding for the ast2600 i3c controller
hardware. This is heavily based on the designware i3c hardware, plus a
reset facility and two platform-specific properties:

 - sda-pullup-ohms: to specify the value of the configurable pullup
   resistors on the SDA line

 - global-regs: to reference the (ast2600-specific) i3c global register
   block, and the device index to use within it.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
RFC: the example in this depends on some not-yet-accepted patches for
the clock and reset linkages:

  https://lore.kernel.org/linux-devicetree/cover.1676267865.git.jk@codeconstruct.com.au/T/

I'm also keen to get some review on the pullup configuration too.

---
 .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
new file mode 100644
index 000000000000..ef28a8b77c94
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 i3c controller
+
+maintainers:
+  - Jeremy Kerr <jk@codeconstruct.com.au>
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  compatible:
+    const: aspeed,ast2600-i3c
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  sda-pullup-ohms:
+    enum: [545, 750, 2000]
+    default: 2000
+    description: |
+      Value of SDA pullup resistor in Ohms
+
+  global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      A (phandle, controller index) reference to the i3c global register set
+      used for this device.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - global-regs
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c-master@2000 {
+        #address-cells = <3>;
+        #size-cells = <0>;
+        compatible = "aspeed,ast2600-i3c";
+        reg = <0x2000 0x1000>;
+        clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
+        resets = <&syscon ASPEED_RESET_I3C0>;
+        global-regs = <&i3c_global 0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i3c1_default>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+    i3c_global: i3c-global@0 {
+        compatible = "aspeed,ast2600-i3c-global", "simple-mfd", "syscon";
+        resets = <&syscon ASPEED_RESET_I3C_DMA>;
+        reg = <0x0 0x1000>;
+    };
+...
-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
