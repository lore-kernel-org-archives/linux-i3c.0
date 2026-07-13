Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF770C44507
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIUVLrm2OaQd7+SpLap2HskF/SyZSMmYCA+qa4/MfAQ=; b=g250nphvcgx4Uo
	4bgLqeQHDt515ccQ15lyyzXnTQ4AWsCyW2HCY8kBzguvKXs745PhdNLKgXY3ApQi8F06y454MzKi6
	kkRPBD2D33KcBGg169G3lTwc1eH5zSC7evfW8disF3LXdWMAb7iDgVCxOgRUfjdBkuNBpnpDJQE2e
	wPPnrTIhrFEvUqv7BbJXfRWKeyYtmr7x6sQ+jefVs/mhwc7J5D+u5WKfXv9crIE1nkOLxQ/3+B8gR
	HuGUjtszUEnYdte6NWck/+9xVyAyoJaAqdTgnXqPRlnzNlNA69E3sa2N4PenNT0d4mjSJ2vne7Qbk
	kZ3V7nuRsCTsdjPvHQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMF-00000009JkU-33eJ;
	Mon, 13 Jul 2026 13:06:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMD-00000009Ji2-2cwU
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-476d8e647e9so3198729f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947960; x=1784552760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7c25tAQuKLxSupdY9CktEZj3cba9VcnGd28lC32imf8=;
        b=h3sCqR+7r0OWKlO3OliXn7zXj44teUav3ZdKRXuGkNV+tQRoruj2w/qXjcftT4R/73
         H4w9sXzJ+9Oi0KdxTZP/fhTAL80HlvAmRZKV7vzqIdAVfIiQGtAH2kyjE1Q2MRFnIJV2
         YetCBTkBV1ChXfSIR6p0pYnWoSjLVtJje/x12lbKBnGV831C29m7uYrsMnoKs5na2u3x
         OMyBra4ewDdtfsKV8jzPnViYaKZ3pnxP9NdBjiBhYT8Cd2xpsHw0vid0tkYlNqK/ZL6X
         vbxtX9B59Tn6oEEvR6aa0SL0boFA9JDf0BO47E9GoaKm02tektWeKibQELOum36QpMT1
         xp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947960; x=1784552760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7c25tAQuKLxSupdY9CktEZj3cba9VcnGd28lC32imf8=;
        b=LSTnnA9QAgmuKXB+oq8QzAZZpRk/cxjGgu9tY/QtdKz/PGPSx3VcODyCCbotGy6COz
         frFh+pXEna85FsoOaeLWI0Jp/tt50p80klx4bqNG8JiyUqGoighS5CLcclS9SLltiKLo
         wf90x7lZHgSfP1TutRPpXzDylljN4Zq1ISl9iQVdCRyyNndrtEfLAQ+cXQCVgF8LfFWV
         f1+NvIKle4akkkLflYKluoxAEyPcS0d6Afe2XjPHiIiFlHMqmdkNbuDUe99EKWZgth3U
         mUGksYPglOuvXjFGzO4bej0e4frrKvsCoSCQnFmQTrulFG8DUPllvggZeP8d7Q6Wlbm8
         9NJQ==
X-Forwarded-Encrypted: i=1; AHgh+RontNiUySOlrMD4FFRpXSuWyCObhmmdM6yGB2cl2Isp5hjpgzrN97eftv80lzQZZEUBhu6e5a7+nJM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyjI17nnYT7LKnWGS5P6xspnaNkCfOQqlpn7IM3EBxDdNrEzVG
	OLFjRJA7R0CA56iBDGS3V1NdAph9234tQIzT3o1Imdzm6g/ydwHAJ7RQ3Urka2oQwao=
X-Gm-Gg: AfdE7cnsrBZCouQkQiP1cMzOKzVEDRJVMgw0IY9Hu1c4YSYgNQsbx8++FTvgd/RYvLV
	exR+cVnx+d0rENU4VUqiGEWa2XDsO8nMYEtHOSQNmXYPpCT54r9gssMjgCCvnIO9sz+7b8m6Tm6
	d7bXr2Ekkf5hGwV0eHquMhLE1LupvpfBgCg+XA93ckIXitauMQZbTmWGQgTCsbGcRWjMpeCuiJC
	tOREFTi//Kk/fWgjeXsxLLyYQsv5cEqePwKcRrmKrx8q7Zbb3dILTuBkGiEDlHEORws5twZDg3s
	XWO5GsC6aDG17+PqJQwSgvwoMMVWwuIMA3lUql6/pL6d9vDMO7/HXtk652Snmoixke/EsiWRaPN
	VtXhPoR+GzP2DF4WlKqR2lxkEvR8HAL2coExogfsZi7Z0UKn/G95g7ur8Xa0qgWOW6dn6kdQCIO
	0W5EhVbQafnwt23LcqvDPQHem4X97g8jfuaNL8hQ8MnSPWy94b8zxSbpjV9ne8GoQ3VNjUhSo3g
	tLo00qaxg==
X-Received: by 2002:a05:6000:4283:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47f2dc8cd9bmr10407081f8f.1.1783947959860;
        Mon, 13 Jul 2026 06:05:59 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:59 -0700 (PDT)
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
Subject: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Assignment on resume
Date: Mon, 13 Jul 2026 16:05:34 +0300
Message-ID: <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060601_720775_FC3E9F88 
X-CRM114-Status: GOOD (  21.07  )
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

The Renesas RZ/G3S SoC supports a power saving mode where power to most
SoC components, including I3C, is turned off.

On systems where the I3C devices also loses power during suspend (e.g. NXP
P3T1085UK-ARD connected to the PMOD1_6A connector of the RZ SMARC Carrier
2 + Renesas RZ/G3S SMARC SOM), the devices becomes unreachable after
resume.

Running DAA in the controller resume path restores communication. However,
DAA relies on interrupts for TX/RX, which are not available in the noirq
suspend/resume phase (unless they are wakeup interrupts). For this, the
suspend/resume callbacks were moved out of the noirq phase. Currently,
there is no identified use case on either the Renesas RZ/G3S or Renesas
RZ/G3E SoCs that requires the controller suspend/resume hooks to be part of
the noirq suspend/resume phase.

Since renesas_i3c_reset() is not called anymore in atomic context
update it to use read_poll_timeout().

Along with this, struct renesas_i3c::DATBASn and its usage were removed,
as they are no longer needed.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- restore it to the level of v1; the other scenarios updated by
  sashiko were already present w/ and w/o this patch and could be
  addressed incrementally
- updated the patch description

Changes in v4:
- used directly i3c_dev instead of i3c_dev->dev->desc
- fixed the swap in renesas_i3c_group_devs_in_slots() for i3c->addr[]

Changes in v3:
- added renesas_i3c_group_devs_in_slots(); along with it, the
  struct renesas_i3c_addr was updated with i3c_dev and i3c_dev
  and the attach/detach/re-attach APIs were adjusted accordingly
- dropped DATBASn member of struct renesas_i3c
- used i3c_master_reattach_i3c_dev_locked() to re-attach devices
  on a fully occupied bus
- in resume, moved i2c_mark_adapter_resumed() after i3c_master_do_daa_ext()
  since it can update the internal driver data structure i2c specific

Changes in v2:
- adjusted the code to still work in case the full bus was occupied before
  a suspend/resume cycle; for that:
-- introduced struct renesas_i3c_addr
-- preserved i3c->DATBASn[] which is saved in suspend and used in resume,
   in renesas_i3c_daa()
- updated the patch description to reflect the new updates

 drivers/i3c/master/renesas-i3c.c | 38 +++++++++++++-------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 6590da962592..acc30ed615ab 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -265,7 +265,6 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	u32 *DATBASn;
 	struct clk_bulk_data *clks;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
@@ -495,8 +494,8 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 	renesas_writel(i3c->regs, BCTL, 0);
 	renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
 
-	return read_poll_timeout_atomic(renesas_readl, val, !(val & RSTCTL_RI3CRST),
-					0, 1000, false, i3c->regs, RSTCTL);
+	return read_poll_timeout(renesas_readl, val, !(val & RSTCTL_RI3CRST),
+				 0, 1000, false, i3c->regs, RSTCTL);
 }
 
 static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
@@ -1419,12 +1418,6 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
 	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
 
-	/* Allocate dynamic Device Address Table backup. */
-	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
-				    GFP_KERNEL);
-	if (!i3c->DATBASn)
-		return -ENOMEM;
-
 	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
 }
 
@@ -1435,17 +1428,13 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
-static int renesas_i3c_suspend_noirq(struct device *dev)
+static int renesas_i3c_suspend(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
-	int i, ret;
+	int ret;
 
 	i2c_mark_adapter_suspended(&i3c->base.i2c);
 
-	/* Store Device Address Table values. */
-	for (i = 0; i < i3c->maxdevs; i++)
-		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
-
 	ret = reset_control_assert(i3c->presetn);
 	if (ret)
 		goto err_mark_resumed;
@@ -1466,10 +1455,10 @@ static int renesas_i3c_suspend_noirq(struct device *dev)
 	return ret;
 }
 
-static int renesas_i3c_resume_noirq(struct device *dev)
+static int renesas_i3c_resume(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
-	int i, ret;
+	int ret;
 
 	ret = reset_control_deassert(i3c->tresetn);
 	if (ret)
@@ -1495,15 +1484,19 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
 		       MSDVAD_MDYAD(i3c->dyn_addr));
 
-	/* Restore Device Address Table values. */
-	for (i = 0; i < i3c->maxdevs; i++)
-		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
-
 	/* I3C hw init. */
 	renesas_i3c_hw_init(i3c);
 
+	ret = i3c_master_do_daa_ext(&i3c->base, true);
+	if (ret)
+		dev_err(dev, "DAA failed on resume, ret=%d", ret);
+
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
+	/*
+	 * I3C devices may have retained their dynamic address anyway. Do not
+	 * fail the resume because of DAA error.
+	 */
 	return 0;
 
 err_clks_disable:
@@ -1516,8 +1509,7 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 }
 
 static const struct dev_pm_ops renesas_i3c_pm_ops = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
-				  renesas_i3c_resume_noirq)
+	SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend, renesas_i3c_resume)
 };
 
 static const struct of_device_id renesas_i3c_of_ids[] = {
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
