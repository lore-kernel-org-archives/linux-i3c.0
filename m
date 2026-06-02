Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD36ECD6E57
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEKIQX00EssAfRNNNLP5hAN+M9cJv6BoG1TdgHFA+Ak=; b=rBpdXNT5MlYdH4
	9d8ZSaJrh9zghGESHo55rVFnGxgJDPitlIb5PDq+6PL5SZs+/d/3u7YYYi5fo6ajnuZWmmR1riVuw
	rhkeEhnwVi076YlzA1vPFVkvc7TPhBeCC1jJ+adwhXqZz0W4xiTHyZnNry0Y4vSUAaFeDxmy536GR
	m4ZaF0rEd/5gLtimY7aKlMspfG4r4K/HtH6/Vf2+BYHlnN8iQlzIvBBzNnyswOfCZphGzu1kEXxlt
	D85FRmFZS/9agV6DSApx2rUBHZkbi9mxGts1iHpxGtjzTE217DkH3yiWIsDJDPqqHz+56U/3Ss2Al
	23i8zK++nlsPQ6BihJkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBC-0000000D7My-2e7G;
	Tue, 02 Jun 2026 13:29:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBB-0000000D7MV-3FvE
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:29:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CCC7601DB;
	Tue,  2 Jun 2026 13:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA4A1F00893;
	Tue,  2 Jun 2026 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406953;
	bh=jTdlX9zP0WzRiGWe22aG2+zirmD8Ab+DdfbEq8C2jSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eThbhNp0BZC+dZv28FvrYbiJPpGZ/zO6vAvWQStct9QlCzcI/ej1msEvZTwk1KrvF
	 nnXNp9VIeDoYmG8H+Rau2XhINu//jieOqwQcff6uRsoYm/xItDPIsOhf9gCGZEY2e0
	 6dUeAYj01nR8Mvdk6EpxLcjAn2NoTxr40JUOpvGCWUksWrD7mvfh70O2gAVhGtLvsg
	 fIYgN0wZY2RCVDHHbQYGCnsVJM7tnc8pJA+6yJRUj2onzon9IG9uWr8IK4/PG/DNhC
	 r1Lm93RrSaFD1eCu6322ckvRKgX73fSuXAfM+b8UV5IoHLwJYs6IQiCyWyqygFXqPN
	 7UAMc/hoBWPZg==
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
Subject: [PATCH v2 12/17] i3c: renesas: Drop the explicit memset() call
Date: Tue,  2 Jun 2026 16:28:19 +0300
Message-ID: <20260602132824.3541151-13-claudiu.beznea@kernel.org>
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

Drop the explicit memset() call on struct i3c_device_info object, as it is
already initialized at declaration through compiler initialization.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 601d879fce9d..6725b7fe5392 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -631,7 +631,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
-	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 	return i3c_master_set_info(&i3c->base, &info);
 }
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
