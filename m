Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50290C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TguSk2fs7G/hP/oxrHe94iaQRnD8EF285TMBiSkxjw=; b=lDL4HphmpkA2zj
	dDoNXRZLXmm3JIU2PI2rIH3VjxE4CWVsiwdrXl1Hu5nhaNMVn8g/UzCeT6ep+ZmTH4BiIu66oqvn0
	cfVrP2NV0LJ8xC/CinO1GmTLFzxMaBgqS+iTFgOMIsmDk3BKsYIlTkAQHk3I1N1Old6zuwNnSHSFt
	WTOg5LCeJHfCY6rzTw+HSLDENyef92wItuasaOcocXxbGHo74K8bDhmZ79Nsa+LZUqPadNHgUzQGI
	HjViyl3NMkj5mdB10mX+0fs/rWHrl7rmIDGehUd7Qy5KDrXujJ12/WW7PDNITZ9vjF0BgnVWEMDsa
	S8CAhqoJUqbRCjM9Q7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMO-00000009JqR-0A2m;
	Mon, 13 Jul 2026 13:06:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMJ-00000009Jmr-3v8Z
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-476a130c138so3771606f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947966; x=1784552766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxph0gA4T5d+Jhqpx0Ou1LFlebFELoaRVUc+1WxHvCw=;
        b=Y+sNP/ICDtKtafevOXrQIILBxPcKb5AFqaFOnIkKvc14QEJDQEyYifIzkD/aznhSfu
         QY4M0ARpC96sXDsj/PIDPS+vhbQUcsSWR9ZbFJvvKXxZHjDtmmhmqjZ1ceJnchzATT9G
         qSNnss23VvToIn13zwlppUcCj6nKgEiBoei0B6OtStE4mvpdcz7dLiylggP/+sdRgc+t
         alYibumdJWUMj1phCYHXfKMWTLLklBdX3//ushSwJwz8ytDLIi+xnGx5WDMOW+9rERvS
         2Q+xLUi7OjCZsN14o+rXe33AxtWFVzAbqfH+HkI0yH7wrzXgC4YX5y6ZCzeNk3JUyYxn
         zMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947966; x=1784552766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxph0gA4T5d+Jhqpx0Ou1LFlebFELoaRVUc+1WxHvCw=;
        b=B2wP/cO+UiKn8XefksvLuXNRBeEiAyCGHwzcAblGzgzaGDhIFfq7xlv+gwyBBfYet1
         kkNUcGDTIfy3Q6zl/YiHGmSvNxxR1eZMyOncjSWCx+LIYaf01gJzC9g9GFRLJuCUo5Hq
         1ABvG0cXkGTuUiej1AAbI3ga5BqGusW89FAKxDXBjaVUu9il06BfMgYZDCa+Iqwpd2jr
         EekdlwN3mxOLCXQjLeRow8+2aTpmm1Of9Qs4yd6U9GqaLEmjFvU7qt3KfGaScKBB5FSV
         9jEEhR84VtEyK8nZxtvC+0KvKd5CrKgZGnDzDnY+i09DyVuC8NsFr2ZViRnY9a3vur/1
         ovHg==
X-Forwarded-Encrypted: i=1; AHgh+RqYGaHOkfvPDyDQZnzpUkJwX4tDH89LbcWh9olQH0Cc7VMGz0KtmCOC+BRVJAwoebC2x/Tm4ErQbOY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1fmgN1DoAdqhipTIAxMKlrUUEueSQFlQLjOLYYqpnzJNiD3I8
	D06BS1rJFEmF32PkSNfvTKPen9RZqruK18na3Q7oEHmJOAb9NxLHC5pm6L6aOvYSUeI=
X-Gm-Gg: AfdE7cl4cfRHvA8+Xzfyq0LzpXHb92FD4/cRgv7fZ7qrJ7a8eGNAwk7o0KKDMXgip0O
	GCP9cZRB1NspAdDzxtvr+mwFnaR1x1FeqN7GIfqPiehpE/FkdtD7s1RXSdOHPEUhwz7FR/YrE/h
	pQZTFaimD/896TH5wya6c/DGQ/sQJ04wtB9XsJyIJMjrqXJCwAzf51prSf/foWc0/H5QvwdCThV
	ngTWUPhwAj+nyJSATu55CM0Plpi9mTeNiWwGE1+lt8JR/4P5Mj0Iklggoy1HeAqlcfdAZ0W6aoX
	DhNxPjX3HhZPTIeq/osjATuYtG6lIJlgBGOIPE7S3uP40cdaQAo10+UNzCu6VhNCDe2pe+d5XyB
	kEYuXsH8XYvaAtXwJ0RPkHrC2rvbVASEmgPe0lBr8uKlm/klyCeqvOhwb94q3vpuadGgOkR3CFe
	6P1XHqPCh9uPd1oUX1ikdomYz+EM4eWoWew1dmXlCQf7j4IodB4q0gl84cywqfz6QU1iqA3eg=
X-Received: by 2002:a05:6000:268a:b0:47d:fc45:ab38 with SMTP id ffacd0b85a97d-47f2dd2b622mr10557777f8f.40.1783947966327;
        Mon, 13 Jul 2026 06:06:06 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:05 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 10/17] i3c: renesas: Return immediately if there is no transfer
Date: Mon, 13 Jul 2026 16:05:38 +0300
Message-ID: <20260713130545.568657-11-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060607_980416_663F3ABC 
X-CRM114-Status: UNSURE (   9.91  )
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

There is no need to allocate a transfer structure when i2c_nxfers is zero.
Return immediately instead of unnecessarily allocating memory.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- updated patch title

 drivers/i3c/master/renesas-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 915090d0ad37..9a3613220034 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -957,13 +957,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	u8 start_bit = CNDCTL_STCND;
 	int i;
 
+	if (!i2c_nxfers)
+		return 0;
+
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
-	if (!i2c_nxfers)
-		return 0;
-
 	renesas_i3c_bus_enable(m, false);
 
 	init_completion(&xfer->comp);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
