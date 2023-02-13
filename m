Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B44C636D4
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Feb 2023 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1tvP3fY+EB621Ueen4563Sof5c1KIYQlUyg0ITEg8T0=; b=Zf9
	7oPqoXgm6Q/wFkZ1O1otE2cP8puv+NgxnYPnvopW2W847NQu10dJV2geaPfGsh0nPKvp5lYMSZ0VD
	UfbFdDdB4+PWaGA7KkEXuMAo6d089PvPK8hj35wqNZBBMxm5vO7j5yJV5xoa2p01Hr30Se97CTPpJ
	P9QwYRjqNFV2grL6PICo1fq+YaoffMgl/L8ZfvlkRo+PAD1eQVcH+vDjNjoxonbpPF1LikgLbOqRu
	16iAWwBnQNATY0hBqGgLv/qPgaFfRpGej5KzMNy+pbhGWb1Y2ekPoU/gMUFf6wzNpwexGo/JoND25
	ZS9J9oJ69wd0fJONakAmNkxGSi8ktkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFSW-005WLD-BE; Wed, 15 Feb 2023 10:56:20 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZk8-00ExXf-BE
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 14:23:45 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4cddba76f55so128600067b3.23
        for <linux-i3c@lists.infradead.org>; Mon, 13 Feb 2023 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rf82oeWSzSebi3IHp7/wkO0XHFRaK53Tm2VM8FWyfpg=;
        b=qzJ7QTEAVcRVLK5NckA901iN36ArQHM4M0Sq0IzXirHuWnll0LaM8ErpVF/2D3kD48
         MBEimYFNhTy0BzEgguDsVSzlCAp03NYKleXUiPbtSqHsem1cypMtFXnC4+e7JVoXbF2D
         PdFSMH57wCqcpHqmCObRE5xeLUAASLW3HCfo8QsjqCLdraydB8MBbfesVi8zWMf2hQYz
         lmWla0gmawYxttmLG4NBSyAglLSM0YWpkp7+QZV+DS/RSuHb7im79VxsY+MiBGdcdB0C
         sCPWI6jWIv5+956hymM9hgniFnQ1VvUADG3rRK019YyqRoNdbi+dxNHmj/LS9MtblGKJ
         JJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rf82oeWSzSebi3IHp7/wkO0XHFRaK53Tm2VM8FWyfpg=;
        b=bInoeCr5mGlNSEb+D4GmXe+LFSZzcl2C/Rz7ewCmYAbjGV+iSTDElXmUc3N5t3UwEg
         lYN0G7ZMeYxrCOmThf0qVjA4rh2I4ClLpeABAEFaRG8o+D4sQr2XnlNNF+AB4n3DHbQe
         PNe8wjPtKOno5BlS7B/TmLiYf9gDSC2tfN7jHBMj1/hOf4AFxwPwANbnSWhy2uZHBiIh
         ouuvUQAHo+3Xi3YhWiwtlbJTABTJjWcairb93lDAZFcrOmp6qkUXILzcnPaS3Tr1M7+f
         cWSrB+YzUIfDVVZ7T5FEgCSsNFpaPExdLNTpkN7cCvYxXqZ3eUgZ+iDzynL+rE2YfmSg
         Mq0Q==
X-Gm-Message-State: AO0yUKVrgSR3mKlvZgb+nt9MFOPA3eYi2AucOH2RNqcDPILb/rcDtJNH
	TUUFD0O6oBjhRGueQgmz0KdOo84BCIe5Znqk
X-Google-Smtp-Source: AK7set8FmsJJMsM5suVqjMsUc0r7FwqRyr9mNaESFAoJVdgM6RFzvANx7m43zjLLnU3Cxl5lTmho9BneqJUQ/ynK
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a81:4b91:0:b0:52e:d81f:1763 with SMTP
 id y139-20020a814b91000000b0052ed81f1763mr13ywa.9.1676298221058; Mon, 13 Feb
 2023 06:23:41 -0800 (PST)
Date: Mon, 13 Feb 2023 09:23:36 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230213142336.192875-1-zenghuchen@google.com>
Subject: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
From: Jack Chen <zenghuchen@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jesus Sanchez-Palencia <jesussanp@google.com>, Mark Slevinsky <markslevinsky@google.com>, 
	Jack Chen <zenghuchen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_062344_403084_781BB703 
X-CRM114-Status: GOOD (  10.37  )
X-Mailman-Approved-At: Wed, 15 Feb 2023 02:56:19 -0800
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

Bus-speed could be default(12.5MHz) or defined by users in dts.
Dw-i3c-master should not hard-code the initial speed to be
I3C_BUS_TYP_I3C_SCL_RATE (12.5MHz)
And because of Synopsys's I3C controller limit (hcnt/lcnt register
length) and core-clk provided, there is a limit to bus speed, too.
For example, when core-clk is 250 MHz, the bus speed cannot be
lowered below 1MHz.

Tested: tested with an i3c sensor and captured with a logic analyzer.

Signed-off-by: Jack Chen <zenghuchen@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 51a8608203de..13309dde1518 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -531,7 +531,7 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	if (hcnt < SCL_I3C_TIMING_CNT_MIN)
 		hcnt = SCL_I3C_TIMING_CNT_MIN;
 
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_TYP_I3C_SCL_RATE) - hcnt;
+	lcnt = DIV_ROUND_UP(core_rate, master->base.bus.scl_rate.i3c) - hcnt;
 	if (lcnt < SCL_I3C_TIMING_CNT_MIN)
 		lcnt = SCL_I3C_TIMING_CNT_MIN;
 
@@ -541,7 +541,7 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
 		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
 
-	lcnt = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period);
+	lcnt = max(DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period), lcnt);
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 
-- 
2.39.1.581.gbfd45094c4-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
