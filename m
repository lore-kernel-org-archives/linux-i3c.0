Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A3DCD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ogv5Y9mxdalHULccBFEr9VKoC9qYdIJuXLGK0T1tRg=; b=BN80bcmTsHE7en
	6GJVToT2cgxXDZFgWnlTggPS1RsusCwpGPB2eO7qwt8bJrz8ubfOKrcWwm7Vd4ishTttS5Ob8zJsz
	C4nfCWin7viuJCamq1VtWWfhdIcvcjXMLb7wDmfoC8uHmxDQ3zNgCAqwUlnNkJJG9mUsigN5qn+mj
	ZnskbrgIxRRFmqaYlb/3jEOCtWBFR5nJWxuYkJZT0VKGU7Vb1D/4mTnQw683DG5pfvvJUUQSYIEPL
	BcC6gDHVQaUFaco+O/j44vyz+gSOv0sWygZNU6Bh5h01TwkQK+EAAmkMojcflpGIQhjA256tdFXwK
	qsChZrrH/BZP4dKM9O4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMyK-0000000AUdU-1bPi;
	Fri, 22 May 2026 10:19:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMyH-0000000AUc7-3w7p
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:19:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6937416A9;
	Fri, 22 May 2026 10:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C529C1F00A3D;
	Fri, 22 May 2026 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445153;
	bh=DsYiQHGyumygtMBJTB4arAhBm7bfD3isQprTj48F95g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dKrzilp3vQseph29uqh+gdL0lhzui08VFEISp1/cDsoJojVk0zB8yIp36SbbgSpMt
	 kMD6cxlFGFqeJhWIMI8gYY1dkKbpXKcDbkTasQi0dhvOHDZWEQYMBK7FtppkxfJhQ9
	 05hZlPcgUXqFvTSGdVD68MoLdNeNgcgezprlcY1NYqZrc290G97XjRpMbrTL4KssHU
	 +1tYOlB5Nrjogu97OHJgvIAWJ/aopmFkaWgW1C6EADm7a8ZRqmZ3gmEOEfKOzMEzij
	 CFdjZYSa2AxVB9Ah9L1EQ7fBAf6AzC7X5qauzPiFKziPygQeDesq/M4YmeHaH5kxEA
	 nKurnAW8GFjJg==
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
Subject: [PATCH 16/17] i3c: renesas: Drop unnecessary tab
Date: Fri, 22 May 2026 13:18:14 +0300
Message-ID: <20260522101815.1722909-17-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031914_020709_DCC22019 
X-CRM114-Status: UNSURE (   8.66  )
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

Remove an unnecessary tab to make the code cleaner.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index e6e05ac03082..a070db4d2440 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -109,7 +109,7 @@
 #define  NCMDQP_DATA_LENGTH(x)	FIELD_PREP(GENMASK(31, 16), x)
 
 #define NRSPQP			0x154 /* Normal Respone Queue */
-#define  NRSPQP_NO_ERROR			0
+#define  NRSPQP_NO_ERROR		0
 #define  NRSPQP_ERROR_CRC		1
 #define  NRSPQP_ERROR_PARITY		2
 #define  NRSPQP_ERROR_FRAME		3
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
