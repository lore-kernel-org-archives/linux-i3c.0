Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B9DC1B0D9
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2025 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cSgWUyIXvTLSmdtRkb7ZgMVudOb77VJ06YojSjI9HA=; b=rq4XMNJ3CRsKEt
	8V9miJ01eNXm9N2Ie8+Fh6EzQDRt7Jqwkg6IidK4J0Tg24EMipiMWqe5OFVNJPc2L+lQ92cNEiYfI
	gu+K2SpGs0pe7FN8Stn6Vc69XG2Ejfc6YQudCIkbBB/gc+fvo+w21NORk1aJ5o3pcp+mQcdzOJflT
	avf3IkWDSzeiVTpxkTGzv+z0wi8ywpyrPrxtoWM4cmIyTpl2+K8c5kfQCmz5OOM1K25tCFyzoiKMG
	9PeirddDtGT+Q2xZx4EoR6PuWbFMBkPSSO7+4ZyjX27ec0R754AzAdCjv68SV1paJuj1utYa0jhw5
	kBq6S4o5gMZwNmtW6iVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnX0K-00000006Rd1-0eN3;
	Thu, 27 Feb 2025 06:04:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWxz-00000006R7g-1eJq
	for linux-i3c@lists.infradead.org;
	Thu, 27 Feb 2025 06:01:52 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f441791e40so964823a91.3
        for <linux-i3c@lists.infradead.org>; Wed, 26 Feb 2025 22:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740636110; x=1741240910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okBbsi8R7J7tXxfGwTKtAERjRy2rLXaYUYDOVdToU2Y=;
        b=IX1TdMAZB1KoH8jTfHZXzTDB8U4+ztIwJhYv9Mck0Keqch1gXGWknKPY1FdGEfbep4
         jAsVwf5PM/Ebh42ff0+1Ou4cIfszpZvHcGR80otmHScAtYb21pMpqTSoZXHeLndCTQ6R
         GYWqm3dqnDxqNX3rD0yLAXljbibWTJgP98OyFm+QNYm66liHX89G8StUwtEc12K2H4VV
         sey5dW8p1l8J4iLmg5GGHjPZeUXdhCYCwTOKXXlWJVhLKgG9+w6yuVPE5C0hsPFVmETu
         C8u/nRXkcxkylSfF1b8qpPKfrfdZEoXSccr5zAg8v/qTB3mAV/uXqYt52VxF0WOGWWuF
         q0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636110; x=1741240910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okBbsi8R7J7tXxfGwTKtAERjRy2rLXaYUYDOVdToU2Y=;
        b=RY/upHLJ7LaD3YjlDoW9g1joakOj2e9sKUl+olJCJ5/gWCTfmqjyA3FADjXb1fInNs
         LiZmi8fEVVNhfEWsvZkDEoD1Lrx0geyFO7jSRiMg9NSHZYKYbZhU3qFTXbA9sz22J560
         WoP9mO3cHTsIroOyXgvWNj4oBX8uf+KE746/i5S6144kxjtdp3eBKKcm+tdHnxCOhPqp
         OxQPxOl3DQtjnsY0JDnwXWblYgbuyda6HktWoleLrpLx7dxCzMFfHWwgI/myZvHffaZF
         yOIxlSpSAeUlwVioTtnWMeYVEks1i1X9O7BlWwt1dxfQV+7aLUV+rT4ut6gSNWKA9Kdv
         A00A==
X-Forwarded-Encrypted: i=1; AJvYcCUkH1yBVksUlVSqFOAprSsl9wzb3IG8asKAO5mUiWxl/86n1El//DqyUh4pf+Zkqw4QTLrYsFAARU4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ/Wf2qOPv3r/CBnYlDL2JTvfJ0x/zjzE1f9w6Pm/SrkIgmZQI
	+hvtD7BSU4HNl7IHzsQJ/s319NmdvoglqCApeiOBVZ3PNkL59YeW
X-Gm-Gg: ASbGncv4JzDQThTzGlDAZ39Y0K0eEYU7WSB/AQmwGMGeyb+d3V/7KGWKkeqVeamgfUk
	yApb39LhmSYVKqWChCmyuDk6wBTTJL5cxWBDSgfc43GV4nYRfNOXi8Zf5f1RJkrOFYV+R/fDIPU
	2mYF9MeGhfNg8z5Idvpc/k78tDtG/MCTGXIImcm6FEDHzf9WsPszF5wMsVd1bDHEYPR0v9qCHv5
	uGgV2TRZAc4LzPoVdSQpxuHXnXFGF8RUnTLqVhaPhZQyeIc/pLxXmJqUSwX9UbKQX+5LIBKe1Ev
	47ltIN+5mvckZBnCT/FXj5Wgpk7Wyl0rRaxo
X-Google-Smtp-Source: AGHT+IHTzGNN16mA3hpJreOiHYFjyZ3AeGJoP48E0laGo4020Qg/YZh8K/FYFaSVpFevtJH+vOQWPQ==
X-Received: by 2002:a17:90b:5148:b0:2ee:c9b6:4c42 with SMTP id 98e67ed59e1d1-2fce86cf0ebmr42714472a91.16.1740636110407;
        Wed, 26 Feb 2025 22:01:50 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe824b67a1sm2728177a91.0.2025.02.26.22.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:01:50 -0800 (PST)
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
Subject: [PATCH v5 2/5] i3c: master: svc: Add support for Nuvoton npcm845 i3c
Date: Thu, 27 Feb 2025 14:01:28 +0800
Message-Id: <20250227060131.2206860-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227060131.2206860-1-yschu@nuvoton.com>
References: <20250227060131.2206860-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_220151_435289_4D995C67 
X-CRM114-Status: GOOD (  18.30  )
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

Nuvoton npcm845 SoC uses the same Silvico IP but an older version.
Add quirks to address the npcm845 specific issues.

FIFO empty issue:
I3C HW stalls the write transfer if the transmit FIFO becomes empty,
when new data is written to FIFO, I3C HW resumes the transfer but
the first transmitted data bit may have the wrong value.

Invalid SlvStart event:
I3C HW may generate an invalid SlvStart event when emitting a STOP.

DAA process corruption:
When MCONFIG.SKEW=0 and MCONFIG.ODHPP=0, the ENTDAA transaction gets
corrupted and results in a no repeated-start condition at the end of
address assignment.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 56 ++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..9143a079de53 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -32,6 +32,7 @@
 #define   SVC_I3C_MCONFIG_ODBAUD(x) FIELD_PREP(GENMASK(23, 16), (x))
 #define   SVC_I3C_MCONFIG_ODHPP(x) FIELD_PREP(BIT(24), (x))
 #define   SVC_I3C_MCONFIG_SKEW(x) FIELD_PREP(GENMASK(27, 25), (x))
+#define   SVC_I3C_MCONFIG_SKEW_MASK GENMASK(27, 25)
 #define   SVC_I3C_MCONFIG_I2CBAUD(x) FIELD_PREP(GENMASK(31, 28), (x))
 
 #define SVC_I3C_MCTRL        0x084
@@ -133,6 +134,32 @@
 #define SVC_I3C_EVENT_IBI	GENMASK(7, 0)
 #define SVC_I3C_EVENT_HOTJOIN	BIT(31)
 
+/*
+ * SVC_I3C_QUIRK_FIFO_EMPTY:
+ * I3C HW stalls the write transfer if the transmit FIFO becomes empty,
+ * when new data is written to FIFO, I3C HW resumes the transfer but
+ * the first transmitted data bit may have the wrong value.
+ * Workaround:
+ * Fill the FIFO in advance to prevent FIFO from becoming empty.
+ */
+#define SVC_I3C_QUIRK_FIFO_EMPTY	BIT(0)
+/*
+ * SVC_I3C_QUIRK_FLASE_SLVSTART:
+ * I3C HW may generate an invalid SlvStart event when emitting a STOP.
+ * If it is a true SlvStart, the MSTATUS state is SLVREQ.
+ */
+#define SVC_I3C_QUIRK_FALSE_SLVSTART	BIT(1)
+/*
+ * SVC_I3C_QUIRK_DAA_CORRUPT:
+ * When MCONFIG.SKEW=0 and MCONFIG.ODHPP=0, the ENTDAA transaction gets
+ * corrupted and results in a no repeated-start condition at the end of
+ * address assignment.
+ * Workaround:
+ * Set MCONFIG.SKEW to 1 before initiating the DAA process. After the DAA
+ * process is completed, return MCONFIG.SKEW to its previous value.
+ */
+#define SVC_I3C_QUIRK_DAA_CORRUPT	BIT(2)
+
 struct svc_i3c_cmd {
 	u8 addr;
 	bool rnw;
@@ -158,6 +185,10 @@ struct svc_i3c_regs_save {
 	u32 mdynaddr;
 };
 
+struct svc_i3c_drvdata {
+	u32 quirks;
+};
+
 /**
  * struct svc_i3c_master - Silvaco I3C Master structure
  * @base: I3C master controller
@@ -183,6 +214,7 @@ struct svc_i3c_regs_save {
  * @ibi.tbq_slot: To be queued IBI slot
  * @ibi.lock: IBI lock
  * @lock: Transfer lock, protect between IBI work thread and callbacks from master
+ * @drvdata: Driver data
  * @enabled_events: Bit masks for enable events (IBI, HotJoin).
  * @mctrl_config: Configuration value in SVC_I3C_MCTRL for setting speed back.
  */
@@ -214,6 +246,7 @@ struct svc_i3c_master {
 		spinlock_t lock;
 	} ibi;
 	struct mutex lock;
+	const struct svc_i3c_drvdata *drvdata;
 	u32 enabled_events;
 	u32 mctrl_config;
 };
@@ -230,6 +263,25 @@ struct svc_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
+const struct svc_i3c_drvdata svc_default_drvdata = {};
+const struct svc_i3c_drvdata npcm845_drvdata = {
+	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
+		SVC_I3C_QUIRK_FALSE_SLVSTART |
+		SVC_I3C_QUIRK_DAA_CORRUPT,
+};
+
+static inline bool svc_has_quirk(struct svc_i3c_master *master, u32 quirk)
+{
+	return (master->drvdata->quirks & quirk);
+}
+
+static inline bool svc_has_daa_corrupt(struct svc_i3c_master *master)
+{
+	return ((master->drvdata->quirks & SVC_I3C_QUIRK_DAA_CORRUPT) &&
+		!(master->mctrl_config &
+		(SVC_I3C_MCONFIG_SKEW_MASK | SVC_I3C_MCONFIG_ODHPP(1))));
+}
+
 static inline bool is_events_enabled(struct svc_i3c_master *master, u32 mask)
 {
 	return !!(master->enabled_events & mask);
@@ -1868,6 +1920,7 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, master);
+	master->drvdata = of_device_get_match_data(dev);
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, SVC_I3C_PM_TIMEOUT_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1959,7 +2012,8 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 };
 
 static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
-	{ .compatible = "silvaco,i3c-master-v1"},
+	{ .compatible = "silvaco,i3c-master-v1", .data = &svc_default_drvdata },
+	{ .compatible = "nuvoton,npcm845-i3c", .data = &npcm845_drvdata },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, svc_i3c_master_of_match_tbl);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
