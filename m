Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9451FCD8CA8
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTUi1W1SPLK2YauKLIXDAIG2q7g3vNq1JkRr3n2d7JM=; b=vA5BkelQu91A+Z
	ADLAp0n2vlArr1mrVL8dXqFxt7g4yLfPCOTb8VNQsUksj9YjztPpocpGi6Iypkt2JNGrshQhGO1ne
	ehUMErdsDukk1cHbhK0GWp9lu2XhKbgl/rAWSyUKTqy4Rqu+ZEp/S/RaEtYkLDPYT+sVYIWIoaufi
	lyC9UhCBhzPCKWMYS3qU/H/rduUrOi95FxajfPzkW3d94ZsMS3h/xtOrV8Ag1k2yikFYPoRQCb/be
	WkSpFVvvvgnK2K5l6/LcA24/1Qy4AfdQFzMrcma6iQSkEyO++wRbgJsQ6Po9mQYNceQREATzlXSkh
	/QU4fyDuh+GmuHzzaqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOa-00000004LjN-1Rb9;
	Mon, 08 Jun 2026 20:16:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOZ-00000004Lis-0Vuy
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:16:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FCFD601E1;
	Mon,  8 Jun 2026 20:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C802D1F00898;
	Mon,  8 Jun 2026 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949786;
	bh=4sswhCww2SM+DB6DdlgyOdcgr7VXPLt6ZjUt7zMH8B4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=STQCalbnwy7GlJiV4ucOC7dItPB3uFcfObTp0txXXDvcnV4h2GRTVltLX80FGOqDk
	 CXCMYg8MtUxNR0+37vlRHJgibYHauTrlxSSHFbN2BXFuBre4mwZTAHue0/cRZ49ZmR
	 HcgCz0N2d5c5WMG2ob7l1wgG6G2eAN9Ib5L6LurqcGFDk5szKvMyz+pY11eN+9vk+K
	 c0sCV2O6GdsMqg9XesEXBLW/N2vjOKrEl4GEJ4kXmB4FuuB4ZYxvH8DZslRGGONT1w
	 XAZ4tQtgHNJC4IzfI90Nmg20fhm6PpqdaLfAfXL0PkuWV18tO1kllGkDRvkCF6xlXp
	 jnPlDRnXKxttg==
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
Subject: [PATCH v3 11/17] i3c: renesas: Follow a unified pattern for transfer and command initialization
Date: Mon,  8 Jun 2026 23:15:37 +0300
Message-ID: <20260608201543.804902-12-claudiu.beznea@kernel.org>
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

Follow a unified pattern for transfer and command initialization across
the driver. This keeps the code cleaner and easier to follow. Also, in
some cases the I3C device was enabled before the transfer data structure
was even allocated.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 1fd39dd57847..4504c6e6db31 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -726,6 +726,10 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	if (!xfer)
 		return -ENOMEM;
 
+	init_completion(&xfer->comp);
+	cmd = xfer->cmds;
+	cmd->rx_count = 0;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -756,10 +760,6 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		renesas_writel(i3c->regs, DATBAS(pos), datbas_dvdyad_with_parity(ret));
 	}
 
-	init_completion(&xfer->comp);
-	cmd = xfer->cmds;
-	cmd->rx_count = 0;
-
 	if (i3c->resuming) {
 		/* Run ENTDAA for all the I3C devices on the bus, if resuming. */
 		ret = first_i3c_pos;
@@ -883,13 +883,13 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
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
@@ -939,15 +939,15 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
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
 
@@ -1073,12 +1073,12 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
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
