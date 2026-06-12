Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69188CD98CF
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZiIAqCoXCzDrrKsLwmJUN4H89ljk9TC7olgxVOzW7cA=; b=1t4uRhYKwsiv9+
	xWInWtjELup/HZMzfk2B3Shy4uSC9fPXka2P112CdQaqINQSa+ve4SMGd/tM08RIFrXh8Qj9QHZU8
	YGoE/IdZJs1uK2T0sf+Tf0LSE//fDNdOULvIiyww6klfIqLlwQ6oZrYE+Wk79e+3zl1O1qfQbLYVR
	7QJ0aUa9uJqo10Nf7uZ6GQ+upfqkauNBuRPWNR3Ki8JAjNFJ/PvuikiCJkHGcNeiB6cVoTL/ycN3j
	3DBeeEZAq7vmSn1idO0WxdjYV0wJUTJJ5KWp+st/yrKOMtdHCfaFw9bW3ZU8d0lYHzvUtLvrvEG3W
	GxsZTnQ9lCT8MhfULVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Nf-0000000BCkG-0n4F;
	Fri, 12 Jun 2026 16:05:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Nd-0000000BCjq-3LEJ
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3318F60126;
	Fri, 12 Jun 2026 16:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FE71F00A3A;
	Fri, 12 Jun 2026 16:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280312;
	bh=XRz/FFtSHJIJsXIK2VQ8xgiI0tAaDdPLADJ0hTGOc0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LwdfzhRLnprQdstyFT/VGiBdIGNt8e2NQQpsrOHSPJYjFxb2WuA6ERCi6iR0MjZs3
	 bBBE8UT1yLlsKI0bINxEP/IOI2znwHfIuqLFAjYOMyi5kvZRTTHM8an0AhqHw8Gjx5
	 D9+AEIFSMAPWaT7CdyAlg90KCNt7t8QlGWI1/Ub/YBx2z4r+a/Rv3TEH7YgfF4M8Z5
	 Bu93w4Vdzjxw/aabLRaIdwl97EDanfVHB1LCIqcW6IRNKjYVa25gKyvdVIdkW5/B87
	 b/SI9zqN1AIgVKr5DPh18GNA2CaLNUGOPbqeixcjMpThyua0mR66ifaaNB35AdlMzt
	 m51HjABKZa8nQ==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 03/16] i3c: renesas: Follow the reset deassert order used in probe
Date: Fri, 12 Jun 2026 19:04:45 +0300
Message-ID: <20260612160458.3102106-4-claudiu.beznea@kernel.org>
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

Use the same reset deassert order in the resume and probe paths to avoid
potential failures due to ordering differences.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index e70db3a17bc7..7d448936b74c 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1457,17 +1457,17 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
 	int i, ret;
 
-	ret = reset_control_deassert(i3c->presetn);
+	ret = reset_control_deassert(i3c->tresetn);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(i3c->tresetn);
+	ret = reset_control_deassert(i3c->presetn);
 	if (ret)
-		goto err_presetn;
+		goto err_tresetn;
 
 	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
 	if (ret)
-		goto err_tresetn;
+		goto err_presetn;
 
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
@@ -1488,10 +1488,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
 	return 0;
 
-err_tresetn:
-	reset_control_assert(i3c->tresetn);
 err_presetn:
 	reset_control_assert(i3c->presetn);
+err_tresetn:
+	reset_control_assert(i3c->tresetn);
 	return ret;
 }
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
