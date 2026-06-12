Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BBBCD98D6
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJr7TmzSCszB0UmH+Jw+VRDxlf/1RV4bBEFj+ooepCc=; b=beTKEFAp5103pC
	9sn720xlRKgdkrt9/sldsqUOzKmMJ+mAjMim9G0jyGG9840Euj84LwCznVOqUHySaU14sUlfbb+2t
	PPWpcVH4AdDKbHxBM5HsiGgvgoHB8RobiiytJ0779kTraIy6IOsaO7GDwGtHRsYp7Md5bH8fBJCSj
	G3xXQy8wlw1I09qpdf0Ae3FSP8mpRbk4sLRd0z3l1U3aiU0J1eLNi9RksIZsAK+hGK8c/lKbHedTF
	/0tqr1w0lLsicT4o5IF3gogiZu7jegqMB7qf4gZ19XE2lMP/K1l6HS1uDL6LnZaEfYa1TSECKw6GZ
	txW0kQ5QHj76TvVbIrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4O6-0000000BCuf-32kv;
	Fri, 12 Jun 2026 16:05:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4O6-0000000BCuL-0mbm
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E96A4438AB;
	Fri, 12 Jun 2026 16:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895C71F00A3A;
	Fri, 12 Jun 2026 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280341;
	bh=BNa1Yy4/n4O8yP/n3E9RJCNAEBckIesIRrdI7M/f4KY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eVdCmdB7vJi8arbvUAmc7GpYBuOnClmShkGc7doM6AA9gYizunk8DDqUeFsv0yn6j
	 jQaPmMj22aZMIst6zJa3sXdWni1Gy2sSnLvrKdrb9FZJUmdgFjFeYQGKEQ7GH1cwiJ
	 n1cSmvMK1gV1LRWZdP1VloLryPDtyOmu6bXNrjszZHjklUH0UIb6oq8NU5bpDzWC4J
	 l9GNyeQRPhlMzGtv2grX2du/qJoj2J8iQUoakeVo40gdX/9i08xJI6DK9FoUZj5i8H
	 d5BVFXE1irdp4okaJU6L0pDVi3m4W5bHRwmDwxjNjbP6Jg2+uHx1hgS/nhPJ+FVMxc
	 FAWYjy/FHOlbw==
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
Subject: [PATCH v4 13/16] i3c: renesas: Organize structures to avoid unnecessary padding
Date: Fri, 12 Jun 2026 19:04:55 +0300
Message-ID: <20260612160458.3102106-14-claudiu.beznea@kernel.org>
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

Reorder structure members to reduce padding and improve memory layout.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 96d4fed32bf9..ab73fee1813b 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -221,19 +221,19 @@ enum renesas_i3c_event {
 };
 
 struct renesas_i3c_cmd {
+	const void *tx_buf;
+	void *rx_buf;
+	/* i2c xfer */
+	u8 *i2c_buf;
+	const struct i2c_msg *msg;
+	int i2c_bytes_left;
+	int i2c_is_last;
 	u32 cmd0;
 	u32 len;
-	const void *tx_buf;
 	u32 tx_count;
-	void *rx_buf;
 	u32 rx_count;
 	u32 err;
 	u8 rnw;
-	/* i2c xfer */
-	int i2c_bytes_left;
-	int i2c_is_last;
-	u8 *i2c_buf;
-	const struct i2c_msg *msg;
 };
 
 struct renesas_i3c_xfer {
@@ -262,22 +262,22 @@ struct renesas_i3c_addr {
 };
 
 struct renesas_i3c {
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
+	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
+	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
+	unsigned long rate;
 	enum i3c_internal_state internal_state;
-	u16 maxdevs;
+	bool resuming;
 	u32 free_pos;
 	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	u32 extbr;
-	unsigned long rate;
-	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
-	struct renesas_i3c_xferqueue xferqueue;
-	void __iomem *regs;
-	struct clk_bulk_data *clks;
-	struct reset_control *presetn;
-	struct reset_control *tresetn;
-	bool resuming;
+	u16 maxdevs;
 	u8 num_clks;
 	u8 refclk_div;
 };
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
