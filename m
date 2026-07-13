Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA472C44501
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZHPXWYa1YeqxrLMIQtWVmluP6fb77iTkL4QFKlGcLg=; b=zDIqjXnhXZGCpx
	9i0x31oT+0lzgwv8kPZozaN9Cdr+JQ+CiGtAtclCSHuokjmISGYRoF02kS5qcNNSfhBCtfRN2aeuO
	+cf5wd5h1blr/I3qyjZ9EigH5F2n38aE7EVZjHWMN5+/3G3QNHcVVBVle+rwwMkdCiFq7YvZ+99xY
	gYpBIoQcXLIFuBBNMAQ9mZ2WJQRUt3FuvZP3Zj9wRtQ/2EAZ1d2bcNyLmUUUXw8zcxN4tKCFP03HX
	n2cU+FuXMi+gkRHLqkN750CYU4Y3Ha2tGtHAx3dZePhWWnMkiHMa/iHMAqBHV4PspFEyAjOg/n7GQ
	JKXDCSJxoySK4AFbMahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMU-00000009Jw0-2XQC;
	Mon, 13 Jul 2026 13:06:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMP-00000009JrL-49qY
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so11858245e9.2
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947972; x=1784552772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QIMAhS3NtIYTLeRVHRa3qf70Dj3A156a3x/QO7iYik=;
        b=Uhoz7WQiMBjAKaUGTdmva5XrPhvdw9pb9c9zgLbd2sh8LWE5iUoHKcK7GCgm6f2G+q
         u761srqbIvxMNXx8AKKJZ2d39QIiIpjxkQaCzv0cQcMPium3eCG6xrfbiBsEcAyEOZbs
         S4OKF08dUcZbMIRkFxlzxMG+R6C3iaJw/Qynat+/2WJSyktkVTRTbQqiaAcWVPglJxIa
         EtiW++9E+xsppMD73+Ob7CF/2BDA1l7NhXizzOO5Sm97uEsmazFb62/4Yv3cxU0VtemM
         SbQC0stwACtkkuhuaRawE2uyh72ZC3LXxUgYRbw6B48pf0fNk0ok79ADzKSl0bL4Rxm7
         UjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947972; x=1784552772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QIMAhS3NtIYTLeRVHRa3qf70Dj3A156a3x/QO7iYik=;
        b=FH5tWmSyhmEHbX91OLPLB07X2U8bp3GRd9Knux92dLvakzyWx6k8sEx2y4HnhHzh2H
         L+UPqEWl66hjKAQsJ+0ZPRbS+Nc7pzo9jC1ZXoPJoYkN4UBMU9PA5HR7goveeJkwK6R4
         3xVpwyC5sHaY73fQP5p/19B+UUjPSCBFThGxqrtM46j+31aZw24tPkxixj6roiWn4xq9
         HIkGYJ3Hyd2KY13q6l/p/qMKEoG4CS6OwEcad+P0lUlvSZgvwxHMnE1/Er9w/eYjwlbX
         lzSFoDa/dW3xBiELc/xbz9RdrxMvS2rjmSrQl7aYfs7pWVStXOqrB6DM54UIRVzL10hB
         Ylrw==
X-Forwarded-Encrypted: i=1; AHgh+RrMBEGwvK9G1zacsyyRXnbrXpKNzA0LQ9JMlVAwGeGwaqlSGJwdNhnX8mVzeMdfwBESi3If4ZZbZng=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCJrLvIV73RfGpkNjJymmWZhKfDE/ur3AcXsm07rSJGSgSsMgk
	azRwa/+AnMfV3Hv3ibj+rBHU/K/VolklQnUOdZmKwp2I+nzMfC6ncBJFR3lU8RwLF1g=
X-Gm-Gg: AfdE7clHZMuWgUOR7MSFwogVYAZs2u1JR7fnZfhHV3587IrbBk/+PLHhGPzKSfPvd4I
	ZSze5S1WqnYpZa+JWEHFuY/LJy4NVy7vl9E0MzHVWu7tC7cwYAbk1/3DJA9gTf2kZ7JUakKKSdC
	noXp4ZwQQT7M4AR+yhUd2y/5kjl550wV/R6IgfvEH9TbqNXjES6WDcJeUZJbj/eZiQpU3nGaSil
	0t6xk5kXh6Flg0mVWy1qldp2ogFHMy1T+WFXw/4FzgAmnihHIo2P/r0tLocy4KWQTjodXlENR5T
	w34jH/bfbTYtXICyH26uUUdSIZaMY/UiydNxExLhZ+PT3hjfBz3skGl8IJJzx8Vjjq5RTl8T7iU
	kdNhncG3GE/KM5zDbLx9ZQNQfQXVGhJ5QrOawBiE7wwXjEIlnNLr7S6b6Nj9mq0xiLxhbS+r7S0
	HtVcMzZjfHMUwFV9HAApzYJrnC51K2YLRo0O5BBRULL6I9IaPyEaJSAzL215lXJY6dpcQdvoY=
X-Received: by 2002:a7b:cc88:0:b0:493:bed6:85e6 with SMTP id 5b1f17b1804b1-493f87ebed4mr60792215e9.15.1783947972176;
        Mon, 13 Jul 2026 06:06:12 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:11 -0700 (PDT)
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
Subject: [PATCH v5 13/17] i3c: renesas: Update HW registers after SW computations are done
Date: Mon, 13 Jul 2026 16:05:41 +0300
Message-ID: <20260713130545.568657-14-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060614_068767_1C4066D3 
X-CRM114-Status: GOOD (  11.01  )
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

renesas_i3c_bus_init() performs a number of computations and software
cache updates, interleaving them with hardware register writes. While
this works today, it makes it harder to minimize the time the controller
must remain powered when runtime PM is introduced.

Perform all software computations and cache updates first, then update
the hardware registers. This prepares for future runtime PM support.

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

 drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 52f09d966651..2cff7c6ae369 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -565,10 +565,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (!i3c->rate)
 		return -EINVAL;
 
-	ret = renesas_i3c_reset(i3c);
-	if (ret)
-		return ret;
-
 	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
 	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
@@ -619,27 +615,31 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			STDBR_SBRHO(double_SBR, od_high_ticks) |
 			STDBR_SBRLP(pp_low_ticks) |
 			STDBR_SBRHP(pp_high_ticks);
-	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 
 	/* Extended Bit Rate setting */
 	i3c->extbr = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
 		     EXTBR_EBRLP(pp_low_ticks) | EXTBR_EBRHP(pp_high_ticks);
-	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
-
-	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
-	i3c->refclk_div = cks;
-
-	/* I3C hw init*/
-	renesas_i3c_hw_init(i3c);
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
 		return ret;
 
+	info.dyn_addr = ret;
 	i3c->dyn_addr = ret;
-	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
+	i3c->refclk_div = cks;
+
+	ret = renesas_i3c_reset(i3c);
+	if (ret)
+		return ret;
+
+	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
+	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
+	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
+	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(i3c->dyn_addr) | MSDVAD_MDYADV);
+
+	/* I3C hw init*/
+	renesas_i3c_hw_init(i3c);
 
-	info.dyn_addr = ret;
 	return i3c_master_set_info(&i3c->base, &info);
 }
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
