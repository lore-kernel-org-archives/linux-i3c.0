Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D8E60A260C
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EkPCM85J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OsTk78it1ZM3Mid+F4DkH4eACV4bApl6wFah4P+Mpag=; b=EkPCM85JRhK+uw19XgyVCcxFl3
	AmjlEH/xpOsTBZyov5NxcSyoPflFACHTwRcRrPYQS4I/ulg6NTq9wlqKcHb12/DB+VoR+ofxSZ8ig
	YiGVYRyXrdXTrWZbD6TEUH/tDZk8j2VGIUZ4wGOu7NC1Y40d7kxxKRmvglm25VQmOwxH/cofKp85Y
	Xtn9IHIRuiEL9TPzI2OVnp+mAnDLxJEAMgQjYdkfzhwiqOpKmB+Yi+zb0cPfu2miinTlNB9+CDyeA
	X+iEHY45/A+VFHbnTJYMRkzpkU78nmsnlGzyrVnIOaZW75y0cDZuCj9dEGsWi4/Jdb3H3n8j3D7lg
	v2T/CvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypQ-00000005WLC-2VI8;
	Wed, 11 Nov 2026 03:16:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypN-00000005WER-0JzJ;
	Wed, 11 Nov 2026 03:16:50 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 11 Nov 2026 11:16:30 +0800
Subject: [PATCH v2 2/9] dt-bindings: i3c: Document the AST2700 I3C
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-2-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
CC: <tbevis@amazon.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=4018;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=C7LPU47uCZf5PPs+zL2heQyebkx3hyevu7kHTop8XYA=;
 b=C5w0tgnbjl+kPCYW/DP5xE3+7DqdIX0sv2WA1xt/Uef0X70Oj+iPFJLJ6MC91BmLvag49ScN3
 BwtoHa8o8nhCrF9EDbHA0drYLD0Ex2K4q3MOEIHmXhsjcyPFb1Gbrs3
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_191649_179273_B0EFEEFF 
X-CRM114-Status: GOOD (  13.99  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AST2700 I3C controller implements the MIPI I3C HCI programming
model, extended with an ASPEED in-house control block and a PHY
programming window advertised through an HCI vendor extended
capability.

The controller takes a core clock for PHY timing and two resets,
named in reset-names as the controller's own reset and its DMA engine
reset.

Boards without external I3C pull-up resistors can use the PHY's
built-in pull-ups instead, selected with bias-pull-up; the achievable
strength set depends on which pin group backs the bus, since that
fixes the pin voltage domain. Reuse bias-pull-up (pincfg-node.yaml)
for the strength in Ohms; it is declared on this node rather than a
pin-config node since the pull-up switch is part of the I3C PHY, not
the broader SoC pin control IPs.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

---
We considered expressing bias-pull-up's dependency on a pinctrl state
in the schema, but couldn't find a clean way to say "depends on
whichever pinctrl-N is active" without hard-coding pinctrl-0
specifically, which would be wrong in general (a node's active pin
state doesn't have to sit at index 0). We've added pinctrl-0 to the
example to illustrate the typical usage instead, without a formal
schema-level dependency.
---
 .../bindings/i3c/aspeed,ast2700-i3c-hci.yaml       | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2700-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2700-i3c-hci.yaml
new file mode 100644
index 000000000000..873398cbbcf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2700-i3c-hci.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/aspeed,ast2700-i3c-hci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 I3C controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  The AST2700 I3C controller implements the MIPI I3C HCI programming model,
+  extended with an ASPEED in-house control block and a PHY programming window
+  that are advertised through an HCI vendor extended capability.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-i3c-hci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Core controller reset.
+      - description: DMA engine reset shared by all I3C controllers.
+
+  reset-names:
+    items:
+      - const: core
+      - const: dma
+
+  bias-pull-up:
+    $ref: /schemas/pinctrl/pincfg-node.yaml#/properties/bias-pull-up
+    enum: [177, 231, 261, 317, 400, 470, 550, 600, 750]
+    description:
+      Enable the PHY-internal pull-ups on SCL and SDA and select their
+      strength, in Ohms. High-voltage pins support 400, 470 or 600 Ohms, and
+      low-voltage pins support 177, 231, 261, 317, 400, 550 or 750 Ohms. When
+      absent the internal pull-ups stay disabled and the bus relies on
+      external pull-ups.
+
+  i3c-od-scl-high-period-ns:
+    default: 380
+
+  i3c-od-scl-low-period-ns:
+    default: 620
+
+  i3c-pp-sda-hold-ns:
+    default: 10
+
+  i3c-sr-p-scl-low-period-ns:
+    default: 40
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: i3c.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i3c@14c24000 {
+        compatible = "aspeed,ast2700-i3c-hci";
+        reg = <0x14c24000 0x1000>;
+        interrupts = <100>;
+        clocks = <&syscon 20>;
+        resets = <&syscon 37>, <&syscon 34>;
+        reset-names = "core", "dma";
+        bias-pull-up = <177>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i3c4_default>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
