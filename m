Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75520C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3A4Xe5IO2eslCi9Wq9DKcRMuPVoh3stGXv6oN9Byic=; b=LWliDAQhegK0Fy
	8XJX7llF3uDQrxwm5jnnH5DP1+bM/RDKBAc0vjsEgoAHvSqYHX2ritOhBYnoqu4AwebFeVEszIq9a
	DKTwvZQ1dJL+MtjnWEpRdIX84QocKgAXThdwKFzkBzqEAxrK1CBZ+IwzoA9E9UWWhKBfoNF89jAL4
	JZQscuafPfFRx97QY77K9LI9pbSKn0Lw9OkDF8mMmrshX514QVw0MKzgrPAuSlX8FN6hSEQzmt+dx
	RGLVAHw6j3TW0j7APF8qJaPCwQeXvdl06ZK2AWRwQQlmIYjiui6wCivifqoYoQ9+N4L+dKBKvBYik
	6+lielhzH6Kp/TaWaORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMQ-00000009Jse-0rI2;
	Mon, 13 Jul 2026 13:06:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMO-00000009Jpy-0x5W
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-470174001a0so1874517f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947971; x=1784552771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxhopbMjuxZXPMIhhCmmmglOvi7gG+5T75nAj7QCOxA=;
        b=BUdBQk78aBvDPwFeTykTvPWJv1mMeIrjedmqpi9GDImNNHy2P0dvaxwaMXi4yhZeTT
         D/zAvBKmywGGOgPP+wkQQNv+noUMJwfQYyPRb9WL/29LKyQwPhApr+daw81VK8Tx6zHw
         9wzQWYLugdL4t5yqlBDuoN5TDZLVLl02MG0OCNN8qpomTYU7ngcOnzUHxht8LjE2Gg1K
         Q3Ki9V+R0fpIR1KscSbIZFDA9d/ID/434dgffyNfYcBl5W0u0P8be6E0knU2GSqAS6w9
         KtjhdLkurhEjvIEce8tbdR/yilt/wKzK0ad2u2JNo7nI2pqmfXoo5yuPQZ9ksmSIi0Pc
         FE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947971; x=1784552771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HxhopbMjuxZXPMIhhCmmmglOvi7gG+5T75nAj7QCOxA=;
        b=acNnw5XfKy02pKTy6daYw9Eb/06KHzg0XiAGlZNtXTQ6qeQLv9xZhy2Iao5yNqsEDq
         jg4OraJn32AW4W8BOsvpSLgP3FBqsJj6NnTb4KzA09iLEqnDE6acFRvQZI1VpHLgd8Q9
         cEi1c4Wg6u3gFs62d88yQXzrQqoC7yLFeqLKV38l8DkrE6eYkw6ev4KkUNzNAYK/A4SW
         cdKUt5w9AG+bzBQek43YDN+aMYY6Y6g4pDJeivVg8zXMGOrv7+HYqf8hJ6ssG8nlh6Vb
         36u8LobzoE3wBUu/Mp4xaTAGFgvyJpOWlVVfUkQlqGxSV3t+AigN4iB+40HKfskCC7s9
         1j5g==
X-Forwarded-Encrypted: i=1; AHgh+RqBhg00q2I22chvSpB2mFH9srf64t7qktBTR3YctI3eSMSCzs0l5efu4W5lmGCMjibsI9dwNGyOXQI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj9n32BfU5JTpB7lihe4gco2pxwBfNI9msnnrhuytGem0+g9mG
	raVvEK6vHxHsFie09f54rwn7iIb4wttdr92YOFULSoPF4aGO3L7Zf5CjuDDuuI112RE=
X-Gm-Gg: AfdE7cliMxpbYkqpA3LPYi91RG+gil41gjvqBDNB2E/6RiZ4dLsk2RlIAWQOcn82g9O
	2Dp6aok4K22cHSDdslZjdFXqJHN/cw5wcImI1ioxmK/l7gt0Cnypvg3ME9xbiOvZZ0FSN1a1owa
	cbvbsHXpGtPa8Iya4a8lq+B8eh+P3ykdbWhfRCVV8T/X7mL6xWnuOCGnjStbPBw4lHW8zOQ1P4Y
	qutKKhb2vMWpsRcJRALWxh1DlDwOYBOgnqFFjNLw9Vo+0pjPfJG9zGfXZXOJodOXpqzBvnUfs/6
	IGYSwCGr7CnS9CXcL9yB0dHPndbiqbIzRXfj3q12nBCT8fTYD4FZkUONLo4MlbR8jZrqNMpeuBW
	nFFt6WTAL9FZZ/KbP6ZkHBwSBRXi+mthYBXSZeTgXCxF0g3iiaEz39AuA3L/scItH8VTqu4FRpi
	sfG8Q1xCCuyadlGn7/FAw/N2G1+HKtANvQjCjtgxL/qyi2JDpZ3+1SEJYqhjfFP9ufWbWdJ8s=
X-Received: by 2002:a05:6000:2207:b0:47f:25e4:5c34 with SMTP id ffacd0b85a97d-47f2dcd79f1mr10206098f8f.29.1783947970617;
        Mon, 13 Jul 2026 06:06:10 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:10 -0700 (PDT)
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
Subject: [PATCH v5 12/17] i3c: renesas: Drop the explicit memset() call
Date: Mon, 13 Jul 2026 16:05:40 +0300
Message-ID: <20260713130545.568657-13-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060612_276594_8E424BEC 
X-CRM114-Status: UNSURE (   7.91  )
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

Drop the explicit memset() call on struct i3c_device_info object, as it is
already initialized at declaration through compiler initialization.

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

 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index c1396c49f45e..52f09d966651 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -639,7 +639,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
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
