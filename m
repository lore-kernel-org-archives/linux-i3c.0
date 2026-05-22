Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7B9CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsxGQo/8izraa2TExL84mC/Ru0tcgdsgjS3lRw5q4wg=; b=GVXc1vimxryMxB
	rc+KsTQwaED3G7jqGVGgf53QtjHhkGUwnShTYQSW19fzY0I3I5HTGjxgZinx2r6DAOhZcfFRvvw13
	+CrNTecXy1/3jiQx4IEZX7Z/GGWnLKkqgpZw/uNomY5dShh2XS7lMu4ENsFmOM+bcM7p6EjT8Jcd0
	nMhpAbac/RUN6kkSwsSL6t24qja+Z6AtxonlD0pjluw0hLe1zFDhenSAxlgLjbNA68eE5UC9hZIq8
	6FX3ZFUMgdwH85s+pOHCm/ikVNwttbU6gRKlu2VA4svLYEZkzi93eUKb5P5ULt9mT+ej1HDDvMi4a
	Cw+fjX8Zx8c5I7HpbJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMyJ-0000000AUd2-1QL6;
	Fri, 22 May 2026 10:19:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMyE-0000000AUZK-2V0T
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:19:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 52BDC4370A;
	Fri, 22 May 2026 10:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF321F00A3E;
	Fri, 22 May 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445150;
	bh=aSGJt3Bw4ZA4gZKsUVnQGrh272MXdVQ2Sy4qXRc2hO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DE46XXTFyTpSDLEKGYfUQXsXQUSuAPT4QxJy/YdnMmXlpeWr1b8d0A5LlS/7ZrRs0
	 QNqo/KMs0IbaJfbeXUVCmCEUIBtMfIgIxtEI4VLvMKtmLL5gIDuK++YdWQASJMhVQd
	 brxKtppOWO37o3corXPOlic2aHg7QeYvklId5TTWQI8ELDQwIVwtAeYhjM1ox+bNR+
	 GlkMc9DUf4BjJOpdR4F2Q2t63UVYCQ7b4g5iRcd9rNmLLKDvFZptKI9aN0ho1pjNDa
	 B5+ojGrIecMnEeQqa7194MXe5dmAHH8spFgTg6/BGTrrHk5B2setp5o3Lb5E1sV8hx
	 9k9GxN3zdFpXQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
Date: Fri, 22 May 2026 13:18:13 +0300
Message-ID: <20260522101815.1722909-16-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031910_667264_8AE52DA5 
X-CRM114-Status: GOOD (  11.50  )
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 5614ed99553c..e6e05ac03082 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1385,12 +1385,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
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
