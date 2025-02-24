Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDA4C021B8
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2025 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fT/8vd8xGFQ31LMZrcu2Qyk7jvoeER+mp9pFo45mQNc=; b=mh0nOKot7iQwWj
	XXMq2Cetlw6TAeH81vWHIl2EoTAf/QNjsKs6LnItfTHNwMwyl7J5JQkESgVjuTrcye2wF2ua1VJLU
	xRmeO/gCcF1TC3fpUVLq+DZtuttDR8WvDuKMB+M7qGb0YeXaFSnGpTNEuq/EojYA95UA8Qd9gsc4u
	aDuZFX9JIsGtH8ircYAY94oowzdMo0MZO6NXqrAi/N6pNRmOhJ20poI3g77t4OVkfY10jSple2m1V
	YQTMPozsnGBxl6apSWu0SjTRkBR74hDYba+xZpKhaKQrj8ktEoNwCz3cAeh7JMt4oUw56x16Wc7CT
	qvfUssjYRhRN+3IGCDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUJO-0000000CnLa-3uft;
	Mon, 24 Feb 2025 08:59:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU0H-0000000CjRF-12HM
	for linux-i3c@lists.infradead.org;
	Mon, 24 Feb 2025 08:39:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22185cddbffso82808535ad.1
        for <linux-i3c@lists.infradead.org>; Mon, 24 Feb 2025 00:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740386392; x=1740991192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/zcMpskijGYRuDfk1c7h2QKxlF14yge6iyoocOzfaI=;
        b=mIGT5Vlh4IL8LZBs/J5mtknMyrtcjkfmB3XTMvMiv+HlQDls5QxBGJPAx7R+zPCNJ+
         IHO3GBrx8DNiIQA43bEtzFRNT+Io8i2xhKXi7NJqMGXJadRv6QP7mKIRO2xqr7aOHWEd
         Bl4l4mU24py4vVMeNXib+1/uALGOOZT5EiK9iVCvpmuQGW2GxZaaoRz+kZY4kdTWS0Tb
         A1aun3O6boQSZp8SCEnWGKb5Wort0b+V7ASqC+FQdQAioV8zNAyeIRZL8FkX/0mVWT46
         atwjMFWINIn4TkxM/Cr+cvYLsZ0lnUvHbsrnW2JEoQlMNcmljeMo7Rw0Yu1Zzx6AuUoB
         4/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740386392; x=1740991192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/zcMpskijGYRuDfk1c7h2QKxlF14yge6iyoocOzfaI=;
        b=KWwFdxb1q0W4cHh7kjbelsIR3imMeWRrnz+R34qrZwXLjkyNy+LQ0S4ofuFpi3zyZS
         6W4EzOQohimdMK9xmn/iOuQ+dJF11XhQkIqcgYGZ1hQNbLA8KjNCzpsXtVczW+91WWX7
         jBhRvgd3dStZKl7XNnJvRNJ282DRkl1wmzX+mxv7FUtjktmUcR71+vRXPwwy3zgOkv+n
         Cn8Xluo95RT2cgM7yE3CjU8OBWSchsLha2pHGJZNPagBk++kJeFOH3TyRzvaEduSm+bs
         g+EKDs15+oOnxWzrkAZXeBWAljXYUkJiv0Yt8Qt6eNhsonkOA54I5l5IEcVY4UHaxZnV
         wzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZxP1K9e5JUvSbqobSz632Xga4kAEWDwYJiiUxgOJDq7JVF+g1VQdDFaIHyDVwnnIbrxKGb3cmbas=@lists.infradead.org
X-Gm-Message-State: AOJu0YzU2211kz0ASFCLL6T0L5WnbiNhYSQh3gMw/dmtEE/sTbb9Vddj
	MYiNtWMrSX2CWNZABD9TMzq9216Vq0NoU4sYNtW0NUQFQeMLSvUUeJD8mA==
X-Gm-Gg: ASbGnctd2GnW0R6d6ABktliT0oiLSrJvVhdVW92wHY0EQIahdqShOH8Sz4JsYxBG/uV
	JDtAJyHcka/EoMTv4ZFhf/0Sq0s9PBJVV70rXvPBZn0P9UbASU+IJw1f8VjWt89HEPQcxv+jxQm
	ucAVAIa9fqsKWqpAXwq4j0xizlRxiv3nsCtPfoABLpw8+YvpEcKlNGxzna933muR5JidWm3Bj7p
	I6BFa47FKOdxVOJYECPiSY4Kg2HplUcjIhDYiu21srhiF1YCzNKsWcM7yBhYexA1jzn++eiKOut
	OW0sfAFAkAlwdAsvP5mxcjI8Te3lX4W5mZje
X-Google-Smtp-Source: AGHT+IH0vF5JtrmGfyOiw3Uz/WiGXZ6m0VJD5EWTauPDEIQovZ+YQzc9KpIobnt648BkAXZ8UT2PeQ==
X-Received: by 2002:a05:6a21:3991:b0:1e0:cc01:43da with SMTP id adf61e73a8af0-1eef3b2586amr18631154637.0.1740386392571;
        Mon, 24 Feb 2025 00:39:52 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327590ff12sm14634793b3a.115.2025.02.24.00.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:39:52 -0800 (PST)
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
Subject: [PATCH v4 3/5] i3c: master: svc: Fix npcm845 FIFO empty issue
Date: Mon, 24 Feb 2025 16:39:06 +0800
Message-Id: <20250224083908.1880383-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224083908.1880383-1-yschu@nuvoton.com>
References: <20250224083908.1880383-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003953_316254_23BCC5CB 
X-CRM114-Status: GOOD (  15.87  )
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
 drivers/i3c/master/svc-i3c-master.c | 44 ++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 8834f87a4767..07506ae0f914 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -942,7 +942,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 					u8 *addrs, unsigned int *count)
 {
 	u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
-	unsigned int dev_nb = 0, last_addr = 0;
+	unsigned int dev_nb = 0, last_addr = 0, dyn_addr;
 	u32 reg;
 	int ret, i;
 
@@ -985,6 +985,17 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		if (SVC_I3C_MSTATUS_RXPEND(reg)) {
 			u8 data[6];
 
+			/*
+			 * One slave sends its ID to request for address assignment,
+			 * pre-filling the dynamic address can reduce SCL clock stalls
+			 * and also fix the SVC_I3C_QUIRK_FIFO_EMPTY quirk.
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
@@ -1063,21 +1074,16 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
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
 
@@ -1225,8 +1231,8 @@ static int svc_i3c_master_read(struct svc_i3c_master *master,
 	return offset;
 }
 
-static int svc_i3c_master_write(struct svc_i3c_master *master,
-				const u8 *out, unsigned int len)
+static int svc_i3c_master_write(struct svc_i3c_master *master, const u8 *out,
+				unsigned int len, bool last)
 {
 	int offset = 0, ret;
 	u32 mdctrl;
@@ -1243,7 +1249,7 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 		 * The last byte to be sent over the bus must either have the
 		 * "end" bit set or be written in MWDATABE.
 		 */
-		if (likely(offset < (len - 1)))
+		if (likely(offset < (len - 1)) || !last)
 			writel(out[offset++], master->regs + SVC_I3C_MWDATAB);
 		else
 			writel(out[offset++], master->regs + SVC_I3C_MWDATABE);
@@ -1274,6 +1280,17 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
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
@@ -1335,7 +1352,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	if (rnw)
 		ret = svc_i3c_master_read(master, in, xfer_len);
 	else
-		ret = svc_i3c_master_write(master, out, xfer_len);
+		ret = svc_i3c_master_write(master, out, xfer_len, true);
 	if (ret < 0)
 		goto emit_stop;
 
@@ -1362,6 +1379,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
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
