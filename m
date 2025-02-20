Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B047C021B2
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 06:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2UVR7gljG7rgVWbZ/RTIhMcaDslnpFuWCQLt4CH54Y=; b=MlXikGGBOlQl1W
	No0AHtYiFn3F+Kom6oPPcx+63pHmueiEgeTFjIdcGgGLCaGQx65JxlNnWheL1HcWzDzafvnLmARsq
	g5XAfes7oOwCgbHUA/a6+vCWhyJw9/NfYDaPZzZo7A0dh7qum6PxWfYYV/ojqCSZXSKwHqvYpd8PO
	SCIiT0+/T/1pN60f3UDH+oWjSuLvaTdo/6rm9jXIsRy8Lnoq5IwnafShdfiT4nm24igDJ+7crReUn
	LSyA+gTeb3GVMoouXGKHOYNse6kpmFePj9PF2OPIaPTQBqkZ2XNo0esV4R1A6I+6PpMmdVwcquRSm
	V1m4t3BdeUxOsFgcj2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkznd-0000000GtkB-4BBO;
	Thu, 20 Feb 2025 06:12:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzmL-0000000GtOU-1vJb
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 06:11:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2211cd4463cso9353215ad.2
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 22:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740031880; x=1740636680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jyCgdWDKnjZQEA9Y1qdWuHJCZbETxV6ANCbypcoIhQ=;
        b=mLk0LbCybir7oo1MjrXpLDbR6JMab62hwtV8gcuhwIgBtdIVTzRZ07YJa9Y906XgRO
         OAj9jZ/+hPn8C4BrQe+QbqGO9eRP5gcCiC/9aC7kzC9rUUljRB727OctWlnShZIunD5D
         /+U614R5/igOHoZnBkuxdMxOF5kpcHNomWMpbwvyTUf44pf1LNHY8DVx6xpxkg0Mvb3n
         FQE9rq6KaAKDchA9tKcwFqTzs/9pmAbJbZhLFBpi9zYFykpJRii1pd83yS9Y9Rg8t2Wk
         cHrzHXX0cN5052wpz7EcJYcJJZJ5Golr7OVrkFXIHFrHxhQ3/hqCZIWb7tdXiYsCmsYZ
         G6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740031880; x=1740636680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jyCgdWDKnjZQEA9Y1qdWuHJCZbETxV6ANCbypcoIhQ=;
        b=jt6lOF6RoajGZ2M551e3muQeJeQT8V6Ovyo4MTGE0UshfJjXxLb6xwX7gJ/H3R3ydU
         8EmBeQGnC5lQCt+p0gK5Org6TuQjI4Ib0q3yBcRi938ffbb9VVfMv9H/84PBgPNMHtlK
         HD63sWTZiGBpc4dC204fcBVoIP3KoSybfP/QNP8HafWXpwq3mFuc5nGjgAuXoIXIMSMD
         6j8UwJTu27bPOKg+sI4hwIzfeAVaayLseql1FwQuafs0GvGtxZpuj/lyflxmHxIuzbqK
         wihf53j/um5ZhWOb8umcyjqEgClZsZxVTh4TSfFz5hJmI9d8BdmrDseQnFBWZK6ucH42
         3mFg==
X-Forwarded-Encrypted: i=1; AJvYcCWgadvjg0OKSkpNEqlcGHDd8v4k0ZLJVHAIqGR+p1CYk55fEsFtFueMzuGRtgC2/gB15UIRXsYB66Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3pebW2vmjYjjLZahG7dhiYVpbMwRrfsZ03ThIQEYI6TvSA5kU
	3loc3TsFgqIer/i9qcBkLWN0hnMykBFihOH790X9VdPhxz04fglp
X-Gm-Gg: ASbGncsLewI3UyzWc9P+U1rcAX7Tsk3nZHCDiT8Py2vMyLIbs7Ffobx7Jid1UjIEZ/2
	TqtBeU+Pmjj6Z2MZzbnPeGe3v+i3jH5RCcO93MHtq/YgmCHCRj2jZLqyNlb3mI1JfyVV46jsbqK
	KAhZDu1eI8ceVGylgk5KD6Wp+4NHfQJBN5MmUC5bgd8ZtTUcgSIK2B9yVhzmjyOezQGp7xBm3Ib
	HH62SZq2+Q/XDOK6GLJv5Lz5JcQoah8kBDvL9Z2jwMh6PzivDSEhpAPyJleoFEbVlUUrK2UIJkY
	4XMgvXzl2V4vdKoFFg+y+/fN6Q==
X-Google-Smtp-Source: AGHT+IGobtb4ADu1SMowtReLDdqa/0G20bTrsNjtMYphroDuWxjEnuqenicfClU6Q1Oum3yt+48EaQ==
X-Received: by 2002:a05:6a00:4f95:b0:730:794e:7aca with SMTP id d2e1a72fcca58-732618c1c26mr33817817b3a.16.1740031880466;
        Wed, 19 Feb 2025 22:11:20 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73271a02648sm8226823b3a.107.2025.02.19.22.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 22:11:20 -0800 (PST)
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
Subject: [PATCH RESEND v2 3/4] i3c: master: svc: Fix npcm845 FIFO empty issue
Date: Thu, 20 Feb 2025 14:11:06 +0800
Message-Id: <20250220061107.1718239-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220061107.1718239-1-yschu@nuvoton.com>
References: <20250220061107.1718239-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_221121_497591_10D6CD20 
X-CRM114-Status: GOOD (  13.18  )
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
 drivers/i3c/master/svc-i3c-master.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index c58440061d5a..2140da3f5187 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1196,8 +1196,8 @@ static int svc_i3c_master_read(struct svc_i3c_master *master,
 	return offset;
 }
 
-static int svc_i3c_master_write(struct svc_i3c_master *master,
-				const u8 *out, unsigned int len)
+static int svc_i3c_master_write(struct svc_i3c_master *master, const u8 *out,
+				unsigned int len, bool last)
 {
 	int offset = 0, ret;
 	u32 mdctrl;
@@ -1214,7 +1214,7 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 		 * The last byte to be sent over the bus must either have the
 		 * "end" bit set or be written in MWDATABE.
 		 */
-		if (likely(offset < (len - 1)))
+		if (likely(offset < (len - 1)) || !last)
 			writel(out[offset++], master->regs + SVC_I3C_MWDATAB);
 		else
 			writel(out[offset++], master->regs + SVC_I3C_MWDATABE);
@@ -1245,6 +1245,19 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		       SVC_I3C_MCTRL_RDTERM(*actual_len),
 		       master->regs + SVC_I3C_MCTRL);
 
+		if ((master->quirks & SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len) {
+			unsigned int len = xfer_len;
+
+			if (xfer_len > SVC_I3C_FIFO_SIZE)
+				len = SVC_I3C_FIFO_SIZE;
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
@@ -1306,7 +1319,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	if (rnw)
 		ret = svc_i3c_master_read(master, in, xfer_len);
 	else
-		ret = svc_i3c_master_write(master, out, xfer_len);
+		ret = svc_i3c_master_write(master, out, xfer_len, true);
 	if (ret < 0)
 		goto emit_stop;
 
@@ -1333,6 +1346,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
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
