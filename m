Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89188CD6E79
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZJyutCDWGoSyGNjzhUqMeDs5+EFXXZmbo/Oqv3bC74=; b=Q4ZAyeDeDaiNrT
	dt44HeRNhJ81dTZRMS0wUxLtyhy/hto8t3Hj8k/EiMQ1e0w/7/3AVsqecWrxXTzNLsYKuFa8jbPgK
	lyW8bRQZ6t7qROY5Id3Rm812OUcc9KsFWaIMQAjg6H4xWXpBLiWaigda09bC+CoEq6M5/HqlCekr4
	LsQNWqLeh7qddWiYWlldSpNkD8qZtA2fekGyVooZQ1mS/jmitzellQEX9BFQzbF3DlTVs79odo7xV
	MfHzgjw61gK0hY2r6xlkk4l8zQvxDF6ZlAW4hQZBUfwbo7d3ITVT9bPgqrqJ6iwhOyiXcIgE0kFde
	QdBFctNGji0lny0lYT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOX-00000004Lhl-1GpZ;
	Mon, 08 Jun 2026 20:16:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOW-00000004LhC-0kkq
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:16:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E3D7601E6;
	Mon,  8 Jun 2026 20:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67971F00893;
	Mon,  8 Jun 2026 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949783;
	bh=wqM6/GnLxJaUFO8vrbASPnnDqBonjG78AYUFZyrjnZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q+LAPTwQ+77UoECCCrrriYVtn04/cGnUMk1PzaSWWR3pZVYwJYkmUaWhLEjUPfSUA
	 UVJL2T928DIGqSsefqKeMrAXMAELpLlruqyVb0E95pU9CnXDxUwZcj6pQuTWrAS0UY
	 ulgWtpLcl3/0u8JvpDP167H4yTsmJmawrcOCZLIsUzwX4Dkg+57xtoxZ37IWU3JOIY
	 gpqx07pwhL0n10kn/9/mFmOG5raCEGM0hjNWReogXQhDR5ZpAn87UWefF2LvQNbqjX
	 1rBuSmQigah0x2EeCf9vVG9lBE5OLez3sxk+zJnDjG9LLWMeZh4yuadrqAu5ejm0Ug
	 ogV8z2A6+zW7w==
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
Subject: [PATCH v3 10/17] i3c: renesas: Return immediately if there is no transfer
Date: Mon,  8 Jun 2026 23:15:36 +0300
Message-ID: <20260608201543.804902-11-claudiu.beznea@kernel.org>
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

There is no need to allocate a transfer structure when i2c_nxfers is zero.
Return immediately instead of unnecessarily allocating memory.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- updated patch title

 drivers/i3c/master/renesas-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 4a055c9f4ffe..1fd39dd57847 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1066,13 +1066,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
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
