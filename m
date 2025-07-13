Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EDDC83F1D
	for <linux-i3c@archiver.kernel.org>; Sun, 13 Jul 2025 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4K9zPfBBUqqCoVv6MIlGCDAkSSCHN1HgGhtQqIO6Tjc=; b=LKHCLJF9tIkIaC
	Y9TOXzAS7z0EpphYD99LhklpaSzaJgEfoe1yOZbZBwvFlkNLol9V1TrVbP3LBj/9u099oQoYsc/p/
	2ypT5kD96XicAfRKV4YuCdDGZ3SYgd3suXLkUXa9KbR6blfLmJJLRrwtiurYD/46zdr1cJKRd7MA6
	Exw4ERx8nV534H1G6oFEZXmPWx4o0FZu9sIBAksKpr/Q0qwMBzufxwaXBPInTlbPtcTW7GjnJP/dM
	gL2RpfU8SyGD1boMKLZeGCfv0RdfyST6124GmAEawqSxNwohPM0oTQsvgy574JsXmAqzkiwrC8Nhk
	dJZjfuZ9UIVoABfLMsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uayZR-00000000JHt-41qM;
	Sun, 13 Jul 2025 15:24:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uayZO-00000000JHQ-3gj9
	for linux-i3c@lists.infradead.org;
	Sun, 13 Jul 2025 15:24:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-453486940fdso1633755e9.1
        for <linux-i3c@lists.infradead.org>; Sun, 13 Jul 2025 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752420289; x=1753025089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9ZNHXnXaiutNt4q3B66spimAL1ksGORFJerkfIEhuw=;
        b=jJ+JfHc/Y0dda2FDpCLvOq5slC0gAhk6HZ9DEYMAugOhfyhQFD28bzewFj2M7D+Gc3
         tluv8rhafC6uRODv/j4jZy1satiXl2+3AI7I8D8pJ62orG8P2RNUl05IfGxMH7Lfb/Ce
         HZ7GaEVhZBFOr9Srf6qy7CSY3T+gJjtB6Boc5JzQtbL7vyJJ2KKBrlNuk1RtT/kaqAMc
         3l6xPbk2HwaGBvgRphLZxoIwr8G0frao3QvajRKXv//h1D54WiyAdiHEjvfsYI+neg09
         gDRZ00lBV9U8uX0qRTB88DSld6g5RYbWgp+vh2AJ9nbU4uRksW2b48Qv1iZQO+S0dOe3
         kmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752420289; x=1753025089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9ZNHXnXaiutNt4q3B66spimAL1ksGORFJerkfIEhuw=;
        b=O+9eQQKv2GWAphnkMWqQVS9cwTUYy6ubylOhiy9K9nJBJrNHnrP7SxchrCWu8bK/Ry
         LUb+hU3GH6ONpEfoC0INR/ld+dYJSHf+QWaHyQfAoGaR6/IqOHsGWoqNEhZJmRIsozcN
         z/TOCBT1Gm3G/hAWPEl2JoZ5Qca8zj8aq4Q99/Y99O4rBRy+s+Zml1Vvrh+zFqYYpUqt
         hUw3hbGe0DhiR4u/a/J8lh7t/V5oXOm3b6StpZzvsSj5xnbRbTxiZMDKM751u8NQP7D5
         /eJ6oAEMGtrLIuvU4DECkZPt4Q1qJOXmIm8NXQRev7rry0CVSReGN3C91zSgTLXu9oh8
         nnyA==
X-Forwarded-Encrypted: i=1; AJvYcCXmDZhbGbDBQDtxpmL1mHD3xhpiiQFCmLT84E8BefW09Ojcmq3F7Ur88lqOEs4LmBLcRjqCBgjjEzs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDw25d4XZppnml6CfbZ5OXmGhlaRF/sKd/aj45zI0LhxwyadYR
	M955z0iVxfHX1P0KjzUT/BKXeH9dwUaIuTHmXHh68wDyvik9ROeAgJe+lNl+VXKAFeI=
X-Gm-Gg: ASbGncvpef5sG0SWQfdMKIBQafWZ53RI9pASHPtcKD/+NKhht/+EiG+Wpj79RzHK7eY
	fnN/LZk8c01DtFBp8kAE8ABbN/tQ2ZFgP+VGWZUgeedDI2BsBx3paGSl0BQ05EEqc9LD84ghC3G
	i78apxQpXgBRqJ3RuKGyCISB+kqGoWhV3GGMh995NQQdQPlMyiKC972DJAmw9WzMQKU0PPc11GV
	ArDTncREHSJE720uYGj+dhcKfOdBnXBBvxefXCnK0Qc7FUAOAJl1o2RSJV6w26WvQ+7BGEXLNk9
	0jV/rYseEbgRkwjeFUe2ptNkG4g7q/XW7yNIlHvBCTOjhPnvIgqT/wYCBGN70rFmKyz+6tt6Y23
	+nd5hLftWT+80gTUHpfz9h08404yI3bBkXVY=
X-Google-Smtp-Source: AGHT+IGy8JKQhFVQ7X5a09go849LYeCFdHeT6JGJ2x1jHRS/zEozOLowuvjyXYNHDSKsJPFJGcQlKQ==
X-Received: by 2002:a05:600c:4f52:b0:441:c5ee:cdb4 with SMTP id 5b1f17b1804b1-454f42841ccmr36722635e9.4.1752420288847;
        Sun, 13 Jul 2025 08:24:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455fde3fb7fsm28656635e9.3.2025.07.13.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:24:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] i3c: master: cdns: Simplify handling clocks in probe()
Date: Sun, 13 Jul 2025 17:24:12 +0200
Message-ID: <20250713152411.74917-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3872; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=x6nwlnCf8EpliBB4PAXRWVJfoeL/+OwxGylEV3WROkY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoc8+bFmvNquQAH0tSpawh2scyCoMl+9QGb7lL/
 Znepp8IZNKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHPPmwAKCRDBN2bmhouD
 169oD/9wvzMYFZ1dj/NhqOY87tzC4+5LoUi+B1aRCH+9avMB5A6eXk06jyHYzCr5b8MRToMYqz/
 tDEyikyuka1/Nel7Sv5T54+4Q5b3mdfnbZdwcohrmnVCO1oSV9vUZsQLpgEx04SoQqp52z+IWX1
 SASkJTpsSUY0qxk0ZBGq48+EARpWyTS/2tVGY2v6peLA2pH4PoPhLe94k0uc2S0A03LWPMSgVbo
 z0D8HMSFWAmwMRMDneBSMBQ9kKNaCzlPm9TmZf3IWl6Mf1zJOSZhEI9UYr8z3abY847yUJkqurA
 dK6Sw4jdf4TeUi7IgDnv9V3IKz1E/NWN/7kZDE99+8Mn3uqrhgOjyeXTcAcch82RnhIN89ER+ha
 y14uR2ADvcUsvvYXoeDw4cSd7F/eY6Al+mI1/VHPK4pxID5kCYiV5Tgmy8Nih2LVCTc36kN5KR4
 NNLBzIqlzzxVBsxB4qnUtNOAFOzFIEsURiXxAv2YBsXxHuFjw+KY7RoQfs60d6D2GF19Bej0/6x
 Ami2GLyCLgFNSHR5grP/Jf7UhjUrKwfB5meBtI2TXrOTzznCQst341L69fZHKCiL9iXejW1/b7W
 MzpJCHUYKkWD2o56BT7S0ZgrvbMIWPq0UJC5DrQEMuGju5jRmMkvjDRkl8tXoGx9Ll4b/YR0eKo BMetp0bDtSamRhQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_082450_945399_D8D32C5E 
X-CRM114-Status: GOOD (  14.15  )
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

The two clocks, driver is getting, are not being disabled/re-enabled
during runtime of the device.  Eliminate one variable in state struct,
all error paths and a lot of code from probe() and remove() by using
devm_clk_get_enabled().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i3c/master/i3c-master-cdns.c | 51 +++++++---------------------
 1 file changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 449e85d7ba87..cc504b58013a 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -412,7 +412,6 @@ struct cdns_i3c_master {
 	} xferqueue;
 	void __iomem *regs;
 	struct clk *sysclk;
-	struct clk *pclk;
 	struct cdns_i3c_master_caps caps;
 	unsigned long i3c_scl_lim;
 	const struct cdns_i3c_data *devdata;
@@ -1566,6 +1565,7 @@ MODULE_DEVICE_TABLE(of, cdns_i3c_master_of_ids);
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
+	struct clk *pclk;
 	int ret, irq;
 	u32 val;
 
@@ -1581,11 +1581,11 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(master->pclk))
-		return PTR_ERR(master->pclk);
+	pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(pclk))
+		return PTR_ERR(pclk);
 
-	master->sysclk = devm_clk_get(&pdev->dev, "sysclk");
+	master->sysclk = devm_clk_get_enabled(&pdev->dev, "sysclk");
 	if (IS_ERR(master->sysclk))
 		return PTR_ERR(master->sysclk);
 
@@ -1593,18 +1593,8 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = clk_prepare_enable(master->pclk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(master->sysclk);
-	if (ret)
-		goto err_disable_pclk;
-
-	if (readl(master->regs + DEV_ID) != DEV_ID_I3C_MASTER) {
-		ret = -EINVAL;
-		goto err_disable_sysclk;
-	}
+	if (readl(master->regs + DEV_ID) != DEV_ID_I3C_MASTER)
+		return -EINVAL;
 
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
@@ -1615,7 +1605,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
 			       dev_name(&pdev->dev), master);
 	if (ret)
-		goto err_disable_sysclk;
+		return ret;
 
 	platform_set_drvdata(pdev, master);
 
@@ -1637,29 +1627,15 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
 					 sizeof(*master->ibi.slots),
 					 GFP_KERNEL);
-	if (!master->ibi.slots) {
-		ret = -ENOMEM;
-		goto err_disable_sysclk;
-	}
+	if (!master->ibi.slots)
+		return -ENOMEM;
 
 	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
 	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
 	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
 
-	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &cdns_i3c_master_ops, false);
-	if (ret)
-		goto err_disable_sysclk;
-
-	return 0;
-
-err_disable_sysclk:
-	clk_disable_unprepare(master->sysclk);
-
-err_disable_pclk:
-	clk_disable_unprepare(master->pclk);
-
-	return ret;
+	return i3c_master_register(&master->base, &pdev->dev,
+				   &cdns_i3c_master_ops, false);
 }
 
 static void cdns_i3c_master_remove(struct platform_device *pdev)
@@ -1668,9 +1644,6 @@ static void cdns_i3c_master_remove(struct platform_device *pdev)
 
 	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
-
-	clk_disable_unprepare(master->sysclk);
-	clk_disable_unprepare(master->pclk);
 }
 
 static struct platform_driver cdns_i3c_master = {
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
