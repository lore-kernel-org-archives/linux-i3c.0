Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E82BD0C857
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3F+XGAA8l41oP4PcZXwDpymA2Kmb1GSpvrV8IpDN2M=; b=aqWRhl/+T7r7A0
	PfpmcuXl3cah4oCj20eHTaNS1m4etsGyHkLBkTWxFj6cai1BNP3+uSh4aiXl4Sp51H32wer2C89dQ
	toQ+mzTUxUcmk5+UOkWsgzGsh1gZR/zm4DcTaYwXbtXZacDWwKdRWBQozNDf+eONVpv850BWhwnP3
	Kd9qtNCxZIFudziJsEgRzZBQ1A9+Tnr1BTIR0DfEmal4HP55y9fBKTHjgfd/V1NcP7bA80PNGflS/
	ANdRa9+yhFUhJLsdKOiHzb2EeVsg6L2LWf7mLdqpxZlba7YaBZTENmUT6EbfjGEadXD+i4W5L2RIM
	F9z4HPIdlaUvJzsaUx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcqQ-000000072G9-0BFk;
	Tue, 13 Jan 2026 11:45:54 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcqN-000000072F7-1WeA
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 11:45:53 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AF1D21A1C34;
	Tue, 13 Jan 2026 12:45:49 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9FEF31A22C3;
	Tue, 13 Jan 2026 12:45:49 +0100 (CET)
Received: from lsv15573.swis.ro-buh01.nxp.com (lsv15573.swis.ro-buh01.nxp.com [10.172.0.77])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9E0AB202F3;
	Tue, 13 Jan 2026 12:45:47 +0100 (CET)
From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: [PATCH v4 2/5] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Date: Tue, 13 Jan 2026 13:45:26 +0200
Message-Id: <20260113114529.1692213-2-aman.kumarpandey@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_034552_010391_8F265F87 
X-CRM114-Status: GOOD (  15.07  )
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

Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
multiport I3C hub family. These devices connect to a host via
I3C/I2C/SMBus and allow communication with multiple downstream
peripherals.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

---
Changes in v4:
 - Fixed DT binding check warning
 - Removed SW properties: ibi-enable, local-dev, and always-enable

Changes in v3:
 - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator
 - Added Regulator supply node

Changes in v2:
 - Fixed DT binding check warning
 - Revised logic for parsing DTS nodes
---
---
 .../bindings/mfd/nxp,p3h2840-i3c-hub.yaml     | 240 ++++++++++++++++++
 MAINTAINERS                                   |   8 +
 2 files changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml b/Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml
new file mode 100644
index 000000000000..b6853a1d1893
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml
@@ -0,0 +1,240 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 NXP
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,p3h2840-i3c-hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP P3H2X4X I3C HUB
+
+maintainers:
+  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+  - Vikash Bansal <vikash.bansal@nxp.com>
+
+description: |
+  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
+  hub devices that connect to:-
+  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to multiple
+     peripheral devices on the downstream  side.
+  2. Have two Controller Ports which can support either
+     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
+  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
+  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
+     Target ports can be configured as I2C/SMBus, I3C or GPIO and connect to
+     peripherals.
+
+allOf:
+  - $ref: /schemas/i3c/i3c.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: nxp,p3h2840
+
+  cp0-ldo-microvolt:
+    description:
+      Selects the voltage for controller Port 0, in microvolts.
+    enum: [1000000, 1100000, 1200000, 1800000]
+    default: 1000000
+
+  cp1-ldo-microvolt:
+    description:
+      Selects the voltage for controller Port 1, in microvolts.
+    enum: [1000000, 1100000, 1200000, 1800000]
+    default: 1000000
+
+  tp0145-ldo-microvolt:
+    description:
+      Selects the voltage for target Port 0/1/4/5, in microvolts.
+    enum: [1000000, 1100000, 1200000, 1800000]
+    default: 1000000
+
+  tp2367-ldo-microvolt:
+    description:
+      Selects the voltage for target Port 2/3/6/7, in microvolts.
+    enum: [1000000, 1100000, 1200000, 1800000]
+    default: 1000000
+
+  tp0145-pullup-ohms:
+    description:
+      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
+    enum: [250, 500, 1000, 2000]
+    default: 500
+
+  tp2367-pullup-ohms:
+    description:
+      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
+    enum: [250, 500, 1000, 2000]
+    default: 500
+
+  cp0-io-strength-ohms:
+    description:
+      Selects the IO drive strength for controller Port 0, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  cp1-io-strength-ohms:
+    description:
+      Selects the IO drive strength for controller Port 1, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  tp0145-io-strength-ohms:
+    description:
+      Selects the IO drive strength for target port 0/1/4/5, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  tp2367-io-strength-ohms:
+    description:
+      Selects the IO drive strength for target port 2/3/6/7, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  cp0-supply:
+    description: Phandle to voltage regulator providing power to controller port 0.
+
+  cp1-supply:
+    description: Phandle to voltage regulator providing power to controller port 1.
+
+  tp0145-supply:
+    description: Phandle to voltage regulator providing power to target port 0/1/4/5.
+
+  tp2367-supply:
+    description: Phandle to voltage regulator providing power to target port 2/3/6/7.
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      cp0:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      cp1:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      tp0145:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      tp2367:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+patternProperties:
+  "^i3c@[0-7]$":
+    type: object
+    $ref: /schemas/i3c/i3c.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          The I3C HUB Target Port number.
+        maxItems: 1
+
+      pullup-enable:
+        type: boolean
+        description:
+          Enables the on-die pull-up for Target Port.
+
+  "^(i2c|smbus)@[0-7]$":
+    type: object
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          The I3C HUB Target Port number.
+        maxItems: 1
+
+      pullup-enable:
+        type: boolean
+        description:
+          Enables the on-die pull-up for Target Port.
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i3c {
+        #address-cells = <3>;
+        #size-cells = <0>;
+
+        hub@70,236153000c2 {
+            reg = <0x70 0x236 0x3000c2>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            assigned-address = <0x50>;
+
+            cp0-ldo-microvolt = <1800000>;
+            cp1-ldo-microvolt = <1800000>;
+            tp0145-ldo-microvolt = <1800000>;
+            tp2367-ldo-microvolt = <1800000>;
+            tp0145-pullup-ohm = <1000>;
+            tp2367-pullup-ohm = <1000>;
+            cp0-io-strength-ohm = <50>;
+            cp1-io-strength-ohm = <50>;
+            tp0145-io-strength-ohm = <50>;
+            tp2367-io-strength-ohm = <50>;
+            cp0-supply = <&cp0>;
+            tp0145-supply = <&tp0145>;
+            tp2367-supply = <&tp2367>;
+
+            regulators {
+                cp0 {
+                    regulator-name = "cp0";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                cp1 {
+                    regulator-name = "cp1";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                tp0145 {
+                    regulator-name = "tp0145";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                tp2367 {
+                    regulator-name = "tp2367";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+            };
+
+            smbus@0 {
+                reg = <0x0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                pullup-enable;
+            };
+
+            i2c@1 {
+                reg = <0x1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                pullup-enable;
+            };
+
+            i3c@2 {
+                reg = <0x2>;
+                #address-cells = <3>;
+                #size-cells = <0>;
+                pullup-enable;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0d044a58cbfe..03a66efbcc4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18924,6 +18924,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
 F:	drivers/extcon/extcon-ptn5150.c
 
+NXP P3H2X4X I3C-HUB DRIVER
+M:	Vikash Bansal <vikash.bansal@nxp.com>
+M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+L:	linux-kernel@vger.kernel.org
+L:	linux-i3c-owner@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml
+
 NXP SGTL5000 DRIVER
 M:	Fabio Estevam <festevam@gmail.com>
 L:	linux-sound@vger.kernel.org
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
