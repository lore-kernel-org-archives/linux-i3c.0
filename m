Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008A9C0015E
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Aug 2023 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFMr3BSXFdtzlVKRMgvnFauL6qHbU9YiqG01CsLq3Ng=; b=v01S+ra1P1uNW1
	QzZ9WxqeKwN41XrOVlxaEQHHtBQ990fN7PBQrNaVAzXbiqrE0gzBxwddAT6su6DswTn1MH1NlAK6F
	OlTUOVVsLzQ7tEoRWp4mR/xITneGVTMS8K8QLOWr/pA02e7beruxA6QP7/yif0uDAvYt0VakPXL5A
	Cy9lZOTWlJj/iXMjsH3WVSut0I4Djccl52e/Wka8WtgYrzzvrWkR/4a1H5FKGE1rOQIYaMAXP586v
	LbiUQEPnaRhD+ww/viybFI0DgBoaLHrZiN8PaQis3jRZO7eBfr0h/qpHA6AD++KCsslqHO/h6xx2p
	PQBVx1x5AtKbJjJaJElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrlS-005zo2-23;
	Wed, 09 Aug 2023 22:34:50 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOrG-002pVn-1k;
	Tue, 08 Aug 2023 15:42:55 +0000
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Aug
 2023 23:42:45 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Aug 2023 23:42:45 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <alexandre.belloni@bootlin.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<p.zabel@pengutronix.de>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: <BMC-SW@aspeedtech.com>, <kobedylan@gmail.com>
Subject: [PATCH 2/3] dt-bindings: i3c: ast2600: Add resets and reset-names
Date: Tue, 8 Aug 2023 23:42:40 +0800
Message-ID: <20230808154241.749641-3-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Received-SPF: Fail (TWMBX02.aspeed.com: domain of dylan_hung@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_084254_575479_B477A1D8 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 09 Aug 2023 15:34:49 -0700
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

Add two reset lines to the AST2600 I3C controller:
- core_rst: the reset line of the controller itself
- global_rst: the reset line of the I3C global register block. Since all
six I3C controllers in AST2600 share this global register block, the
driver needs to handle this carefully. Generally, this reset line should
only need to be de-asserted.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 .../devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
index fcc3dbff9c9a..3166d6f3a39c 100644
--- a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -23,7 +23,12 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: core_rst
+      - const: global_rst
 
   interrupts:
     maxItems: 1
@@ -48,6 +53,8 @@ required:
   - compatible
   - reg
   - clocks
+  - resets
+  - reset-names
   - interrupts
   - aspeed,global-regs
 
@@ -63,7 +70,8 @@ examples:
         #address-cells = <3>;
         #size-cells = <0>;
         clocks = <&syscon 0>;
-        resets = <&syscon 0>;
+        resets = <&syscon 40>, <&syscon 39>;
+        reset-names = "core_rst", "global_rst";
         aspeed,global-regs = <&i3c_global 0>;
         pinctrl-names = "default";
         pinctrl-0 = <&pinctrl_i3c1_default>;
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
