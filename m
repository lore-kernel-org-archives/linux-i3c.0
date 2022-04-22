Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE050C433F5
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Apr 2022 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KNhKWRwO2MEaFDJopc1Lx+XRmPJtvYv4ADiQi930WoM=; b=4bmt3k1SywcxXe
	vwZxjqog0BH1z1df4uLFAlwem0utTtPiQ3X55mNsO3eqmMVxH2op1X5D2EEFMwXV2X1QT4K01cFWs
	LtQpxfTuSH4xOPNcgA6Lgy9vZYGnghYPmq8LVzvUuTpD64Y5dLKLpvdK/WToUF87zmGO0TdADGjvp
	6RT5oRysGb4dO7wivGnlgV9uIpdvndTeoZ2Bfe+GqCbNdY1gt1fYFhfaaqtqSnx7Lo+QsqhE3ey1B
	8j9M1JsjsA3pedrwdrTtnreDXflX9wxUDbF+yLdTBpTHIzHTFIDogvu640xZqyyZO+9/jkcz8s+7y
	aQYAJQyGZ7Lt3G0bVwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhyrk-0027gM-3l; Fri, 22 Apr 2022 19:22:52 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhyrh-0027fG-FD
 for linux-i3c@lists.infradead.org; Fri, 22 Apr 2022 19:22:51 +0000
Received: by mail-oi1-f169.google.com with SMTP id r85so10104926oie.7
 for <linux-i3c@lists.infradead.org>; Fri, 22 Apr 2022 12:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kkCuqc4lk8yEfR89vQV9qFVj6wArnvFzUiFZKzKZjrc=;
 b=62KtVe3yEJoJPoQdEQuJPW7vks7DmDqq/LcyunXCtVe9FDZpoCUntMV9PlJdAY7Foq
 pWpxy6XOr29Z8Er2PPRZs2pNqjUEO2N7nsKywxw8izMBysrjog+81lMmrzMURlTjrACk
 SVI8UdcyA6UXtU290SZxYRqYxBUbv7dfzMa+P+cPnMjvfDke8D+QQOeQWroQpn7pFUQy
 SSp2Iqh9RdZbON2EDqbxUlRjj9yPmcIlXmSmvnVQYVVjrYKVcaCsSQ367LKC4sHFG4cP
 VncDhoXgwDZ78irUjWwOru5rBttFbp/0f13JRwGzM5oFoNIw8yGOm9bqIn2G5vrEROnQ
 21mQ==
X-Gm-Message-State: AOAM5319zMdRuEEUeWmYltvYIyGw99kCsTDe8L/fnlYIHrj6JRDPUwH4
 p62iirisCRQQACULuUplbA==
X-Google-Smtp-Source: ABdhPJxrncT4pRUKPew2OPpm8vR0ZDSQQ568OrOABzj1bnXewh83dqFsNF56FDzodHorYpfjmdi2dA==
X-Received: by 2002:a05:6808:2102:b0:322:7e22:da6 with SMTP id
 r2-20020a056808210200b003227e220da6mr7154736oiw.92.1650655367417; 
 Fri, 22 Apr 2022 12:22:47 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 h186-20020acab7c3000000b002ef5106248asm1069591oif.45.2022.04.22.12.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 12:22:47 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Vitor Soares <vitor.soares@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i3c: Convert snps,dw-i3c-master to DT schema
Date: Fri, 22 Apr 2022 14:22:36 -0500
Message-Id: <20220422192236.2594577-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_122249_546372_2FB618C4 
X-CRM114-Status: GOOD (  14.68  )
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

Convert the Synopsys Designware I3C master to DT schema format.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/i3c/snps,dw-i3c-master.txt       | 41 ---------------
 .../bindings/i3c/snps,dw-i3c-master.yaml      | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
deleted file mode 100644
index 07f35f36085d..000000000000
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Bindings for Synopsys DesignWare I3C master block
-=================================================
-
-Required properties:
---------------------
-- compatible: shall be "snps,dw-i3c-master-1.00a"
-- clocks: shall reference the core_clk
-- interrupts: the interrupt line connected to this I3C master
-- reg: Offset and length of I3C master registers
-
-Mandatory properties defined by the generic binding (see
-Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
-
-- #address-cells: shall be set to 3
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
-	i3c-master@2000 {
-		compatible = "snps,dw-i3c-master-1.00a";
-		#address-cells = <3>;
-		#size-cells = <0>;
-		reg = <0x02000 0x1000>;
-		interrupts = <0>;
-		clocks = <&i3cclk>;
-
-		eeprom@57{
-			compatible = "atmel,24c01";
-			reg = <0x57 0x0 0x10>;
-			pagesize = <0x8>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
new file mode 100644
index 000000000000..5b8b43e6f1e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/snps,dw-i3c-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare I3C master block
+
+maintainers:
+  - Vitor Soares <vitor.soares@synopsys.com>
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  compatible:
+    const: snps,dw-i3c-master-1.00a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i3c-master@2000 {
+        compatible = "snps,dw-i3c-master-1.00a";
+        #address-cells = <3>;
+        #size-cells = <0>;
+        reg = <0x02000 0x1000>;
+        interrupts = <0>;
+        clocks = <&i3cclk>;
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
