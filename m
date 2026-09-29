Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2493BC9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDbDN35hx1Zjj8t1pfqWq7vSxuFGQ7qgAR6g2KFn9Os=; b=aC4TV7EamdVz8O
	LI6GnmxYROVvccFFgS9z19iXJSY/v3fkCSSqaLXtRcOWiDrDn5eO5tZKB1WRGibqha6u+C5ZP6gG/
	8rVAUev0+1oSumVLpq0sfKVkDjTDbwYdgOjx7VY4X7jln6rWTbYMPnsFgELH3y+mVzb5+OASI8pL0
	FydwsYjnjZ+siVl3J4KNBuGKWZEXeB2aQ8PgtIkjMS9zL12qVuP3Dhz0uL+XaFsTh4wkPys2r/5S4
	XnHmuvsfRebheTkRQL6NK5uVS0dQg9wXa/+0GLOxhhw6WgXGRIg46lAwztaoyhCTZcpB2Sp+7irNs
	nj2652wrqSfoumyP+HsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRRb-00000002TWo-3IjC;
	Tue, 29 Sep 2026 06:36:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRRG-00000002TI2-01df;
	Tue, 29 Sep 2026 06:35:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 704CC60A5E;
	Tue, 29 Sep 2026 06:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4291F000FF;
	Tue, 29 Sep 2026 06:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663741;
	bh=z2AGKqHG/UsA+CBxwXm4Xs+da1+7l4bQqt5uAiwnyZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gMxb0IDutUsTygy3vWlGjnapMxUReMRrdMI3VsEQ+o71SMPS9PUddSdb4x99ucrny
	 ZNslnbEkcon3MiI/fXrtaSGdwN8W8FARUo9GoGg0lTFrU/wrrkbTF4Tc5YSLl0iwAp
	 DS73l1+Oc4mN4fek0bPz7M6UTIGgcD6O7j8nbM2xc7zpZJ93fzjvN8dc4Hnz3Jf9tQ
	 QHk50OcHPQ9c3In/g7ULKARijXMcSNbBABLqB6x/ZOfnRNfOGXTWQMPBTx66DwIFZu
	 CWKEWFURRCTWkL9EqAUgySPsZatSUPFHFh8JDAnqiPVlLQdDFlQrkyS1m84HnzbfaR
	 +fa+2uDeRO9Fg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/20] dt-bindings: pinctrl: berlin: Support Synaptics SL261X SoCs
Date: Tue, 29 Sep 2026 14:14:10 +0800
Message-ID: <20260929061417.20733-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
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

Document the dt-bindings for pinctrl in Synaptics SL261X SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
index 6ace3bf5433b..fb60a310a24e 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
@@ -37,6 +37,8 @@ properties:
           - marvell,berlin4ct-soc-pinctrl
           - marvell,berlin4ct-system-pinctrl
           - syna,as370-soc-pinctrl
+          - syna,sl261x-soc-pinctrl
+          - syna,sl261x-system-pinctrl
 
   reg:
     maxItems: 1
@@ -44,8 +46,10 @@ properties:
 additionalProperties:
   description: Pin group configuration subnodes.
   type: object
-  $ref: /schemas/pinctrl/pinmux-node.yaml#
-  additionalProperties: false
+
+  allOf:
+    - $ref: /schemas/pinctrl/pinmux-node.yaml#
+    - $ref: /schemas/pinctrl/pincfg-node.yaml#
 
   properties:
     groups:
@@ -60,6 +64,8 @@ additionalProperties:
     - groups
     - function
 
+  unevaluatedProperties: false
+
 allOf:
   - if:
       properties:
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
