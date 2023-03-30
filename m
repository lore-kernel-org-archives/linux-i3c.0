Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B9C6FD1D
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/JzDTJ3W08IOy7WbDIk4xiESmGfnxGHDZXCqINrFB8=; b=ZOsKTiw2IE7jNk
	EAXxx34f/zacqkDeSoGVKuih1dwxsewi2SusE+A3x4UqeduaNjB4tsLRCB5Ld5otIBr4ctH2GCPch
	KQWzSJx6+dmIt5hJ1KGzyghyOrEXQ71vf7DgJCVqOpug6mg55+vtQ91gyjlEVSNwiVxDWRDPlQk2L
	5d6Kyop8MdtE72Gz/kWVzK3zyIZZWi9hCCCTco1gWUyiFWwrsGZ86avQZi6lnbgoMi5iZ/5ssf+5x
	3egKzwWkzD0RzF2m8XsCvESjU402/91YlO+zutLJSJRJrlOpG+RVGCaTTFOlqJvWo1pGgAQg7/lxI
	VEuLz4q1AEi6m0tRxq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmhh-002tZw-2P;
	Thu, 30 Mar 2023 07:28:13 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmcI-002szY-0V
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:22:39 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id E57E1201F2; Thu, 30 Mar 2023 15:22:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680160951;
	bh=FWbcA5dORUr++A7duxNqxgidowcGUM2jcrHUfxGInKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j7LIjSLqxYbgUzIxH3kYvHvsLEnDhNw6mfSkWsuaJTuYVmFkt8rGwb87NZCceFhyQ
	 wILcBB/EsNL3fD0p07s/1vB4bePOmmxQKA0h+lljn4e1rrubq3bO3MrLiPrzewMhLo
	 +39svv86LLikI9n7qg68xwc6AYKRlFsQ09fkOCSb5Y8lBoBu0AMKUfdPfujT8tcXou
	 iGyApRNnYalh1e6+h3gxJyiNXmf803uzqtDdCA/IkWDtg+5FZQfRFKx0rW9BZ6y8KK
	 rgJuKLak98wh/bLt+GWL17rWQqqTLNHaHys0CniUC1aVso25EoT47nsuQzjg66x9QB
	 9JKQAFR0GS7WQ==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 2/3] dt-bindings: i3c: Add AST2600 i3c controller
Date: Thu, 30 Mar 2023 15:22:18 +0800
Message-Id: <f567ce86cf9a57b50320c1b2f7c851adc03c094d.1680160851.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680160851.git.jk@codeconstruct.com.au>
References: <cover.1680160851.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_002238_407036_337BE32A 
X-CRM114-Status: GOOD (  12.25  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 00:28:12 -0700
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (on v1)
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - example: replace aspeed clock defines with constants, so we're not
   reliant on recent clk patches.
---
 .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
new file mode 100644
index 000000000000..fcc3dbff9c9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c-master@2000 {
+        compatible = "aspeed,ast2600-i3c";
+        reg = <0x2000 0x1000>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+        clocks = <&syscon 0>;
+        resets = <&syscon 0>;
+        aspeed,global-regs = <&i3c_global 0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i3c1_default>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
