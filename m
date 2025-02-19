Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2A7C021B0
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 01:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TF3TaymJY8wa7H+XSYTDalpW/mOUmIfMxEifcyxg0Uk=; b=0OwCgMQS4SDwzB
	nDTDo5QOoHXD8oihOSWGoVthgMVy57RZl1z3idQghkZYu+2Av3zp+eyT9DS+xsz+CfJwDx421FJcN
	D4SGNn1rKBDyaOqlwbheh54SyUjRuuinWY9crwRBFSgQBqDwStblP427e4QrgsPQl0SGo23zbILph
	eEfa/HE37XeLKTI3i9Nv6D7/ahinmmg/HvuRmmebP3cfnVLBS228qUxqtVMFHtpRZSUe71kHSBR4H
	8rW66RC/Z2Bhj8EAO5sk1tTfjIAOV0IFQf6g8wWW1buvYYoqfHs0VL4Z5FXr8Z/f5dIhv7hwuiPsL
	jsDQCIw5hACl1R1JkeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYcW-0000000AUkF-3qsl;
	Wed, 19 Feb 2025 01:11:24 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYbj-0000000AUW1-00M7
	for linux-i3c@lists.infradead.org;
	Wed, 19 Feb 2025 01:10:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-220ca204d04so84542955ad.0
        for <linux-i3c@lists.infradead.org>; Tue, 18 Feb 2025 17:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739927434; x=1740532234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3mYC7ENmf6rcEpzheezEvM9BfeiOk2Z8ZQkMdJrj/8=;
        b=L1W9cwCbhXzRu9PIYdVf5CCHhbjjKZivS/TApHPh++/3KMzdwhPnSNJlXY93Lqmgm9
         8Y/kpviAI8lV5F+WTri+DhW7fBisqZSlyxSN6rM5tYlaLm1rE6P/8FMUT/sbCs9ETHDG
         3NkaV2I0p3YlyU1eQl04nVv/IKy9pakukgXW/okmq59gzxQ1+NIee7t8Lrxux3hlb/Uu
         GGc1Qg35tMj4C3guzZWWeeKq2y+6BbLZ2PnMnOabWFbywHE1Jw5VKT0X3+F3/TEqFm/a
         vRAdJYgop3FV8CNHqJJ4U5p3TNygJNWSchlAayAfSDPKj8toF5damqPmscUPodYv8Z8z
         JACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739927434; x=1740532234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3mYC7ENmf6rcEpzheezEvM9BfeiOk2Z8ZQkMdJrj/8=;
        b=afLo+8/iYEtywL6JKX0g1K4wKfGH9z3WNQwUIRJd/bF22/eT1mcuBQG6MnB9qdkwgH
         os2nlC/p0YU5uGbdigcS92wGI6ZgjE3SFjqVKEf9lMDctvI9wpxpYVR6mnhwAo9nPR8e
         L26mUIUTSRS3HrzbX7d3Eu8YoXebJZhIB0sDddC8CrTXLvSLMIg5/U3Jm/2BRMnkiFzQ
         xUxwrApOFZj/andJ1BxP7IqErPKtPgRuncivo0WrlqCXmUIRDzpanmgQMTGKDSVxi/t7
         eRB2ynLARJyFG1fNdhfEMP7DT0BWG6h6y9UxyMP/KSdvatsY4MN1d37+k7Ql4BjvAiTY
         qkIA==
X-Forwarded-Encrypted: i=1; AJvYcCVxx67lnVq7AUQDeFd4GU96EsVK/5Swy1gfutUqBjTLSuFsiwsGAOyINn9cWI7CORlJPq4Z0J3TCP8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAihQ4XO8oM2TCDyjSy/L5Do4Ln+8j4nbhtCP7EO5Ma/xcQcrH
	Maz0VCwiD18jZg52xYSVqjZkI0YJLsfGdZ987j35aWo/+lKybjEDVKmCF6g5
X-Gm-Gg: ASbGnctm0lQPdulomq23d5GtuCmyNTpzSl2sKLZbWKPxOI8XyWZrqD5dWkZehP/7fwK
	Rm1Fl5u24GusQ2diMWQWLfI6mGIUd7F9oTWkMF1SMxT3QVYvReZeMjPOGanXhBU64z2j0ELlW29
	C1fokmzMWvDT2Z76i3JOFTUFkAsA4Njv/Mw1pE38dUSUkmP6trixSW+nmXHDRDrSu7BVkPvUhNW
	Ezlye/IDZE60a5PUPKUUv7qAahejGTry4SBb7M/FayoN5TxCA7ayNLZlU1tz4JrFVXIBJTSY8kS
	MMkD8SZ29tN+yX1KU/qEnl6hxg==
X-Google-Smtp-Source: AGHT+IGXfY3WGuhGV/3mSu1e9ym7RxoJ3BskUzPfy/qOHknOlucPS8A+jBmMTZSyoS6Zh/ed/iN22g==
X-Received: by 2002:a17:902:f550:b0:21f:7077:2aaf with SMTP id d9443c01a7336-221711c2a34mr23963485ad.44.1739927432623;
        Tue, 18 Feb 2025 17:10:32 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f05sm96080315ad.2.2025.02.18.17.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 17:10:32 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 3/3] i3c: master: svc: fix npcm845 invalid slvstart event
Date: Wed, 19 Feb 2025 09:10:19 +0800
Message-Id: <20250219011019.1600058-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219011019.1600058-1-yschu@nuvoton.com>
References: <20250219011019.1600058-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_171035_039212_C46C7C2F 
X-CRM114-Status: GOOD (  14.23  )
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

I3C HW may generate an invalid SlvStart event when emitting a STOP.
If it is a true SlvStart, the MSTATUS state should be SLVREQ.
Check the MSTATUS state to ignore the false event.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 22cb1f1c1fdc..14cedcb81c52 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -59,6 +59,7 @@
 #define   SVC_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
 #define   SVC_I3C_MSTATUS_STATE_DAA(x) (SVC_I3C_MSTATUS_STATE(x) == 5)
 #define   SVC_I3C_MSTATUS_STATE_IDLE(x) (SVC_I3C_MSTATUS_STATE(x) == 0)
+#define   SVC_I3C_MSTATUS_STATE_SLVREQ(x) (SVC_I3C_MSTATUS_STATE(x) == 1)
 #define   SVC_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
 #define   SVC_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
 #define   SVC_I3C_MSTATUS_IBITYPE(x) FIELD_GET(GENMASK(7, 6), (x))
@@ -143,6 +144,12 @@
  * Fill the FIFO in advance to prevent FIFO from becoming empty.
  */
 #define SVC_I3C_QUIRK_FIFO_EMPTY	BIT(0)
+/*
+ * SVC_I3C_QUIRK_FLASE_SLVSTART:
+ * I3C HW may generate an invalid SlvStart event when emitting a STOP.
+ * If it is a true SlvStart, the MSTATUS state should be SLVREQ.
+ */
+#define SVC_I3C_QUIRK_FALSE_SLVSTART	BIT(1)
 
 struct svc_i3c_cmd {
 	u8 addr;
@@ -576,6 +583,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	/* Clear the interrupt status */
 	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 
+	/* Ignore the false event */
+	if ((master->quirks & SVC_I3C_QUIRK_FIFO_EMPTY) &&
+	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
+		return IRQ_HANDLED;
+
 	svc_i3c_master_disable_interrupts(master);
 
 	/* Handle the interrupt in a non atomic context */
@@ -1915,7 +1927,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	svc_i3c_master_reset(master);
 
 	if (device_is_compatible(master->dev, "nuvoton,npcm845-i3c"))
-		master->quirks = SVC_I3C_QUIRK_FIFO_EMPTY;
+		master->quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
+				 SVC_I3C_QUIRK_FALSE_SLVSTART;
 
 	/* Register the master */
 	ret = i3c_master_register(&master->base, &pdev->dev,
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
