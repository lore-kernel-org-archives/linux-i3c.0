Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E0C19F32
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Mar 2025 06:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ywuB66xi5NLUWieQb7EG5eDswTs8OndozPw99TFTi8=; b=r0d+yDl4XRNsgJ
	MqHuI3zbvZktUK3sdyhF+n9D7Csgq9tMZNeb0YwniWQYkuj7TXZCqx4x2I3bC2mI+efpc5kEL8nQ5
	483hhSIs5QFMXQGJ7axG2iB//lumHxaxn1wkIwHwgjuYgt3456Tc4of1ynrLjr77SqaBnv8mI3Xud
	bl+Iqs2hFJ5mUG3uDuGWCoR/aKjER9vcfGXXP0/G7zh6gUVxYTgityHIhLKZD0Jnu+GnAwQXwSBJN
	PcBOiFjPvsVcgk+jUESdvdLdSKq26eGMDmXUoR8syJLqDuFn6/HH2q4T8LxSBhxIKiefZt6F+d2Rq
	+2QogmjFVmwHr/oR+xSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpi1s-000000076AW-0f4A;
	Wed, 05 Mar 2025 06:14:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgj-00000006u0q-2EJ3
	for linux-i3c@bombadil.infradead.org;
	Wed, 05 Mar 2025 03:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K5XgaLNVCOBJH6qLNdTYPllzrDzuWjs4hTrWU2in37A=; b=ovP2o/ZMmApuntAC0BfvJnnsJY
	AdCQPtcVuiKodbnS/pdacapOUw/NOEKzoS9bIUBNb5vKvlxVsBxTGy94ZO2eLsH9ohS7Q+9Sz108M
	1s7z139LwgtFBlxHIBp0B5IcrmjP3cbVQOEkFMpaklIX264//tJudZ/AJ2fnneJEsBlofyZT+I9S9
	1YZ8Rb9j8ZQV6kGqylizvtoz//MBoCKdzvstJilrkS51ovKNMwatQ4pkGijgs6y52WGx0gEz+G2/H
	bTtPyL9fELKgae1skze7mzG6ZJCKJuMi6AxXnPp6arnj27OFcwnYApKJeL5LvcecRNjlV0IsFt1Zy
	PtmUlIXQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgd-00000000LVV-2Vkk
	for linux-i3c@lists.infradead.org;
	Wed, 05 Mar 2025 03:44:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22349bb8605so122796835ad.0
        for <linux-i3c@lists.infradead.org>; Tue, 04 Mar 2025 19:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741146286; x=1741751086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5XgaLNVCOBJH6qLNdTYPllzrDzuWjs4hTrWU2in37A=;
        b=mbwvrJTKEonFt+inB6dfF8MwDviCtPPKjcmmlewzAIuT+1EthN3p3g1+ETCO8NhDTG
         XngcpiJWj6G1X9zAT00OQQarAiTa0mlTb6EaEooikq+4BSxSdqFgTizuT1rbDE4uc1Ia
         ZpD81fXPhgeDUy57Bzk7QHRDrm8hykbyGWY5jiWi2D8U/CM4NGNeZyFrPRbdugH66NGY
         EdH4M7ARl2Opmiz7EpwsNJW2HJic/jASpf0tDLnj/9XwShxk0Qzit1B01vIC6tGo67eN
         uiF3Jp0ncxQkEfweEcYz3UOP3qn90CBMGpS1AyV2KjnGX2e5vRvafPsJjNfwmVW1kuOE
         97pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741146286; x=1741751086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5XgaLNVCOBJH6qLNdTYPllzrDzuWjs4hTrWU2in37A=;
        b=t0i5J6VktLxP/UFgEQIOsO3T9G6piR89Y2KPfzZXMWY8nAFBS5imKNApIL62kWbxkc
         6Q2ct22ywtabWg65UjgT86V08nqn6TecGW6RQW4/sxQ6LDeKWr0t7ULLJM/b3ASa000l
         M/A55aHAx4UJsrGKGy8xPzcDSaDfC0NoRcmK4BXrK8UXrmy4nj/eT8eEo5r4JJ7GgsCU
         Xv8DlQrrhxsTLz4BL4qOYRyIMF7VCsWFR+HBkOdGw70VpIxo6/yRWTCrKQInEQCsEfVj
         ZeWvyzNsWYJRhhBd+rLVc47wJRgHZghxep7vHgqJ+Vk0VO17JH78CkiiLbJfHkwhUHn4
         kJEg==
X-Forwarded-Encrypted: i=1; AJvYcCVrN7kbOppIzj1WY1sqLMf/V97+gs3pm37c0iJ67dMty8sx6iI8PI+8amEeMlXi7YY1vuH2l32JrRI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTBnIK+SriAN07A0TZYr8Se9vV8ILLc+51Q4TekcoFbCjV/QfK
	0OJL+InWj8KG6riqtuKINlITRS5prsI9FubGrp6tWdgbbNFYjSft
X-Gm-Gg: ASbGncsopL9ljPoRdTv6uVuIoL9TXYcSq8i3kjgCcFyDS+ILuGb3rhgcxlBwmWEJnXe
	1aGDI6vk1NCLu2ZTccU5IRA0znFu9qbg6ooMe5pxgnKXL0zu/zR3ybuJ1swsve9PJ0lL1Zim/2l
	vSR30PS3JQKt9qn21A4sPyqIyQVEzfA0SRkCNpB3wUkqPuxoom5EJod/DNGIPmuQr/UP5EXP3z8
	q8EonIcBu5egHktuShZvb5UZK8HaAZb/Mhm7m/Aa1K0RM1OuzLrm1d/shugCXIg849kF4LzYoiK
	q2ICKvF9GzeHWzfqpCLWtvd+4D2UJSyspUAF+Q/QOH4c6dgm113V8p4=
X-Google-Smtp-Source: AGHT+IGPoR5eAIQW9xdEo8WStH1w40nmyMmwzBz1XdEZxtqBN5FLjqj3BW1bdcFkkK22otVnGbjCBA==
X-Received: by 2002:a17:902:ecca:b0:215:8809:b3b7 with SMTP id d9443c01a7336-223f1c6b194mr22922005ad.7.1741146285606;
        Tue, 04 Mar 2025 19:44:45 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c37sm102734335ad.133.2025.03.04.19.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 19:44:45 -0800 (PST)
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
Subject: [PATCH v6 3/5] i3c: master: svc: Fix npcm845 FIFO empty issue
Date: Wed,  5 Mar 2025 11:44:12 +0800
Message-Id: <20250305034414.2246870-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305034414.2246870-1-yschu@nuvoton.com>
References: <20250305034414.2246870-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_034448_165594_066ECF47 
X-CRM114-Status: GOOD (  21.35  )
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
index 7cafdc8fd1ad..46b032b61f3c 100644
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
 
-const struct svc_i3c_drvdata npcm845_drvdata = {};
+const struct svc_i3c_drvdata npcm845_drvdata = {
+	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY,
+};
 
 const struct svc_i3c_drvdata svc_default_drvdata = {};
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
