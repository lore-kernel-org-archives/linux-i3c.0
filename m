Return-Path: <SRS0=pX9d=GY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57D2C433DB
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Jan 2021 10:18:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9EC221F8
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Jan 2021 10:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B9EC221F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VHm1HLS0GuNnmtDhVXykqLxrb/QV061XXCH+p4k8RW4=; b=y1VcUkgbAngMwTBK3+ONLoD/f
	gfVhFoQy7gFYChujh7V1aN4FWtrfE+FGfFFXp3fZPvg0fOx5udYtMRld0GVWPuVVDkWl57NvILzOL
	LAt7h/v6I6oPrphVFPaeTyb8MSr7evG8zuNbD1GQwuizggb+fIQQfT2LBjNsk8r8BcyMShlXKixW9
	mh43SbwU/cpKyooMDVWkVco0KCJawFT8bXc9m2kalpEY7myUOl7HKCqInoB7lUL9kGlzfZOFv43UB
	7nR/GV+Kof59FVA8zywit1M4gUM2jQZLPf5tPj67C5khwWihi8JXBDRSTf9Xec2ytJ1iB0shYUbQK
	UmhJnCD6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2X2g-0002sp-6Y; Thu, 21 Jan 2021 10:18:18 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2X2d-0002rT-HY
 for linux-i3c@lists.infradead.org; Thu, 21 Jan 2021 10:18:17 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 21E4920005;
 Thu, 21 Jan 2021 10:18:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v5 1/6] dt-bindings: i3c: Convert the bus description to yaml
Date: Thu, 21 Jan 2021 11:18:03 +0100
Message-Id: <20210121101808.14654-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121101808.14654-1-miquel.raynal@bootlin.com>
References: <20210121101808.14654-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_051815_763955_63317E5C 
X-CRM114-Status: GOOD (  26.20  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Conor Culhane <conor.culhane@silvaco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nicolas Pitre <nico@fluxnic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Attempting a conversion of the i3c.txt file to yaml schema with
minimal content changes.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/i3c/i3c.txt | 140 --------------
 .../devicetree/bindings/i3c/i3c.yaml          | 179 ++++++++++++++++++
 2 files changed, 179 insertions(+), 140 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
deleted file mode 100644
index 4ffe059f0fec..000000000000
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ /dev/null
@@ -1,140 +0,0 @@
-Generic device tree bindings for I3C busses
-===========================================
-
-This document describes generic bindings that should be used to describe I3C
-busses in a device tree.
-
-Required properties
--------------------
-
-- #address-cells  - should be <3>. Read more about addresses below.
-- #size-cells     - should be <0>.
-- compatible      - name of the I3C master controller driving the I3C bus
-
-For other required properties e.g. to describe register sets,
-clocks, etc. check the binding documentation of the specific driver.
-The node describing an I3C bus should be named i3c-master.
-
-Optional properties
--------------------
-
-These properties may not be supported by all I3C master drivers. Each I3C
-master bindings should specify which of them are supported.
-
-- i3c-scl-hz: frequency of the SCL signal used for I3C transfers.
-	      When undefined the core sets it to 12.5MHz.
-
-- i2c-scl-hz: frequency of the SCL signal used for I2C transfers.
-	      When undefined, the core looks at LVR (Legacy Virtual Register)
-	      values of I2C devices described in the device tree to determine
-	      the maximum I2C frequency.
-
-I2C devices
-===========
-
-Each I2C device connected to the bus should be described in a subnode. All
-properties described in Documentation/devicetree/bindings/i2c/i2c.txt are
-valid here, but several new properties have been added.
-
-New constraint on existing properties:
---------------------------------------
-- reg: contains 3 cells
-  + first cell : still encoding the I2C address. 10 bit addressing is not
-    supported. Devices with 10 bit address can't be properly passed through
-    DEFSLVS command.
-
-  + second cell: shall be 0
-
-  + third cell: shall encode the I3C LVR (Legacy Virtual Register)
-	bit[31:8]: unused/ignored
-	bit[7:5]: I2C device index. Possible values
-	* 0: I2C device has a 50 ns spike filter
-	* 1: I2C device does not have a 50 ns spike filter but supports high
-	     frequency on SCL
-	* 2: I2C device does not have a 50 ns spike filter and is not tolerant
-	     to high frequencies
-	* 3-7: reserved
-
-	bit[4]: tell whether the device operates in FM (Fast Mode) or FM+ mode
-	* 0: FM+ mode
-	* 1: FM mode
-
-	bit[3:0]: device type
-	* 0-15: reserved
-
-The I2C node unit-address should always match the first cell of the reg
-property: <device-type>@<i2c-address>.
-
-I3C devices
-===========
-
-All I3C devices are supposed to support DAA (Dynamic Address Assignment), and
-are thus discoverable. So, by default, I3C devices do not have to be described
-in the device tree.
-This being said, one might want to attach extra resources to these devices,
-and those resources may have to be described in the device tree, which in turn
-means we have to describe I3C devices.
-
-Another use case for describing an I3C device in the device tree is when this
-I3C device has a static I2C address and we want to assign it a specific I3C
-dynamic address before the DAA takes place (so that other devices on the bus
-can't take this dynamic address).
-
-The I3C device should be names <device-type>@<static-i2c-address>,<i3c-pid>,
-where device-type is describing the type of device connected on the bus
-(gpio-controller, sensor, ...).
-
-Required properties
--------------------
-- reg: contains 3 cells
-  + first cell : encodes the static I2C address. Should be 0 if the device does
-		 not have one (0 is not a valid I2C address).
-
-  + second and third cells: should encode the ProvisionalID. The second cell
-			    contains the manufacturer ID left-shifted by 1.
-			    The third cell contains ORing of the part ID
-			    left-shifted by 16, the instance ID left-shifted
-			    by 12 and the extra information. This encoding is
-			    following the PID definition provided by the I3C
-			    specification.
-
-Optional properties
--------------------
-- assigned-address: dynamic address to be assigned to this device. This
-		    property is only valid if the I3C device has a static
-		    address (first cell of the reg property != 0).
-
-
-Example:
-
-	i3c-master@d040000 {
-		compatible = "cdns,i3c-master";
-		clocks = <&coreclock>, <&i3csysclock>;
-		clock-names = "pclk", "sysclk";
-		interrupts = <3 0>;
-		reg = <0x0d040000 0x1000>;
-		#address-cells = <3>;
-		#size-cells = <0>;
-		i2c-scl-hz = <100000>;
-
-		/* I2C device. */
-		nunchuk: nunchuk@52 {
-			compatible = "nintendo,nunchuk";
-			reg = <0x52 0x0 0x10>;
-		};
-
-		/* I3C device with a static I2C address. */
-		thermal_sensor: sensor@68,39200144004 {
-			reg = <0x68 0x392 0x144004>;
-			assigned-address = <0xa>;
-		};
-
-		/*
-		 * I3C device without a static I2C address but requiring
-		 * resources described in the DT.
-		 */
-		sensor@0,39200154004 {
-			reg = <0x0 0x392 0x154004>;
-			clocks = <&clock_provider 0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
new file mode 100644
index 000000000000..52042aa44d19
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/i3c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I3C bus binding
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+description: |
+  I3C busses can be described with a node for the primary I3C controller device
+  and a set of child nodes for each I2C or I3C slave on the bus. Each of them
+  may, during the life of the bus, request mastership.
+
+properties:
+  $nodename:
+    pattern: "^i3c-master@[0-9a-f]+$"
+
+  "#address-cells":
+    const: 3
+    description: |
+      Each I2C device connected to the bus should be described in a subnode.
+
+      All I3C devices are supposed to support DAA (Dynamic Address Assignment),
+      and are thus discoverable. So, by default, I3C devices do not have to be
+      described in the device tree. This being said, one might want to attach
+      extra resources to these devices, and those resources may have to be
+      described in the device tree, which in turn means we have to describe
+      I3C devices.
+
+      Another use case for describing an I3C device in the device tree is when
+      this I3C device has a static I2C address and we want to assign it a
+      specific I3C dynamic address before the DAA takes place (so that other
+      devices on the bus can't take this dynamic address).
+
+  "#size-cells":
+    const: 0
+
+  i3c-scl-hz:
+    description: |
+      Frequency of the SCL signal used for I3C transfers. When undefined, the
+      default value should be 12.5MHz.
+
+      May not be supported by all controllers.
+
+  i2c-scl-hz:
+    description: |
+      Frequency of the SCL signal used for I2C transfers. When undefined, the
+      default should be to look at LVR (Legacy Virtual Register) values of
+      I2C devices described in the device tree to determine the maximum I2C
+      frequency.
+
+      May not be supported by all controllers.
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "@[0-9a-f]+$":
+    type: object
+    description: |
+      I2C child, should be named: <device-type>@<i2c-address>
+
+      All properties described in Documentation/devicetree/bindings/i2c/i2c.txt
+      are valid here, except the reg property whose content is changed.
+
+    properties:
+      compatible:
+        description:
+          Compatible of the I2C device.
+
+      reg:
+        items:
+          - items:
+              - description: |
+                  I2C address. 10 bit addressing is not supported. Devices with
+                  10-bit address can't be properly passed through DEFSLVS
+                  command.
+                minimum: 0
+                maximum: 0x7f
+              - const: 0
+              - description: |
+                  Shall encode the I3C LVR (Legacy Virtual Register):
+                    bit[31:8]: unused/ignored
+                    bit[7:5]: I2C device index. Possible values:
+                      * 0: I2C device has a 50 ns spike filter
+                      * 1: I2C device does not have a 50 ns spike filter but
+                           supports high frequency on SCL
+                      * 2: I2C device does not have a 50 ns spike filter and is
+                           not tolerant to high frequencies
+                      * 3-7: reserved
+                    bit[4]: tell whether the device operates in FM (Fast Mode)
+                            or FM+ mode:
+                      * 0: FM+ mode
+                      * 1: FM mode
+                    bit[3:0]: device type
+                      * 0-15: reserved
+
+    required:
+      - compatible
+      - reg
+
+  "@[0-9a-f]+,[0-9a-f]+$":
+    type: object
+    description: |
+      I3C child, should be named: <device-type>@<static-i2c-address>,<i3c-pid>
+
+    properties:
+      reg:
+        items:
+          - items:
+              - description: |
+                  Encodes the static I2C address. Should be 0 if the device does
+                  not have one (0 is not a valid I2C address).
+                minimum: 0
+                maximum: 0x7f
+              - description: |
+                  First half of the Provisional ID (following the PID
+                  definition provided by the I3C specification).
+
+                  Contains the manufacturer ID left-shifted by 1.
+              - description: |
+                  Second half of the Provisional ID (following the PID
+                  definition provided by the I3C specification).
+
+                  Contains the ORing of the part ID left-shifted by 16,
+                  the instance ID left-shifted by 12 and extra information.
+
+      assigned-address:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0x1
+        maximum: 0xff
+        description: |
+          Dynamic address to be assigned to this device. This property is only
+          valid if the I3C device has a static address (first cell of the reg
+          property != 0).
+
+    required:
+      - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    i3c-master@d040000 {
+        compatible = "cdns,i3c-master";
+        clocks = <&coreclock>, <&i3csysclock>;
+        clock-names = "pclk", "sysclk";
+        interrupts = <3 0>;
+        reg = <0x0d040000 0x1000>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+        i2c-scl-hz = <100000>;
+
+        /* I2C device. */
+        nunchuk: nunchuk@52 {
+            compatible = "nintendo,nunchuk";
+            reg = <0x52 0x0 0x10>;
+        };
+
+        /* I3C device with a static I2C address. */
+        thermal_sensor: sensor@68,39200144004 {
+            reg = <0x68 0x392 0x144004>;
+            assigned-address = <0xa>;
+        };
+
+        /*
+         * I3C device without a static I2C address but requiring
+         * resources described in the DT.
+         */
+        sensor@0,39200154004 {
+            reg = <0x0 0x392 0x154004>;
+            clocks = <&clock_provider 0>;
+        };
+    };
-- 
2.20.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
