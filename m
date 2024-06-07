Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CFAC27C53
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Jun 2024 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=y5W6TFMJ1VLDQ4Tgic7Oyro00qe3FMIqj8ulk3qg7So=; b=sg/kmYz3fyKvgbrXlPTXuY+w15
	cllNJfkd/bZUlsL8G0NbhQUqI9w76eUaioQXYg9WzkOsogjVy5crKtMaiqsPXAXZU7/57i+usGZiK
	+tmmQGc5vT+PABEx8O98WftgQDobhnCkhlcbfPCvmMe0bFY+0RcBjKWz7kO1GoTOqU6VJMfxuBv6q
	8b1GmP6j/qc/gvqVpQbxH8ONWZL7v0fh5lN43zivJdAS2zo6xkoUUFlPfJtQXq9y1QWrTInzEWWIh
	zLz1p+d4jCJ1Dyb+BBIJGDPihMKT5v99Vls9ClTpoFLpJ85bf+nsACRtBJt+ik8xfka6X6bE7KYuX
	5sXIZlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTu6-0000000CsT1-3gbz;
	Fri, 07 Jun 2024 07:20:51 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTu0-0000000CsMk-2KYI
	for linux-i3c@lists.infradead.org;
	Fri, 07 Jun 2024 07:20:48 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfa84f6a603so2870667276.3
        for <linux-i3c@lists.infradead.org>; Fri, 07 Jun 2024 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717744838; x=1718349638; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LPMd0YveQHyYq4holtAZQwo//xyVvbIej/9hDc6mCbE=;
        b=usxa/XlyO1RqSx8Xd9vRhTPj5l8ry3XW6I5WdKk1WRqpoxzAgZe5s6vOsHETYfDaKi
         CFhk0Ju0wAc0SUGTFjv4H2bqaVW2tdAGHthW8ZApCYVmVtD4KnO08SRigEeBI2ZcqTCv
         Xyr19iP59VFDk/xJkL316zZJVREDAKbTUQBCJrmisyFXdqOoq0vlTgzBnBcyEtwRSSfw
         5unkpWYUFW0OXEU1z1IYKqU04kQhilu0vZl5M+TMYuPOMv0WDDCMuxlD0KfGbcF8GZvf
         ++KHRP6fLLFT2TD2Mgo2rZTHf0EfF36EHlWs0ybp8HAnC6Bh5Z3uHOz9ORegd2Errb5A
         YeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717744838; x=1718349638;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPMd0YveQHyYq4holtAZQwo//xyVvbIej/9hDc6mCbE=;
        b=W+TcxsICxP/pnFpL+E14Gg7jMkFHNfON2uIWhj+Li03pI7RTAZQgLTyYDo4LzLwZwi
         GhPUSr0fJDyepNndqy+0VnqBCCCBvAs/Q9cs8QXogk+aOHfgngGwjMyHDbMViXUQ1xeC
         PB9wanHMw9gb7VAiD3hQmKqe/+HUU9JqesOwxGZM1DURcVK5F8lxSyC+Vvuu7IaRoLz9
         48acuGASo4hMQUwwz/qqfL8bB8/7lAJTrFJEDG+5qrjeN3cI4VsMZrVU72aaQ7ZDglrR
         pXUFnXHN+EzoD4oE7mwL39pXdg/WlilGtBKnXP5WuzmYjdfZY/JKKbXXLuY3exPenNIn
         q55Q==
X-Gm-Message-State: AOJu0YxVe9y4cme/BVhfcQr3NXFcnjFc9qvjlTmSYBG95Hcs2YiMFsXq
	6DNWLkioAuhvZItE3VuAEKrCNO1uF3uM5SVeE/Aj7L2xmr+UFde4+d8V4GME262mBwPZ1H1gAYL
	/uHed+DvYXvL0Gk22xZRfCBIOzQ==
X-Google-Smtp-Source: AGHT+IHUG1TkmKj0XidS2kJaY5u/jWXEV45MSeqH1d1RNuGh9PvPBtSHCr0zKEXMgGOpve/jlyIaIMUK569tO1UZDKI=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a25:a3c3:0:b0:de5:bc2f:72bb with SMTP
 id 3f1490d57ef6-dfaf66800f7mr100083276.12.1717744838152; Fri, 07 Jun 2024
 00:20:38 -0700 (PDT)
Date: Fri,  7 Jun 2024 07:20:30 +0000
In-Reply-To: <CAMmmMt2guEx1jajb2NC0iBnMGpkd2vaSiXg_BqgZhwrA=FARLQ@mail.gmail.com>
Mime-Version: 1.0
References: <CAMmmMt2guEx1jajb2NC0iBnMGpkd2vaSiXg_BqgZhwrA=FARLQ@mail.gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240607072030.2618428-1-aniketmaurya@google.com>
Subject: [PATCH v2] i3c: dw: Fix IBI intr programming
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_002044_828465_68B77D30 
X-CRM114-Status: GOOD (  12.53  )
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

IBI_SIR_REQ_REJECT register is not present if the IP has
IC_HAS_IBI_DATA = 1 set. So don't rely on doing read-
modify-write op on this register.
Instead maintain a variable to store the sir reject mask
and use it to set IBI_SIR_REQ_REJECT.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 changed from v1 to v2
	- replaced counter with the mask
 drivers/i3c/master/dw-i3c-master.c | 15 ++++++++-------
 drivers/i3c/master/dw-i3c-master.h |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 0ec00e644bd4..03911a5c0264 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -658,7 +658,9 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		return ret;
 
-	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_SIR_REQ_REJECT);
+	master->sir_rej_mask = IBI_REQ_REJECT_ALL;
+	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
+
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 
 	/* For now don't support Hot-Join */
@@ -1175,17 +1177,16 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 	master->platform_ops->set_dat_ibi(master, dev, enable, &reg);
 	writel(reg, master->regs + dat_entry);
 
-	reg = readl(master->regs + IBI_SIR_REQ_REJECT);
 	if (enable) {
-		global = reg == 0xffffffff;
-		reg &= ~BIT(idx);
+		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL);
+		master->sir_rej_mask &= ~BIT(idx);
 	} else {
 		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
 
-		reg |= BIT(idx);
-		global = (reg == 0xffffffff) && hj_rejected;
+		master->sir_rej_mask |= BIT(idx);
+		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL) && hj_rejected;
 	}
-	writel(reg, master->regs + IBI_SIR_REQ_REJECT);
+	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
 
 	if (global)
 		dw_i3c_master_enable_sir_signal(master, enable);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 4ab94aa72252..8cb617b8147e 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -39,7 +39,7 @@ struct dw_i3c_master {
 	char version[5];
 	char type[5];
 	bool ibi_capable;
-
+	u32 sir_rej_mask;
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
-- 
2.45.2.505.gda0bf45e8d-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
