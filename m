Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F445C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNZFkGRyK8a3JXLCv2vV01Ri2XwxfsKqDXjW8swHS1Y=; b=s0Y2qhPo3qYJ9I
	gWN0KTN0lFvVM2qJSdyBmeKEeH2xOfbkh2XoH2Nbi4Bha0dE5GSvnQPGRnz7I5XmquRgjDurElY+D
	vJnPwq6+nykOCioa0jjJx+BTjE2iKZ+wAQMmRu2rKrPhsIVebeW8CG9QAkO0ypKcDxvCXsgSrcrY/
	gwB86oz0Ew+aUwHWFpBOwEPvlTrawr9zB/Wqk5m3QGf4tMD4q2lOAXe4UMIzwX2k/U/P5YPzqLa9O
	D2CetolQyhQFYRb80BF2lJkOQWLXtUUCv+Fn06HWzWzxVGij2d5CZ81rzdLlNMVrHtqrpihClyf2H
	upRe++uQ/6uRip/Q+cgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMW-00000009Jy8-3SNi;
	Mon, 13 Jul 2026 13:06:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMV-00000009JvL-094d
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so19567175e9.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947977; x=1784552777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ4HI810hrTy7wdk8GAVxIAfJZWowAHqKrnu4cWL3zY=;
        b=W6HCXWY4ohlDq3NkIf1Py9vlkTlwBeT685mfV1DNN3H0w0Ve0RhgdfMRprOGF6O+2l
         ESVrx96xmxsxFEFrtVKxA1vQnPU7zoAovLKNrnw43ez47VNYERo4ZqR8v7XAFqPJFwp3
         52LEfDYRYCf+zKgmQJQLifk/IWTMlpdT1WmlCQUGtv9o0r/IaerU2TtfvyOsVL0Gws82
         /kiwOBHiY8iZ5L3RVEl8mWSiIEEo1PqkNeAwyNSjBKEdIjOsuWq16Qb9SumPW3KL+aGm
         FZtGjUuBjT9Jiqpt1rNeokPmNHMifJcmAdazhup0iG1lJqsJIKg5jdOZD51raf2R5SIz
         C5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947977; x=1784552777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ4HI810hrTy7wdk8GAVxIAfJZWowAHqKrnu4cWL3zY=;
        b=IKWRrssOk0xLZzmHB7Kx9lS+Z7LUV5AvObyHj/vkrz6Oz9Wdv6DvC8qWMgDtBiXnGJ
         1CJxglVDRe5ccNMwBw5IqCmxx1HT/eqLkuJCAHgZUxswsY3LhqiR1fJ/Kqn9EOgwhPVQ
         o3jRN/xkuff3pwu53NMVYbj6GDx94TO5SZfVJI+skk0mfBicksVxnaEeqOamDx8ahSn1
         iaIzhDgSdhoN+ttbQpjeSdz7psL0PVnUwwF68p51vngeYZAZqW2/mdYw8gt6+oyVKaI+
         kLRjIwgbOPLK9vWO5vslATJYHeF/yJR6sHITleaBfKJT7ezAi/BIkfAxylXTd1gQcbmH
         AnlA==
X-Forwarded-Encrypted: i=1; AHgh+Rre2whMn8EQVPLnexKcBehJAb1d6b2axmRvz/luoUAsZHdqZs9LkugqJQVfzyiYEXuM6kZ8TYpYgjA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJMKntHsHheA5qBsyyaJLuUBMV6l40q1asQN+tez5fErFFAiWm
	MpEtJc0PEA2flADY4/lYL1j17Xwk9qsuLR4zvH5X1wgZB0XvRXtKuUA/isrmDQSfthk=
X-Gm-Gg: AfdE7ckxgIQAp4foyy1OjXI4keiCah8Ei0M3xI5dZCDR34ggxkZFuPr7C/oMdq2/1UU
	GamXXC65e70eHr5ZgBEmamM2+GTYQra2vxsUiz4f4o5teBme1hYhtM/Y76NMBishUUYnWsvOxAJ
	3wu/vAxlrdST3ie8VHSku6qL7HpjXFVKF96dhsV7i7iE0SYgv3TyStgdmak3gHTTAbr+WzmJisX
	7Su+zug1uCsojqhBCxHc+fg2niT/ONgUypyItnVfR10kWPKVq/qaYwrOXf0YfvhLHSAupXvuRBA
	SJJv7bKmR1wbGwdG+ISLyr9NPOBTX09TryT7ZHeoMa3PpaAv5sUDKLu5AynU0do+VCjjiTfUZi4
	OvcUc2VcgtMCCl5lC5sXZE79uVZKOLxhx085fNTWWYNIvyOt5pmDXWNQ14BOpSlGRyqpQAU8QV4
	qa9xTHRY3x8OqoRTpHMKB+kev7R+y+7JuSmFpdrRJ9CJn+Om0vOxh6QxjhdZvGl30fEeQI/VA=
X-Received: by 2002:a05:600c:5487:b0:493:f534:3e73 with SMTP id 5b1f17b1804b1-493f87e6c80mr95247815e9.9.1783947977232;
        Mon, 13 Jul 2026 06:06:17 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:16 -0700 (PDT)
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
Subject: [PATCH v5 16/17] i3c: renesas: Drop unnecessary tab
Date: Mon, 13 Jul 2026 16:05:44 +0300
Message-ID: <20260713130545.568657-17-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060619_109805_1A4EAB5B 
X-CRM114-Status: UNSURE (   9.17  )
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

Remove an unnecessary tab to make the code cleaner.

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

 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index f28e260dd166..378baac71aef 100644
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
