Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2968DCA5FA7
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMbrHEzmAF28Z+K0hC3twEKkB5ua45UA6TzS3AuOV0M=; b=v539KNAMQnqn+V
	kJUIQaVXhoU+LoLoY/U9ZlC6WC1VX7oqPhU+M2RqyAJExdDHsr9aw0ih3dn/XVj481osYazXx2qB9
	QSRtKsSybs9kZNOHzI6SijVoLWWRizMEo+F4LHcNmTQvE7Xiy3so/SmNHFgdwPCgMKjiddpk4E58l
	i97XGHNi8yrAwSmvoVW3GPkdc1kCtQ3rJaLg7cQOCLzNqykhGp//LP5x7BamjkCfUvijxlPDwx1Q3
	q5v2rSePwxzMMKPs5uBFFog/GK/5MUPvDbsDD1OHi1PA4ba5dMw0ht6tkbjMRvrKdggxKOW2AWUyh
	neL9dEXfzGPshdRndm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQF-00000002Se9-3ZzQ;
	Tue, 29 Sep 2026 06:34:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQE-00000002Scp-1qdg;
	Tue, 29 Sep 2026 06:34:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB29E60210;
	Tue, 29 Sep 2026 06:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AE21F00893;
	Tue, 29 Sep 2026 06:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663677;
	bh=BjWubQDEwzkTNxDwhBXrPCAtpvohKMIuJsfB/7fSVhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TIWlK7cRn+wmNif0WwVG2cvDTmLijVqigoKVlGa0NWpYApY32nXw3rlAbBSqXeByG
	 N9tzOHiTZMqGH9FrL0Ifpc2qL6Vi5eavWG3dUqDl5RYg7eOoHx8i8y1gCnv0j7S+yM
	 wkLNDnjqxfeq7kmtJBsSq7LvciAt+wZdu7VjAKq4wtdD3r5zJaberM5ccMhayTDC5j
	 2S4YuyRnTTw10Ihd+48YTvnzJni+J9gCf3G7vUpMiznxnJnaiJPIw++SxpSqQxrezl
	 /kKaPnu1uGRrKP0vZqS5l5wUtTvDR0XxC2G+v3TgHLkJo1EHX2dK0N2nSD3NAa0J6b
	 KX9Nko3ELS6vg==
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
Subject: [PATCH 03/20] spi: dt-bindings: snps,dw-apb-ssi: Add Synaptics sl261x spi
Date: Tue, 29 Sep 2026 14:14:00 +0800
Message-ID: <20260929061417.20733-4-jszhang@kernel.org>
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

Add the compatible for the Synaptics SL261X SoC SPI controllers, which
are compatible with the Synopsys DesignWare APB SSI.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index 1e70c6804d5d..7090de9fa8d3 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -62,6 +62,7 @@ properties:
               - mscc,ocelot-spi
               - mscc,jaguar2-spi
               - sophgo,sg2042-spi
+              - syna,sl261x-spi
               - thead,th1520-spi
           - const: snps,dw-apb-ssi
       - description: Vendor controllers compatible with v1.01a
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
