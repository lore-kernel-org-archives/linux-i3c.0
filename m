Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF712CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTqzt/IIG0VsfNEUj2JqDBv9XeGClpk2nTHJamUA5Bo=; b=UwV1XpBkWzhYEp
	9/BFsmR1TaKCnMOUcc6MPL/985JwcGdLkcNpxDn+RQXUpuQLLWTQmSHMkwP1irsv1IHj02yO/Q0L1
	4q6tARTa2nwxroU+80W4ph3YhXwNJ+RJza9v/PQM1hKK21mSB1IDLlcfrjEL0o0ZAh58GP1wUBqM5
	fYRfHo/EvaFMeMICuwvw37amyJFeNdp77ChQAAuxbLjdl92D8ry1qBPMLUYSsHvHl0MZPXwB/vevq
	UFJWjmtycrLcoNKMiCAs9sYB4NrYuRZr2lLGtCT/jfpoyv2wxffiNSAbsMlbLRM0QLjDh4FXgAiOo
	rySAt4ohrDEwWSiTHHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxn-0000000AUC6-2Q4b;
	Fri, 22 May 2026 10:18:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxm-0000000AUAL-274y
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:18:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ECBF8601FA;
	Fri, 22 May 2026 10:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE531F00A3F;
	Fri, 22 May 2026 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445121;
	bh=2HcpYK49UBf/mKUAx3HBqJD/spvujUuD4VomntZMaFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ecgwsESnFSbRIMClib3AsiGiUviF9EJENft1errAR5aEEf/490iNL8wcGNV9b3RtQ
	 mj9foSOzaQ/n02MqUx3H9ZiDbmDX7d6TLTdWtpNXs4rVKie1wMC/eqgUg9enJPSNGa
	 7Rgb9yrBiVgHBhBeyxq+5fjieC1CVxyN8Sf5RMYjleP0/oV4GFOaWDOj7XMtIJRr1o
	 KKQ+SBgXj36x3ntFM9klql7cAkyBRefEWfiYAs+lIboGjZ86sR2pBkVQ7voCMC+P+s
	 FYCOLfZV5HSLetwf5v2eAg4iwB9n29mh5/e7NcijutaOFUm8iQCM+baec/uryDh11j
	 6h+zlL0heUijg==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 06/17] i3c: renesas: Reset the controller on resume
Date: Fri, 22 May 2026 13:18:04 +0300
Message-ID: <20260522101815.1722909-7-claudiu.beznea@kernel.org>
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

Reset the controller on resume after enabling the clocks to follow the
same sequence as in probe and avoid potential ordering related failures.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 5174a390d668..2f3c6ddf75c0 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1464,6 +1464,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	if (ret)
 		goto err_presetn;
 
+	ret = renesas_i3c_reset(i3c);
+	if (ret)
+		goto err_clks_disable;
+
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
@@ -1483,6 +1487,8 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
 	return 0;
 
+err_clks_disable:
+	clk_bulk_disable(i3c->num_clks, i3c->clks);
 err_presetn:
 	reset_control_assert(i3c->presetn);
 err_tresetn:
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
