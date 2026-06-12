Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AE1CD98CF
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=td9LIC3LHz2aaBi571fqkcsn2Ua5gykenaaU3wPP+GE=; b=UvYSUdPEk+RMKe
	IIuK223A+wdMWcpOM+hOsl4Kg0NYNm+Y1/URpqGKUWwJ576DeWfwQrUwFYGbPCUQCaVZOQtUKqDBH
	5KndCNv+Km9WH+rAt0rbuP2KKtaOjfr0kdPySxe+0T0w+/t+QLmYf45rG6mHQYOWGDWq5Gxlv/poT
	RYaq4RAIt0ekS2F7ndcdCM4ZZrhKOQsj07cN7ZljjoYza9oIjQ/UT8FQroTgwqbda9rkbx2AtMilG
	JajRIWvaBAPYVTjDBNCyE0uMamT6qEZ4gn6lV4Irbzi04uAmbe5JHxJlRa5yRs6K1i/DBG9ibvx4D
	aFYzS3hfvCEZc44Lg2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4OA-0000000BCw5-3DCR;
	Fri, 12 Jun 2026 16:05:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4O9-0000000BCvb-1cTC
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0A156008A;
	Fri, 12 Jun 2026 16:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3FF1F000E9;
	Fri, 12 Jun 2026 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280344;
	bh=ivV3cM9KsM+Lq38ibJkMQvMi0uFW/qVYbD5EnX8CDew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XC/UxRAYA3umksAqwwkhrlc5i1fJYD0b5ZSWSHBK0l5fIWogMo2iA52omA3fQHD0y
	 UZAJJ+R+OEiOF7pA6ZRoF/Z3Z4gPXTgr8phm8vldtFYwXZ8U0AvKO0rvzTgfznUuSK
	 upn+otTNs0dXeSPIoZejgRNQo7UcgvyDZxpp/Sv6SPx3jHnnhhXQragECuCRly/ylz
	 PzVPZ71cnBiilhWtzc95xDBYzBo/4RQcGoczb7V0yJSv6+yEcx5QVoTOBMc6a4mQ6c
	 /6wDetB+7cqs9A5RG0zu0uVoePTku+4Mcg/4SDF2Nrw1dqLY5Bk4uJQ5Eroi3JiNa6
	 RgbZyAt9a5BsQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 14/16] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
Date: Fri, 12 Jun 2026 19:04:56 +0300
Message-ID: <20260612160458.3102106-15-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
References: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use the "dev_name:irq_name" format for the interrupt names. This makes it
easier to identify interrupts in systems where multiple devices may request
interrupts with the same name.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index ab73fee1813b..a5384c0f71e3 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1533,12 +1533,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(renesas_i3c_irqs); i++) {
+		const char *irqname;
+
 		ret = platform_get_irq_byname(pdev, renesas_i3c_irqs[i].name);
 		if (ret < 0)
 			return ret;
 
+		irqname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s:%s", dev_name(&pdev->dev),
+					 renesas_i3c_irqs[i].desc);
+		if (!irqname)
+			return -ENOMEM;
+
 		ret = devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
-				       0, renesas_i3c_irqs[i].desc, i3c);
+				       0, irqname, i3c);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
