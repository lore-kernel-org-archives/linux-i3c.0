Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AE1CD8CA8
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIKPhZ64q+Qog7xGLlveG4QaKscP2i+9nXMbxUyYHoE=; b=rlPwrFVCQjcrQk
	FzjSYup19bBnky+TO0mpLYYg/78pPb4AEMBGMKQCZ6jKhklzU8SnYUSXPYCmGyfjCf04fEP183V6m
	aHdUJ0P3NGJ9KR/lq86FQvsSZsrWzB0K1BYZyLCWnYHh6yJhOplj3Bh0M5MZOgrEQrAKu98sm6+X+
	rXayIURgKCAhF2okS+jGE0iEQ6iKU7hQ4+9/MnauiA40bvCg5q7pvsAzSCrrHGa3+E+16waSD/mFi
	hUpm5fSkA1A+Ys+qN3rnNvXyKtDcXKLVfzpJonXJpb9USBkJq9cxQGJpLpxapgF57oCN+7Y+YK08V
	VTLi9KrZyL+q2RkdOkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOl-00000004LnU-2aPy;
	Mon, 08 Jun 2026 20:16:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOk-00000004Lms-1xDm
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:16:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35D6543759;
	Mon,  8 Jun 2026 20:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906151F00898;
	Mon,  8 Jun 2026 20:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949798;
	bh=AKSEwxHG4l89bFYF0FcArUN3IFekiGEu40fvQrNy8+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P9SQcnW+6voirvsAk8gwovXqxrs6cDu/SdOCfVrtWdIs7fm7UmkMvDrpcUq/oFIx/
	 +aQgKHogxh0jow6piEyvhOkQMcKWz14VZcCkWeMiQIGU9ES8kfx6YTpbXcUeCukDMV
	 D8ucfCgJAAEWDvrbxcXOAr+XcAsgcGyhOOLw/oYNyUrFAayIAxUygzHZXo9TII4dWl
	 zGyHKgd8rScxUff2fW61h0awT7/cyAa/Ax86Hszm/8bw+PSyrrcDyXd9Bdwk8tSyuV
	 +swWxsxi/VjeYXzpzPr4YMNmoirYniV5huvyOyysmgzpiGiBOAsH8ENRf31QwQ2ekX
	 FDrGQg+TsPN9Q==
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
Subject: [PATCH v3 15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
Date: Mon,  8 Jun 2026 23:15:41 +0300
Message-ID: <20260608201543.804902-16-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
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

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 103c938d1455..6572934a1837 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1536,12 +1536,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
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
