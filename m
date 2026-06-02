Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E17CD6E4A
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQPdVMZAoZtN7baiGgy20EwPLPGK3tK2UqK37sFTfrY=; b=dqzeSNM0O3b86/
	/Q+LTTaF2OSEeRW49W9F9UXRdphn2BrzQk23Y1dxSIoYx5cRD8azkB+uknwFrOtpNtcPB+K8iAl+m
	UV0Z5MOybZXOaR3JRbIT7FhhlO32vMQIC67x3pw8s2SpTSUzGKuGioF05c1bYt2f2oJVYZouAPdMM
	mjN7SloG2jZ7B7bLVrybr4QemLGgu1XymY1t37mKb1nPeq0sq+U+R+edDrUdSPS5WdUBYbxYHPtqw
	vSRLwoG2jFY0Wv68cu6S9/ECq/KT39yNC+oY4JGRPj5ggPu3e+UIsHt6teryWR7u5b7XD/J9qIL3q
	gD+HyABf/JrUEw20XtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBA-0000000D7Lz-2Q8H;
	Tue, 02 Jun 2026 13:29:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPB9-0000000D7L9-0CNo
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:29:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F803601D9;
	Tue,  2 Jun 2026 13:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D961F00898;
	Tue,  2 Jun 2026 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406950;
	bh=kB0mTS4bPznyvBQvcWqNat3upb4ComylAy+AiC3M3g8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hZNwz7syLcUbmrM/ow3xjYOeuPvPmns+4mYEF4P9cQF4Z9TlaSqtMSeFzTyEM/H7f
	 +pTrJRNfVeu7Op0Y7NqLn8TghYfLW+gAhy26IkEWcW/l1RS++paQIc8medr431uOkP
	 FXZ995RW3mnEEBwwvUVKygZuP7zrLFJE5kHFXJx0LZHwR3q9xooM/XGpcfhgxiYxVl
	 EzAUkLFpcm0RFFrwdNHuZ6D7HgSi4Q7R2+xtsCxnsSKUNOVSmP8a2jvleiEdfgH3KC
	 HZ7cocmsPGQdNGf/EzVtUyEXyQdONmFTiolkLKC2y0OKGntx7Hgznq2mc5pBMcCDDQ
	 eE3FBm5pLTBUg==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 11/17] i3c: renesas: Follow a unified pattern for transfer and command initialization
Date: Tue,  2 Jun 2026 16:28:18 +0300
Message-ID: <20260602132824.3541151-12-claudiu.beznea@kernel.org>
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

Follow a unified pattern for transfer and command initialization across
the driver. This keeps the code cleaner and easier to follow. Also, in
some cases the I3C device was enabled before the transfer data structure
was even allocated.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index ed925b673b38..601d879fce9d 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -656,6 +656,10 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	if (!xfer)
 		return -ENOMEM;
 
+	init_completion(&xfer->comp);
+	cmd = xfer->cmds;
+	cmd->rx_count = 0;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -696,10 +700,6 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		renesas_writel(i3c->regs, DATBAS(pos), datbas_dvdyad_with_parity(ret));
 	}
 
-	init_completion(&xfer->comp);
-	cmd = xfer->cmds;
-	cmd->rx_count = 0;
-
 	if (i3c->resuming) {
 		/* Nothing to do if all slots are ocupied by I2C devices. */
 		if (last_i2c_pos == i3c->maxdevs - 1)
@@ -804,13 +804,13 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	if (!xfer)
 		return -ENOMEM;
 
-	renesas_i3c_bus_enable(m, true);
-
 	init_completion(&xfer->comp);
 	cmd = xfer->cmds;
 	cmd->rnw = ccc->rnw;
 	cmd->cmd0 = 0;
 
+	renesas_i3c_bus_enable(m, true);
+
 	/* Calculate the command descriptor. */
 	switch (ccc->id) {
 	case I3C_CCC_SETDASA:
@@ -860,15 +860,15 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	int i;
 
-	/* Enable I3C bus. */
-	renesas_i3c_bus_enable(m, true);
-
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
 	init_completion(&xfer->comp);
 
+	/* Enable I3C bus. */
+	renesas_i3c_bus_enable(m, true);
+
 	for (i = 0; i < i3c_nxfers; i++) {
 		struct renesas_i3c_cmd *cmd = xfer->cmds;
 
@@ -989,12 +989,12 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	if (!xfer)
 		return -ENOMEM;
 
-	renesas_i3c_bus_enable(m, false);
-
 	init_completion(&xfer->comp);
 	xfer->is_i2c_xfer = true;
 	cmd = xfer->cmds;
 
+	renesas_i3c_bus_enable(m, false);
+
 	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
 		cmd->err = -EBUSY;
 		return cmd->err;
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
