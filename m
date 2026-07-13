Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA677C44501
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyzFxCdXXltYG080nn6Yg1+y3d84SUs9gjXlmNMD/YY=; b=oL4RO/2bpHt1pg
	7UVcsshZ6cKPMGVT+YRLilRlkFzfPey7hVbS+0KvVCB0ol9IIpcpFpi4yY4XkWuT/tlWbZXFmGtur
	Vl78MFPcKZfkH2yySPDj3/ODL4zJaC+OcuaCSdXKuW1Gd9kHCUaGeKreyX8c/3vuO8qrXqYTC6G5x
	qaFi9m8lcVC+Dhu/wiFMfDrvaEO6xpMOD8s1SlteaN2NIJEY7N/nN7kA++m7ptZn5uU0aO/rN05Zt
	EvmZ5uQac66qOpWFHfUooSRT4PniiHWTRFq/CuShpgNy6yA7EFUHX1FWrkGUUcB813LlA70ccTcjw
	1q0iXdyUxhq179lAsdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGM8-00000009JfR-1ssp;
	Mon, 13 Jul 2026 13:05:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGM6-00000009JeH-3389
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:05:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1873837f8f.2
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947953; x=1784552753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH5mcedIpIiZlH9zrS1BV7uvFaa9p7I+Dq7Nzg++u6k=;
        b=hO2lIsBifkRXE+FM69JRz0IKTZ7MOk528uu3ceiw06rphkx9az1dUv2uQtKap3EvgL
         olb14d9mXT/vr4nz/n25aIf/Bsg3LpvaObN9xOpMGsfSXIATAmcfc46BtueuZ7gEqWWF
         ynLsbLDGbnIgYQK0XlWErBV4UUVy0EHgL4HQW84OaP8NebNnSokpkFGAoMiYqwBglH4x
         DGrCgzq/3SVt/wRc4UDmmcGxjWMSuxcH3KF424Sg/yegSP7NDvyUih069iPvzBn9KL69
         BQF5r8ZOQY/T2VD0j/5hpjt4WcLwIeCAw3e46B9QWeWRYKYuhFUbY2eL3sFLJOkUvhfw
         fuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947953; x=1784552753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UH5mcedIpIiZlH9zrS1BV7uvFaa9p7I+Dq7Nzg++u6k=;
        b=R9fQK2lzzdeHRCQ9jT+WWt4YtlxqN251D+YQDBcD3sv551tbrjdkC8NFGqBE5eBa9g
         oVTqiLGpmgq96dw8mjFINv5LlJbXJcvCu/eRfZoauVQ51OuRj1ohhEedhOaSRc4+mjTc
         mhoo24zO5p8o1p4Rzd61D5BLHw86ZyFE2/nrKljE7/4QYg8bRr+ZGcW2iC0s72wxbRGH
         bcKgUSlbBH0RDs4v95+SRrP50QP265Bk9fzG7JO6dJ1AZs5y0tTRTNGGNlxPlodQwmyz
         bVRZ4vmQk31Y3O04n9YeVHavjdOpC4amMaZwHsmcbIpzBVXAk6Y7feQic/UeCGMtgcTd
         Ap5w==
X-Forwarded-Encrypted: i=1; AHgh+Rrf41kbQFlInjTle958APPy/d3TPrD4Wjwa0b+tw/BSDl8P4ztGURPcmHKM/oA4SsexEoEVo2anhIE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWhmy/14YR9uuKU16Mh2j7b7zOtVP91ct4DhWMM33sTseSl+2J
	sDb3p17IhHf+6Vd/VKj10emzAtd2FdR0Ggkzluf/wG0lfXjeXj+k4DdopyiGjfh2fSM=
X-Gm-Gg: AfdE7cmAQurd2QjvcEPwDTsPRSFMf+LCcM045SqzPFbv38pjFsnqrhURFcUVOWhIHnP
	ss1lrGb1hmeM1Rd5+8JClpnmfoKx5+LjK3BiAjILndQaBSyhXL63oUqEq1WITWNt2C96Pbao8Ja
	KM419J3QDUOUMN7W9uYBmSsdl5K1GMTufuWPevUdsTjeEQszHIMYcuoBB4nGz8oyBU7Q9r0973u
	DIbILoFU3aWKyB0U5VLxs4ecsosrJJ4+bALQjtUCOoeXHZqD+aaIEIFvMIxyd7IZlRpxjr7IjBJ
	zBqeMysQxehNWBhZTpfZccvt4RongkNkVqj3cTsWc5Esg92mO2yfvJupMgYF6VtU8z1lffYLEdm
	YwFYBSx01kGYRD3kIj/vsqNTyzBHz+TXN4rrQERnqcpGoffGXt0W+7j/O4xnq1sNZw64yN1g4IG
	znIrcJbmisXDpIjrcwQBN/iCD0hfrP0+We/NjzFJhfT19lxV+D1qnK6bIYQxxtZ30MFEGzdzo=
X-Received: by 2002:a05:6000:2209:b0:47e:4b03:1aac with SMTP id ffacd0b85a97d-47f2dcc657bmr9421634f8f.38.1783947952926;
        Mon, 13 Jul 2026 06:05:52 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:52 -0700 (PDT)
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
Subject: [PATCH v5 02/17] i3c: renesas: Restore STDBR and EXTBR registers on resume
Date: Mon, 13 Jul 2026 16:05:30 +0300
Message-ID: <20260713130545.568657-3-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060554_780622_41826986 
X-CRM114-Status: GOOD (  12.03  )
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

The Renesas RZ/G3S supports a power saving state where power to the most
SoC componentes (including I3C) is lost.

The STDBR and EXTBR are configured in initialization phase though the
struct i3c_master_controller_ops::bus_init. Set them on resume function
as well to keep the same state of the controller after a suspend with
power loss and a similar initialization sequence as in bus_init.

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

 drivers/i3c/master/renesas-i3c.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 38b8428f464c..cd9928649c7f 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -260,6 +260,7 @@ struct renesas_i3c {
 	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
+	u32 extbr;
 	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
@@ -622,10 +623,9 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 
 	/* Extended Bit Rate setting */
-	renesas_writel(i3c->regs, EXTBR, EXTBR_EBRLO(od_low_ticks) |
-					   EXTBR_EBRHO(od_high_ticks) |
-					   EXTBR_EBRLP(pp_low_ticks) |
-					   EXTBR_EBRHP(pp_high_ticks));
+	i3c->extbr = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
+		     EXTBR_EBRLP(pp_low_ticks) | EXTBR_EBRHP(pp_high_ticks);
+	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
 	i3c->refclk_div = cks;
@@ -1468,6 +1468,8 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 		goto err_tresetn;
 
 	/* Re-store I3C registers value. */
+	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
+	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
 	renesas_writel(i3c->regs, REFCKCTL,
 		       REFCKCTL_IREFCKS(i3c->refclk_div));
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
