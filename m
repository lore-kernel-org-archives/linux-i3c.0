Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA58BCD98CF
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lt6JT7cBDSwqzFjhU4Zukeba716k9m7vHCdy2SZ2TAQ=; b=cftpDbovJo0g+C
	sm9NRbL+x1oXz+VRSvnhcFfOvf3pAahi+b0a5BEtGXkpEPKnuyaALRegKhRbFrng3G6+rEUHubwNd
	bxJxLAOHQEDegw2AqNiV+lfH/b4ohgg4kdl50Jf4Emaj3xitRFeiig8pGa0zNa19XyB1YKKf/vyT/
	V5KfmwfWa/34rJ9tE1x4TBtFpqmwZQBJ3Nh/4IdyF5iei6CuUivWstU0ZAzaTnTsqW6lbrNW1PpWB
	NUBfqjWz2WlqskAuC4vxgEkd8H2WG0425/a2E6nLYzZbWAsK/7zbk6mSd1huEDeYTTzxQug+0Cf7W
	SmgHctnwiZvaykNIgc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4O1-0000000BCsx-2jZI;
	Fri, 12 Jun 2026 16:05:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4O1-0000000BCsl-0YM8
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9418860126;
	Fri, 12 Jun 2026 16:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C3E1F00A3A;
	Fri, 12 Jun 2026 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280336;
	bh=xxb788dRxKrIg0/S4TBSGiihi29qab/T7pmnfgUsWDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XeTGksnxpQHBwCMa/7PvGNukBYIgoXZVuY8usOyB4JEJcXSoBIwLRlhuqKN4kPrmS
	 /TfE1JXUBAXavSS2sKPunIR6lGA+9YMT0fANl78PAfzhdjkyqlqKuH+KhubCEt4iNJ
	 U79vKJV3crXT7gD8GH7gNHRe3rWAHtD0A6APcEeqE+g5G9zq9ZtHCpyMMNvdK+ALWZ
	 P7a8PwPFsdMOiq6jMLJxjY9N5QqLt5ifw2q83OpD+d27zUiIohKxhfkIqAE3vphLR5
	 xf07CHDlYuZN+rO+Rna4wbNHxxrRb6yAznxrchEdkAlVlrq5IQ6sR+DgdFK2vwR4T0
	 WHGrTWJe2XX5w==
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
Subject: [PATCH v4 11/16] i3c: renesas: Drop the explicit memset() call
Date: Fri, 12 Jun 2026 19:04:53 +0300
Message-ID: <20260612160458.3102106-12-claudiu.beznea@kernel.org>
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

Drop the explicit memset() call on struct i3c_device_info object, as it is
already initialized at declaration through compiler initialization.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 883be4326e43..d5247e841a83 100644
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
