Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2418AC43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80D7wIrGIp134RgCmOEEkSpgv95MF+XkIuACPDjAdjo=; b=HCBBOs4Swk004a
	x8qyfQRbTQ8hA3aqMhwnJBK+YIIwTcl17exrbu8CejlNBBLloscDKhBO0gJKd9ZfD22lQaVmxYNqU
	Dd/j9Ts+AFFt3cCKM4yt7N1WjCZZk1zbiO5ZryrbY3GdO2njFMQp3l6n97Cg/lVI/s8TrLhcXIZnC
	XJACFcgGLMPvPQyCxKk7a7nI5YisnM8ry1xqhuHij0NRI1PYbXf4NJcIdkXPIL6SRxHnocPlKjYDC
	U8ixjdhxht+zpVXD4QJTQgJfZt9BPzxxFqTk9/3RggF0Izh9S4kyxDevw4QqwbT8AdO6DcEY6KdJ4
	N8kN23wHNrTQjWdTwiQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMK-00000009JoS-3id9;
	Mon, 13 Jul 2026 13:06:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMI-00000009Jlg-1w3H
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-475417f010dso1446725f8f.2
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947965; x=1784552765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGkn37O2dLecAyAReq+7VIvOrR3e9Bs6vVNAB3QPbCQ=;
        b=LDTFnfe97am0R1yg822KrzM4lKwTG/xZyMCvG0/SY1GfrYqM5iiuduo2lRwqTZmfzQ
         rdMQY1joeoVjBhrQNo4W8A2j7HxcmBU75en61HBMltMirxf7KZu22c0Erjn7MxsgB7Kq
         iOKNBd1/TtCRmgyfh/YxSHlPsLZB07ylEJTN9LMSXKS41tjP+defciO0atE/+0P1H6++
         9IBsM15Z+bGtTT+zFlR0Kq1cGX+uxF98k5H0vng0jxIjnDX6GY+R8kB3hcXYRSvDazbP
         dqjEEyFTDP361Ix3P5RahEbbI2fszdiQxK/DlbaA+3Pexj77T38gvbo3KRLPdgV6Kj0T
         PQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947965; x=1784552765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGkn37O2dLecAyAReq+7VIvOrR3e9Bs6vVNAB3QPbCQ=;
        b=qtkUMc2JVkaL9YoDXnINAwhDrbFyPeiULNpJmFKe0jb8zUD73kOCZhIQP9IVHmtcsk
         1bdR8waFBU49Prs4qWdo+V/I29UTuMes7PUzYbOPCxa7acMZUGachkho/nscTG7fQ1Y2
         sLPoae2B0Kkn4xw3xcuS2x/Zr5Bixoe3ZmTqqmS0lQgm8eK3uLqwNxRK99uUqHhdR8T4
         git9efbn23a/LDMwL6ndHJCS9sxcMabHjEKsDmHLWaw7oQsw1FABVFTeWqo+3+wqhO0t
         sZsgIc3hMfJLwLIAcla/BFLXZcl+f+SZlYQ1l6bc4NoX22Nw4X+dfwpdm1v1x4v85yV3
         qlig==
X-Forwarded-Encrypted: i=1; AHgh+RpJh5U4emOZ9NWOTnN9jAhXI+PxhLPerIyF/LEYv/XP1k6BFZ+EKC74SZh/6iSxNzNHJYY42X40r94=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVTUUfyDNPhlRRqVzwjnXEFGr8Rhr3FrCmFUsJihtha16TS84u
	5YMP14KGlcka+PkkzmMbclDg9M43yCVwoDdaKyRtffsFk3xZ0rl3yALcw+bK6WvEHBk=
X-Gm-Gg: AfdE7clMJOWJGDT23ROmr2YfWLPdhs+zX8RCf2k47mg03yBtDQjn8KC3Jv91BzBv9i2
	7/wy5izt+FGE5w8rfV1h/BrfgmeClV+QtvSXZXQphqIovnV67BQtiFUDts8rDKpI+EiETBhzn+F
	srCwpu5r4IGrk5hJiM4bsWghFvWpI0SnR+bX+NwAKaSv5seNB7iX31Uh2gtRa1F3EqDdeGFjKIc
	uWfM2P/5/bE+RUjgP1m03N4j1pyq4O+vNYXFxfIHYELY7lOj555DjZazsaLnASnNn0iOF6K0q1b
	N8hPbhQltvB/AxCSJJUsgdtnLCLpgbfItRXSufmfUIR5LiVAUNN5NB8IDyS5Jn7Wp+XD8Zv3Kz3
	bCAWWgOgHohk/PWSF2cqiDYNFwbUzCIJCQe9Z1L0cTN73XM6LQ/QAAvOV6Xb6CsXG52+J5bLPQY
	4o/NsolP+lrZXn2g+wYX3Wv1xXaoEeU20tajrwVBeAcyG3wYu3Bw4xYZYcWgBscSvKaHbD6Sg=
X-Received: by 2002:a05:6000:460f:b0:475:f0f0:9f04 with SMTP id ffacd0b85a97d-47f2dd0e4c1mr9446685f8f.59.1783947964734;
        Mon, 13 Jul 2026 06:06:04 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:04 -0700 (PDT)
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
Subject: [PATCH v5 09/17] i3c: renesas: Use reset_control_bulk_{assert, deassert}()
Date: Mon, 13 Jul 2026 16:05:37 +0300
Message-ID: <20260713130545.568657-10-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060606_519264_394B5765 
X-CRM114-Status: GOOD (  10.80  )
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

Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
suspend and resume paths to simplify the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

 drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index c459e40fd5ff..915090d0ad37 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1437,24 +1437,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 static int renesas_i3c_suspend(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = i3c->presetn },
+		{ .rstc = i3c->tresetn },
+	};
 	int ret;
 
 	i2c_mark_adapter_suspended(&i3c->base.i2c);
 
-	ret = reset_control_assert(i3c->presetn);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		goto err_mark_resumed;
 
-	ret = reset_control_assert(i3c->tresetn);
-	if (ret)
-		goto err_presetn;
-
 	clk_bulk_disable(i3c->num_clks, i3c->clks);
 
 	return 0;
 
-err_presetn:
-	reset_control_deassert(i3c->presetn);
 err_mark_resumed:
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
@@ -1464,19 +1462,19 @@ static int renesas_i3c_suspend(struct device *dev)
 static int renesas_i3c_resume(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = i3c->presetn },
+		{ .rstc = i3c->tresetn },
+	};
 	int ret;
 
-	ret = reset_control_deassert(i3c->tresetn);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(i3c->presetn);
-	if (ret)
-		goto err_tresetn;
-
 	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
 	if (ret)
-		goto err_presetn;
+		goto err_resets_asserted;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
@@ -1507,10 +1505,8 @@ static int renesas_i3c_resume(struct device *dev)
 
 err_clks_disable:
 	clk_bulk_disable(i3c->num_clks, i3c->clks);
-err_presetn:
-	reset_control_assert(i3c->presetn);
-err_tresetn:
-	reset_control_assert(i3c->tresetn);
+err_resets_asserted:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
