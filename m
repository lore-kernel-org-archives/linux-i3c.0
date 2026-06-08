Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C121CD6E79
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQUZJKCIYkrZj5iEKpZvMoZA6bTJFk8LoaSd51XjyKw=; b=zn2x/e+mRc9ggK
	0W6Zdf23ROIRQVpi7k0MAWtWZ8v0GHl4B3mh/1HBIvXOC0GCLvX6ZaBv7woXaxhBmsZMeIm9p+XO6
	XKRtohmvVedEHovrq2mnX/ynGT3i9cS4u+f3ZrdvklANicPqoYvrkKpOAzwIcH+2bA3dSOcekc2T8
	md+tW4gs04/UVvzxArSKJ3qCrE3iylTLliAjv+8w8eSmvXcldx01UcAki7/bZHy/pWC1jfijL7eZl
	1kU3qgWS5Ld6XitmEq42N8A56fEUzngjdU1jKh3pYS0BxGftEgrjc364nEX9LVvrIPzvw8nsq1EMd
	XshezaJzVfz2d0NWENGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOT-00000004Lg2-0w9V;
	Mon, 08 Jun 2026 20:16:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOQ-00000004Lf3-0w1h
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:16:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A8013601E2;
	Mon,  8 Jun 2026 20:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3CB1F00893;
	Mon,  8 Jun 2026 20:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949777;
	bh=A9Hqv4TlpLN9iAGI/RzzflDctnOwz1ujQS2MKeOsnD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jFwB+MQP5obdlxGybkTw8dCmvG6+eE/4+9e8wtKjbxBC2mpNg6cBgDUol2fDDjLZk
	 96UNVuWhBcVYoO33C51jQ/GSZ2HSLiW2YAwOuAJH7fzVGIKDFaLTbNPiKo4OObkWHj
	 SoTVfBzgY4qdvIquoapOUCZ5gFMW1jfVHv0LQOLrCEU7yj65NI4QnzLsMYrFdLYRwX
	 fWSAyfMidcLNN3e+kb3iuUVwJhoQPpDWcylTYOjZuwwgse3d9pfn6EHfahKg8NSI8u
	 1kpnz9FFzCuOBc8qce+ctcU0o68aK0O3wzlHfYgv6IcvYoGkxBXuk1dBjE8wKQeh44
	 Fn0hvOeMDsDQA==
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
Subject: [PATCH v3 08/17] i3c: renesas: Clean DATBAS register on detach
Date: Mon,  8 Jun 2026 23:15:34 +0300
Message-ID: <20260608201543.804902-9-claudiu.beznea@kernel.org>
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

The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
register for the detached I3C device to avoid issues.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index f96848022c45..195c40956148 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1047,6 +1047,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 
+	renesas_writel(i3c->regs, DATBAS(data->index), 0);
+
 	i3c_dev_set_master_data(dev, NULL);
 	i3c->addrs[data->index].addr = 0;
 	i3c->addrs[data->index].i3c_dev = NULL;
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
