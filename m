Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE06C1B0FF
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2025 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjaJzALrq325F/OaKREZHuZlLNinrGIETbxY7/c6pOg=; b=fbBJ6YHm6GqBnu
	v7I2msrGxLRH6+KryHet+BPmFPIKDj6+P1F7TVdyeha2NwNewiZD4CTase9tFkpJYE5jagSOMQPgj
	iMVyvKXqxAkXwYL6qWQcJoHnz4MQbxakmhyOo58+aOIx676xecCqfd618De8/HDXKE328l8izQLkb
	gDdLpAXcYPcyiYbyHzNdPHw9aJxwgpjq053IWmvxoW/nFDt1jr/vPJ6aqpHtUKabYg9kkfJDJHuwN
	guhFj8U667G7ThsUqq06b69afhK9uV6O/AkqRij8Lm7aGEbUijVSYg0ulANfCKGmQaWFxWhG1zAya
	38g+GIK20gDsZNb3i/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnX0K-00000006RdX-26Tb;
	Thu, 27 Feb 2025 06:04:16 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWy2-00000006R8h-1dFk
	for linux-i3c@lists.infradead.org;
	Thu, 27 Feb 2025 06:01:55 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fe98d173daso983658a91.1
        for <linux-i3c@lists.infradead.org>; Wed, 26 Feb 2025 22:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740636113; x=1741240913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jkvj3L9bGHMjbRbwPbZT9vYFOnv0oJXGKH8ygdTiAFw=;
        b=Sju4ds40PYeRzVKJ/9rV6Paj4coTXQFi2PTnRiJ8I6nFqO7uy1/dn/VT3lK1vKVBhC
         HRs08Py1WH4UqKHuqCXt89iWOHmD98n/CeoPqnKQt00f/AahG9DLTmkAphO8ZmN9FXRW
         qpLtBrB+8EoaixhXxh6n/A6s7erwINYJm+8v3QzK6oRfsxDt/N/tKpT1KFScfsNu0c+h
         E+U6Cvjh3I/VivLTTWPgSLOL0pUDvWyBCuZxMZNImLEgNZh8VzHPgTkOFUMJ6uhstbrN
         +ftvVvH5PaI2EHEDz5zVYk3OcvfdPhmhvtaHkFAzbzqUKQcQG/BSPAxSnh3DEuwn3cbB
         HTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636113; x=1741240913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jkvj3L9bGHMjbRbwPbZT9vYFOnv0oJXGKH8ygdTiAFw=;
        b=ngFNcnQXmIXPW2sCGiYejRKCjyATIh1os7geiEMKEA9AsNSMg81EMSAIgIWpQZqdym
         QvEmancvPHgcCTyuxU16YIHNYEkZKOdE/ZXGs7GpnntPxQFYSf3Bea2FvfLE4r2IDUYn
         bT8AJwR0HozzY1tn3YfcF2lzbq7GK2MGsDDSxYenCUhGa6vS0+YQPwrNRNQ5zq0DdN6q
         vMpnbdowHrc4nyqmtyLTO0kRChnv11EfOBt2mY+U2/jnIkjGy0tplyxaIzitsGcJuUx9
         Qj23VynMWxDHApeRo8fE1h5OwWv7B3RmGKpe1qZ2UfSjN6116O02NdMBkge/RUqM5CEq
         Yctg==
X-Forwarded-Encrypted: i=1; AJvYcCU8J/ugclG9PMoFRGaz3e4LU5nqmAfEFxfPu3dU7PUJ0jw2aE6/0CgB31m2edcouroWbJyalJeOheM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz6uRWZf9roVqFtJLV0IoV5FixSk/rcqxnb8vFBx3jbT/9hVYi
	BOXJ6sWELJiMZLe0vtuEdVBPqFZ8+Ao8I3rrWIMypaxFATkAMTqU
X-Gm-Gg: ASbGncsmEaXWljoeA8LPa2+CdlQ+wKHOZhJxZ9ZgptWrbrbGGGK512TMg3Cq7IDw786
	WYAyEzAdbNmDNb8FzrkQ4dz3S3P6xT6Wz14s+GtPr10N5ZdK/c/bRRQ464VHKWMN6IjhfSq+oma
	BzMIvhBFGLsrkLImPQuZJOrwoP8PBU6HI8r4IFtTXRqm3o6HksOnPdEQagaTehnrpA7uDQL/ZiR
	KY/uiRIdcIwB3Ufc9eRYfDJN1RWKZZ/I09zDzFI0hwdZF8PLMBk/iIp/d9d8Dhzr6nciWS3Fdf8
	DFrqXt5FyN4uakouVE8pv9EaDv7L9W8YZVSt
X-Google-Smtp-Source: AGHT+IGJf1EprWbsXZ2jFkUl5sHahMq3HVyinxDfNpi1XqlJ5NGR7aG6ByojzGWqVWyAfi7gUIv7zQ==
X-Received: by 2002:a17:90b:1f81:b0:2ee:d433:7c50 with SMTP id 98e67ed59e1d1-2fce873af2cmr32572563a91.23.1740636113433;
        Wed, 26 Feb 2025 22:01:53 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe824b67a1sm2728177a91.0.2025.02.26.22.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:01:53 -0800 (PST)
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
Subject: [PATCH v5 3/5] i3c: master: svc: Fix npcm845 FIFO empty issue
Date: Thu, 27 Feb 2025 14:01:29 +0800
Message-Id: <20250227060131.2206860-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227060131.2206860-1-yschu@nuvoton.com>
References: <20250227060131.2206860-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_220154_436669_FAD3B999 
X-CRM114-Status: GOOD (  19.28  )
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
 drivers/i3c/master/svc-i3c-master.c | 52 ++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 9143a079de53..a0c6d8053a25 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -114,6 +114,7 @@
 #define SVC_I3C_MWDATAHE     0x0BC
 #define SVC_I3C_MRDATAB      0x0C0
 #define SVC_I3C_MRDATAH      0x0C8
+#define SVC_I3C_MWDATAB1     0x0CC
 #define SVC_I3C_MWMSG_SDR    0x0D0
 #define SVC_I3C_MRMSG_SDR    0x0D4
 #define SVC_I3C_MWMSG_DDR    0x0D8
@@ -940,7 +941,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 					u8 *addrs, unsigned int *count)
 {
 	u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
-	unsigned int dev_nb = 0, last_addr = 0;
+	unsigned int dev_nb = 0, last_addr = 0, dyn_addr;
 	u32 reg;
 	int ret, i;
 
@@ -983,6 +984,25 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
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
@@ -1061,21 +1081,16 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
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
 
@@ -1272,6 +1287,24 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
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
+			u32 end = xfer_len > SVC_I3C_FIFO_SIZE ? 0 : BIT(8);
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
@@ -1360,6 +1393,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
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
