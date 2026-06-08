Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1D3CD6E79
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lqEEVyF0AtBfyzFR9Vh+Kqtp/KfshlfK0IuaPiQZog=; b=UzTGVee+Qrpv/x
	7EhlS+LfdZ2t79820E7sEHX808ZOufy5nEeL9uh2szsrpAwrqPaP/bdkBOODBz0k+dixQU2XByeR6
	XcfiS37VSekzNWiee80EmUtAsLZOHXGCZPToygJ2XUOUgspeYCpR5tyh3d5xPyQRIZfP2pT5ygPsy
	FxJOqNhM8qpy6iRbNyYLPxdIZeA4wdlKmePU0Dy2oSdPOeJPOguSzgw8f+PScejjCj4Z/bnelAZC0
	d85ilP8YmCj86Ey3IYJaPg1bb6iSVXKM380sB7mAsZr1lt8FaEXHCGjgm0sr4gRQDMopAicDYGM02
	SnctKXHlH6AnZVwGL0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOG-00000004Lc9-3OBb;
	Mon, 08 Jun 2026 20:16:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOG-00000004Lbu-110U
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:16:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07BE644459;
	Mon,  8 Jun 2026 20:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C75C1F00898;
	Mon,  8 Jun 2026 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949767;
	bh=XkZcK2CJUgIVgyR/EGaoOYASXw4bwoLswDyjXXi++9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A6yIUCRidXhs3a54OFMFZjtJ0NPkG/Zol8hDjqls5tGf9bSJB+Xd1H2HZNwUbTV+o
	 dtKBvvpHIiUU9969Tzgog5OHvm5y0gdPtkSLRkvHypGQ4Bxej3mIow9DNOfU7omeVq
	 07EkJhBoShkVnfLh8TML0oSq/ZJX7YJKQsLZLhoa/3LGN0hV/WVwl9mbgNZNri21pa
	 2XmsvpGPKaQxVVZFnweIfN8ZNFebquWVZNu6KP552h75dpNzrMmIOzHdh87xw0G/CU
	 SrDcwI9PLghtpqQCS3T46jIE7mPDov9JG5PiQzzxYjlFg7a1iCAHDV+9skJhjeaajO
	 I0IJRAxxcFTzQ==
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
Subject: [PATCH v3 05/17] i3c: renesas: Reset the controller on resume
Date: Mon,  8 Jun 2026 23:15:31 +0300
Message-ID: <20260608201543.804902-6-claudiu.beznea@kernel.org>
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

Reset the controller on resume after enabling the clocks to follow the
same sequence as in probe and avoid potential ordering related failures.

With it, renesas_i3c_reset() was updated to use read_poll_timeout_atomic(),
as the driver's resume callback is executed during the noirq phase of
resume, where interrupts are disabled.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- replaced the read_poll_timeout() in renesas_i3c_reset() with
  read_poll_timeout_atomic() as the renesas_i3c_reset() is called
  in noirq phase of the suspend/resume; updated the patch description
  to reflect that
- collected Frank's tag. Frank, please let me know if this should be
  dropped. Thanks!

 drivers/i3c/master/renesas-i3c.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 76a4831098c9..7ef317b2ba39 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -480,8 +480,8 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 	renesas_writel(i3c->regs, BCTL, 0);
 	renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
 
-	return read_poll_timeout(renesas_readl, val, !(val & RSTCTL_RI3CRST),
-				 0, 1000, false, i3c->regs, RSTCTL);
+	return read_poll_timeout_atomic(renesas_readl, val, !(val & RSTCTL_RI3CRST),
+					0, 1000, false, i3c->regs, RSTCTL);
 }
 
 static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
@@ -1483,6 +1483,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	if (ret)
 		goto err_presetn;
 
+	ret = renesas_i3c_reset(i3c);
+	if (ret)
+		goto err_clks_disable;
+
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
@@ -1502,6 +1506,8 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
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
