Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10030CD6E57
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJREsG+WSAb+UM6kq2MrY2fzWVBQE1CCtEYZULQQhvg=; b=kMB4OAxkggi31h
	StI8DBfxsU6NkMR9+mBoTjX0OR3qmlla6ayoliLmS1wWByh0fvkg61mSX0VYtJr+2DGWt5DMi+zVB
	gI1nQ9uNPoBi4nx3iT0EDPtXzzBXGqyXnefUdz8XofwjCRWyCafpUIUjXvn3Qb/iis31Dba7X/xiK
	YPow+PAHizXDCxZKDfIEmdS4LRK7V0AzZ+HXLIOzyAkqXZrCUQo7kj0ZmBXLpe0P091+fgSveQ/Yw
	xVw4/cuX2NGy7W1a0La64nTxjejn+5ThQSXcPlydSsUqa7LPs+9Aoa6ira0r/eO5m/i84brjZLoKB
	E2nOr41Tnjq2kFO3eXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPAn-0000000D7C5-38iG;
	Tue, 02 Jun 2026 13:28:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPAm-0000000D7Bl-3dVW
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:28:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 534DD60145;
	Tue,  2 Jun 2026 13:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5EE1F00898;
	Tue,  2 Jun 2026 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406928;
	bh=zqUdJFTffah41MiqYor0O0hc6fcUw1Q2v/wZzX4zQWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Py4aq7dZrQ1FCbnEndd+CRni4u0RDiKOUsa6gmolzaKatuU0pCuC2FRpwDaRZfAX4
	 lCP5nZdgFlqNU/wLnNPFDpVBcOda9UpYok0Uef7zrEVWQbJkjFDD1yKlD9qyvhOaiz
	 ZgIhlyucyrd5RmQtP1LWfN806vh9zIfHnDecB5W2N7PGF0D0tD95tFZX33RVPSTHB0
	 AJw7SNGyHSiioOavXAO9WBFKaT7EEqT6J3D+e3RvOCBQL6s2/cB8HW8Ce7FgnP/PXd
	 pPMt4wmtjd2IwY+BUa+rUVbXq/0xcmBvhqiriX1wlYkvioQBQMaK9Uai3yj28juf2q
	 //7LbxAdhTSPw==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 03/17] i3c: renesas: Follow the reset deassert order used in probe
Date: Tue,  2 Jun 2026 16:28:10 +0300
Message-ID: <20260602132824.3541151-4-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
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

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 88a16efe096d..4c86e7257804 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1455,17 +1455,17 @@ static int renesas_i3c_resume_noirq(struct device *dev)
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
@@ -1486,10 +1486,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
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
