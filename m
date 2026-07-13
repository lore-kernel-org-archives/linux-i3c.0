Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06228C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rADn0iuDHir56fgqPtwzCTKjq3tYNY7X7HRmJuAt6Ew=; b=FEQAW2at7PJ+OK
	iCkjaB0EMJFWXWVTnXasEj2imEuJim9K1JKkNrH54TTIpkzP9DqXKibuI1jj0I7oe63HzkQ1ONIhf
	29s99+zp/NV+opjrh0psBXNa9JR8vbsamt4p7ltDkJIbfFJdccGlPemDLZOhtOzfZBdPimpTnXArT
	2yRRG2UWgXVsMI4oNdk1LyOyeFF3WjXjqWqvoPB9C8GvFAeYEG/3NMzD5od//xSPFKeUDMdhmaazr
	b5oG6XntJH2p95BkgMRJYWcIu+IEYyOat9a3YFdkIPawuoeRWAVKTFyJuRYEUef+eaGf/oEKR2jQA
	Qthgbda5+I8KnyFo+itQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMH-00000009Jll-3Hot;
	Mon, 13 Jul 2026 13:06:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMF-00000009JjN-0KT6
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-476a130c138so3771452f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947961; x=1784552761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/juGqGDG2fLncz3tYXEPSwjfCpIrvLGtrL87h0T1kX4=;
        b=EvGXrQ2RG20NXQyLRMBmXPqCdU/1PGDA9QMtvwYt+/yhg2oP+9EsjTcOgG6mELajYh
         Z/+Nr2vPngLZ1KyriHV9QkvtqpHsXMlZEOrKO2Aab0Y2d28jJAwbKyEmuxoWSjeznoMZ
         cwTZr6XzUGnvCZRcPlsr58O5X4Fyeg5DMbtjtpxl2B4Z2alm09Uf7ggoXwwki9+xOIFN
         10pbJaXZ+kx9aw/kuYGCRT5kk0mN09k5imG3kmWKlgVWl3C8w1NxXuHwY83LUP8kQ4YP
         qhFXcKPhnuBVpxUIDTSuuDgeVOcHN41zkqMZ1Ucr0iDqs5En0mCiyvAOIaXzmiR+hl4U
         9/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947961; x=1784552761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/juGqGDG2fLncz3tYXEPSwjfCpIrvLGtrL87h0T1kX4=;
        b=DOIw6XBlNTK8oYo04Kg7JMymH8m9h93/WSKkU9FG9hDG8dBanrNY/d05z5cFFQ8zx/
         SHHIoPBKZEcMZudsGjXbTbbG/4LzMEQ+UwMhNlRkcqXi4LNFWhm5OvvDdldWe1m1Vmjd
         +lCc9fclUSslKU51TdoD4ce68Qa7WMaPwOgU4Y+FyzE9sdXqjg+/lV+tCi5a6uyRaFGw
         KJ2Qonf0T5VwmTgaBTj5e5fylxZy+RjEgX79BvRhfBeT2z19qcuCt4kKEGhBy7MG70YX
         K8UfMWVlCUeGkID0b8ckkQ0zK+rWdBdztlj/4phugL4KGSmY9dN1jWm3S9s+rMJmpQAo
         uXnA==
X-Forwarded-Encrypted: i=1; AHgh+Roi1bQTUwUIoFYxJ0bn9JdAcLzYjYAMbQCtdR/AtCfFEBW2idixO82GadnEY73HgCjJLBU1C3Cr1Lc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYrB2IwJw1qHB2SbAPsA7dnK9+1HQE37fxmJYbeC7oN0g7QzT+
	OAGVzzwfBCGKssPjfC6kcK2Bk/d5DUYOxfxpAr1VLVlK/bUPAiGfWig3EtJCH9X7MCCBfw9pAFs
	FmFY1
X-Gm-Gg: AfdE7cnGpZuJL+C5gdmBO0IW/ZG3dffU9gLjxmeTt4c8zbVVpoaU7Y+P6LzJ8ltdZWd
	xPZs6am8td+ydx5jDDNVSzFDq2TfNJaR98w0V0vy9MOr6FS1ej2Dp5OmhT/fubpTGPH+/nvM6CO
	oWenh71gD6t4A14ftlFOts4wJaD4d9inO+WTq/clhA5l4xD11wXa1dUpGj7QQeYVn2CTTxogDjU
	G48hkgnbDQThKCLXCvtg3vk3zihfVHsqwrRIG4EzOa0Ls8/wIJJJjGvA39H2Iokw0wi+r+b01WW
	rxQMULlzez3lQpcQ4dhN6fubqKFlgglyFpbs8k/aJsikpN6Gtgflz7idV6la+Y5jPuych3w96da
	6LWcKtQsbr7U9miRJCCPyA87kH1XgWLxUpkkSHbjJXTdHwAknrb+VIL8dRLFcf/5045N/CFUCNq
	NyiEcb86G3mH2rmzgdkhGMZ66XXjpRtjSZ1SX5X00hUxiKjfm+9fJsw9fh9d6/JV6CRkLK3aw=
X-Received: by 2002:a05:6000:4b01:b0:475:f100:35fa with SMTP id ffacd0b85a97d-47f2dd439ebmr9925829f8f.55.1783947961456;
        Mon, 13 Jul 2026 06:06:01 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:00 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 07/17] i3c: renesas: Clean DATBAS register on detach
Date: Mon, 13 Jul 2026 16:05:35 +0300
Message-ID: <20260713130545.568657-8-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060603_132924_6AB87A06 
X-CRM114-Status: UNSURE (   8.52  )
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

The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
register for the detached I3C device to avoid issues.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index acc30ed615ab..b9784d238f61 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -935,6 +935,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 
+	renesas_writel(i3c->regs, DATBAS(data->index), 0);
+
 	i3c_dev_set_master_data(dev, NULL);
 	i3c->addrs[data->index] = 0;
 	i3c->free_pos |= BIT(data->index);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
