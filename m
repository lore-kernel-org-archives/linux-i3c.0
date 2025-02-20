Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF04BC021B0
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 05:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndwDI7KcNauTIGHx3zC3mbSdkfJBfmNhS5L5Q2KpswI=; b=rtIq+gExkVbGVw
	3L+AUkecjnCfrsvEAioshdJvUjWwLBQ7zzvk51+VXmgF8UYJyAZJ8InX8OWtZI+KIKOLOxFGQYTdI
	Nez5VGcINSmPwnyR0Jm9KkUdB8Jcly7KBnyWKXdhBvDwAh4Of6PaWfIS46LhRV9wl3Qdj+IlghoTh
	Gd0k9LUOmzrij7AS4SVCJAfXHSdUAcYJhqSStcQu136EuSja5GeYF2V0X3232KKtJgL9/thV3WDFu
	t7D0FnE0thk/nm9X+MAsDWbUinr6IdK1MIEKqp6OaMDUDPnw8PRdZtzXCHH3PCvPH0E+xx+MX/KqD
	bTbibsdiJUAKOXqWFbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLi-0000000Gptx-1XNt;
	Thu, 20 Feb 2025 05:43:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLg-0000000Gpsy-0clo
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 05:43:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220ec47991aso6067455ad.1
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 21:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740030227; x=1740635027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdyLMLTg8byPe8k/ZJkRLFsyG1RrElmC3EJS6e+873Y=;
        b=lNgAe3R5qYWwnrGkSnpmK3ogWwgHtxjmSoOWD2n1Wa2nfDeBsjZHqHsDTr+/033+T8
         hcf835uNC1slkBMrDZcxeuYbhzY1FKABAaD84lzoxX7TX6/XwwKnxF+doDEQUhY7gbP5
         i8zGG21RNrSc0BnL9bNM8f4aw8+RQSQ/Eygfo68FektfDhwzHaUJuzQ72T0VMW6vE+RL
         BuXs8o4wbfLtW2fsEE4ifhJYQDpdKKVOsCn55Cc3cwvlYv5PlOoMZa/p3H6j8qk4qp1+
         brUiOKFGL1kmbsNiDRZ51UsMbCOaj8+h9A+Td2DmlTTEcSKTcC4rAaeI0dfgWzgf15II
         ulXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740030227; x=1740635027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdyLMLTg8byPe8k/ZJkRLFsyG1RrElmC3EJS6e+873Y=;
        b=A4/CqeBF4KRwCSafhpJBCnkapcXqnjVuAgdJvClV6KYFq+t6r1CsswZm5pR2WSPGj/
         X0gX/tHdjKwakvOohkA0CnrI+TvJt5sFoVzp0weyN12mmJsctNltNGAgG9jx+0Q5TtF4
         S5u1LFqaRMtHQ7ULBKleuNdrc5eM+hPOuAME+3aQJT2XxGYfuqDpffG9wz1Jh/zmB5kp
         Ac8NuEcs3Upw6vreMipE3QwT/Z8txRY/Rpys+fj9JOt8XyTpD8ODIJKkKoUWAFHIAtG2
         9MOFkPO08t5Iw6GwdByQl83Ruue99MfbjyPIhW6ZonX7SGfD1t3ycN7W7EZbZnPN+csV
         7hJw==
X-Forwarded-Encrypted: i=1; AJvYcCVBzKnLVCvDKAA/1CTTEkpidiLqBO08tB7XGQioGrmZa9ppNsGIwjhh9ejrAZLAlX2Ksz/h0kBSID0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ES4ezK3t7TzbgioDkFY15cIvOcG65s6SkxjhqvLeV49K6mhY
	fZGkENpeidvwQ0YPOIItR/9YHCHTqQDbBWflMJgE6jrtpm9UmbhH
X-Gm-Gg: ASbGncspnCGw6xgvBt9PY02ks1GQHbBAOJZd1cMU1s21naA+xXZvYHs+6VWYHj4UL4L
	qiVrkEfhs89XhRpUuhGPS1mjfx+o4lRcqv5LvlPXSyRUF2LxvcG/AmHKGe9VHD6mFKIiO/R7YPq
	y14wAN8ByrR4yiI19B2ZA+f061m2ODlTiysEKF2AfPMxhVdqNIxmdTJajFQEYJvsh6hgDPmpEaU
	flIvJ1NDENCTpGtnW8RphS9BUF4Byr4rxfgMRFCMqmIT/hQJVgC/pzT+Q11NHecdOdUOSOw+AN9
	H+4X146tG/YEiY986X7G4XtjgQ==
X-Google-Smtp-Source: AGHT+IHpDIBFsH7vbUvCxPzxU+DThzUJ3gvnL5P2dGfiTDolUeJEuC1kCfITRVmlniKuIgAkbGy8og==
X-Received: by 2002:a17:902:f609:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2217119ecc7mr98131815ad.42.1740030227442;
        Wed, 19 Feb 2025 21:43:47 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534951fsm114415335ad.25.2025.02.19.21.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 21:43:47 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v2 2/4] i3c: master: svc: Add support for Nuvoton npcm845 i3c
Date: Thu, 20 Feb 2025 13:43:28 +0800
Message-Id: <20250220054330.1711979-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220054330.1711979-1-yschu@nuvoton.com>
References: <20250220054330.1711979-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_214348_185658_C057403D 
X-CRM114-Status: GOOD (  14.72  )
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

Nuvoton npcm845 SoC uses the same Silvico IP but an older version.
Add npcm845 specific quirks.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..c58440061d5a 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -133,6 +133,22 @@
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
+ * If it is a true SlvStart, the MSTATUS state should be SLVREQ.
+ */
+#define SVC_I3C_QUIRK_FALSE_SLVSTART	BIT(1)
+
 struct svc_i3c_cmd {
 	u8 addr;
 	bool rnw;
@@ -216,6 +232,7 @@ struct svc_i3c_master {
 	struct mutex lock;
 	u32 enabled_events;
 	u32 mctrl_config;
+	u32 quirks;
 };
 
 /**
@@ -230,6 +247,14 @@ struct svc_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
+struct svc_i3c_drvdata {
+	u32 quirks;
+};
+
+const struct svc_i3c_drvdata npcm845_drvdata = {
+	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY | SVC_I3C_QUIRK_FALSE_SLVSTART,
+};
+
 static inline bool is_events_enabled(struct svc_i3c_master *master, u32 mask)
 {
 	return !!(master->enabled_events & mask);
@@ -1811,6 +1836,7 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct svc_i3c_master *master;
+	const struct svc_i3c_drvdata *data = of_device_get_match_data(dev);
 	int ret;
 
 	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
@@ -1868,6 +1894,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, master);
+	if (data)
+		master->quirks = data->quirks;
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, SVC_I3C_PM_TIMEOUT_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1960,6 +1988,7 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 
 static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
 	{ .compatible = "silvaco,i3c-master-v1"},
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
