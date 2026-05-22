Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47145CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuB8RfCgwcPydizxQkGF4ZVc8wOfH8XjDUiSCLgMmJ4=; b=xLuOcTZuDvUpo8
	rwWcCbRMMaVZNf731bNxU6d+3xYlApvdSes1D05F43XB7a1vdKnypRxRtkI7bBqvqBUL+oMtYCg1B
	Ub6J8EDygOafeu0TLv/ENB0z3xObnabMu7RBbMvjw8mYwpzdW+AMygU7CBdWJ1vEowF+HD7L0Pm49
	V4p7P2GAFo3Lo3PoQ1sI7vONq6+OZat6vPMZfg4l+iXpRRejFbRBGZ8wJTurHC5TT2G1+s/ythkYB
	vCCSF3M/cN4LHwMr7uqfOLPjvBclxa7HmePOxpBumb6ve4mTb2CzEDY/4Ot5BO3Y9b1r5INxS07PY
	Rb8cG+G+J2BqNLXbTjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMy2-0000000AUQV-0Amg;
	Fri, 22 May 2026 10:18:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxz-0000000AUNi-15qr
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:18:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB8AB40885;
	Fri, 22 May 2026 10:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D721F00A3D;
	Fri, 22 May 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445134;
	bh=ZjMZYfPSJO9ZQMhgvudeE6rW/MiN6FXWJF5z9WaCh7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XNlWY6OPjVIBWhlFjQsA+z8YLFRh1Fle3nuYY28u9LrXGkBpfkuTMWsBRXPqrra31
	 cMAGTiIbbccR8PJncjGOkQs3IlqhDUo3d0yTPD6tm7dR0KKrLFtGVzHfjXayZ49/mF
	 VapJF0cTUwC4IbuQg+9xlSyW0HZbf4TWv3wYCxQD/cuLL2NDHDOPQK1Jj0nBCbXLnu
	 NEkTIsc7mxPJpo5631Q9arSaJrYgtrrPyXQdW7rwdVd9DT0rDH5Ee8Ur0VMrBi4j1w
	 H/dbdFOyJB5K+T/18UOuOXolBqxAZ59qyyOIvxxCMWOiuwkk3R5Ccb6n3w88OSmF2w
	 WmfT7nqlpP8iQ==
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
Subject: [PATCH 10/17] i3c: renesas: Return immediately if there is nothing to transfer
Date: Fri, 22 May 2026 13:18:08 +0300
Message-ID: <20260522101815.1722909-11-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031855_323102_311DC831 
X-CRM114-Status: UNSURE (   9.18  )
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

There is no need to allocate a transfer structure when i2c_nxfers is zero.
Return immediately instead of unnecessarily allocating memory.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index e5963270d6e5..de75125eb013 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -940,13 +940,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	u8 start_bit = CNDCTL_STCND;
 	int i;
 
+	if (!i2c_nxfers)
+		return 0;
+
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
-	if (!i2c_nxfers)
-		return 0;
-
 	renesas_i3c_bus_enable(m, false);
 
 	init_completion(&xfer->comp);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
