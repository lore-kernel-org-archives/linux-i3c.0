Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF20C44507
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ju7JcyB0a7uhjcMupsKn5DCehOlaf9sfJFwlBET1nwc=; b=2HEk+lLeE9VZ1+
	iIdBFbo8R2z13goBj5Dot9LNoaHdfOiQz7xju71z+42a5bL7NO6LGZ/U+KrQTdey5fdP5uiBjbE3a
	LMQrnJkx7N34tz4VqdGTtwcQP2ogY8aqdcPIt3N8SWxzlkrKOWonYyXQiwivxdxFlsJ4MNccUvWxK
	U5yajrsMQJl/FAYFU1IF4RdvaZ/6+16Jy60RPceoDUrrAjmGPD9uUI8gFFa8aBond8zufPswJnH68
	N8VnosX4bq4XLtEcAzo3oS1B3UgftMKTfLLiY8SKQybZnfdVBHNN5ubYp2ZVezs3G8S2qGwQDMXpm
	Yx6mi3IGIuIVQLfGDa0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMP-00000009Jrb-0XDs;
	Mon, 13 Jul 2026 13:06:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMM-00000009Jp7-33LE
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493e497643fso18737015e9.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947969; x=1784552769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNXmTXjRfKoPXDcikOUifOydaqjawsRuj+0wvKXoUpU=;
        b=iQy7ZV2G+JRoKj1WHo8juaWbjN0vXB5n5z6qyMKj5IY/1CqhlZ+nP4tNm07RXrUDC9
         jc9AtD2kQGocZK3ZHyc3+3O854ZJDijAmQMJB+SIKhxwZXhOKw+F+uS1e9b89PjYkh6U
         rAON9KciWbIjWXkItXp9pxb/UIKMaW1kmsJRwEh2XOeGKEPJSOVUBWyCN89+J9XI3CMf
         OP1ysIoqNdp4TajeKaa+Uq301RBHaoQJjWlKUwrziCC1J1grL8fATxs2ppB8dUGNnM+v
         8fliwqUuyyrZWuqUguD6PYfEzq/Kk3QaGOoVaY+hbSE0vfjXb1V96G3sMD/Zc52mzwFZ
         b85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947969; x=1784552769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VNXmTXjRfKoPXDcikOUifOydaqjawsRuj+0wvKXoUpU=;
        b=Cd13E+Ihu4ukC2BIaKWzBkZ9cNNZ0FAOCI2JO4OehRcp4xvFgw0ib70HNOSYQxJHIh
         fhz2Odk7cymUdILheb41RjnGUg8CfYfE6N8x1YnpwBnN0W8c6Knzw1BYNpq5CAmJpObq
         d/3MaxDVwZ+xLMW22lsy+zjHRtMvMylAizjP0yeOmXla3QkTCdPznV8DT9VKO0OviUzV
         yTWKWUApVfpc4oxRWQrbVid6LQexxzhdATQ/A0dl9Hf4yA9fWMYh3+JR8pRzJRAW5sbm
         /esQzzi1U+fuHD3EBCU9nEDfGSpsbzX5b19/LYBUxT42fBocYOkQvjgb7hgc5xaZ4moF
         Asuw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/PVmUVpPW9WjW7UBQiWBVP1PIsw/dTJXI34KUNOHbiVyhoiIxAa28z5BHtdJKtl/2FOw6VyTWtrg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLsH/FhgD/JcZvJHWN7H90ggoJYOgLrtsnWg8zI1opsi73ueYz
	IiFVLjrTgbKf9SOqJU1+cvLLRVD7sVtTCcBvOQgdNe+AJhxME3EgUDDuXBQYITWCTpU=
X-Gm-Gg: AfdE7cl69eEWtM0jtSb4RC4dPmHCAHEWgEcuqnIcW04rclM+N+Jk3mO5JOmJC+zF6xL
	6w9ZnbolNXL+6V0rDjqijLV5yPjr/9epIvVpk3K1WZqmCHnSvsEiXc7L01WVJb/9KL8AZEHlKZ4
	qpgnJA0It/v7yUhczAhvPZ8ekQnNDECxHH92Xk8kjs2b1J2v/lKzZ0NH9VdK+VglVinvzCc7b7O
	KAK7LtXwuS8BAT31MugUy/1E+C4HttSH9SH4wxBKHB32BODIMta0lLXB8RyoVorRJCcQt5/9Ppg
	OFIv8A8w6LFJDjLO9bhdrkOZgN8rSOH58G3gBQ767cF1F1XBXriYuf9Qtf7FuZKQrPU9M/OBrKu
	wgxGws5zU07GHbloyRl68u2V0P8gte1E2ctNp/Nry2JByiHkzF2CYCtowt5dREoHGGFUp73BApU
	gMNdvtwfKEh7FB8+Hk5ZJR3W4wYnpVrntdx5OujpiGPhsdpVherPk965bqDB226NuJN+iUprw=
X-Received: by 2002:a05:600c:2e15:b0:493:eb71:5cc6 with SMTP id 5b1f17b1804b1-493f88280bamr55543995e9.27.1783947968931;
        Mon, 13 Jul 2026 06:06:08 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:08 -0700 (PDT)
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
Subject: [PATCH v5 11/17] i3c: renesas: Follow a unified pattern for transfer and command initialization
Date: Mon, 13 Jul 2026 16:05:39 +0300
Message-ID: <20260713130545.568657-12-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060610_786460_F7EB0655 
X-CRM114-Status: GOOD (  15.14  )
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

Follow a unified pattern for transfer and command initialization across
the driver. This keeps the code cleaner and easier to follow. Also, in
some cases the I3C device was enabled before the transfer data structure
was even allocated.

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

 drivers/i3c/master/renesas-i3c.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 9a3613220034..c1396c49f45e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -663,6 +663,10 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	if (!xfer)
 		return -ENOMEM;
 
+	init_completion(&xfer->comp);
+	cmd = xfer->cmds;
+	cmd->rx_count = 0;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -684,10 +688,6 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		renesas_writel(i3c->regs, DATBAS(pos), datbas_dvdyad_with_parity(ret));
 	}
 
-	init_completion(&xfer->comp);
-	cmd = xfer->cmds;
-	cmd->rx_count = 0;
-
 	ret = renesas_i3c_get_free_pos(i3c);
 	if (ret < 0)
 		return ret;
@@ -779,13 +779,13 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	if (!xfer)
 		return -ENOMEM;
 
-	renesas_i3c_bus_enable(m, true);
-
 	init_completion(&xfer->comp);
 	cmd = xfer->cmds;
 	cmd->rnw = ccc->rnw;
 	cmd->cmd0 = 0;
 
+	renesas_i3c_bus_enable(m, true);
+
 	/* Calculate the command descriptor. */
 	switch (ccc->id) {
 	case I3C_CCC_SETDASA:
@@ -835,15 +835,15 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	int i;
 
-	/* Enable I3C bus. */
-	renesas_i3c_bus_enable(m, true);
-
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
 	init_completion(&xfer->comp);
 
+	/* Enable I3C bus. */
+	renesas_i3c_bus_enable(m, true);
+
 	for (i = 0; i < i3c_nxfers; i++) {
 		struct renesas_i3c_cmd *cmd = xfer->cmds;
 
@@ -964,12 +964,12 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	if (!xfer)
 		return -ENOMEM;
 
-	renesas_i3c_bus_enable(m, false);
-
 	init_completion(&xfer->comp);
 	xfer->is_i2c_xfer = true;
 	cmd = xfer->cmds;
 
+	renesas_i3c_bus_enable(m, false);
+
 	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
 		cmd->err = -EBUSY;
 		return cmd->err;
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
