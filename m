Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C90CCD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb22GRmd0brTHqpSQvorcbN10fx1hwu8n/R2t18gEyE=; b=Nl3jctizbi88T/
	22mxBTY7LJ3OHYMJM6Y+P+VvnqiaYZ7IC04GNhSX4KoJ7BsrQkYhjm0VJY+ckT/Pu/zpfynHWumoO
	iSJetZ4jadgXbq7OCN0cgab4te90UK71lNlOlARUmEXdd+D7WUnPZ4ZnNVfzBGnHy93HfijNnggas
	ULRdh2ZrNHgS2KmznWp8UWIcGdALcM0wfHTGtZiatKlSqFF3cTvP0jRJ7U5PFMVJ29//yM5eoPeUg
	JhrY0TRp2rtLq+wcDfS0BjzmGORjn1PkUKhhjIGrXOFcaVrZKoJj8o2GRtTNUmJ2z8rb9m4SJjVhx
	LCqG39xlAxtSLXSJMAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxc-0000000ATyY-0gCp;
	Fri, 22 May 2026 10:18:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxZ-0000000ATvt-1clK
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:18:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D06FE60220;
	Fri, 22 May 2026 10:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87531F000E9;
	Fri, 22 May 2026 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445108;
	bh=yJQyuEWe74cl7D3825FOdpVlTkubYgooJJWbJo4v/c0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HTT4z8x3sSC2eolwDB1V6RrOoK19V9Uc+PgfvGd0yoxZCzFSn9/dzEl4tx1DbCcAz
	 sfD25s4VoLSVdDPxFv5mj/d8XexLzB/Zz4JWP1FA4F9N5QuKqbRXygCTNhcU+u786D
	 QbU+vVCMxTUUPItVG3AqJ/gviB6+rI8YASAWuEdK+9MxUz2SOD+cBzXmSuv17piMZH
	 D/50Bv0lM2DYSpMTYX8UUEaVXLOO2DjR/9QN1adh2E/8F67ikp9JkX/uHuUo7s7qik
	 cOKWN58ZLfy0homMy61Fg/4lFDrU+UWAMztP94FFs4LKBSvsRSdshfQ7LUM7JNEEQb
	 2JnmTE9ABf9fg==
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
Subject: [PATCH 02/17] i3c: renesas: Use the divider 128
Date: Fri, 22 May 2026 13:18:00 +0300
Message-ID: <20260522101815.1722909-3-claudiu.beznea@kernel.org>
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

The REFCKCTL.IREFCKS field is 3 bits wide, and setting it to 7 selects a
divider of 128 for the internal reference clock. Use this divider value.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 36e3ccbe66b0..1917549cf6d5 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -559,7 +559,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 	i2c_parse_fw_timings(&m->dev, &t, true);
 
-	for (cks = 0; cks < 7; cks++) {
+	for (cks = 0; cks <= 7; cks++) {
 		/* SCL low-period calculation in Open-drain mode */
 		od_low_ticks = ((i2c_total_ticks * 6) / 10);
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
