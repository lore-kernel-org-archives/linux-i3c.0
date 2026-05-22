Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3854ACD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGEnIeWnT6RPb5FQQzgYFejmRJwM5G4dQuwwodDiFmE=; b=U3eRWJEW8BD2Uy
	i4393GUt/GGZ8xQGCXUOFXsfhV5s3ifjtFIBJlQDUrOtxBtabTYoqGcotFL5SAKvjrgSFeDWNhY8X
	YwGeVBRl9pjwzJ7PLgjLbWf8W0CpDV0rY4M+rGwwEXZy7bVSWHYWucEB6+cy6goUazEv11IGja32t
	AvtwqhLl9w83Y5rAASMCr+9jl4g9sCP9R+Vh023/Xxnu+PI/RpVqXDmYIQ/ZVXiOTVUWC9HkNL1o/
	80vEMtmYP89OFfIlga//n7VEoUFnZlJ43SOoVy3hqvx/VOFDA2mDRA2WusOmWUNjgJFJrv/dUi5t1
	twEoit/QPm+mo/fu0RvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxx-0000000AUMs-42Su;
	Fri, 22 May 2026 10:18:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxw-0000000AUKs-1ngh
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:18:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC4C260213;
	Fri, 22 May 2026 10:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D990C1F000E9;
	Fri, 22 May 2026 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445131;
	bh=fQueYcmdwnccioyNO8aGWs1lRM/qB9ET5VtaJlLRrkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lILRdStRs+CqQzCip+lPD5w3AffDPiy+rQYCSopIUO4TiF1p+/iC/3LrgphzdW70m
	 pVLwkZyK2DYGoSD53GqZ3J9UFL22l+WFep2eBkK36/LWDIMt1FQc8+9fGoGorIsKdQ
	 sAPH/EXUMBmMok6LxsES8jCQA0t8R0XOYKy0iiwSn0I8hFosjKtKaqJ17cf2NVjMU5
	 HqAvgob7QvV4H2fhFZMPAAh+o79F6T2huKiadyQa3j4/GFb4cXyDcGUoQXOcixPy8Q
	 0wgZtP1SV1urUuQuVdNhp6R7zCO6pWOLg12YCrVBVZj9LD5CCopnXTgHWP4pOkfhr1
	 CmDJ97HjulmBw==
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
Subject: [PATCH 09/17] i3c: renesas: Use reset_control_bulk_{assert, deassert}()
Date: Fri, 22 May 2026 13:18:07 +0300
Message-ID: <20260522101815.1722909-10-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
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
 drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index d32646deb69f..e5963270d6e5 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1414,24 +1414,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
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
 
@@ -1441,19 +1439,19 @@ static int renesas_i3c_suspend(struct device *dev)
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
@@ -1484,10 +1482,8 @@ static int renesas_i3c_resume(struct device *dev)
 
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
