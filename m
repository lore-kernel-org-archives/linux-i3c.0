Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E38C9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uR9tcH6qhzF2NWIpBQhn1GRqFi0tj8JMMWDno4JuZ5k=; b=mGq060touc5BCX
	eDj/aeTH2wmVfQOZnf2LsVK2MAIyfbkAgGRXy1t2gEauI+3ESQ/go4lpclVM8mKaULdgEubtc6Omq
	j4iNH4tMNeER0S3VwX7yEMV9RyAYGAFsTCY76u8qkdp1gxseY62Xw+a8X9BU/W9Kum7z74yY3o66V
	6vxWUm8asr7UGYa41DZY7pBjuzuR2YUvvOgfMX4RB/09yyZWYUPYUfifPU1gpMYYwFpYf+s8L/KCT
	kPFwTumgwctF8KMBvJLGwrxzq4aPgQEj/5PUlrsU6vZLoG1XjEDlTCC8kPBD4RAetZRCp0JCCEGTB
	x7b06m3SR1M+EA+7H32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSG-00000002U0O-00IJ;
	Tue, 29 Sep 2026 06:36:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRRt-00000002TpJ-3BPz;
	Tue, 29 Sep 2026 06:36:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8303C434D7;
	Tue, 29 Sep 2026 06:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FA51F000FF;
	Tue, 29 Sep 2026 06:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663781;
	bh=sK92kjwtQgzYzyqBYyYH3USgcFn3Hilolf2mqG5ssq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=drbxlan0e0renGOqaBmek+B+M/uFa2zUEZ3rW4CDYMXLv77X+X5lL471r1bKByjf6
	 t7TmXeheEY0v9VSawd7sbdeGYfsstWv2yh+Q3YF21ylwZY2xcKqvi0/FNw9ynIIrGI
	 QxOgxmxOpG7xU4YGiswoksx4cO8HCAiUy0+7faHjQWDuj03kQ0zPGuZ0Pe7HstQbUz
	 Ej1nJb4okzWjpqgFtkzjglqomyKOJONL7M2ScbA3YOZNUs/DHtioCLPGKxedo9Jg4V
	 4JGsK4xXLd27aVJiRJN/rZOwpA9Ug9C0xGVFQXA8HtB9q8Nd07BIn7062LAoldlrzM
	 dD4VaURkMeaAg==
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
Subject: [PATCH 18/20] regulator: dt-bindings: sy8827n: support standard properties
Date: Tue, 29 Sep 2026 14:14:15 +0800
Message-ID: <20260929061417.20733-19-jszhang@kernel.org>
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

Support standard properties regulator.yaml, such as
regulator-active-discharge', 'regulator-always-on',
'regulator-boot-on', 'regulator-max-microvolt',
'regulator-min-microvolt', 'regulator-name' and on.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/regulator/silergy,sy8827n.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
index b222adabc7b4..0baf93ca67ca 100644
--- a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
+++ b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
@@ -31,7 +31,10 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: regulator.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
