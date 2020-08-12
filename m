Return-Path: <SRS0=SnxP=BW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFA2C433E1
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Aug 2020 19:18:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 640E72080C
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Aug 2020 19:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQFxpF8t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 640E72080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lhPFYN9lnNZkLupjTPVozJIvWZRM1zPUj4SODlMSHi8=; b=rQFxpF8tcAOiRsdvmahxwzU1p
	KP6uRcaJPEW+UdistLyc4QJkZymNfYBflJHCktxMHzGq92W4ZFu2VmPDs1UMW0Od51duEJqx4Bynt
	cV0X0/w5/IzXmKzOVZuWIoJDMMkKopBnY8787tsYwRhPVukRdBubR8c4EHM8iOYaWbTlH7D91P2xG
	7v4PXIDwUvy/Jdo5K4B+nPwAKfONhCTtQR4RA/dvPOSst6JjwXFVNGg1cRNb0ijlcdDK6QIhniBPP
	ZdCeRSUrJWvbBGHk7jxp6g7zqtvku2Y10C/1WfVsu+SOjp/VlMuMAnQDWQtNoiZp1dFQSLqQql+Jx
	ge+ftxVNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5wGe-0002eo-SA
	for linux-i3c@archiver.kernel.org; Wed, 12 Aug 2020 19:18:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5rVE-0001tY-OV
 for linux-i3c@lists.infradead.org; Wed, 12 Aug 2020 14:13:18 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AEFA1240009;
 Wed, 12 Aug 2020 14:13:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: i3c: Describe Silvaco master binding
Date: Wed, 12 Aug 2020 16:13:10 +0200
Message-Id: <20200812141312.3331-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200812141312.3331-1-miquel.raynal@bootlin.com>
References: <20200812141312.3331-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_101316_922635_ED5564DF 
X-CRM114-Status: GOOD (  11.46  )
X-Mailman-Approved-At: Wed, 12 Aug 2020 15:18:31 -0400
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
Cc: Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
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
---

Changes in v2:
* Updated Rob's tool and fixed the mistake reported.
* Updated the vendor prefix.

 .../bindings/i3c/silvaco,i3c-master.yaml      | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
new file mode 100644
index 000000000000..63731e8a9068
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -0,0 +1,59 @@
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
+properties:
+  compatible:
+    const: silvaco,i3c-master
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    description: |
+      There are three clocks:
+        pclk:     System clock
+        fast_clk: Fast clock (for the bus)
+        slow_clk: Slow clock (for other events)
+
+    items:
+      - const: pclk
+      - const: fast_clk
+      - const: slow_clk
+
+  clocks:
+    minItems: 3
+    maxItems: 3
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
+examples:
+  - |
+    i3c-master@a0000000 {
+        compatible = "silvaco,i3c-master";
+        clocks = <&zynqmp_clk 71>, <&fclk>, <&sclk>;
+        clock-names = "pclk", "fast_clk", "slow_clk";
+        interrupt-parent = <&gic>;
+        interrupts = <0 89 4>;
+        reg = <0xa0000000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.20.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
