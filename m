Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38CDC43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JYdhqDqRSEihdSmiRcBxX+QsjsIT9tNjQLwLCDmIC0=; b=ZQkcEnPp/X+rsZ
	jbrrORClENmC6o4KWGocmX5VVgVDmJPcuuy7j6ofwgBoKM3l6he6Yj5m5NELlK2WS8O/j4Uq4sVpa
	x1eEqdv835QwmHJKVD9uY7uoxQyaUOeb4aoa7jbzoNQAp2dWGc7MjICQt4jtOk4sk0ox8MG7I/ii3
	jOJutvf3FA4vnn+O57T0uK73O/uC/8NBya2n73rXRiuCvYw7NwEusPL7/gSxaaGztOyyCmCP+L3bG
	e0zM27uB7aBV+r8I/fN9UWf56b4zD32MYe065uvk32PvjSnZR5FxKHHzVy1JXMxaJ0VRGwN+20BuQ
	XSAVokOMUaLiJ0AfP/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMA-00000009Jh5-27sd;
	Mon, 13 Jul 2026 13:05:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGM8-00000009Jf4-1iEH
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:05:57 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-470174001a0so1874217f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947954; x=1784552754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUK3J4PNfu7w2oijinZPF7ASv5k/jbRTm1vrjO45FNA=;
        b=AS9GFXJxWcFLWl7wf/IYIlkPOgSm5647AmZo0ZLGAK92gGg0I1xUsUJDgaz4Vx4M5/
         EqYYce1nNBNfMk4HnjQ3t7sje6NsG1t83mBS0mSPGeu7HIkY5HaIUGd9XEv2toJ3q9uh
         JrkOhx6qqGF2EJLc2KwHkazcrlIsBRgJOBXmMe7PDJt2smjXb30m8T09pwq7AdwVR6Cy
         7scf/oU4g+1pW8K2dcphhZSh+ea2Wc/0pMd5AI/qUlptC+z3y6Mk2nAJYE5LkEShWbTo
         gaKm8bDJUm+QrPJukEb8FK0FPg4vUGNQagVMmGCIjzhqOtZHT2q72/wInZZryoG69mQP
         669A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947954; x=1784552754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUK3J4PNfu7w2oijinZPF7ASv5k/jbRTm1vrjO45FNA=;
        b=NoECquikBbqQWrE4RsEZCFYv9YK020PpdqRb3XNZ+15K7IPLQbxkk0wftNenS8FzOU
         Vd32isBq7g/OhOD9L5maCB+7UPybcPSp3PPth2K/2xm2nQwAP04JA8rq9ex1jaVxIn9C
         igTZZFCrOsiIQNoNFu8sL9W0jaRULUHRbQsgQ95bexxKs3buBtASKQzlnNwMfThRAmxb
         ra8FxYcWIDOrfxmsX2a26HE6G/GoaR58QhaNRa6BNfGSoPXezGXSuDDc39G9g+ejkwS7
         huEtwa7b0Qc2ghls8VFRZB6mVz3/PDUsVXKIaDglqCKhOJsfugHlRcgZbWxUJ2fbWfDk
         3BVw==
X-Forwarded-Encrypted: i=1; AHgh+Rok0VLtsU1ZRKImltUnZlmGYnA9f00epPWewa8gqVBnpisEX3JY7pSSN/jyO3eeR34YATF/VAre9hc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzhZdukMmICATqtUJT9nyU97rtTjCgEgpRcLLBnrFq8nm4qIt1
	XebMt8txmSFxxb5nJRdWZNelXdzGizzOTTU970bwC9swXo2Bqd5Z4K/FPfXNUVwvtVg=
X-Gm-Gg: AfdE7cleZet5UtVqBmj9bMUqNu4gN7GIDNR/+34lCOsrWNSgqbL6/fLDcHGAk7ZoRJt
	rN8Rr3hfTCddPiFBVk/i4/xN1C2ct/pW6zI8B55r0DG2AyzIl/D7wqLFdJ8664axFqFS1jJ0ENu
	ueaEC//ZqvvsRK32vBozZZ3s8JeuwXKFn/UwEBAU4dV/F3tqnTucl28j0l4vm3vN6uefHrS61Yv
	5uL5Er4g8b16xJiOJ0gnho9Tarc3ffkFDz10wYSsLCPrTt+5qzP3AvLlFTcCilXSkLq2FpiHYmn
	iaaAxk6drT+8DuGxJb1VeitoaDKlURK+nYhm7gHMLeOB8D+SkodC/M3JKbbi9kwwtxZche23b6x
	3srnix151OfBInBWUgR6HoBpMa8Sa7glwB06EcO10Sao2U2yjl15VFouiEiqksfSdQ1ffzYiju4
	+Z0DTe+ZbZpJAe1dMMn/SXtxaXFQfk+OuA+xy57t7BW9bmBel1WxBqkQiLqG1fPhUCtqJpbkI=
X-Received: by 2002:a05:6000:420a:b0:47f:285c:9769 with SMTP id ffacd0b85a97d-47f2dc8d86bmr11100953f8f.10.1783947954635;
        Mon, 13 Jul 2026 06:05:54 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:54 -0700 (PDT)
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
Subject: [PATCH v5 03/17] i3c: renesas: Follow the reset deassert order used in probe
Date: Mon, 13 Jul 2026 16:05:31 +0300
Message-ID: <20260713130545.568657-4-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060556_485939_7A3F4371 
X-CRM114-Status: UNSURE (   9.93  )
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

Use the same reset deassert order in the resume and probe paths to avoid
potential failures due to ordering differences.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
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

 drivers/i3c/master/renesas-i3c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index cd9928649c7f..ccf55afcdedc 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1455,17 +1455,17 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
 	int i, ret;
 
-	ret = reset_control_deassert(i3c->presetn);
+	ret = reset_control_deassert(i3c->tresetn);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(i3c->tresetn);
+	ret = reset_control_deassert(i3c->presetn);
 	if (ret)
-		goto err_presetn;
+		goto err_tresetn;
 
 	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
 	if (ret)
-		goto err_tresetn;
+		goto err_presetn;
 
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
@@ -1486,10 +1486,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
 	return 0;
 
-err_tresetn:
-	reset_control_assert(i3c->tresetn);
 err_presetn:
 	reset_control_assert(i3c->presetn);
+err_tresetn:
+	reset_control_assert(i3c->tresetn);
 	return ret;
 }
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
