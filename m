Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7C5FCC9D3
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 06:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3faj+klwdCe+BMY/2DzUn7gIRF/6mP35pOfhFSiFxAM=; b=imSGo2Hfmqs7s8
	No8eYMWmbuWWS4Rw7ziatDY3FNNAebqPWE5AXqwREgz/EUfC2EWt5mXvjWLdTN6uBCX4ylEEjRdti
	tv0jNjeZ2M1EjHjxZdoRJnkGUbucjVs50+F5I1Tc//6qXRwI8aTF2+TfzrBZPLSXyw9raugkhkOsb
	u2YhNwMd7mmtCTfLQTp7SuyJWajjzdZwssvvR65nHq70Q7wgq1yEiJ9K+C9ZkvD0ZKJraYWE7FqEi
	O93Qh5gL0io8TuK5bbfwR590kKUDr/mE1y2NvKLEghe1REocVHpADVs66jbPKD2EAznDBmURPFuVw
	BGbfYaXxESaZ3vI/rJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzr2E-00000008p8l-3DYv;
	Tue, 10 Mar 2026 06:57:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzr2B-00000008p6K-2Z1X
	for linux-i3c@bombadil.infradead.org;
	Tue, 10 Mar 2026 06:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MY7QUfhsHsRfzF78Mdr7r1JkN/9UCP2YpeXKBT7Qf/o=; b=XOGIMJ2rzW8bsjjp4q0rBPuppN
	Oqq7r/aISPHh1JtByXbGtITdauBkO7U0ysmUsfrVTVL1T8eW9BmtrO96zHy1TIhv/nj9FABh6in0u
	A3bTPn/85K9Vz7TNyrO0by4yCjGhjwJW3IL02RxIA749WnHkhNmWeLa7HYFyxGxbni1pc7g9bKQmS
	WHegRAcFsvotiJoWVe2xZHifAwTq409oH1iH7W1F1gAcUPYPlxEB9/asdncf33c2WWsJHnWV64Ra6
	nBXUF7eZEvh1CYr0A8WxWHJrviXoNEQ8FDjJ4m8Vus9uBy/CCaxEaAznnhP9yrqoSIZI+g0sek0k/
	d4OtkU/w==;
Received: from inva020.nxp.com ([92.121.34.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzr27-0000000DpnA-2ZNf
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 06:57:37 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C45AD1A1ED7;
	Tue, 10 Mar 2026 07:57:33 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8D9171A1EF1;
	Tue, 10 Mar 2026 07:57:33 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 3BB4218000A4;
	Tue, 10 Mar 2026 14:57:32 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
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
	aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: [PATCH v6 3/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Date: Tue, 10 Mar 2026 12:27:23 +0530
Message-Id: <20260310065727.3759342-3-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_065736_015310_9FCEC0C1 
X-CRM114-Status: GOOD (  14.38  )
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

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
multiport I3C hub family. These devices connect to a host via
I3C/I2C/SMBus and allow communication with multiple downstream
peripherals.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

---
Changes in v6:
 - Use a vendor prefix for the attributes

Changes in v5:
 - Removed SW properties: cp0-ldo-microvolt,cp1-ldo-microvolt,
   tp0145-ldo-microvolt, tp2367-ldo-microvolt
 - Changed supply entries and its descriptions

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
 .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 209 ++++++++++++++++++
 MAINTAINERS                                   |   8 +
 2 files changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml

diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
new file mode 100644
index 000000000000..e592952e8164
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
@@ -0,0 +1,209 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/nxp,p3h2840.yaml#
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
+    const: nxp,p3h2840
+
+  nxp,tp0145-pullup-ohms:
+    description:
+      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
+    enum: [250, 500, 1000, 2000]
+    default: 500
+
+  nxp,tp2367-pullup-ohms:
+    description:
+      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
+    enum: [250, 500, 1000, 2000]
+    default: 500
+
+  nxp,cp0-io-strength-ohms:
+    description:
+      Selects the IO drive strength for controller Port 0, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  nxp,cp1-io-strength-ohms:
+    description:
+      Selects the IO drive strength for controller Port 1, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  nxp,tp0145-io-strength-ohms:
+    description:
+      Selects the IO drive strength for target port 0/1/4/5, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  nxp,tp2367-io-strength-ohms:
+    description:
+      Selects the IO drive strength for target port 2/3/6/7, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  vcc1-supply:
+    description: Controller port 0 power supply.
+
+  vcc2-supply:
+    description: Controller port 1 power supply.
+
+  vcc3-supply:
+    description: Target port 0/1/4/5 power supply.
+
+  vcc4-supply:
+    description: Target port 2/3/6/7 power supply.
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      ldo-cp0:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      ldo-cp1:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      ldo-tpg0:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      ldo-tpg1:
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
+        maximum: 7
+
+      nxp,pullup-enable:
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
+        maximum: 7
+
+      nxp,pullup-enable:
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
+            nxp,tp0145-pullup-ohms = <1000>;
+            nxp,tp2367-pullup-ohms = <1000>;
+            nxp,cp0-io-strength-ohms = <50>;
+            nxp,cp1-io-strength-ohms = <50>;
+            nxp,tp0145-io-strength-ohms = <50>;
+            nxp,tp2367-io-strength-ohms = <50>;
+            vcc3-supply = <&reg_tpg0>;
+            vcc4-supply = <&reg_tpg1>;
+
+            regulators {
+                reg_cp0: ldo-cp0 {
+                    regulator-name = "ldo-cp0";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_cp1: ldo-cp1 {
+                    regulator-name = "ldo-cp1";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_tpg0: ldo-tpg0 {
+                    regulator-name = "ldo-tpg0";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_tpg1: ldo-tpg1 {
+                    regulator-name = "ldo-tpg1";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+            };
+
+            smbus@0 {
+                reg = <0x0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                nxp,pullup-enable;
+            };
+
+            i2c@1 {
+                reg = <0x1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                nxp,pullup-enable;
+            };
+
+            i3c@2 {
+                reg = <0x2>;
+                #address-cells = <3>;
+                #size-cells = <0>;
+                nxp,pullup-enable;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..06b803d6f45d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19107,6 +19107,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/ptp/nxp,ptp-netc.yaml
 F:	drivers/ptp/ptp_netc.c
 
+NXP P3H2X4X I3C-HUB DRIVER
+M:	Vikash Bansal <vikash.bansal@nxp.com>
+M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+L:	linux-kernel@vger.kernel.org
+L:	linux-i3c-owner@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
 M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
 S:	Maintained
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
