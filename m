Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668D0CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chJCCfZUPgV1O80p+3lyGKO2G+h96NWy3Mqu8eUazdY=; b=B4y11aWKyY2P+i
	BGOUQUy6ehA2cuGD70avB54S9n1SkP5IKQvRbBnVuL1bddI5DQaujsUy6mXL0FjN97P8j5Fd9pBsq
	gyO5xc/36YQYXV2aFckSYNUkgH2glSqymdtIKRN6eQbM0dzr6EGF3gxsTrSwxDeb7EQyx1P0uS1D0
	3nJVX7whMenYgX7TpP7pAaHLZ+MvhhN+Vbp/ZX2MA+KaXPK3VRrBpPFZvtwcio+5UOl7uU/n46XZl
	V3vaXOpthw0X6etT1bKouS01PiCvYJn0eP6sptyN+oay/uVh2lBFk6W0jOZIQpXLsLX0Dfi2ZZgo3
	IYJSnMU0FmmcUguMPZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMy7-0000000AUV1-0hiO;
	Fri, 22 May 2026 10:19:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMy5-0000000AUTp-3aLs
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B77F601F3;
	Fri, 22 May 2026 10:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659D61F00A3D;
	Fri, 22 May 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445141;
	bh=+vFJFlgaUSzlhWn87F6K4JPStiuv1ICWwA4GM2ytu98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eR948MYOknWWdHEvPctgZ+boHq0n3tHGuKVcPKzZM9R8pSXK9MBflVTBU8ZbYPUc1
	 t32ppFnSSusuWRaMvAhJqB/HB5GTdfa2AQiimTc6kHEygdBIZsTxjHyPVgOAQ1dApX
	 4iTPZe5TRO7Sjim1AV9JSe/uCA2Bxj1cANr23nirX9Iaz3wi9CB+y3GwSNxoT8PUeQ
	 OTloT1Z4z7iqLpuZ2nnvfgPIb42WWbJ2JumVbdebBtDjxTRf70mBnEufvLU6Lnoq66
	 6EQrafoLNc8IjJXiNReWC48j41rs7b9midToC8wcmKdmVsjTFudZGpd86mUH+Obhqc
	 fFjoJd4agtWZw==
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
Subject: [PATCH 12/17] i3c: renesas: Drop the explicit memset() call
Date: Fri, 22 May 2026 13:18:10 +0300
Message-ID: <20260522101815.1722909-13-claudiu.beznea@kernel.org>
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

Drop the explicit memset() call on struct i3c_device_info object, as it is
already initialized at declaration through compiler initialization.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 12bf4797a70d..865e67ac0fd2 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -624,7 +624,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
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
