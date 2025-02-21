Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4620DC021B4
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2025 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uCd4Jv6gUf2lu24gS5RNlVu/sos1zSShJYOBFtSC/A=; b=GmOpWhmCgt4POZ
	dcBeZBTghkVA2RtyDA6TxPdQn8F9bE+bxPVeMGOZvWm5F9MB3tWrW06ddAvSCACUIqIUjd+i4bFxT
	OD3n2RIkAqn/H+TbWB5AYKgZp1xzLWPmLGKnLDkRsY1l/0Fhe+n/T3GPOWpi+1e0pOxQuSyrxgQxh
	0nVdM2HmB1fjrXGg0LFFfrvTrotxv6KSCUY1VsdixZTdC1rOHI7URUQELQQmPATuR0Gj4NrvhVLeX
	xm1LgmYCVBiWDeyPqP5NldGav9M+IEntkWQObkkTxIkQcIe5kxOPuU2LcPhnBCYx1El5FhOxgDyAP
	7q5EBR/nppQwldjVB0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdX-00000004OQm-0DyI;
	Fri, 21 Feb 2025 06:35:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdU-00000004OP2-2vau
	for linux-i3c@lists.infradead.org;
	Fri, 21 Feb 2025 06:35:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22114b800f7so33058395ad.2
        for <linux-i3c@lists.infradead.org>; Thu, 20 Feb 2025 22:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740119744; x=1740724544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmC19JBPGsENQ1VkviAHTu5A3YwsTQcs9ernFXwa91g=;
        b=L0rWVmtzIdCWU6x797xgns1tii1XUnwingF/B/glUVwrcTK5T4hfnKhYxFAuGOks3o
         o9PoNqwimjRoZvT/ecvaUWdFP+TTNiC5xFnuePjASiA86x6dAUfuO31YitoFBvcamIYH
         dzH9rUvVYXVXl182x0nPFOKPgqIMOiHbGk73PnTKQXuF0AIeszjbaDG/RLiWH6xS8ecN
         xdiadhGnHAc3nSbE88cUBK1/O3MrQqXpyODtYCjePMmvCqCcyFBoNgN3nQ1pf1XnCoqK
         OFR2IFXtE+EsfzI97lVd7k1w5iOJqIvpPY9z+jSbX73EPGeKO/dhpiYekX+Oz0bAqxFe
         Q1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119744; x=1740724544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmC19JBPGsENQ1VkviAHTu5A3YwsTQcs9ernFXwa91g=;
        b=nlTSDTo7jlHNjCrZSfLYD8n9RGuCbjU1pXr0azcj7pgsM63MQIicOq9el+rRZQoTe0
         ump/OgbT7uh9d/UX1kon78q5R8fgoCI+qwlHiakN1h5VniAWlruGPF1qiOg5q/FWDhwC
         yhaWaXf4D47KDzbP9Gel1Un/CkfK+D7u3tG89od4QomiLPMeVEzhML0taD7+fjV6Mirk
         hVgmTXfeAr/4Kjk9T2NKqkhAsmzZPD6FPLlz5lVmuwh0wMY7VZma2/RSQ+x7/tRxeKBE
         yGkOgwyWaz6GqewOUTLd+ITPGAthZO3LFrhkyqmRY1P7q3HvK+CXKKW0TAMzaCKv/W2t
         97sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCKq83KdwLTcAKYNvtltL3tAXB7WrnR+69t2Tyt/WkagNyUf1TSOLtXscQFq/pSJYGFJb2X2g1iaI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlRfBJS45+bPHWwH9dIxt0UfcnbTPkcJ1M4LfDuW0yGD6Ti74w
	alz/WiwR8iaf/eSIO/i4ULs3Ignyq7kC6IbWQ3/hbHoM6H4x+Io4ibxfgg==
X-Gm-Gg: ASbGncv8CwkqmyAfpx+ZiB6FmoZWa2uSXbjDSepQDJXryIZ98Dsx6ZvWtO97uD5su5j
	tbuvjVzhJtW1K6GQnQdd87/ZjFOpJ0dreO1gcp4Y2puIusDXta27yUKCn992/BjrljPlJz/Fq9S
	Hjce0KAP9rbcw8N52EQJjU4NP+KjwEqwHBdBGJO6eFzHHHWE0DqBBYYoFn/F7ByN0R+MK6CSk5Q
	BnkKVK0AEfgFcllTqNJdj+kYJqk6MncbpUnlbD+bOsmq3wJTvEscX8EIbXyjg1yfhuNGum3dERU
	ZxGUp8J+q450mTVhlnw7TDtDCawL0jaN5YNB
X-Google-Smtp-Source: AGHT+IHcLopNzqkHAb76GoiyWMDUo2xcF/l6UUNHRIBoO6hb5KRaBtRoFFyBw9WH1MBRsIG3Mamdtg==
X-Received: by 2002:a17:903:18b:b0:221:1cf:da1 with SMTP id d9443c01a7336-2219ff5f759mr40749795ad.24.1740119743680;
        Thu, 20 Feb 2025 22:35:43 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5dc68sm13777275a12.9.2025.02.20.22.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:35:43 -0800 (PST)
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
Subject: [PATCH v3 3/4] i3c: master: svc: Fix npcm845 FIFO empty issue
Date: Fri, 21 Feb 2025 14:35:27 +0800
Message-Id: <20250221063528.1810007-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221063528.1810007-1-yschu@nuvoton.com>
References: <20250221063528.1810007-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_223544_740840_079690B9 
X-CRM114-Status: GOOD (  16.00  )
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

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 43 +++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 1e7e3e1f3d22..7919a49e97c7 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -921,6 +921,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 	unsigned int dev_nb = 0, last_addr = 0;
 	u32 reg;
 	int ret, i;
+	u32 dyn_addr;
 
 	while (true) {
 		/* clean SVC_I3C_MINT_IBIWON w1c bits */
@@ -961,6 +962,17 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		if (SVC_I3C_MSTATUS_RXPEND(reg)) {
 			u8 data[6];
 
+			/*
+			 * Filling the dynamic address in advance can avoid SCL clock stalls
+			 * and also fix the SVC_I3C_QUIRK_FIFO_EMPTY quirk.
+			 */
+			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
+			if (dyn_addr < 0) {
+				ret = -ENOSPC;
+				break;
+			}
+			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
+
 			/*
 			 * We only care about the 48-bit provisioned ID yet to
 			 * be sure a device does not nack an address twice.
@@ -1039,21 +1051,16 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
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
 
@@ -1201,8 +1208,8 @@ static int svc_i3c_master_read(struct svc_i3c_master *master,
 	return offset;
 }
 
-static int svc_i3c_master_write(struct svc_i3c_master *master,
-				const u8 *out, unsigned int len)
+static int svc_i3c_master_write(struct svc_i3c_master *master, const u8 *out,
+				unsigned int len, bool last)
 {
 	int offset = 0, ret;
 	u32 mdctrl;
@@ -1219,7 +1226,7 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 		 * The last byte to be sent over the bus must either have the
 		 * "end" bit set or be written in MWDATABE.
 		 */
-		if (likely(offset < (len - 1)))
+		if (likely(offset < (len - 1)) || !last)
 			writel(out[offset++], master->regs + SVC_I3C_MWDATAB);
 		else
 			writel(out[offset++], master->regs + SVC_I3C_MWDATABE);
@@ -1250,6 +1257,17 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		       SVC_I3C_MCTRL_RDTERM(*actual_len),
 		       master->regs + SVC_I3C_MCTRL);
 
+		if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len) {
+			u32 len = min_t(u32, xfer_len, SVC_I3C_FIFO_SIZE);
+
+			ret = svc_i3c_master_write(master, out, len,
+						   xfer_len <= SVC_I3C_FIFO_SIZE);
+			if (ret < 0)
+				goto emit_stop;
+			xfer_len -= len;
+			out += len;
+		}
+
 		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
 				 SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
 		if (ret)
@@ -1311,7 +1329,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	if (rnw)
 		ret = svc_i3c_master_read(master, in, xfer_len);
 	else
-		ret = svc_i3c_master_write(master, out, xfer_len);
+		ret = svc_i3c_master_write(master, out, xfer_len, true);
 	if (ret < 0)
 		goto emit_stop;
 
@@ -1338,6 +1356,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 emit_stop:
 	svc_i3c_master_emit_stop(master);
 	svc_i3c_master_clear_merrwarn(master);
+	svc_i3c_master_flush_fifo(master);
 
 	return ret;
 }
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
