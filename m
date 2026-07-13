Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D909C44507
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yx3eJ3VbKVQIZE5I18voz0gBiZgW9oCBBVGrb0EB33k=; b=bZPo0cBaa3mxWQ
	pbuhQjIf9RCWXYyinV3N2ZxXR/A7bRQEX15ITHrJY4Rgplbe2nht9ULQKg8NuZkwcIvnXsQrM6x/v
	D8cRlzpJ0Z1RSr+nbDVj8NZ17YFH9ztxZ3mr7vrwbg1dU4jzRij8FEsBn4YKDlA8dTuhU942yZAN+
	V1eP6s25z8GjmNj43XLSyh3EycfuPCWwWab///891IktE2UnF5iDdqYoktP3SEeSMfYdgs2pXNb+b
	a0mBFxACySy/caUTlmhSZju606M/9LDz70db1bUGdEOYjo4sLUeELVoHPHXK26w8ycA9UniuXux+h
	p/bvHH1IwGBunx4v9EVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGM8-00000009JfD-1Myj;
	Mon, 13 Jul 2026 13:05:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGM5-00000009Jdq-0GT2
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:05:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-470174001a0so1874169f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947951; x=1784552751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIEzViZhXjAraDf7Ayi3/ThvikdI1szu91oMmQWBOX0=;
        b=a/D40rRT6bimQwfpEnPM6q9goYy7NfHxenCvMowS+WlD0vQtQVQmUt1eehhK9t0byg
         iQZI4lAO2dbIo6t5e+EFgKT81P29nFWV2xzyFvRfyBsuLscaJuQKFneySyww2KQNq2TY
         nwW4b+qgxEQbr39Z4ZIHphme58koCjS+0bXHwcyR0zX8SlutqQL+LdaXvrRl2Ff88+bA
         Jmh+nX+LXvgW8MZy4HW3M4hkILQc9EcgrksLCMvOKP3VKgytXfT1msXQAeAzcQFDWKJA
         VrCgVqjmwqnvwq+wfZHSnCUlQp2cgZgC0dEVhD2rvQkx3Tgbkye1WR1FgfLDYdjNGUIK
         c1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947951; x=1784552751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIEzViZhXjAraDf7Ayi3/ThvikdI1szu91oMmQWBOX0=;
        b=m9vvRFJWGoF2+/5Lz5IGFECABMO0hd4QtPye5XnRXIbCrnNPB3gh22Y/QcvylpreYV
         wccOoxb8cafpKLDdV6Wy7IMfF2scodZ0Hesejtm+vJPcG261elcud+/OAHIopGPZtpOy
         JuIOCWIldTGli2Zrf3ujguyaVQx6DBbGWXed031R9a61sGlp03qyALCQxJl+qQUw63XK
         r6ui/bul9uMSLmewCXh3y6+rafzKvQdjKBhUkwqFg93FOwcSh/PucbQpjqevJ2pKISyM
         WUDhc1uZMAq136YPbOnFgbfJbfmuEy1dpo66K9BplXmyDp4yAEDWi3baXQdST6REliId
         39UQ==
X-Forwarded-Encrypted: i=1; AHgh+RorUX8VyP0EEuCJtnPDoYzpgHm2SSZW6C4raxn1APB7lKLGVPtdxJuGesDh+wUpVewSavzYXYQJb60=@lists.infradead.org
X-Gm-Message-State: AOJu0YxE8MLXy0nIife7bxkYJCCB5HQkHP5QZYly7aVQIwWu/sGbtfbT
	24g69Ja4AvOSVWST2gRv91jVeuUS9+uYObfIYz78CL2A1Z3OHWDY8sN6mnLMb9KB3J4=
X-Gm-Gg: AfdE7ckkM1V+nPLiH7iFCA8lzHWHDbYq/LY5Or71nzblrgfNr+bQWzmIelHopX7kEj2
	n2KEqiRl+GrGa0RPTkwqx2QyDuitfgwu/tQ9kzeYJcLAOjQXYSNnT1MmBQJfw2GrdJomkDA/1mt
	sieYCyxbLBwPwMKk7V5H26QQIA1o2xKbIhIm446vt2oWmDCUyMT7dhfNM9spd8E25kmOoYr1Fyi
	x74hk5reD23fhDt2aentGzIDo7hnincogmu94FK0dN35QHKaSk4vVPoBeoo73J9Qo9j/R5o8rqr
	hdC2auJ1owAMHQ/ksYIRtPbfI2N13ZI+X/22PPR3DN+W7R1sVpNGNpK3cMjJ0zpCkx+YlnK0CYH
	KvaqJH9NAIndSntdksdE7GoQazY37baPUoViGjQnkRWb9t++f7aNoguRNZT9frDR0uhMsTZTTQ6
	sBmn219+FrLXpNqJdpFmGg8SdNxVAPVE2Gkdwn3oC32xYFCBn8Mz7grqgv5/PY6rGZAgnOlb4=
X-Received: by 2002:a05:6000:2902:b0:473:1ccc:15bf with SMTP id ffacd0b85a97d-47f2dce2fcemr10893103f8f.42.1783947951174;
        Mon, 13 Jul 2026 06:05:51 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:50 -0700 (PDT)
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
Subject: [PATCH v5 01/17] i3c: renesas: Check that the transfer is valid before accessing it
Date: Mon, 13 Jul 2026 16:05:29 +0300
Message-ID: <20260713130545.568657-2-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060553_150859_B8E107E4 
X-CRM114-Status: GOOD (  15.18  )
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

The Renesas I3C driver uses an asynchronous model to transfer data. It
prepares a struct renesas_i3c_xfer, enqueues it, and waits for completion.
The interrupt handler dequeues the transfer, updates/uses it, and signals
the waiting thread.

If the completion times out, the waiting thread dequeues the transfer and
free it. If an interrupt fires after that, the handler may access freed
memory, leading to crashes.

Check that the transfer is still valid before accessing it in the
interrupt handler. With it clear any status flags and disable all
the interrupts to avoid triggering the same interrupts again.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- introduced renesas_i3c_irqs_mask_and_clear_locked() that keeps
  unified the IRQ mask and clean path
- updated the patch description

Changes in v4:
- disable also the interrupts
- dropped the Rb tag

Changes in v3:
- none

Changes in v2:
- clean the IRQ status bits before returning IRQ_HANDLED and adjusted the
  patch description to reflect this change
- collected Frank's tag. Frank, please let me know if you consider
  I should drop your tag. Thanks!

 drivers/i3c/master/renesas-i3c.c | 52 +++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index f39c449922ca..38b8428f464c 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -433,6 +433,21 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
 	}
 }
 
+static void renesas_i3c_irqs_mask_and_clear_locked(struct renesas_i3c *i3c)
+{
+	/* Disable all the interrupts. */
+	renesas_writel(i3c->regs, BIE, 0);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear normal transfer status flags. */
+	renesas_writel(i3c->regs, NTST, 0);
+
+	/* Clear bus status flags. */
+	renesas_writel(i3c->regs, BST, 0);
+	/* Read back registers to confirm writes have fully propagated. */
+	renesas_readl(i3c->regs, BST);
+}
+
 static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
 {
 	unsigned long time_left;
@@ -1014,6 +1029,11 @@ static irqreturn_t renesas_i3c_tx_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1054,6 +1074,11 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		/* Clear the Respone Queue Full status flag*/
@@ -1138,6 +1163,11 @@ static irqreturn_t renesas_i3c_tend_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1184,6 +1214,11 @@ static irqreturn_t renesas_i3c_rx_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1234,15 +1269,13 @@ static irqreturn_t renesas_i3c_stop_isr(int irq, void *data)
 	struct renesas_i3c_xfer *xfer;
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
-		xfer = i3c->xferqueue.cur;
-
-		/* read back registers to confirm writes have fully propagated */
-		renesas_writel(i3c->regs, BST, 0);
-		renesas_readl(i3c->regs, BST);
-		renesas_writel(i3c->regs, BIE, 0);
-		renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0);
+		renesas_i3c_irqs_mask_and_clear_locked(i3c);
 		renesas_clear_bit(i3c->regs, SCSTRCTL, SCSTRCTL_RWE);
 
+		xfer = i3c->xferqueue.cur;
+		if (!xfer)
+			return IRQ_HANDLED;
+
 		xfer->ret = 0;
 		complete(&xfer->comp);
 	}
@@ -1259,6 +1292,11 @@ static irqreturn_t renesas_i3c_start_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			renesas_i3c_irqs_mask_and_clear_locked(i3c);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
