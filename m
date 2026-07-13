Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDA4C44507
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROuDNRwjr7qedzZjAW/OxYCUsB2WUHDl+Gg5vIG2fXA=; b=V8GqvQ+8gaSBqn
	pNZBgS0irN7dlUTnpDj344ZM7E+VpWTaLwd3R0xRGBlsEgHUy1oPTcCkYkPIeGdpNyLxLuUPF1xOs
	hCKKSSbw6dyHzWa8Uef5DK+fb63ETHJgXu79ADkEjV8k7JnPIQqj/QuBX0pUjcAz4CNH3RzGeLwfa
	ja8QKG+x69/WM7toiZmQB2enZhMMlc7K8tL3e1bM5J3NFE6VOKyoYec5Tj+o/ChJ60d65kQmFmffP
	FXV+zhETH64nQaSKJxnJvzLVTapOoorcL0Wkf6u8usTomwsdpqBO8dr47vhK9+DlQl4BO2iZZ80Mh
	spqaV/2MJtfFnjgrHW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMU-00000009Jvm-1xQB;
	Mon, 13 Jul 2026 13:06:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMR-00000009Jsg-0uhd
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493c7902f47so29040145e9.1
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947974; x=1784552774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka2WRcxeR+5lBW53fFIg0AOmhGbckfoTmT31bECGwZU=;
        b=d9CwTiId5rNWQr4eol+qSjVNbh6DC/Dmox8ialksUaLZ9yQTFaaPNkPmUEd7Ed6tP1
         AtD82MoC5yuUX878bRlZ1n90tuPO8N3jFArmrtpYFgGFfkFn1/mORJfUIF/8Gux4ZOA7
         w6ZXYj6TeFdWfUld9H0Bb+nDf29jht4bmjDqA1HGc8ri0gvLE7dA2OLXNilaeOMHXrTH
         hWwI6RFJF417xYJe/bbuSUpZD6R+ivqqKPag15LQc8qA1mnacJdbmWTzpDlNInpcu0/S
         UWTZj3PJOqTy2/f98hGDa+adPdO0CisbkBhhCImZ1hPDGsZnVTgIbHKHBLe2DlksLHhb
         1rxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947974; x=1784552774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka2WRcxeR+5lBW53fFIg0AOmhGbckfoTmT31bECGwZU=;
        b=Xz4Mp0SqsQaL9rnT41u/qqJOvbzp3QuHJsFnMpDauasWj3oxQrZpjOlpC66jrqy6x4
         IGoIaLjU/YeIV0koumvyYKe9qu05Yzrq90nOywRZCJ8zYZ61NFkYgcOGdlEaT8Wk6nfW
         OvtvCtPHOIOI5caeTOVro5y4bMnx2u5L2iMTPP/rqWtK192TOFRJs+i1Fj+MNwq+sah+
         Rf5zq8mkzhWk0Q4AJkpqTUEYqDQPR8pfP//IFsFiDUy0jY3pYnEtM13c2HETY3MkL0Ru
         RK4m0GsaHxek00krQVsNxKWOFRimuYjXknVR/PDjeUNgJSoPk/lQ8hPeBOOIGdDU1N3v
         ILdQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV3nQC7a+mfUPiZPJiPEcJBOnceJK+mLO3CAg4E2025ZD+bK/3lotC3rDwZE8twnNI2Qdpwcl4kjc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3EUxHa/mcK9k+oHYq1lPV07i/YUynd4GbZI5r7urTcJlraNYK
	sJ7N/WcJ5fQEnaveh0ikjlKPDwUM6diGfofcTEsm5afoYM4V4R0MzURPRgnjN0pcq44=
X-Gm-Gg: AfdE7clBBJgC9WgcKo7Z6tqik6ZTRz7t98ag2JDguApSVObSdMhjq3hwulqqNwGcnms
	U0VeemOfiMdb2Io7usfTQqJ0p3nieKKmFMWI6a8+GIBwBacHnOatllsmLvcS5RjkqLXr9gXl3kz
	ryaLnsI0aqW/l7iJi0IgNio0XIgyhD9QHJ62KPffuZNLHCWaw9AlkOzhqD+6LokqpBWQuGre1tm
	sAUQOP8v9gmMVjJk4SKO01+6OvApw2qgHd7ding0yGLNp5u28tow3zHq19eVS3flHxKkdVM92oC
	UQ/vTlGhr5voBnqZupKQ7N1GVbEGWMcxxVDZfbTZKOw4w53m56rSk5IvVEOfGWVNrgioJv6oSyW
	iddeP3c2tLVE0nfVVHMTzXjEJp0VraSbhclgmVYl4H7WCWJ8EiX+QOqy7sBMcGrOI2m4MIyVE8K
	wlX02G4zN04bFGo0kc9tZthNWFFNpi3tYmsCY15i29jmiVHliz6AFuP2C8p+owByjkP2nhYO0=
X-Received: by 2002:a05:600c:3143:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-493f87e9f43mr90709465e9.11.1783947973694;
        Mon, 13 Jul 2026 06:06:13 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:13 -0700 (PDT)
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
Subject: [PATCH v5 14/17] i3c: renesas: Organize structures to avoid unnecessary padding
Date: Mon, 13 Jul 2026 16:05:42 +0300
Message-ID: <20260713130545.568657-15-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060615_279795_A05CB786 
X-CRM114-Status: UNSURE (   9.27  )
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

Reorder structure members to reduce padding and improve memory layout.

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

 drivers/i3c/master/renesas-i3c.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 2cff7c6ae369..a54c20ef5f6e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -221,19 +221,19 @@ enum renesas_i3c_event {
 };
 
 struct renesas_i3c_cmd {
+	const void *tx_buf;
+	void *rx_buf;
+	/* i2c xfer */
+	u8 *i2c_buf;
+	const struct i2c_msg *msg;
+	int i2c_bytes_left;
+	int i2c_is_last;
 	u32 cmd0;
 	u32 len;
-	const void *tx_buf;
 	u32 tx_count;
-	void *rx_buf;
 	u32 rx_count;
 	u32 err;
 	u8 rnw;
-	/* i2c xfer */
-	int i2c_bytes_left;
-	int i2c_is_last;
-	u8 *i2c_buf;
-	const struct i2c_msg *msg;
 };
 
 struct renesas_i3c_xfer {
@@ -253,21 +253,22 @@ struct renesas_i3c_xferqueue {
 };
 
 struct renesas_i3c {
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
+	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
+	u8 addrs[RENESAS_I3C_MAX_DEVS];
+	unsigned long rate;
 	enum i3c_internal_state internal_state;
-	u16 maxdevs;
+	bool resuming;
 	u32 free_pos;
 	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	u32 extbr;
-	unsigned long rate;
-	u8 addrs[RENESAS_I3C_MAX_DEVS];
-	struct renesas_i3c_xferqueue xferqueue;
-	void __iomem *regs;
-	struct clk_bulk_data *clks;
-	struct reset_control *presetn;
-	struct reset_control *tresetn;
+	u16 maxdevs;
 	u8 num_clks;
 	u8 refclk_div;
 };
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
