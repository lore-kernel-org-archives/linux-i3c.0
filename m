Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51CFC433F5
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Apr 2022 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NfYmhwQBmwJuW1+jh/TCgInBkAQaoAM9ZXT5GtsWZC0=; b=wRIqqr5Stx5a8t
	zTIDdbrIOMNJ5y47//ukvN2ItEq9c7/gYpluFJ9+i0uRlX2WRYwBKNr9oOh6ito8W9xOLbIF+E2Hd
	txzmHgDL8JhosVgYrhZ5P0SfqPL4xj9UGm//lRmzvuhiEP2EY1H5AETHd5Ki6AvGTBuwF+g0CA71M
	z0V6c/I67aDe8I4+ufc0hPsCz3rUtSO+MsBa/s6nVUtgcSPTZqtYQqF4zJ0fw+yPllrwPECrK6Wsw
	EZcYsmZgUqT+sPSR5tTZ2JhQ14lDypPK4eGeL+u0bnGf94yOul7qANpZpqMlyTJvfhIIpSU4aibsP
	OApAc/zm+JF5enI3S1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhyrV-0027bS-S0; Fri, 22 Apr 2022 19:22:37 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhyrT-0027a4-J4
 for linux-i3c@lists.infradead.org; Fri, 22 Apr 2022 19:22:37 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so9615621fac.7
 for <linux-i3c@lists.infradead.org>; Fri, 22 Apr 2022 12:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ESSxqxOQpi/fkkAwzK1UrVnLgRLoSXvjLv+Y8gGFxH8=;
 b=KkpsH737V3LHFWu115o+d4+8vBo1sLh3oX8AZ+5D2P+Lx2Ec8lFTmxy8WgvMUCB5L7
 KW6e2FZFdRiGes9+y+tM8+esKLYQpuqfgjt94nZKNpyPcdxqZoVDPvArSIXIqEftfFlt
 YOXx36/flAhlspPBSr2FSzc7G7R40n6aIPbL9zKyJ9N/UHBqCXiKK0BZj7aCcBM+7okt
 fg+iQ3j0L4TL6OGjt4GBbZinlgtxSqMv8IPwh7xyfeEDLIZQ96a5/rUlc0VBJUcSnX2J
 Wd3w9D6+NXfV+LAbBFWGQu4WWe4NTpSK0uP/v0yYm3qVOsBLMYZLLw3mHVm+4SQBZNUN
 UUNg==
X-Gm-Message-State: AOAM5324opFYsaMnM+b4LRsieYNcdMsjj2bFnt2i+VIqljlz39vzuJmR
 P7EGfcHrGwxg89SIXgEWr/54YOsIHg==
X-Google-Smtp-Source: ABdhPJzTgaHRHiSVw3JzlGm13jAQRd5uoKS4VQdRiI/I0L2A+6xlR5NxOtX6aFqeBAGEY8uYjV7r1g==
X-Received: by 2002:a05:6870:2314:b0:e2:a480:eb4d with SMTP id
 w20-20020a056870231400b000e2a480eb4dmr2580363oao.133.1650655353558; 
 Fri, 22 Apr 2022 12:22:33 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 oa9-20020a056870bc0900b000e60e510d5esm928487oab.25.2022.04.22.12.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 12:22:33 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i3c: Convert cdns,i3c-master to DT schema
Date: Fri, 22 Apr 2022 14:22:23 -0500
Message-Id: <20220422192224.2594098-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_122235_661464_024CECBE 
X-CRM114-Status: GOOD (  16.31  )
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

Convert the Cadence I3C master to DT schema format. This fixes a warning
as it is used in the i3c.yaml example.

The "nintendo,nunchuk" is not documented by a schema, so change the
example child device to something which is documented.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/i3c/cdns,i3c-master.txt          | 43 -------------
 .../bindings/i3c/cdns,i3c-master.yaml         | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
deleted file mode 100644
index 3716589d6999..000000000000
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Bindings for cadence I3C master block
-=====================================
-
-Required properties:
---------------------
-- compatible: shall be "cdns,i3c-master"
-- clocks: shall reference the pclk and sysclk
-- clock-names: shall contain "pclk" and "sysclk"
-- interrupts: the interrupt line connected to this I3C master
-- reg: I3C master registers
-
-Mandatory properties defined by the generic binding (see
-Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
-
-- #address-cells: shall be set to 1
-- #size-cells: shall be set to 0
-
-Optional properties defined by the generic binding (see
-Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
-
-- i2c-scl-hz
-- i3c-scl-hz
-
-I3C device connected on the bus follow the generic description (see
-Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
-
-Example:
-
-	i3c-master@0d040000 {
-		compatible = "cdns,i3c-master";
-		clocks = <&coreclock>, <&i3csysclock>;
-		clock-names = "pclk", "sysclk";
-		interrupts = <3 0>;
-		reg = <0x0d040000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		i2c-scl-hz = <100000>;
-
-		nunchuk: nunchuk@52 {
-			compatible = "nintendo,nunchuk";
-			reg = <0x52 0x0 0x10>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
new file mode 100644
index 000000000000..cc40d25358ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/cdns,i3c-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence I3C master block
+
+maintainers:
+  - Boris Brezillon <bbrezillon@kernel.org>
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  compatible:
+    const: cdns,i3c-master
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: sysclk
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+unevaluatedProperties: false
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
+        eeprom@57{
+            compatible = "atmel,24c01";
+            reg = <0x57 0x0 0x10>;
+            pagesize = <0x8>;
+        };
+    };
+...
-- 
2.32.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
