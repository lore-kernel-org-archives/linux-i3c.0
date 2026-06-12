Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF42ECD98CF
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcdrYCtpInlJDAGcyMgtWaI+MunMAcIhJXDgJJiSxgw=; b=EWmoQoZTHDx270
	4ym2DiVKwFzZQj1PP0vfnnxSxp/2TDy7qDQ2pDVPsFzarp6WOIuWWBmvivYruLMgb54/K5eYFO1Tq
	7izU2OQ4VowtperJrSuZ9Ht54gc7BACt2ngxDiJx7fMfOZBZx46HvTEuH2C62yF61dNdfvThApatf
	21ou5GhPQWIiHwDqNWEMWJaaOF3f/7As7wCm1YP4q5umJsOZYZZNhCokaInSTx7YBTXqLxetCthe+
	mkLJW66fSKHMPQIpwtS0Xi/1lfG1rJXpAd3DM04Ki2zoepB5ntMflZ4g6IUQgrEXU/hukDHmwDgyu
	2GopDWOlIc85aDc3y+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Nu-0000000BCq0-1v8Y;
	Fri, 12 Jun 2026 16:05:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Ns-0000000BCp3-2hTS
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BB7460126;
	Fri, 12 Jun 2026 16:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAF31F000E9;
	Fri, 12 Jun 2026 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280327;
	bh=XJQpP2DqNfu1UIc+wcBq6q91NixsA7/1tV1WaL5quSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eqOjY5WTyF5M1MxjPvFCyBkzn7FqMaxX9d8Fe2gYJG7V2iJiYx5fMmt0IzCGEDVUY
	 OwDuWPzpwEsZQHcN0IQ8JpXp28L794PnXrNQIuZ8VqsW+UJkZOzO56YsttX5fpQ84A
	 sUVLlm0RqCLwGLfmkGWBf0a0VXsG2NlL+1U7ssHFBAn3yxGqrC1s/FoFqgi5dsE0Jh
	 ZBe4fH27zQ1QbtsW3b7lR9MzWPIXdUF3HyLd/Ll3fIb5EdbgWTssUrPWwUTIt8vhrX
	 /TN6B+oToWJrd2dHISXBGCWHjzagEZYCvCvdUn215sT5+6RF8FTsRIOo42rjWoLh6d
	 fQZWtcp5g+01Q==
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
Subject: [PATCH v4 08/16] i3c: renesas: Use reset_control_bulk_{assert, deassert}()
Date: Fri, 12 Jun 2026 19:04:50 +0300
Message-ID: <20260612160458.3102106-9-claudiu.beznea@kernel.org>
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

Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
suspend and resume paths to simplify the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

 drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index abe24e563d21..9edd2dc96107 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1562,24 +1562,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 static int renesas_i3c_suspend(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = i3c->presetn },
+		{ .rstc = i3c->tresetn },
+	};
 	int ret;
 
 	i2c_mark_adapter_suspended(&i3c->base.i2c);
 
-	ret = reset_control_assert(i3c->presetn);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		goto err_mark_resumed;
 
-	ret = reset_control_assert(i3c->tresetn);
-	if (ret)
-		goto err_presetn;
-
 	clk_bulk_disable(i3c->num_clks, i3c->clks);
 
 	return 0;
 
-err_presetn:
-	reset_control_deassert(i3c->presetn);
 err_mark_resumed:
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
@@ -1589,19 +1587,19 @@ static int renesas_i3c_suspend(struct device *dev)
 static int renesas_i3c_resume(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = i3c->presetn },
+		{ .rstc = i3c->tresetn },
+	};
 	int ret;
 
-	ret = reset_control_deassert(i3c->tresetn);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(i3c->presetn);
-	if (ret)
-		goto err_tresetn;
-
 	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
 	if (ret)
-		goto err_presetn;
+		goto err_resets_asserted;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
@@ -1636,10 +1634,8 @@ static int renesas_i3c_resume(struct device *dev)
 
 err_clks_disable:
 	clk_bulk_disable(i3c->num_clks, i3c->clks);
-err_presetn:
-	reset_control_assert(i3c->presetn);
-err_tresetn:
-	reset_control_assert(i3c->tresetn);
+err_resets_asserted:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
