Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB2AC3271E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jul 2024 06:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JHvEGNK7AMf0aF4lJaOUbc0qnTCy0ZQVaesZbCabhlA=; b=hiINm1SqDQc3PIBy3SepiygpUx
	Mmy5+ur7o1AtJrOpuA6vFetSSUr6xySNlw3evaBmpTb2Vkxp3hL5VM26ctTx2EpXwSEldWC+sx5a+
	83+3pLCb1bGKpmPM8S6TvkC9q9VF8UtDfAi+06yPg5Opgc4oUDAoNTVi34R+4zA5m3oCXCYPFX3vX
	EJ2mQrBz5rFXSeBJA4c5DdEP5n4Nf3xfSFBZ3cXVZMmWaVjJXG1kEgH8b7APO4gZ5U87arRGDpUmQ
	pFQeFz9ET8HOILwhBz/chclMrJNABgpXVJaV4cLraDx+Rsx61bpo9gxgVSFTi+NAZeVR5AA6JonWQ
	aSgutEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhkb-00000002rOg-3wXh;
	Mon, 08 Jul 2024 06:21:25 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhkY-00000002rNE-3rU3
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jul 2024 06:21:24 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfab38b7f6bso5750108276.0
        for <linux-i3c@lists.infradead.org>; Sun, 07 Jul 2024 23:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720419681; x=1721024481; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRE3CTl41ox4KiTMo7IKJflgnlE4+zxOG9BgLIy76LA=;
        b=4C+HJClTJjXZH7tXYipjbfTkD1WKtMZWb3t/hSmCz8mRmb99KYb7y4WdwpqHc/+XVG
         XGPl+7iRBrPV+IMcYO+nAtzIkwXxvBD8Vsz5sAjXaw5B8lgYa/D/4gAcuSYgJcrvEAko
         wqcUfm8FVn2CAmjk0OkJieNNtEa7dzWlcHHdq8vB4xoml6f7pY77goC1NtwCaKOLqphF
         TMpFcu73aXqGhxbS8psDwa4mO+l3VdSAu4y/4JpWsl9M51vKXcNG0kOCOjS5MTSco2Mw
         F5x9MDc/dW7//AT2iBXN7q17XQmi0xBjZEhJ/gbodGeiRp8gH6EoaZV56+Szq468DeLL
         +Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720419681; x=1721024481;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRE3CTl41ox4KiTMo7IKJflgnlE4+zxOG9BgLIy76LA=;
        b=FzTit1Pfi61zA2NLuUCtEErt7psKOlSF7x5Z7lmY2UgjCJYYKwrHfUkV/HwqOqdcbg
         kPvbuAvELPX7VfkcEIQ7YOAuyXMDsPxcrRP9FRho0yAfkvYj6Sm3BPklk4KgCqVBCkzj
         4xqXxg0PllgAKHyBpsulL7o92m2VMVnj2x/j3s2sDTomTK/C6mtWvj5Zejm+znOhoXqi
         blXa5mjue8EagSxyz5OOfziLDjJxjypQwCcwzVVBpNhIa1Cj39ZzVyMkcFCOPvOnDd41
         xItmLpR4CNXvmm8BQClsyoEf2p8tQtxzNeFl153amnkP5i//qefVUnVaQDKVwu8kiJip
         J92A==
X-Gm-Message-State: AOJu0YyaOgu44bOJuojsuKmb6XeSR7HXWsC9q9dEvGB6xQeL2/tbXFwj
	qXR/L2N0yI9WkJFBAMopKcczZNklu/KG+7ISlroE6OxeiJcLwwCuVUSvfYKMyOdRs0C8h7wRs5V
	5qqa5N19RLVi+ieTFfF3rciLQFg==
X-Google-Smtp-Source: AGHT+IHlkJtcNN0OXfJII+G6EXZjRqg/GVIaRc00MqzWRa6cfLCMbK9U0UrS9QmCLqwe7QweYJbtQDhrxI5xAgMfXpA=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a25:53c9:0:b0:e03:b5d0:2aa2 with SMTP
 id 3f1490d57ef6-e03c1bf24b8mr307204276.13.1720419681282; Sun, 07 Jul 2024
 23:21:21 -0700 (PDT)
Date: Mon,  8 Jul 2024 06:21:02 +0000
In-Reply-To: <20240708062103.3296587-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240708062103.3296587-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240708062103.3296587-3-aniketmaurya@google.com>
Subject: [PATCH 2/3] i3c: dw: Add some functions for reusability
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	vamshigajjela@google.com, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_232122_981357_96834D9D 
X-CRM114-Status: GOOD (  13.27  )
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

Separate logic for setting intr/thld registers in a func.
Also modify enable function to take care of setting all fields in DEVICE_CTRL.
These functions can be reused later for power management.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 62 +++++++++++++++++-------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index fcfa37f55d86..fadb58ac8b68 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -300,7 +300,14 @@ static void dw_i3c_master_disable(struct dw_i3c_master *master)
 
 static void dw_i3c_master_enable(struct dw_i3c_master *master)
 {
-	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_ENABLE,
+	u32 dev_ctrl;
+
+	dev_ctrl = readl(master->regs + DEVICE_CTRL);
+	/* For now don't support Hot-Join */
+	dev_ctrl |= DEV_CTRL_HOT_JOIN_NACK;
+	if (master->i2c_slv_prsnt)
+		dev_ctrl |= DEV_CTRL_I2C_SLAVE_PRESENT;
+	writel(dev_ctrl | DEV_CTRL_ENABLE,
 	       master->regs + DEVICE_CTRL);
 }
 
@@ -521,6 +528,32 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 	dw_i3c_master_start_xfer_locked(master);
 }
 
+static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
+{
+	u32 thld_ctrl;
+
+	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
+	thld_ctrl &= ~(QUEUE_THLD_CTRL_RESP_BUF_MASK |
+		       QUEUE_THLD_CTRL_IBI_STAT_MASK |
+		       QUEUE_THLD_CTRL_IBI_DATA_MASK);
+	thld_ctrl |= QUEUE_THLD_CTRL_IBI_STAT(1) |
+		QUEUE_THLD_CTRL_IBI_DATA(31);
+	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
+
+	thld_ctrl = readl(master->regs + DATA_BUFFER_THLD_CTRL);
+	thld_ctrl &= ~DATA_BUFFER_THLD_CTRL_RX_BUF;
+	writel(thld_ctrl, master->regs + DATA_BUFFER_THLD_CTRL);
+
+	writel(INTR_ALL, master->regs + INTR_STATUS);
+	writel(INTR_MASTER_MASK, master->regs + INTR_STATUS_EN);
+	writel(INTR_MASTER_MASK, master->regs + INTR_SIGNAL_EN);
+
+	master->sir_rej_mask = IBI_REQ_REJECT_ALL;
+	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
+
+	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
@@ -615,7 +648,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = { };
-	u32 thld_ctrl;
 	int ret;
 
 	ret = master->platform_ops->init(master);
@@ -638,22 +670,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 		return -EINVAL;
 	}
 
-	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
-	thld_ctrl &= ~(QUEUE_THLD_CTRL_RESP_BUF_MASK |
-		       QUEUE_THLD_CTRL_IBI_STAT_MASK |
-		       QUEUE_THLD_CTRL_IBI_DATA_MASK);
-	thld_ctrl |= QUEUE_THLD_CTRL_IBI_STAT(1) |
-		QUEUE_THLD_CTRL_IBI_DATA(31);
-	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
-
-	thld_ctrl = readl(master->regs + DATA_BUFFER_THLD_CTRL);
-	thld_ctrl &= ~DATA_BUFFER_THLD_CTRL_RX_BUF;
-	writel(thld_ctrl, master->regs + DATA_BUFFER_THLD_CTRL);
-
-	writel(INTR_ALL, master->regs + INTR_STATUS);
-	writel(INTR_MASTER_MASK, master->regs + INTR_STATUS_EN);
-	writel(INTR_MASTER_MASK, master->regs + INTR_SIGNAL_EN);
-
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
 		return ret;
@@ -668,15 +684,7 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		return ret;
 
-	master->sir_rej_mask = IBI_REQ_REJECT_ALL;
-	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
-
-	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
-
-	/* For now don't support Hot-Join */
-	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_HOT_JOIN_NACK,
-	       master->regs + DEVICE_CTRL);
-
+	dw_i3c_master_set_intr_regs(master);
 	dw_i3c_master_enable(master);
 
 	return 0;
-- 
2.45.2.803.g4e1b14247a-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
