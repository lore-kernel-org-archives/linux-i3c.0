Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E00CD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xI8eRgUNXJNYhaxeEGqs7m4l2GlRd7AbsERyeoE1Xgc=; b=kh1vyEPWHUPkhD
	NijVObt3i/oqv8HRsl7hzOkt5GKT+kkTCkHfO6eyMdbAnnfawTeqj0TtiHI0Ac9dSzEkjpZVlN1yL
	zxmcYNinTjh678gb8H22pEWs5W3GtvoiVpzhs1tei8tXAdgQX3VDSKfzWdxBFcvMrfN4FkRtRzMwO
	eDGrtftTHffl8dxVrvYfa60WDLVphB6UZR4MAC4WylS4BsQiEz/vybA6HPepWkKTevDD7cnKhyavq
	TxDaXX0vZQP6SEvBvtkcqHSl5c+UXzSsBkbxvFJXsivx3iDyV99LXvjj+5LCr6COtw0xABL7z9KCv
	p90MjpI33D8th5G6f8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOd-00000004LkA-1b7u;
	Mon, 08 Jun 2026 20:16:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOb-00000004Ljg-2Km7
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B34E40298;
	Mon,  8 Jun 2026 20:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B891F1F00893;
	Mon,  8 Jun 2026 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949789;
	bh=7IliUUkRt8PSvyKG237cNGfEJgi46uZHPdCs04Y0B90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YD0hq1WLI2Vpo65ogL8UokmhD0rd12hy6mh7syS292+QoF8D0Gz3CA51JC3UA6eKj
	 3mwFQE/Cctz3K2EExFVFxU5mEwM8meN31orXRYBCLTas44cBk7FqYsw4/ZMLi5MCU4
	 Nr89wGiF+btH9BMLVA6hp5JFHdyfFb5fQ9i3SWDGyYMat0Ik/BlTdpEXBNWjNeKTKn
	 oY2bA2CR0T6vAntPXqVHItSm9AcDVZsGyvM6TcLo5MOfHmiz6SbErcMfT92I8rDroQ
	 yGmY6d+uvQnH7LQFsAEsQWUepNh5JezdlSFxGof7TEZ6+meJuPoIapvl7FMFJdBlNc
	 MKDcmvaGt7VpA==
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
Subject: [PATCH v3 12/17] i3c: renesas: Drop the explicit memset() call
Date: Mon,  8 Jun 2026 23:15:38 +0300
Message-ID: <20260608201543.804902-13-claudiu.beznea@kernel.org>
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

Drop the explicit memset() call on struct i3c_device_info object, as it is
already initialized at declaration through compiler initialization.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 4504c6e6db31..dab643cd8859 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -634,7 +634,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
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
