Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BF5CD6E57
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Om7xC+JovsHqKLb/eG4KGxoapAFqFVxsnu3Jtki/HKo=; b=KcKVlpBfE1lytW
	m5R8FyjBcr9Ru9m9F4Z2RRXH+41tjnCr6hYxSoPxfoPSub+NCe+ausk+KqnB/iZ0ze1hVMv7biQT3
	eMpC2HEtZCaIamIyQqhYYk8AWsbtgz99euUcJCU3Iwv7muP2L2QwR1lnkBskbYiXUBNkQ08C2DqbD
	c6QybvxcU2NKj7cXgOGpVYapqbs/9cvEnMn5I16/uY8uK2DF5PR7OMETbl7d5UyIuQPqa295s4PH7
	UuxZKK4BhmuCiDw7sBoL4OCop+3hM5Z49UsJWNK87WzoD5NVvaYVuzUA5kVJ3peRKKrVJmLF3d8uJ
	SyGV2rAJMpPNmqy/d3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPB7-0000000D7Kh-25G6;
	Tue, 02 Jun 2026 13:29:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPB5-0000000D7Jq-3c1H
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:29:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93F15405FF;
	Tue,  2 Jun 2026 13:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2D11F00893;
	Tue,  2 Jun 2026 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406947;
	bh=NUfAs+sHMqHmxNkY0D9GV+o/r6ED3U2p1btc5r6UtuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UIwgl+6+I/qo083RzdVRohHXZbyCK+Fiiwnt7Ax7yoUgbLaocDzci4sBWeu6Lw9AQ
	 DEZRgP15OdmkmyQyt9z2dlG1Z6Ge80NH6U04Bkh5MLIBRhWKk9iBfib446tXipBRQA
	 OFrz0JlkPqNXMWSNMox9jHSEkqNzncLlnRHTG/+n0SlNDf6F4+9TQEXWFxQrurhsKh
	 HTUSz5VNaSqD89OWFTmMjPO331hlmS9jWF0y+WCcBemDrncMXXWSBAWsSD4e2hhSod
	 FTRm3v7lWhBUcsZ2/DKo1nhQm4y0i+ooihERDCvCKufbWk1nqTpD+3q7hfVanONDYE
	 2cZCS8CfilHGw==
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
Subject: [PATCH v2 10/17] i3c: renesas: Return immediately if there is no transfer
Date: Tue,  2 Jun 2026 16:28:17 +0300
Message-ID: <20260602132824.3541151-11-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062907_944327_103199F2 
X-CRM114-Status: UNSURE (   9.76  )
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

Changes in v2:
- updated patch title

 drivers/i3c/master/renesas-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 860c9f2f17de..ed925b673b38 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -982,13 +982,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
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
