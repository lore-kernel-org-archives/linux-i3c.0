Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0D0C28B24
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtEgPrqncdBGKgjCwHmEd0E/jVN9yz+GfQw32FHbLcY=; b=SXbdxf7UI7V+Sa
	Fgzif5bXjY4iR6I63Xq71mnoJ1u++JDbTPUl8bV0tRJhbqb7YGCOryTvsxlkAcnZaW1FDlMt193kf
	ZNtw9fSGhTUBEhLIfVNriLr1swAhRwsSHBqd52ztKHIdvq00uYqCD1gsZGQwiQVmjl57kitVO3hnk
	Cu1nvX4o4ep0aTGLprWcSR0JnI3wKuBGkHaZgE2wE+fn/3gA/4Hcmnvqx5N+0lqQJmt9ksSuVRkgv
	SpGWAQblMj0Pg9jEofxJQC0a+FAcom1j7GsRGcMasyWAr5KqeE07KFKyqLA8tVFJ6UVslxB4P/3Lt
	J14Pe2GmBLGnIX1og1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq64y-0000000AGNn-0CN0;
	Thu, 06 Mar 2025 07:55:40 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq646-0000000AGBA-0l3G
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 07:54:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-223959039f4so5451535ad.3
        for <linux-i3c@lists.infradead.org>; Wed, 05 Mar 2025 23:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741247685; x=1741852485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEZQpIQJFkHZeLv9/Dqh07QChyI7uFyuz8YE5XUUtDc=;
        b=CdniW3jAb6XE1TeyRN438OwVPtuxlJSRQkeuWe03ipNmxi3YoyN7nNq3ycfx/qC4fd
         l2DjegMG8RreddEN2qdh8n3N/ml0WzsSBY2DoxGPp0lkGsZy2NTSNKdKgc5JxFBkmwKo
         n3mVWXI0MDeQVS26ZcuwXPO8lY3qGY3bhgdmqnVcQ4sW1ZW9NT2rEa6U1nv4KHbmthea
         nRxX+OzOb/R67JPjUEF85oPp+om303t6wykok9jhGD9loyWyByxPqdXlqEYv8zO1MxPC
         BROgAI9ipeFvB71goyDlsUmQ/XxKYAbSXjmYtJKb9xNimqb/64TshFmFZv0xaf+Zj5yB
         fXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741247685; x=1741852485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEZQpIQJFkHZeLv9/Dqh07QChyI7uFyuz8YE5XUUtDc=;
        b=T0QVdPnO2yShB2G7KLKsvjH1+F7LhXgQQoXFy5plUcPE9/tYPRyl809nr+kNaZLMMb
         nZlcQhBhvPBBWHmqaAIYEdr+TdK/0wKEoqW+hC/GSIf3wo6va/9VNkL8oP5KEoTXqgOJ
         Otny/AOdrWy55EnCNFpd8uK9ca3K+Xf+b+bxdJjJrxfCtq9/xEwBqzpVnTpxZqB7Tf9v
         iQoIno+1WJdRtGDrPBNVBbCW4gT0iW57W+YnCgKC0U5vXen/taxhmvSu+931K4DToqg8
         8zmPL3aq7a0lPf4m/PTQw0r+xpk7EkaB66PH41GjAvm0NL3Md5Tiq2Ee5RG7E+C9VnKv
         NNXA==
X-Forwarded-Encrypted: i=1; AJvYcCUFn3J4nhJM+NZIoMUoeirGsTkVmSyZ+dMEnWag5G2wB20QPFT+ChAnpBb+PzYf2GRN7LAcSJfB6+Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHNSTvxndcwH1xCFvuaXBMZ4lRHDWqhKNSQI8+T4a6CRZvJLNG
	NWFrewJYL7A6FyNNtK3RkAh30QW3sE0WX2uj1S8EQdl6TD44vgX6KiEMIg==
X-Gm-Gg: ASbGncvfoQZUoCy6BJbDrevK9AV1fsW6sZzuAVNp9SDI89fROYZvg+rxA6jscMIZRoR
	X9nP022OBXCDBwf4XW+++JwsCHvWTg9C/WcSmoEzYJrPNHGHPlDEedtQE1TD72tmToLlRX3ifeD
	POPQ8jZ8jvS8FeQvZGtWdPNEYnMCEEP7GszwT/TBymN/2FPu0YTn9/CnBsAEHKUm0x7CMLQ6bzD
	q8lJF7kCG1wZFM0294yyMHGUl6fadk+qbBYMTc//wB9MQMSBnf6Wsk6BzCyJBYuXn0bXqo7I2z4
	3fac4MqzrcckgTmDI2xPpuNtdyAx+2ACfgofjf4AfE7I5o0Zb9/tdJA=
X-Google-Smtp-Source: AGHT+IFcL0+B3Hx4sm17S7HaaAzS7pgvJFy07ZpdfXIMFxdeHGAgASq3H6x7BYZUzd2tuu/iirTDGQ==
X-Received: by 2002:a17:902:e950:b0:224:11fc:40c0 with SMTP id d9443c01a7336-22411fc412fmr15782245ad.11.1741247685528;
        Wed, 05 Mar 2025 23:54:45 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa448dsm6085485ad.210.2025.03.05.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 23:54:45 -0800 (PST)
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
Subject: [PATCH v7 3/5] i3c: master: svc: Fix npcm845 FIFO empty issue
Date: Thu,  6 Mar 2025 15:54:27 +0800
Message-Id: <20250306075429.2265183-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306075429.2265183-1-yschu@nuvoton.com>
References: <20250306075429.2265183-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_235446_220228_73B24935 
X-CRM114-Status: GOOD (  20.58  )
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

I3C HW stalls the write transfer if the transmit FIFO becomes empty,
when new data is written to FIFO, I3C HW resumes the transfer but the
first transmitted data bit may have the wrong value.
Fill the FIFO in advance to prevent FIFO from becoming empty.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 71 +++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 40269b692aa8..cba89a685e13 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -113,6 +113,7 @@
 #define SVC_I3C_MWDATAHE     0x0BC
 #define SVC_I3C_MRDATAB      0x0C0
 #define SVC_I3C_MRDATAH      0x0C8
+#define SVC_I3C_MWDATAB1     0x0CC
 #define SVC_I3C_MWMSG_SDR    0x0D0
 #define SVC_I3C_MRMSG_SDR    0x0D4
 #define SVC_I3C_MWMSG_DDR    0x0D8
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
@@ -236,6 +247,11 @@ struct svc_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
+static inline bool svc_has_quirk(struct svc_i3c_master *master, u32 quirk)
+{
+	return (master->drvdata->quirks & quirk);
+}
+
 static inline bool is_events_enabled(struct svc_i3c_master *master, u32 mask)
 {
 	return !!(master->enabled_events & mask);
@@ -894,7 +910,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 					u8 *addrs, unsigned int *count)
 {
 	u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
-	unsigned int dev_nb = 0, last_addr = 0;
+	unsigned int dev_nb = 0, last_addr = 0, dyn_addr;
 	u32 reg;
 	int ret, i;
 
@@ -937,6 +953,25 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		if (SVC_I3C_MSTATUS_RXPEND(reg)) {
 			u8 data[6];
 
+			/*
+			 * One slave sends its ID to request for address assignment,
+			 * prefilling the dynamic address can reduce SCL clock stalls
+			 * and also fix the SVC_I3C_QUIRK_FIFO_EMPTY quirk.
+			 *
+			 * Ideally, prefilling before the processDAA command is better.
+			 * However, it requires an additional check to write the dyn_addr
+			 * at the right time because the driver needs to write the processDAA
+			 * command twice for one assignment.
+			 * Prefilling here is safe and efficient because the FIFO starts
+			 * filling within a few hundred nanoseconds, which is significantly
+			 * faster compared to the 64 SCL clock cycles.
+			 */
+			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
+			if (dyn_addr < 0)
+				return -ENOSPC;
+
+			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
+
 			/*
 			 * We only care about the 48-bit provisioned ID yet to
 			 * be sure a device does not nack an address twice.
@@ -1015,21 +1050,16 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
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
+	svc_i3c_master_flush_fifo(master);
+
 	return ret;
 }
 
@@ -1226,6 +1256,24 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		       SVC_I3C_MCTRL_RDTERM(*actual_len),
 		       master->regs + SVC_I3C_MCTRL);
 
+		/*
+		 * The entire transaction can consist of multiple write transfers.
+		 * Prefilling before EmitStartAddr causes the data to be emitted
+		 * immediately, becoming part of the previous transfer.
+		 * The only way to work around this hardware issue is to let the
+		 * FIFO start filling as soon as possible after EmitStartAddr.
+		 */
+		if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len) {
+			u32 end = xfer_len > SVC_I3C_FIFO_SIZE ? 0 : SVC_I3C_MWDATAB_END;
+			u32 len = min_t(u32, xfer_len, SVC_I3C_FIFO_SIZE);
+
+			writesb(master->regs + SVC_I3C_MWDATAB1, out, len - 1);
+			/* Mark END bit if this is the last byte */
+			writel(out[len - 1] | end, master->regs + SVC_I3C_MWDATAB);
+			xfer_len -= len;
+			out += len;
+		}
+
 		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
 				 SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
 		if (ret)
@@ -1314,6 +1362,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 emit_stop:
 	svc_i3c_master_emit_stop(master);
 	svc_i3c_master_clear_merrwarn(master);
+	svc_i3c_master_flush_fifo(master);
 
 	return ret;
 }
@@ -1968,7 +2017,9 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 			   svc_i3c_runtime_resume, NULL)
 };
 
-static const struct svc_i3c_drvdata npcm845_drvdata = {};
+static const struct svc_i3c_drvdata npcm845_drvdata = {
+	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY,
+};
 
 static const struct svc_i3c_drvdata svc_default_drvdata = {};
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
