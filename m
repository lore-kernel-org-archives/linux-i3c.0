Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA30C44507
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PgpnwU7vNTK781P5uhCxp/4Ts12gEUC2i5EkBIwBa8=; b=TCduGzaIZjsE8i
	hcvhZPqQR5FSJbMqN45bH8KIDMwVc52x4b+L38eub3/32OMuB9iNmVpFUsOyqkuOFkdSeC2JdIbKD
	6VC5zXsBPweBYK0Vnm/aUKIQvG1xKHXsWbuDVlQlJPGys1Qef6MdbyLy3Ht+QAnPUU6m8gJUZJIjm
	ZFGBEYX/iANulccu7EmnSw8m9qyF07oMQk42tfdhm4hqgF27uY2i/4OOooOVPJV1K/At3XW1odKTm
	UJ/59TA3kqP9gKpYz80cMAe75sYtUgGqL4KbhwZLigXugGcPtUUkQ0ouwIUgO61pEhLBgLdKq4i48
	p1uJSLelrKyJgiJSE6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMC-00000009Ji9-2Tvs;
	Mon, 13 Jul 2026 13:06:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMA-00000009Jg4-0i8X
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:05:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493f0ae9572so12327855e9.3
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947956; x=1784552756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSMCQsQ7LVIlHm1OHZIZQGorFPeOXnJuXX7KCA2GxmU=;
        b=hzXlNO4PsmtWjrfM03iTWyUV6WwiqytEc4msTT7qnHzidIC3UIwoHB7834+qbt5NZG
         0xnobDBcNZZXfakgf7ewGV1JEWvTjkClCxbPY+H53O6vHyI8jAp990R0Uad9LnZSb6he
         o4QRVE/LD4llTvUveCM/m3D5V+iUpjBdKrUNuBe9jSKgGV/qyBk3wIc1x1tieZHyZVck
         DBpKqGpKDN+bbG9v2gCcW1oZnP+k86CWm4RzpAHmCOAgQqKI5YvBlv4aoT7gfhURroc0
         lqa8DDN83pIYmyLqJ8su42BzcHNGSYBWXP8JmDxmgKBqs5yMtzJiSZGlB0v0gU48Q8Oj
         RdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947956; x=1784552756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSMCQsQ7LVIlHm1OHZIZQGorFPeOXnJuXX7KCA2GxmU=;
        b=dNyRfrxWOnK+nOQuo7MI7Y4zxVEJGcz31EyZM/bowmhGqQWmcFdYmLJXmGxr28Ek/N
         xIxlosXI8Ee8UFO65hzpz6e2Yf1Iw8JTA+cGoLneORh+yZy+vtKVweanG4Agte0TMtdU
         /sBHefYnby7tutt00z77a/enG0XQi1EfQ1gGct31Zv958YEMhTyYPfpT4FJmdwlzSA5q
         1Mr8FYVg9WLfXB91KtZt4yekwUXBEzCYI38XYwHRLIYhmnOqcFB/waLyPYCkqib2Rdwv
         wOOWoreXiPuKCKn3DeLAHJP1WzBWI1ycWwUCJtcfGc0pIk6NdzTkj2r2ZbKzrrlEQ3zG
         elAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbGWaInnHHweLIJb4EiqSpGnBOn14JMqP8dHJo3GrSMmofF+aTvoGN3/2Mz3tfB1s+nh83HqV2hz8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa5R/FMpwbur3OxP6Fi+K5RhmJ4eKrPpdGTFlClmIhvTDFsJ1r
	1+Q+fCiHPZyyhuTxqIM98/1L5kG79JTtuJ/7APKCA7A1UpW31PKCnJFgJmTj2sMoF1I=
X-Gm-Gg: AfdE7cm52qzyqMP5HqQ5azV42dZTABz9PFMD+GmAWxeNDtRXzXDDMAZFTefgz17QLfL
	uiMRy6UcDrgVlpoxE4tN0AjzKdZXPV9pS0tfeZxZ3vVCII260GCj8k+2w8wUlUVdt4oJR6Uxsjg
	BIReNWhwg6ZAJ5t+MQ5d4k3lkvJSYisVKJlvTJskUWTzJeJO84em52TqF3kz+2wyqwA3D/ovfBw
	Dun2MmcHcFp4IpjNFpbn4GetVkLukrZNdOEHSq5CwxuN+SOYyXYxb737ftOqY3JLwyKgBnvOa/d
	DDNbXtHmCUhRJwtFPNoShL2mK9vaeXfVU45DBLQAa6WkhUDra//0EleL9wiMT2koi+OF6hVUHM0
	3aUgILaG5hKFCdgzekTJW4x3RHi2j0A5U/4Bn9orhuVHa8pVWsqwjXJ8UKdaJBl3hM+RBANwrBo
	Y6sNpU6sjghl7Q/x5DQfOYe7+bSIqPZSdWgDpxFLfiXPn1mYmFlfXJ7ZfQPShlIa0NevctB9Q=
X-Received: by 2002:a05:600c:1d06:b0:494:6baa:ccef with SMTP id 5b1f17b1804b1-4946baacd33mr10753825e9.11.1783947956381;
        Mon, 13 Jul 2026 06:05:56 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:55 -0700 (PDT)
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
Subject: [PATCH v5 04/17] i3c: renesas: Reconfigure the DATBAS register on re-attach
Date: Mon, 13 Jul 2026 16:05:32 +0300
Message-ID: <20260713130545.568657-5-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060558_232436_8325044E 
X-CRM114-Status: GOOD (  13.19  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- use "data->index > pos" condition

Changes in v3:
- collected tags

Changes in v2:
- dropped the "if (pos < 0)" check in renesas_i3c_reattach_i3c_dev() to allow
  re-attaching in case of a full bus; along with it the condition to update
  the DATBAS register and software caches was updated to
  if (data->index != pos && pos >= 0)
- adjusted the patch title

 drivers/i3c/master/renesas-i3c.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index ccf55afcdedc..517ac2df9bd4 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -907,10 +907,26 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	int pos;
+
+	pos = renesas_i3c_get_free_pos(i3c);
+
+	if (data->index > pos && pos >= 0) {
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
