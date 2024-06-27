Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B16CC27C4F
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Jun 2024 03:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KI5qCviAYU9bE4CYitkEHu1qr7ehr9pDUMMPb3QyjhM=; b=CuJ
	t9FCT6Vcl7i73QMRzjhF6bkHXHLN0XkmaajbqyFbZkYauTN8hZMMMjDFk3XSN5BqJXN8t9+wZkunX
	p+7Ju4grbaWEXhVzqbX/BdIqqmmlPMSQdV/S2MJ3sAZ2BJH2WgW1pZXoV+9rvQ14s4S2lEU/98iNp
	x+5x3hdRWruiCAY8jZyx1AU2LrJBW6Ve0wTHdxohJWHsDdZgLqMUbvOYaxWxko2UcsR/+zLGErKyv
	yFqTPPSAa5Dg0fzZkgeD1cEXL3HBIKZmNEOA4UIg48YrGSgmlhYqculvZPCfitCeLPSmrnqCzSRdm
	aIUjmU6XtUpUQQroLW3pGAtUybMAvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMg0u-000000097cD-3Wi8;
	Thu, 27 Jun 2024 03:41:36 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMg0r-000000097bi-3ROG
	for linux-i3c@lists.infradead.org;
	Thu, 27 Jun 2024 03:41:35 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dfeff1ae480so14066967276.2
        for <linux-i3c@lists.infradead.org>; Wed, 26 Jun 2024 20:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719459691; x=1720064491; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VfN6LKN9UpV/AtHOiz/7ta4IA3zN6HychBdUUeCjM10=;
        b=QxZ5TR2ZDxHMu0ICfF6YlRKyAUAaej66p0Drsgz36YvPEwKRDvuFRtt7FAydp5dRyU
         GPZGXsh2BfPoazwGiSva1n+ds0FUY2lf9vavQ/C8uroDkdg3OhqZ15J4loOMlqimbK9E
         TVigFwXrSVf86y/esG8os9Sg+1oN29IfR2lRNAMchb6v0YJi+3dcrCWPXR3jmpJrPKEi
         RmDg2G2w8A2Hj0lnA7CYH1ngnPdL8+GM26LoaQFmo1vtvE/Q0aKHvZUyKIQPLyrNKLjj
         qDzCPfdssowRwvXqPOvQAac/3nF5cI2sIkDuqJbOaNoioabSX5pmM6ZeIa+tHjccQAGx
         UCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719459691; x=1720064491;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VfN6LKN9UpV/AtHOiz/7ta4IA3zN6HychBdUUeCjM10=;
        b=nNchEcTyLlmrbBO4YyzerhJfpmpFeoQLoXzLky9IjVuaWW1Kt6itnqfW3GV2f4Z7CK
         QfdyEpPJ/qjLuhheyYBwCYeAQtulj9gcAq3fTg+W6hkzUDndLp1aoYapONYGAC7YBvrK
         Oa3YCTMM/P1gwlY5uOdOQRCpRfph1rDufkyvbc25JmlgtWRII3sGtnTDXhg7f6bqXwoE
         LD0iLXygZPfhbGoZ4oXphK481MPTCN2MUYV5PSZapjNXOgTIPmE+VI1yEikP5xx+wZip
         dMh2sR8i26lnCh/l6yOlLvbYumRrvH5ciALwN6Ftyu5qFcggYbnwLOGMz+AmmDCx2UHj
         /r8g==
X-Gm-Message-State: AOJu0Yx8/9G4LyNZPIkQRBOysU6EYwBPSgGuPjGIG4GDPu1Ej/W1ooUd
	btR6JOQSZ5sOXgBF9BPWrIokYoEPGjbS5ZXPO2GLm760zCBn4OKa7NxfqjZ2ETr0JWhj0rpk8Fx
	1DwL5seghJH3ARJR7UHRnvgsrrQ==
X-Google-Smtp-Source: AGHT+IGIQNKQcug/qo4053hTb1Q8b5FhJ00vTMf/lKz13G9EggldaPq/x0y3u9c/ZrSftf/dnDAtBduWF27TMMEmXTw=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:1885:b0:df7:b717:10c2 with
 SMTP id 3f1490d57ef6-e0303eb3559mr475694276.2.1719459691678; Wed, 26 Jun 2024
 20:41:31 -0700 (PDT)
Date: Thu, 27 Jun 2024 03:41:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240627034119.3938050-1-aniketmaurya@google.com>
Subject: [PATCH] i3c: dw: Remove ibi_capable property
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_204133_990748_142F4608 
X-CRM114-Status: GOOD (  12.69  )
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

Since DW I3C IP master role always supports IBI, we don't need
to keep two variants of master ops and select one using this
property. Hence remove the code.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/ast2600-i3c-master.c |  1 -
 drivers/i3c/master/dw-i3c-master.c      | 23 ++---------------------
 drivers/i3c/master/dw-i3c-master.h      |  1 -
 3 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index 01a47d3dd499..84942dbb6f80 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -156,7 +156,6 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
 			i3c->sda_pullup);
 
 	i3c->dw.platform_ops = &ast2600_i3c_ops;
-	i3c->dw.ibi_capable = true;
 	return dw_i3c_common_probe(&i3c->dw, pdev);
 }
 
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 77a2a1c3fd1d..9aae5c8dba8d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1404,21 +1404,6 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
 	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
-};
-
-static const struct i3c_master_controller_ops dw_mipi_i3c_ibi_ops = {
-	.bus_init = dw_i3c_master_bus_init,
-	.bus_cleanup = dw_i3c_master_bus_cleanup,
-	.attach_i3c_dev = dw_i3c_master_attach_i3c_dev,
-	.reattach_i3c_dev = dw_i3c_master_reattach_i3c_dev,
-	.detach_i3c_dev = dw_i3c_master_detach_i3c_dev,
-	.do_daa = dw_i3c_master_daa,
-	.supports_ccc_cmd = dw_i3c_master_supports_ccc_cmd,
-	.send_ccc_cmd = dw_i3c_master_send_ccc_cmd,
-	.priv_xfers = dw_i3c_master_priv_xfers,
-	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
-	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
-	.i2c_xfers = dw_i3c_master_i2c_xfers,
 	.request_ibi = dw_i3c_master_request_ibi,
 	.free_ibi = dw_i3c_master_free_ibi,
 	.enable_ibi = dw_i3c_master_enable_ibi,
@@ -1456,7 +1441,6 @@ static void dw_i3c_hj_work(struct work_struct *work)
 int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
-	const struct i3c_master_controller_ops *ops;
 	int ret, irq;
 
 	if (!master->platform_ops)
@@ -1506,12 +1490,9 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
-	ops = &dw_mipi_i3c_ops;
-	if (master->ibi_capable)
-		ops = &dw_mipi_i3c_ibi_ops;
-
 	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
-	ret = i3c_master_register(&master->base, &pdev->dev, ops, false);
+	ret = i3c_master_register(&master->base, &pdev->dev,
+				  &dw_mipi_i3c_ops, false);
 	if (ret)
 		goto err_assert_rst;
 
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 8cb617b8147e..7e76ca381d9f 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -38,7 +38,6 @@ struct dw_i3c_master {
 	struct clk *core_clk;
 	char version[5];
 	char type[5];
-	bool ibi_capable;
 	u32 sir_rej_mask;
 	/*
 	 * Per-device hardware data, used to manage the device address table
-- 
2.45.2.741.gdbec12cfda-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
