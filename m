Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB604C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kynhmA1YhAIYeET0LEp/jTMnCIWRvwDongddwfv7eLg=; b=DXe5Z1P+Mho7YI
	ViWozd+vM3VrtQpSejS0Wcg0UIf+bYhUuaDhUPHXquWjDckRrdBDBVcVKJCXWICnPRcOHCMpkvcXv
	CtWF65ki7oHxthPERP38qRidInGAk9ryNwCfMuTpliBRivzFw6XhNJOh2MijLHGOukn0EW3sdaJwK
	Jph8OpmyZEb/U6BJujfWXE1q8iJerD/Ru9hdgbb9Ly4GXh4dVyMEmlv4TbMs9Ph2kqtpLb7sQq9XV
	AbFLTMU7BIVkGytUZGFkpWtgBGE0JwJfh6xUuYdr5DZbkqlhw7PP4+6GvndfJ/MsYazXGUvjTtyQC
	VybvvsI9kEJIsiR5AOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMD-00000009Jin-2eaE;
	Mon, 13 Jul 2026 13:06:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMB-00000009JhF-420l
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1046412f8f.2
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947958; x=1784552758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAq3iUlWeKBxi9BzVp2LKHNg5+ivMc/cKZSPqbSeCas=;
        b=WZvzjOGB6IKa9P38Sy2Vc58+siK4z1bDVDK9jeW86JVbcDNMzFARFdWYYlgXzkKtq/
         HqTqJsDFnnFEewbsXUtVlFR0XtMsuwBVhvl8aW7RqXtA1vFmjVXUBDrFT7SjNyS3LJG/
         eINZ7JmATZtFA/kOso85+Rm1ULapZFBEUAmgSMrZ8D72bPZelgfbZe5gw8YtUAoRG71N
         /D+hnyABc97UGSQiofYWQDT70FnEMtmdyBr8Mpvs+aAMtYfypZ8webibR6Ex947BVTdm
         CyyvvyqD8GWdC2/C3pNwjzmwEk1CITgcMXs+BPfrGNZyemGxob278KdRJiLgbjWczJNr
         nBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947958; x=1784552758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAq3iUlWeKBxi9BzVp2LKHNg5+ivMc/cKZSPqbSeCas=;
        b=IAertiSSQRGPCv0mP18TwqrkWEB4fuftMBaeXLpzDZY8yiNJKoz8YV5TDK5MLfhEDM
         /10yVFTgwuHAEu8cp8uaMi5XZ32/QZu9bJoR9PviFUW7cedqBBU7pas3Q1vw31Lr632e
         PZoAGqN9qh+gfJMzNWEJcffgaqtf62VP20inqBb3twIBlMUrbJhf+FrOZSK07W09tN8Y
         1QikUORI7f4DIUvfbHZgSPEZ2Jm7RmZvoksbB5TC0g4VVopIQfZrpkMYSNLYgMFxUEtI
         2ciAcPXmG+uqkdbwxKABmwXjimDgpgWOAw9lgBWJzh9BVvCrlGYzLOGEY5ywo1mMqeyB
         hXvg==
X-Forwarded-Encrypted: i=1; AHgh+RqIlu3vMjxOCIjLe5yzLmpTSKMI7dzXALGFJMnLwyWmY9xGdaSM/u1G1LXFAjtVR1yrSVuSpqSezm8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpRn3DnY1SGScJ+xAptjx8kYMvmvi+7U28T/qIi1VIAD3NuDNR
	+U3dco8HSLwLEIFkoqrpqv7Ar9nJ/lxfPVoWYkqfNko77pLQlgepaa5HK0pfhLNtAdw=
X-Gm-Gg: AfdE7cnGC5lTFwyhZQZVm0xxf7yL08t3xCNoMbEXrrcMvNJGiaDQfuyLvnA0rwZ+63t
	sBTetk3wDpQMdCxpGDxGfEKA/znUn9D/vNr6AhBv66Ojq21e0DXnEGwJaRIlgNxKOMRhpIT5vx7
	MXt1gHqMDGZNviJNgXGzebPhRQ4tEfIxYSGKj0+N7iyDEh/SylovRn4JSzkVWQ47bjRdaDYGXJe
	rFeKZXA6S+TczSJnflKiHWOYP9vS/BE8BcVkuu0qlaCY1CD5CSJWhFNU3Ad9dtSRGhdxIzVmwmE
	p5yAbnMpBUdpYP7TROm/fqQRZ9Pu7Twz4DxWmI/rUtPYb/vt7U23e1Q80kbingUERic/5NBvb0F
	DyMZe8pzHEyQk4Wj5z/xn97Xv17aGqz5HzkadUH3rP9ofEilyE2nBXU6f9GLqMsZ9T8isLzooLJ
	rffZ7vp9oK2qSVwyKZRlCtfzoq5FBn3iGXdpOVCbZOuW/5Y4XpbFcqpcPrAdHe5toOUF2DPNRUi
	2Cuc55xEA==
X-Received: by 2002:a05:6000:2510:b0:473:1ccc:15c9 with SMTP id ffacd0b85a97d-47f2dd04861mr10170497f8f.40.1783947958166;
        Mon, 13 Jul 2026 06:05:58 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:57 -0700 (PDT)
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
Subject: [PATCH v5 05/17] i3c: renesas: Reset the controller on resume
Date: Mon, 13 Jul 2026 16:05:33 +0300
Message-ID: <20260713130545.568657-6-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060600_012140_587ACAB3 
X-CRM114-Status: GOOD (  13.21  )
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

Reset the controller on resume after enabling the clocks to follow the
same sequence as in probe and avoid potential ordering related failures.

With it, renesas_i3c_reset() was updated to use read_poll_timeout_atomic(),
as the driver's resume callback is executed during the noirq phase of
resume, where interrupts are disabled.

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
- collected tags

Changes in v2:
- replaced the read_poll_timeout() in renesas_i3c_reset() with
  read_poll_timeout_atomic() as the renesas_i3c_reset() is called
  in noirq phase of the suspend/resume; updated the patch description
  to reflect that
- collected Frank's tag. Frank, please let me know if this should be
  dropped. Thanks!

 drivers/i3c/master/renesas-i3c.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 517ac2df9bd4..6590da962592 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -495,8 +495,8 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 	renesas_writel(i3c->regs, BCTL, 0);
 	renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
 
-	return read_poll_timeout(renesas_readl, val, !(val & RSTCTL_RI3CRST),
-				 0, 1000, false, i3c->regs, RSTCTL);
+	return read_poll_timeout_atomic(renesas_readl, val, !(val & RSTCTL_RI3CRST),
+					0, 1000, false, i3c->regs, RSTCTL);
 }
 
 static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
@@ -1483,6 +1483,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	if (ret)
 		goto err_presetn;
 
+	ret = renesas_i3c_reset(i3c);
+	if (ret)
+		goto err_clks_disable;
+
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
@@ -1502,6 +1506,8 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
 	return 0;
 
+err_clks_disable:
+	clk_bulk_disable(i3c->num_clks, i3c->clks);
 err_presetn:
 	reset_control_assert(i3c->presetn);
 err_tresetn:
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
