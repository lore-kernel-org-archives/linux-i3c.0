Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71B6CD98D6
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjnF380Z84YRIlnwYHpGwm98GKEengi/QOuhiT8tafw=; b=GDXeo3Pi1zYib5
	VhOhKLTadhhS8PEg3pCQaCX7Eb1iDwff4CbOTB1S0zM28jx+9UPupoL8KR0Xu/zAPfAaBvprFGXWo
	ifd7s3WgY6+GTYVL5HBXtZhW7XUIgZkDo1LA+OdAirOQnnf1bta1xf5ju1w1g0okS0Nmyxm+W5Rk9
	9ZnU/iaB4jIKkTL5FoFYbUIkgHqdxu80OSashDoXb2yvOUn/P18IcpnLuPfIBuG6zV01lYM0xTgjI
	yLV8yYXUn4fQ+PLbU5Q+8uLnf6XxXJ1uvz/+RIyJg9vbIuo8XWdZac0XWmlcdScCUNP6QcshJCHCv
	4HO1KFaVa5QhrR+scSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Nv-0000000BCqc-2PyU;
	Fri, 12 Jun 2026 16:05:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Nv-0000000BCqC-11U8
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A440C4039F;
	Fri, 12 Jun 2026 16:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4AF1F00A3A;
	Fri, 12 Jun 2026 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280330;
	bh=60IK6YWG+dRDFCv45v80sBI9qCNyBc+1E3j9SG0opzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aNuQSghq9i4tuHySJTjA1uYoTkudWnrfw/8khOg7fxsQKltb6hnIaw8T4Tg0NToTE
	 gHAMPRtN3Okeq+ClNzkAxDZzHCxQHotc1a/MOvsSM9ua6+kbJD7TyLPIYjOEQcT05N
	 SmoXAu/stl3YVWPfHKeuBSx0Drql1I77rceyL6spV+I9Easc7Zz7jhjWjV8LdV7ZWr
	 hejWb0psnNK+dNrKeIuJ7jJ+QNVWdHnRqNSyb4FKqSQcp7gJo1lv9cZ0etXPdsC8wu
	 0VtwRa5EGnRa1U1sl5T3roY6BznyMRNCkD2e4QUTzxFoBB297jWVHCGxhYTOINf/lm
	 az9c8ax49l+0w==
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
Subject: [PATCH v4 09/16] i3c: renesas: Return immediately if there is no transfer
Date: Fri, 12 Jun 2026 19:04:51 +0300
Message-ID: <20260612160458.3102106-10-claudiu.beznea@kernel.org>
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

There is no need to allocate a transfer structure when i2c_nxfers is zero.
Return immediately instead of unnecessarily allocating memory.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- updated patch title

 drivers/i3c/master/renesas-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 9edd2dc96107..fa9c15381ed6 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1061,13 +1061,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
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
