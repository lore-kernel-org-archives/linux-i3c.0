Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43D2CD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCO1dCtTIAIVsrmm0JHckEzToZVnuoEPRgbemdz1qMI=; b=SLMJnW4e0TFeuv
	oeJEr9DmbnkP6RVLabQzANhurkYUFuDJ2kDS/ImOUtLFd1HLYdF2BHDzKIpgWoMh1IY8BUjGBoV2F
	0oyT1OZRjMDzYDCtP5EwhWP5n3tXCKtIBzK5X5achbGomhiS7RsMmBmxoyxUIPIGzQV/e8QjdmpTE
	1IrrGM6qnAmpEwJwj4JDdSifE6SxtIkUxwYZ922EPGPncbsE7UzGb+f9XZY6c9DOY68frqD0wOCxs
	Gn2xyVvksQbBRki7Dsl+Qtb8jxZmUSd1nElMR0ky6CbUU0xERDKK3kfd8zqpHmzlISfiLqXoH8Upa
	jb3pNDDhX0OR0i1BhVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOp-00000004LoY-2pd4;
	Mon, 08 Jun 2026 20:16:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOn-00000004Lo2-3d73
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:16:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51F44601E6;
	Mon,  8 Jun 2026 20:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B80C1F00893;
	Mon,  8 Jun 2026 20:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949801;
	bh=V8FpqfK6BrNGzXwyagk5netU9fKT6/4/WWtxZJz6REo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CYlgAbpewYwlBMRSlX7tg2SrLooa/aacJJE/A67/cjnmG5ZZZaW1Tri6up6oMtYLs
	 V/qOjlIffVMoeVbfJG8R9Jp4Hx72clhGZXGL1y4Xp6yhAcFFCOBR76IYrcX5rnL3DU
	 CuK8CgJ07dqX7lO5qEuUz8uJY874Z3+phDY1EMfqW4neRWxeXCNXLGHzzCHsWjbYoI
	 ZwO3n5s78gx9qfm5zq8wvPERAIfEiIwpSeKkcv+3Pz58IdcUMmeHlz4rgk76mJxc35
	 WBiCSU+d+hjemN5l2aAZeo7CaciFZt57J5+D1pcCSM8vU5PlsbJvkHM6zexZEcetr5
	 8/trAzQRZhaeA==
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
Subject: [PATCH v3 16/17] i3c: renesas: Drop unnecessary tab
Date: Mon,  8 Jun 2026 23:15:42 +0300
Message-ID: <20260608201543.804902-17-claudiu.beznea@kernel.org>
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

Remove an unnecessary tab to make the code cleaner.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 6572934a1837..b6c282c53a54 100644
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
