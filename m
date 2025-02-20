Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8712C021B0
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FF0K3FPiybYqB+3Gz9AWl7yE4DrZRtIlp4N+g2PIWfE=; b=tkiuCM+SC9vQVB
	GDtN+EZcJvfnrOC3lLKG1BgrL2Dy91NVAYzma/iNDO/DQTq3sE7p5AWapX2+yynGj1O7hyd0Np+m+
	IOCg6VIxmWPOss7TmX9/2TMn67BzhB+ta/RvqWuGCFiNwa9lcMWUa3eYnquy7nehA3K+Wyl9tzpRl
	C/rX4kDoRR+kIAn9K78Jk7qMPkayp1Nt6LWORpte7i24mqDSnLIxox3aRrU3vT796v5Tqn4T27mt5
	PEzDiNYoMNJ7h0ajFFyAMEd6WqFXTCL9MJzsnjoPpAcxfXkxLLbYeKp3O9fvdhBmL7agB5V9y0kCs
	f7K1P8QmAyHHu95Mwthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkznd-0000000Gtk2-2x1c;
	Thu, 20 Feb 2025 06:12:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzmI-0000000GtNz-2Fr2
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 06:11:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-220e6028214so10329345ad.0
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 22:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740031878; x=1740636678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+j78yv7W1SEsENaFWTruZEdfPJNI2RZz4FriJMcOius=;
        b=X7wfuZnIJNZE4k/8APeNf8LDf0F58VzBXf4JLTw8asbDY0woiFvFJzM85Zg7Zx9oMt
         ywBL0yfujWpCOvye4MRmCx+ue972Tu2cDYzLUbatNjUgWcgobncH/vsWMFlMjTu48HSF
         dE+vO8MBi2fZVDU0BObwix+KzkAGz2/r494et4jO89pNIV3P1zTQO33cVyOfu7680XJq
         fZYotoYJWCrKceZXS9a3cU9cDZdynHdMyFjNSJ7QOdLoKATyBw7E+Fs0y8Mhow505f3z
         0lZ6IqrLPNb4xix64AGr0az9bamZgrICDMvXKV9HOuqcNg1DsfIOMxq/Sz5yBooxPgck
         SDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740031878; x=1740636678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+j78yv7W1SEsENaFWTruZEdfPJNI2RZz4FriJMcOius=;
        b=mJaiUgYqsFXJ/6foF/cnqiQW/OhH7AWRMj23u3W1pssGHZwttYftl3XL/JZBTmdW+P
         zYuFcNmKcOpqnnJVHH2cdPQL95PmMzmbuMfIo3eC9nZFUFqB3bT6gmZ3wRjt8qjdxy94
         fJSiyqaBN/ysV49KagLTqQf3q8yakvvvMue2i84QiKgBBfNwOqBr7AxXkjKHwjL5DJLR
         ZzPdzKqMzDeA0u1iLIxFw3jNz6k640QIW4weB89K2v3qP8oUNSwfdHssbRoIZHeMKoVj
         WzKzV1nMBqHMCJ5qD5bd2GFPvET1S/5bE3AAlYid+aDbkZD0lDHQbSMtmC3tWsZwWuKh
         RPHg==
X-Forwarded-Encrypted: i=1; AJvYcCU8JQdqsSLg+bnlraiAWKNMux8tlwlkvWi0+odvu3x6A58WRP2uuj3KYuLlql2ygue+BD6qrY6/eNc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcukdwe/e91QJfjC8LkX2L4bt844v3lGPTJL3Jmm0XNgWxTG+4
	sigmoNl+e/I65c12YPJlkIDhLmJmWMpSQpWY4hbtnaMlNS+uw483
X-Gm-Gg: ASbGncuioULBhwTnXu3WK4IcSzqonbYkvHxOispak9bVspeyOlpCBkugJmRp9iEQVUY
	2BVOSAnx+oD2uMyJ2q5RiCb9k/EGvStedETrWJNwntDWR1jjlv3mPfx4dPUhXSMvsNI+QZPlxXH
	SXVXfXCruQ5gH09wv0rxqViEksA9nYUM+/L9ButWPqSVkFUKQpQVLt34p15dtrkSBOt7EYWhIz2
	zErq2ufRXPxPE1Rkml3De7ZFRUlhdDApMA58Uo8gA2pupPVwaYTwt7uFJoQgWfKKaZi6pAptcYD
	4ypzlsBObKimh/upxsJX9NH9Sw==
X-Google-Smtp-Source: AGHT+IFU3vxY9Ip1+CC3bff8XqxgjtFV+EfaOwsPv0Qbpgrftb/RcnRACrHbtb9fAqxl0J/+zKDiqA==
X-Received: by 2002:a05:6a20:9148:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-1eee5c95932mr2769361637.19.1740031877986;
        Wed, 19 Feb 2025 22:11:17 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73271a02648sm8226823b3a.107.2025.02.19.22.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 22:11:17 -0800 (PST)
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
Subject: [PATCH RESEND v2 2/4] i3c: master: svc: Add support for Nuvoton npcm845 i3c
Date: Thu, 20 Feb 2025 14:11:05 +0800
Message-Id: <20250220061107.1718239-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220061107.1718239-1-yschu@nuvoton.com>
References: <20250220061107.1718239-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_221118_572957_75EBE2D9 
X-CRM114-Status: GOOD (  14.70  )
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
