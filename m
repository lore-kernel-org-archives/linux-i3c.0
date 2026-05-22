Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4A6CD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5jJl/Tp/3pwrrPyX0MDhwdUioacy0oduqqTda6sdio=; b=XP33UHO/Ldey1a
	JmwcQTqWjV5V1/Bqpu5t1d64zwnit+iVIlbZ5RPDgO5BZ7MrTzQDtvvN/wPO+8i3RCx7kYaR5E7pR
	fMe/Yb2bRIGZx8CwxWRLtaPgbGj0QB/rBQk7msA+2NBDTWA8SHHJXyaXisg7QhpUmU7Ah7HvgKVYC
	5Im+olKUiPHK7Ea5KBFIbYrgcKw6XdsY7NRC16ROeYLLwFHyZKIPk6bUxTjd8QkWSzFQ/lKWX3pfX
	6+rRHaglyG0AGJiJ3KAbvOtHiUATkwudlFYZ9ElAKBqCm8r0MRUV22Gma12RIpiQ4EwzW+LVGqhDz
	1D0s4yjZLZoSrbjn00BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxm-0000000AUAc-1la2;
	Fri, 22 May 2026 10:18:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxj-0000000AU75-1OS1
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:18:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 946E2601FA;
	Fri, 22 May 2026 10:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836F31F00A3D;
	Fri, 22 May 2026 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445118;
	bh=ZdZdbTP0Zl4cO/TOEBD6ohZd0OjzNrlsg3iBs2gbCH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hyGcNSVR+OF9Z/oWgWO8av6LPOV4KJacF4eUTOfcvcdAVVvdTUG8N3IU2MWEuZSko
	 dEAlbdLPP29iykxP8aNw4Y5KYDv2uSi9K4r4xuL25db0bMbAbYA5Qi/yUHSIhXOWa+
	 FuvZsmLYpaJwPRpB/8+NCtOsZG5CDdMkFdcQGt8rc40WZ+jSuqrg+pT93+L34SLwG9
	 xQDOtl5DTQpg4wjtA17puEdf06Uh8mujOgzXHMM6iQQ9KD6fM8+Rhx3OQjHZFy0CvN
	 xYnsdggAWQg7eMiVNVqIPp11XUqFVS/5P1N1IT8Rnqq/L2Vf/GLCrkc3tDYt4clZou
	 teFto687IxxLw==
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
Subject: [PATCH 05/17] i3c: renesas: Fix re-attach
Date: Fri, 22 May 2026 13:18:03 +0300
Message-ID: <20260522101815.1722909-6-claudiu.beznea@kernel.org>
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

During re-attach, the device may change its position in the i3c->addrs[]
array. As a result, it may use a different Device Address Table Basic
Register (DATBAS), which needs to be reconfigured.

Reconfigure the DATBAS register on re-attach. Along with it update
software caches.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index d2f29ed0b6ed..5174a390d668 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -892,10 +892,28 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	int pos;
+
+	pos = renesas_i3c_get_free_pos(i3c);
+	if (pos < 0)
+		return pos;
+
+	if (data->index != pos) {
+		renesas_writel(i3c->regs, DATBAS(data->index), 0);
+		i3c->addrs[data->index] = 0;
+		i3c->free_pos |= BIT(data->index);
+
+		data->index = pos;
+		i3c->free_pos &= ~BIT(data->index);
+	}
 
 	i3c->addrs[data->index] = dev->info.dyn_addr ? dev->info.dyn_addr :
 							dev->info.static_addr;
 
+	renesas_writel(i3c->regs, DATBAS(data->index),
+		       DATBAS_DVSTAD(dev->info.static_addr) |
+		       datbas_dvdyad_with_parity(i3c->addrs[data->index]));
+
 	return 0;
 }
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
