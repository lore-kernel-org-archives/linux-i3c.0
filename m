Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B58C28B25
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 07:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhetcVJrjupx+vB/08q8Cf9sh25Xo2HaAJgqKQovfFM=; b=D+ij2J2YRf+qU8
	sJCNFx+EpR9fQLTn350cYgIjX1yU6H/GPGpJwSGkhD36HZx+9D1vuf+Kuuj95teNxWRVV0rxpXbWu
	yYZxCKJWEQhgkoq+MBKTaIQzCU/nEwxzI1BTOMfke5gAbKOZ9iM4+Hdfaz99Bg4BbA1ZkZkxkLQKs
	CyYzP4A5OJaVZiTunFDr/2TTC/kiJJNS2+nOLOZUinsvdn/JHlXlG9baAcdjL5Mmpnh5aflguaXyk
	VyL4JU0wBqjypEAL+kpI4IJqtRqBfmYeIumG+hhsqyLUFjwcHY+TGcFNECZs0qNhp9fe0yWzHOfQP
	84fpmDmGZqS2Vv2BectQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq64y-0000000AGOR-2zip;
	Thu, 06 Mar 2025 07:55:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq649-0000000AGCR-1TOl
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 07:54:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22337bc9ac3so5812355ad.1
        for <linux-i3c@lists.infradead.org>; Wed, 05 Mar 2025 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741247689; x=1741852489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2+tfajWqV/BpF+HlwJ7tnoTx43eUOwV3JjZ5iyWcbQ=;
        b=UK01opd7ruz6iW/8Y2V0jORMc2i2HC6DsLUOq3HYG3szbibZBK1R8dnuQ4Trrg1xMN
         IJ/wE2gLpeOmiV9JhBDLHPt2e28hxeBNB0ylAkSJLgkBj2OOzjGYrH2aG0EhWPtGk7Yw
         lk3PkAog6Q0ZFRj+zKktNg9cyrgyrSPXdSz7AlE6TXFlRaYohOmUW9Pgu3Ylc4dRmt91
         B9PhDO22fGVtov9m+l7dCcYRAxL2buldQm6mlpmRcpHns+HXH+U1c2Zk1B9z25DaaZ6l
         QuulitEyl+OYKDgEzYqO3Wm2AYNFaLsLG4+giO/Iie2KdKqUd6RRJ9wYfWPUP5ABz5Xy
         aMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741247689; x=1741852489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2+tfajWqV/BpF+HlwJ7tnoTx43eUOwV3JjZ5iyWcbQ=;
        b=JsF3kNYF54GsZM8A57qlfbXiOVgT/5qP+i8t26e9R72zyVfsqT5ya59EpuV8/0AF/w
         8WIAy9js7QWvjjkHQPe1ROgWavI2DQQSKKworJRmCzMZJFthtMwKP69wIevS1lZ6pYQ5
         Iydz5mcYcxqCZ4tWQJW4M9wUQaIlQLSw457D4P0SvOrLPNV/lNFUUV4gpQ4rHF56f7AV
         XaaPNhJtIRmerN2J4BnA8x9qDIO28abAhdnmZ914gEkdDRP013b2fs75p5Quq1QFelkz
         pcNimmx2AE2xXpFBaCC8qcc3l5hi3vz9ESnhamIipjUz5FF6cE7Fm7pA0oMnJJHAPm+j
         fLng==
X-Forwarded-Encrypted: i=1; AJvYcCWLlA/VWIJ5/u6UrLdjdh3WXDeYJbdAROrPOX33LmEpcTgPYJ2aycUUPDYzN0Oe7OCCZ3AaBWTHApo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2PB1vwY8NtXjG6OnUkCbKHGou+9tivo9KeLK+B63XCsK7iGIz
	aZQ7nkfxp6IOcRsQHCDGH9gKNJtYnAYiXrIh+/dsjrORM5g9MrcP
X-Gm-Gg: ASbGncuFInTH1zVaUQGZZdKevNX19mXrms0Xmo+aJ6CjC0TXtlF65jPY5auY1yXMOOa
	wya7deIinZInp59BJdc1PY5kT9SdRMvkwJIR4o4IJZWNgVSo6jC4xkOsPMNb35tpA9N7Ug3Xt8h
	wOw8s9ut5kieeRXWTjd7COYUeifl2S3L7UzhDoBgE3i5nVINPi6UTizROFz3lmQWNq8JWq+IAq8
	ao8dB0KQDpJkH2lzgsvQYJnw3/rCPt821T7waLREHFunKBsReD8/V2plEwwpMluQfvgtZ5KDl8Q
	bk4v0YLg2LQfDxYZkn9Y/+7UUpyLCAK1+Ikve/GAhT7PX+0s8IDs89o=
X-Google-Smtp-Source: AGHT+IF5txJTRwnyckdazVXegR2kdBARmrqG1Lso7rQth72ORrfeInWjkigbGtMEweDgwRomphqtbQ==
X-Received: by 2002:a17:903:8cb:b0:220:d7f9:9ea8 with SMTP id d9443c01a7336-223f1c979bamr117875855ad.26.1741247688596;
        Wed, 05 Mar 2025 23:54:48 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa448dsm6085485ad.210.2025.03.05.23.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 23:54:48 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v7 4/5] i3c: master: svc: Fix npcm845 invalid slvstart event
Date: Thu,  6 Mar 2025 15:54:28 +0800
Message-Id: <20250306075429.2265183-5-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306075429.2265183-1-yschu@nuvoton.com>
References: <20250306075429.2265183-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_235449_391761_204DB2F2 
X-CRM114-Status: GOOD (  12.67  )
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

From: Stanley Chu <yschu@nuvoton.com>

I3C HW may generate an invalid SlvStart event when emitting a STOP.
If it is a true SlvStart, the MSTATUS state is SLVREQ. Check the
MSTATUS state to ignore the false event.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index cba89a685e13..1cab5b8594de 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -58,6 +58,7 @@
 #define SVC_I3C_MSTATUS      0x088
 #define   SVC_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
 #define   SVC_I3C_MSTATUS_STATE_DAA(x) (SVC_I3C_MSTATUS_STATE(x) == 5)
+#define   SVC_I3C_MSTATUS_STATE_SLVREQ(x) (SVC_I3C_MSTATUS_STATE(x) == 1)
 #define   SVC_I3C_MSTATUS_STATE_IDLE(x) (SVC_I3C_MSTATUS_STATE(x) == 0)
 #define   SVC_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
 #define   SVC_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
@@ -143,6 +144,12 @@
  * Fill the FIFO in advance to prevent FIFO from becoming empty.
  */
 #define SVC_I3C_QUIRK_FIFO_EMPTY	BIT(0)
+/*
+ * SVC_I3C_QUIRK_FLASE_SLVSTART:
+ * I3C HW may generate an invalid SlvStart event when emitting a STOP.
+ * If it is a true SlvStart, the MSTATUS state is SLVREQ.
+ */
+#define SVC_I3C_QUIRK_FALSE_SLVSTART	BIT(1)
 
 struct svc_i3c_cmd {
 	u8 addr;
@@ -586,6 +593,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	/* Clear the interrupt status */
 	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 
+	/* Ignore the false event */
+	if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART) &&
+	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
+		return IRQ_HANDLED;
+
 	svc_i3c_master_disable_interrupts(master);
 
 	/* Handle the interrupt in a non atomic context */
@@ -2018,7 +2030,8 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 };
 
 static const struct svc_i3c_drvdata npcm845_drvdata = {
-	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY,
+	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
+		SVC_I3C_QUIRK_FALSE_SLVSTART,
 };
 
 static const struct svc_i3c_drvdata svc_default_drvdata = {};
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
