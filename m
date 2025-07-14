Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0872C83F25
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Jul 2025 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8rmw/Ahk1lFouSUWqhD/4rL5+jCwW/lGXpyAM1CTPo=; b=gG8BNLTlYTNzXZ
	f+wbGlCH+s69AJFKqijpZ6CcfUY1h+ChQwreACPm2UVoVDIhZ+Wa5estzylBuElzMu835SZFBpKxt
	pjXWl9C2G5vqk2Ig4ZuADv3vc7v4ofEnExDbg0G+nK0aXhQs3Sq5coGPh/GdTVqD1dAGaO1Ui3QXx
	wlgmeftMh8vlJ2HpCsNxPlh4LkJ5DumSj6wBTlRxSJrEAhlCYHlqLS8GwuUKVJ0aUYgoeUmgYPL86
	AiYCgCRxs2ttHXh2Jnk/H4UPbLfvM0UxtL/fUP1FdNjW0gd3u6LllfxwUOrNbkZVF8PdPtnyimEJ4
	/SotA7JAkNREHuppvOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFG3-00000001kAT-2AuM;
	Mon, 14 Jul 2025 09:13:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFEb-00000001jpE-2ctp
	for linux-i3c@lists.infradead.org;
	Mon, 14 Jul 2025 09:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=nxWe1OPboBVBbMmD1o6/1jTXm4QcpGIxaNX7jN0TAqQ=; b=TIJHN0
	FzRoRzU10kyPGOWCm8oGtY+bZt2ZdGEH0FBNlfBE+jWdhWR6xBM0Qt5BCR0EPIpd
	hbf2ASR/dZNO2RNRmCZqZ+TcNqp9WzaKGZmY8hpmZ2PMPPZBAk3yk/z9XLSuTg2q
	KZY9Ab7KqxjZ7nUGCOiqQkO7LtBZVWoGzwwRxMCVepcwsF6wjiOKJlyuJBh34Di6
	h1VRZk4RSh0wsi+cIqdGBn4LO0tR76Y6A/VHBww304/D+BCJqwB8pSTFDEybn6MG
	qZNj3WuOFcLw6BY9yNffZiWHbUtdQmPXVJEr1/uOTcuX2UNF8KAmZ01hxinC+OVb
	3YcZo+ZLkE1Z9HLg==
Received: (qmail 2399856 invoked from network); 14 Jul 2025 11:12:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2025 11:12:24 +0200
X-UD-Smtp-Session: l3s3148p1@m8nQDuA5duYgAwDPXxNjAMIr4MhSGEU6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: i3c: renesas,i3c: Add binding for Renesas I3C controller
Date: Mon, 14 Jul 2025 11:12:08 +0200
Message-ID: <20250714091211.20497-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
References: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_021230_555969_989BFE4A 
X-CRM114-Status: GOOD (  11.37  )
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

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Available in R9A08G045 (RZ/G3S), R9A09G047 (RZ/G3E) SoCs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC:
* resorted the clks, so G3S can only have the first two while G3E needs
    needs all three

 .../devicetree/bindings/i3c/renesas,i3c.yaml  | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
new file mode 100644
index 000000000000..f53a176cad2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a08g045-i3c # RZ/G3S
+          - renesas,r9a09g047-i3c # RZ/G3E
+      - const: renesas,i3c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Non-recoverable internal error interrupt
+      - description: Normal transfer error interrupt
+      - description: Normal transfer abort interrupt
+      - description: Normal response status buffer full interrupt
+      - description: Normal command buffer empty interrupt
+      - description: Normal IBI status buffer full interrupt
+      - description: Normal Rx data buffer full interrupt
+      - description: Normal Tx data buffer empty interrupt
+      - description: Normal receive status buffer full interrupt
+      - description: START condition detection interrupt
+      - description: STOP condition detection interrupt
+      - description: Transmit end interrupt
+      - description: NACK detection interrupt
+      - description: Arbitration lost interrupt
+      - description: Timeout detection interrupt
+      - description: Wake-up condition detection interrupt
+      - description: HDR Exit Pattern detection interrupt
+    minItems: 16
+
+  interrupt-names:
+    items:
+      - const: ierr
+      - const: terr
+      - const: abort
+      - const: resp
+      - const: cmd
+      - const: ibi
+      - const: rx
+      - const: tx
+      - const: rcv
+      - const: st
+      - const: sp
+      - const: tend
+      - const: nack
+      - const: al
+      - const: tmo
+      - const: wu
+      - const: exit
+    minItems: 16
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: transfer clock
+      - description: SFRs clock
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: tclk
+      - const: pclkrw
+    minItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Reset signal
+      - description: APB interface reset signal/SCAN reset signal
+
+  reset-names:
+    items:
+      - const: presetn
+      - const: tresetn
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clock-names
+  - clocks
+  - power-domains
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: i3c.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-i3c
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        interrupts:
+          minItems: 17
+        interrupt-names:
+          minItems: 17
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-i3c
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        interrupts:
+          maxItems: 16
+        interrupt-names:
+          maxItems: 16
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c@1005b000 {
+        compatible = "renesas,r9a08g045-i3c", "renesas,i3c";
+        reg = <0x1005b000 0x1000>;
+        clocks = <&cpg CPG_MOD R9A08G045_I3C_PCLK>,
+                 <&cpg CPG_MOD R9A08G045_I3C_TCLK>;
+        clock-names = "pclk", "tclk";
+        interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 294 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "ierr", "terr", "abort", "resp",
+                          "cmd", "ibi", "rx", "tx", "rcv",
+                          "st", "sp", "tend", "nack",
+                          "al", "tmo", "wu", "exit";
+        resets = <&cpg R9A08G045_I3C_PRESETN>,
+                 <&cpg R9A08G045_I3C_TRESETN>;
+        reset-names = "presetn", "tresetn";
+        power-domains = <&cpg>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
