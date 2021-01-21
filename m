Return-Path: <SRS0=pX9d=GY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB537C433DB
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Jan 2021 10:18:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FE923128
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Jan 2021 10:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FE923128
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7R5L3LkfQ2nsetf1LuG/bwU0ycqA4SwODEjV+ZnsJSY=; b=OEK5aehJNwswj+YN0N1X3bg+1
	jL9pHSoWqyODjhdlLSOGyBH7M0cGAIqXrBNQHXBPXCh61V+wjKuP/wyUwcibdc7xLZ4kw4axK6XbU
	adkrFafJru25kbiNAGFaIn69LOGdkVSkJerQgQs+/jiNwK42IZWOjJ3N7Y+x5k9xs54hyEM6MwNo4
	oNdIuAbJXisl0XPtIJcpVR+rdd8J1mvpLewpTTmUpDX/cDZd8UgMo5bXPrmgLvYK+zsdrYWSbbWmG
	Qeo1qcFvKpFx5HUn19IGaKCdgFPalBPC0vJJo6+wvCwQwwX47+T/4/DDX7kzEVDU2btXOeOUPFAK9
	Fu+hLvEmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2X2j-0002uO-Fs; Thu, 21 Jan 2021 10:18:21 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2X2h-0002tO-L3
 for linux-i3c@lists.infradead.org; Thu, 21 Jan 2021 10:18:20 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6327920014;
 Thu, 21 Jan 2021 10:18:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v5 4/6] dt-bindings: i3c: Describe Silvaco master binding
Date: Thu, 21 Jan 2021 11:18:06 +0100
Message-Id: <20210121101808.14654-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121101808.14654-1-miquel.raynal@bootlin.com>
References: <20210121101808.14654-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_051819_805396_AD2B34E4 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: Rob Herring <robh@kernel.org>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Silvaco provide a dual-role I3C master.

Description is rather simple: it needs a register mapping, three
clocks and an interrupt.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/i3c/silvaco,i3c-master.yaml      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
new file mode 100644
index 000000000000..adb5165505aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/silvaco,i3c-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silvaco I3C master
+
+maintainers:
+  - Conor Culhane <conor.culhane@silvaco.com>
+
+allOf:
+  - $ref: "i3c.yaml#"
+
+properties:
+  compatible:
+    const: silvaco,i3c-master-v1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: system clock
+      - description: bus clock
+      - description: other (slower) events clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: fast_clk
+      - const: slow_clk
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+additionalProperties: true
+
+examples:
+  - |
+    i3c-master@a0000000 {
+        compatible = "silvaco,i3c-master";
+        clocks = <&zynqmp_clk 71>, <&fclk>, <&sclk>;
+        clock-names = "pclk", "fast_clk", "slow_clk";
+        interrupt-parent = <&gic>;
+        interrupts = <0 89 4>;
+        reg = <0xa0000000 0x1000>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
-- 
2.20.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
