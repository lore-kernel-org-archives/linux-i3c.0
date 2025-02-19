Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FBDC021AD
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pp6laHrkCansU6LANzYeirPcVKTNoWzjTOLbdX70Bc=; b=Y7cryaE8P5tBAg
	2s8s1SqUdMYvTitmGhBlg0BxkxLohPQySS8rigmw4v3RaT9HBcYjaOlqca2tF4SP3Z27g9/1H4aU/
	ux31lIQ4PM6w0sdBZqc0KYNZzOHPFYc8WP4qmQB1XX7BoVH5WAbtS3jfdw1X8rhMF0RR6QboZ/od+
	DC/5R5z0L1a6tl6fJZW8RM6Hm+LIntKywZeZ67nD0z0ik31dFpMm0m4wVmfwVI16c012fA2vA2ZRO
	2rd6gFg35kbQkPYeINGUWfw7emUQQfJC5dgB4XW0EtO6G+sNEoCAP7/5kheeTZZX1TgVc7X/HNPLx
	oVlsJKElWXPqYRDnWk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYcW-0000000AUk8-2eDj;
	Wed, 19 Feb 2025 01:11:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYbf-0000000AUUv-0u0F
	for linux-i3c@lists.infradead.org;
	Wed, 19 Feb 2025 01:10:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22101839807so81842735ad.3
        for <linux-i3c@lists.infradead.org>; Tue, 18 Feb 2025 17:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739927430; x=1740532230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQfECy+M8cSWsoOJoFSA8ondIMCqsdotHgkIf8xUcO0=;
        b=d6768fETBRZxruehuzsPFf15eHNyifaWBnN2ipZHUEcFKkSFY7FZQfdO42B75gajWS
         +fzvA7P7gRAzsNiWzIc9akPnudiUfTwCgxdAhqUiZGpGgQPRBb3XLnArYliCwfgImZ/h
         p3k5eGt9mlFrLmxj3mUXqx1hBPUWkUlVcbev9l17LIa9ebkooA5TwIIH8EsVc3HY/5gX
         tkS9GwD4L/yttCGA6k1xBe6ilMciDpfVLA9/Ti8RFybNhC9dWbT0lliy9gprhWCF9zyS
         r/ycj0H0i0xl0nnY9bnibooYTbgLDpCkhobRTkIcm/T2QIy6Q803RPcuyM0isvidzRIe
         MBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739927430; x=1740532230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQfECy+M8cSWsoOJoFSA8ondIMCqsdotHgkIf8xUcO0=;
        b=G5NL6pSluT31OXCiPyCWZtdwHIosNT1pf7PMFZO/RSQ5PfLfN1RP2XxKyFJVI+Alfj
         BSgYTrfx189WKawPujovifJ4yWaCRCmtAqRLPAc0TYAWej5sNOwE2ta6tc/+7QueslNh
         XtH3enZJ3FM8t9k+YNK00uf/4+Nk2hHe+s6JdpSvCzEwPyqw6xKlRmw7sXhRknvAO0Xq
         GNjnFcNJxo3i0Cac+hjoMYPkwzgm2Y/URtXEN3pMSqCGryHPkzGFxdq6nbFOUydiXwkR
         Of5zNBr+UD4fA+ZdKgWRb9T/JWinNX8aKbGJ8pVK2dNLfFD6ZskoXDz5xQ5jMTgT+F5F
         qwWg==
X-Forwarded-Encrypted: i=1; AJvYcCUpnIM7i8f3XqAdaI1AOvV9jy4A2TGPP/Lssr2JFQfUUWWxGsHYg3TxZCNGUN+mXapvnjvDBylpe6k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy44y+zMh2UEE/VWtxFCGb7qZXhFX1hD8bdjBb4K2eoAdqwXF9c
	4pevuwkZAtl8D7AqZdBGNJ6EHVHf/kHqeEYhFkWeknbLxImHGvHuuz/Ve+04
X-Gm-Gg: ASbGncuBxu3a+i3P3nshOxFOvvhM/i4BK1qPL5BeddkmIDD8sLm/2hv3cllCDIPasIB
	f4xqLuy0/fTDsyCt2YdfKhrl4RYKJYWV5pqJSmZrUr+Ih3lmuY0R3Dxb2kXZyKkGWnxIE6YAOiz
	4jNOxL4jb3sNladcw87FxsQHhSkkjZF8laf3dEoQ9aA8f3400/EseSi1ZiwP/zKKoL7p0ZffiwZ
	U6MsfCZN+SvEf3Tf1tVIXaJ2LbvY6lmhuoILeB6hVP3bc2zZ+Jkjpl4MattzM10jWmKtIDk/h3g
	tgezWG4dN+Sz27Tvtz9rd+bqXg==
X-Google-Smtp-Source: AGHT+IEjPOF9KSTzI2MsQxcir5evnluJM/uTeYqKNUB3AIj9hbsInSCZPHWIGW6siNdjzcinklyF0Q==
X-Received: by 2002:a17:902:e84a:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22170988bb4mr27863125ad.24.1739927430304;
        Tue, 18 Feb 2025 17:10:30 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f05sm96080315ad.2.2025.02.18.17.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 17:10:30 -0800 (PST)
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
Subject: [PATCH v1 2/3] i3c: master: svc: fix npcm845 FIFO empty issue
Date: Wed, 19 Feb 2025 09:10:18 +0800
Message-Id: <20250219011019.1600058-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219011019.1600058-1-yschu@nuvoton.com>
References: <20250219011019.1600058-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_171031_257095_90DC5531 
X-CRM114-Status: GOOD (  20.43  )
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

npcm845 HW issue:
I3C HW stalls the write transfer if the transmit FIFO becomes empty,
when new data is written to FIFO, I3C HW resumes the transfer but
the first transmitted data bit may have the wrong value.
Workaround:
Fill the FIFO in advance to prevent FIFO from becoming empty.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 58 ++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 813839498b2b..22cb1f1c1fdc 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -102,6 +102,7 @@
 #define   SVC_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL GENMASK(5, 4)
 #define   SVC_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY 0
 #define   SVC_I3C_MDATACTRL_RXCOUNT(x) FIELD_GET(GENMASK(28, 24), (x))
+#define   SVC_I3C_MDATACTRL_TXCOUNT(x) FIELD_GET(GENMASK(20, 16), (x))
 #define   SVC_I3C_MDATACTRL_TXFULL BIT(30)
 #define   SVC_I3C_MDATACTRL_RXEMPTY BIT(31)
 
@@ -133,6 +134,16 @@
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
+
 struct svc_i3c_cmd {
 	u8 addr;
 	bool rnw;
@@ -216,6 +227,7 @@ struct svc_i3c_master {
 	struct mutex lock;
 	u32 enabled_events;
 	u32 mctrl_config;
+	u32 quirks;
 };
 
 /**
@@ -891,6 +903,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 	unsigned int dev_nb = 0, last_addr = 0;
 	u32 reg;
 	int ret, i;
+	u32 dyn_addr;
 
 	while (true) {
 		/* clean SVC_I3C_MINT_IBIWON w1c bits */
@@ -931,6 +944,15 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		if (SVC_I3C_MSTATUS_RXPEND(reg)) {
 			u8 data[6];
 
+			/*
+			 * SVC_I3C_QUIRK_FIFO_EMPTY fix:
+			 * The TX FIFO should be ready before the TX transmission is starting.
+			 */
+			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
+			if (dyn_addr < 0)
+				return dyn_addr;
+			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
+
 			/*
 			 * We only care about the 48-bit provisioned ID yet to
 			 * be sure a device does not nack an address twice.
@@ -1009,21 +1031,20 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		if (ret)
 			break;
 
-		/* Give the slave device a suitable dynamic address */
-		ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
-		if (ret < 0)
-			break;
-
-		addrs[dev_nb] = ret;
+		addrs[dev_nb] = dyn_addr;
 		dev_dbg(master->dev, "DAA: device %d assigned to 0x%02x\n",
 			dev_nb, addrs[dev_nb]);
-
-		writel(addrs[dev_nb], master->regs + SVC_I3C_MWDATAB);
 		last_addr = addrs[dev_nb++];
 	}
 
 	/* Need manual issue STOP except for Complete condition */
 	svc_i3c_master_emit_stop(master);
+	/*
+	 * Dynamic address is written to FIFO in advance for SVC_I3C_QUIRK_FIFO_EMPTY fix.
+	 * Flush FIFO in the failed case.
+	 */
+	if (ret)
+		svc_i3c_master_flush_fifo(master);
 	return ret;
 }
 
@@ -1210,7 +1231,6 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	/* clean SVC_I3C_MINT_IBIWON w1c bits */
 	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
 
-
 	while (retry--) {
 		writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
 		       xfer_type |
@@ -1220,6 +1240,22 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		       SVC_I3C_MCTRL_RDTERM(*actual_len),
 		       master->regs + SVC_I3C_MCTRL);
 
+		if ((master->quirks & SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len) {
+			int i, count, space;
+
+			reg = readl(master->regs + SVC_I3C_MDATACTRL);
+			space = SVC_I3C_FIFO_SIZE - SVC_I3C_MDATACTRL_TXCOUNT(reg);
+			count = xfer_len > space ? space : xfer_len;
+			for (i = 0; i < count; i++) {
+				if (i == xfer_len - 1)
+					writel(out[0], master->regs + SVC_I3C_MWDATABE);
+				else
+					writel(out[0], master->regs + SVC_I3C_MWDATAB);
+				out++;
+			}
+			xfer_len -= count;
+		}
+
 		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
 				 SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
 		if (ret)
@@ -1308,6 +1344,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 emit_stop:
 	svc_i3c_master_emit_stop(master);
 	svc_i3c_master_clear_merrwarn(master);
+	svc_i3c_master_flush_fifo(master);
 
 	return ret;
 }
@@ -1877,6 +1914,9 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 
 	svc_i3c_master_reset(master);
 
+	if (device_is_compatible(master->dev, "nuvoton,npcm845-i3c"))
+		master->quirks = SVC_I3C_QUIRK_FIFO_EMPTY;
+
 	/* Register the master */
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &svc_i3c_master_ops, false);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
