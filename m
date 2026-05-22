Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23E3CD5BB1
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1RDXCq8IXzHfSAKwvUSeSJQqgJKZwRt3Vj7vWUqVdM=; b=Q4T9MxyAe2o8Tc
	3ZNbfwpVQSFQD+asD9LaXxac0GdaFV50Y9OIHGIOD0yWRCW9Ici0hWaKjBaV+qA3EnDDI3gYMHN2U
	rZhBGJwiqGxOgYFa/b/DtMCVmNJ1Oqi0or+vngDy1OUlFvLyEgj+MCMqgooLBKO6vzZV+KFq0KPkp
	ZTadN5XxkZ693iMILBttz2GWYPM6wyAbbNZ4+boh+hMdOKRY7/77iRlXgJNRPpVQPNhkL0lidh+rh
	UGEM+YoJZk8O2m2YCoAR3wg4PrKGfcm9XJ7UZ9PjF11LGltQ6y/6Ps1YzUL5DbmK/OkqOo3VdmhwU
	yJKKVitBDTQt2qzuTq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxh-0000000AU6D-2raB;
	Fri, 22 May 2026 10:18:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxf-0000000AU2S-1p6i
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:18:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B1AF4050D;
	Fri, 22 May 2026 10:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538E31F000E9;
	Fri, 22 May 2026 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445115;
	bh=nlATKTBuVymR4RbCGx8EgOlGBJ0lcWHyDwOxkS9JM/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UEhvacPtlFASvTveZ5wQiyCUCLIb5rPzdraj4eS39CKLa7qs+UcoayW4qr5b0NUvx
	 GY3z53b/At+rc7tFIWcneAsh+YBMfOOB5ajSrTTuIkJp8ibEN/W6zR1CD+Ncl8Yrbc
	 cYrFh9IIUNw5uEHqWqiyfgp5HSDeRCUrb6x4D8fVOunDXTvgYuKkshcEKC+Cf2a2RW
	 GCcuKatRi4YswgLLCQ6O2UyH9rnTOxeMnHx9f+upb4tP1uzPdSbulFTjTvJSatqFjW
	 rfddmAXSlKUs78l8VBIReNYQga1Nf5rf28zWKevNN9MjhQ/gKphrMFJvi/pi6hmB6a
	 pcuPBnIwclfNw==
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
Subject: [PATCH 04/17] i3c: renesas: Follow the reset deassert order used in probe
Date: Fri, 22 May 2026 13:18:02 +0300
Message-ID: <20260522101815.1722909-5-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031835_531333_DF32E415 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 6c23f956ad2a..d2f29ed0b6ed 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1434,17 +1434,17 @@ static int renesas_i3c_resume_noirq(struct device *dev)
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
@@ -1465,10 +1465,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
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
