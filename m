Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D64C44508
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2hyxTzzP5Kqe2AuJjF9onrC+pYDyrRiApnN1Wz1OKc=; b=uKzVcvgmy0sd3Q
	WP7PVti9DVZ0Y4IjVujued9cZlNugi+2vG6u8YHMTWUEaIi+hxN7T4qFWu+RbH2MSWJQmZOHZQf1E
	0sdEJ5L/FxpaGURtk3OifL4mmyWsLTPXZ6DxVqZj2tgymlzPKXW4zLvXzk/uvZcDRlVCyU/59nTyy
	ZEFSWpNMuWsypzt6xMH5LMt6b7Tx3K4D4X4haH0kEDTf61FbxRAA9Ly9RnyN1vs+vFodZFQnEzBUN
	gKciBv/Ced7aXJl1tgh+DkbB8APc9mEdYIbS2o1eqVJJXwnXnxQQn4KQznc7SNXta27dfu3wSmzgZ
	WwUIFF+zJNQgmSViF7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMV-00000009JxE-3BLO;
	Mon, 13 Jul 2026 13:06:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMT-00000009Jtr-0ncp
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1316791f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947975; x=1784552775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyFiMTqW9DNKe50LmTgk4WYg6g3GKr2XXyXW7yrTRtM=;
        b=i1PhfSPazPpVaUB4+02r4ggZzGHocFKdndz/QnRbDZwJ5aEWB0Nkzxn8Ma8eFxh18x
         JHoNWaYiO9JM1s9UntUr44/HoTcl7yWowdBizKEOfqB/Z1arEy+lG+D1ZXJ+oaq+u97z
         yyitIaZ7Zt0ElwxFFt9Dw1Y24Rjh9VrFCYeX8ouErAV6JF3qoq/4oGMQB2vAVadNv554
         d4l29CBmnDWI32rxuZNGYTNVEMGCfdFoQZK0w5yea058k3smGcXEZ2zrVN10mskXiB3J
         +ZxGIKoPatpkcv927MN47zmkFw29vQn81SsVenUjfvD5GJmH+rFJt02QK88QDxXWkkHs
         LPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947975; x=1784552775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyFiMTqW9DNKe50LmTgk4WYg6g3GKr2XXyXW7yrTRtM=;
        b=LfKx3swX9q+/96NyoYjgctlI3TksP36VhERlsBQX9MhjwnfqK28q1aRwj/swF/GWOV
         gmLN65f93MtfrMS8LfyRYNmrSsMyC73HlKeWjBFUVAdYMqsxVdJYg4BeZVKMpPi/kAiG
         2rnXB5BSIFpjBoRwEgtASuBSy3cHM/Fz1MH4AC5uHQNdoPu6FrSxkaUzDqnnp5VRhu9p
         +vqCvwXVddxcGDcje5FZefCzBD4Ih4grVdoJtu3sLKfUEsP5/D4JcDegYqzkZG+VOZ3Y
         4mVJ+t3TjGRBj5EyTI/H+V3nAsbgTgFyK2rkaLf4kReK0GE5Oa8LSp7hzXBzv0eqo6x0
         qE0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0KigyGphWO1Ghr6HlxQYWqxfDlI6b4UKHavLEOHKc8YLX/ElCVwXvi1EC/ad06JJJ4gEOIK0lfB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRX+AAtLq85FAABdqm9j16ohKMYnVS5X0Z7GwYSD3bM6phDmpZ
	JAWM7JgPGbbW5DPcWR7sHke/8ZrmKDX3BJCCV5YgiaTRbIsbE1+HTHma7yKgGcnc0hw=
X-Gm-Gg: AfdE7cnRnFuc7V8dVUTeRm4CkNxFX+3Xix3eaX6j8sMR/MbvacwAk7JaJ3ZStTrcdow
	dgZsf38u3h9h9tg+rV6fjMoPiAsYpEAH1+f3Bx/o+WtISKE841iT4i8zurq8Fg4sRKmsp//NQh2
	B3qZU71G/mmfT54136oXLvpCLeFJ8FAvfISDDsRCfmgQNMr2SQ5Ovp7Fdxo7PLmdsOnQrfwJlNp
	IqRocKJKDyS9GZDm6/YxKp2uA6HIUifBuCZoOzNH/805O7NTISAe7joiH1mmu1h0tK/H/GPKdVD
	UcoME54RS/nGCOTOgSGUiqOM1EGL9KR1Lcoz7w3da5xUUrTyv1rODJl5THTYwx+/nG+6Vka+x76
	MhSEkQDZsLB2v5+/Uva87jisnjbkJ7Hcf6Chu7weode7n4v0NJByAcGkAkxBX1F2FeYN0naNBUg
	rr6vZJcSJSCIrcUrNGEP1DaNwKMZFj7Igptsn2h64vWaWFXAo/JkhWyyDruXdQFAfarEcKWFY=
X-Received: by 2002:a05:6000:2008:b0:478:9d9a:d515 with SMTP id ffacd0b85a97d-47f2dcf7f47mr9434967f8f.44.1783947975585;
        Mon, 13 Jul 2026 06:06:15 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:14 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
Date: Mon, 13 Jul 2026 16:05:43 +0300
Message-ID: <20260713130545.568657-16-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060617_257097_9E358279 
X-CRM114-Status: GOOD (  12.31  )
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

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index a54c20ef5f6e..f28e260dd166 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1409,12 +1409,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
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
