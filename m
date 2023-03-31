Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810CBC6FD18
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Mar 2023 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGUGKW155Ak+eUtxZVRESw7QzxQikn3Il1a8XtDi5hs=; b=Qj8sXuJmuXuibM
	XD+42HEww98o2CqsZPEVB+efSfBqW7hTpQRDPoKjUZdb9Q81mMwvx3YWYRD7cj5YvtsaW3c0U3Bcz
	BYzEncXKq21+bzqK6XLlrADqSeravhc0+rYYDoAmFjgnfQglbSMmOhvw8ONoFNgWyWfpj70q8zTR4
	0Fx6FNBBfq74datNiwft3k9TvEQmaJoya/xB0RsF9jJf+jjXzKv5uCkbVdYmxmkC5YxcGHJv3kNiI
	/2sMPT6fLhJJlh19+qviW6hcEBQbaECtHcBIUfBzYsvSEEo6x0ITt9nxWFlE3fmQQxIIZ9k2V66+o
	lDpXQDe6FnD0RdO6oIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piArB-006dQE-32;
	Fri, 31 Mar 2023 09:15:37 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAr7-006dLw-24
	for linux-i3c@lists.infradead.org;
	Fri, 31 Mar 2023 09:15:35 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 9DC10203E4; Fri, 31 Mar 2023 17:15:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680254114;
	bh=4i6zbPriP30VDqxbtLw8DULJL2d8uZhDMuiqyIgkVgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=llF+FE5l2BTyEOtFdJl1ZHwWFVvFUruhmn50cOTFqKwvroSsYIYR3jOcgxj9o27gg
	 5SJiv06viDhRw3SPrdDRDyQ2OILIRaIMp80XtSzZbU6YiWBf/OQ7PGS/xLpj7/X+CQ
	 RfhUiynEx2JxXgsbz8dgz8/ipMoLjuJ1esyUTVlTVPJ7g6O3ED3KDtQSEj/orsHY6v
	 7fbUSswN0vE0YCfxGeNdTkrJ3mR/HX6+t5AsFci+VUGc6o5ZmB6bKpAN9PR1UBWF/F
	 +jPv8qQfT8Ru9Vq6WY6lyAfE00tv2X3rX0IFmNCxswOwUv4WB0kmO+RiLwoop59wvA
	 ILzrdfHa7c9Dg==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 2/3] dt-bindings: i3c: Add AST2600 i3c controller
Date: Fri, 31 Mar 2023 17:15:00 +0800
Message-Id: <20230331091501.3800299-3-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230331091501.3800299-1-jk@codeconstruct.com.au>
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_021533_879802_C5F5D4E4 
X-CRM114-Status: GOOD (  12.45  )
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
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
