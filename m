Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C1BC64ED8
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KBWGUMi6fwrlF+Lwe46SnoVZaQQTFdlflKSwp1wo5s=; b=WCkh54n6+VadF9
	FlLN3top5BMGQr2oygOGpzpgfw+agIdR4V5lqPs232Dl7DnIswxapOwBtUOrV3+xnW8JtCVfSN270
	XA8uKRgHGtzgmG8VcfkZzNJCmH3tIc7EjpxsZA3bqm3uGz1LVeWV3IAgSzY6sTHkj0XA+yo3pv28g
	1ITfLwiFYULaHA0s8vCFwxXMScRdTmTqGEtlp+qvr2/B8bsSiojtsZdilQVKvyk5MFbG9+ctzbQsL
	2T0ZUfz96Tr57+7/tQxaQGXJAeQIKm4Mj9vBl+nNqpzPbNB2ouQes6sFGe2DmA1O+9Th7wBPFNYMY
	sTzhPzLLjMi4b1Drkg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSa7M-0099Ic-TT; Thu, 16 Feb 2023 08:59:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYu8-008q9b-9y
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 07:42:11 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id A141620178; Thu, 16 Feb 2023 15:42:00 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676533320;
	bh=s6ehK0j4ise00ta19NKaW0MnDM4sA9n4LCZKGU732KU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MNmRVoK0ZJtmb5u/nDJltKOEh0ETDRlMWLEn6baZZiZtaMzscgCwCDF8+ZwajCjla
	 5CJ9OSKubS/xreoI2BmFLmV1CsseMXkivszP6EDU97WTk9XJxN/I5r8VERGrT6JO3g
	 P/G/Mz00hUN/Fn4H6D9WknqhtvrwvyDk/uRZgEBTGyXVrCgmkI4RJ8pM7Qe660Nos4
	 9cg177q/XCfI2/KNZ4kiVonzFDdMz6+54FC93b3BJFPGaLR+SqrNaZAB3SVdiUVyYr
	 1NSFoDCxnG2c444QdZYTv4S5P0UizeSdMvuwaVa+h2fe5HbxgtJpmVp09yKwiEILa9
	 zt0hlRGNhUYWQ==
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
Subject: [PATCH 1/4] dt-bindings: i3c: Add AST2600 i3c controller
Date: Thu, 16 Feb 2023 15:41:52 +0800
Message-Id: <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676532146.git.jk@codeconstruct.com.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_234208_573626_51B05441 
X-CRM114-Status: GOOD (  12.90  )
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

Add a devicetree binding for the ast2600 i3c controller hardware. This
is heavily based on the designware i3c core, plus a reset facility
and two platform-specific properties:

 - sda-pullup-ohms: to specify the value of the configurable pullup
   resistors on the SDA line

 - aspeed,global-regs: to reference the (ast2600-specific) i3c global
   register block, and the device index to use within it.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
changes from RFC:
 - add vendor prefix to global-regs properties
 - add item description on global-regs property
 - drop global reg node from example
---
 .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
new file mode 100644
index 000000000000..920428f243b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -0,0 +1,73 @@
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
+      Value to configure SDA pullup resistor, in Ohms.
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to i3c global register syscon node
+          - description: index of this i3c controller in the global register set
+    description: |
+      A (phandle, controller index) reference to the i3c global register set
+      used for this device.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - aspeed,global-regs
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c-master@2000 {
+        compatible = "aspeed,ast2600-i3c";
+        reg = <0x2000 0x1000>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+        clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
+        resets = <&syscon ASPEED_RESET_I3C0>;
+        aspeed,global-regs = <&i3c_global 0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i3c1_default>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
