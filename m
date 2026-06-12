Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3078CD98CF
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZiElQZ/RJQ23W5JTdJOzVPrXJg9A6pFLGTVUf/cGyc=; b=4gtBeC4OFmQNnz
	WEvMunNGy2SQrSyP0Fzg6d7YGKQlCduLF77TbZCm8BvSqFVIgpZPqCG57clQB93E0v50wRyVm2vCw
	OlqiXJ9vPWCAj1nHuHoN2cvUmUJquSwx1Qp3qycwhMNdtc4kBQ418+kHmovL1Hh7PkP4mM4G3qUnU
	kibl3h0QBbaYHTwvyIRqo89CqKy12851EjkEGkb4rvAwagerjsI51/E0OM9eUVNT0YBM5rkmFPtw5
	4EkM8wYVbowXDcIvtmVQkz9nK6uRqMWdZPW5hDfQT2xWHg1AEBhnwcR7FpLx1yan2UeGtSfLGP+Hk
	5+HBRa+QmPfrNQSQST+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Nr-0000000BCoi-1lkO;
	Fri, 12 Jun 2026 16:05:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Np-0000000BCo3-39Hv
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 363F260125;
	Fri, 12 Jun 2026 16:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CD41F00A3A;
	Fri, 12 Jun 2026 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280324;
	bh=6CzvHKRqj39+/AvnEcb6S6lx4Dcw1R8+JnnIfeHoRPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VRTcxi9YUZQ4nHQIVe7kleJ0vzjRh6QhYFwLE0izBmP9MlRORiyzj6AZ+ly3kQ2No
	 iA5VS/+SFwmLN9PMRy714Pr4y/R2+z0X3ubo0SutnhEYL44LmWMEghvbP+SqSiBqbk
	 B547hPYBLL7EAgwg5Axwz92EFmitYmWSf91WNEbBYQE+HqwMxOOgbkvDtCMnN7ZnP8
	 yrb9twmdF9ANmf6Z9eIEoEoWMRfJU/4FK6+142XD9aZJ53pXaGpltU6NzuMOkwbTob
	 zX+CnBajJ2Z60IzGFRlgGAS9878KlnWUO/3DxVe7ay3IofehcxxS8pZEFUXFNIvKhw
	 Mfn7tuNErwzzg==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 07/16] i3c: renesas: Clean DATBAS register on detach
Date: Fri, 12 Jun 2026 19:04:49 +0300
Message-ID: <20260612160458.3102106-8-claudiu.beznea@kernel.org>
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

The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
register for the detached I3C device to avoid issues.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index a63edddbc9fe..abe24e563d21 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1042,6 +1042,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
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
