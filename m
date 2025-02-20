Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC7EC021AD
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 05:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVm8N0n+xzFhIUQCkn61nO0ayR2HoLGmP2dTtMbuk74=; b=H7AWW6gu2Tr6OJ
	qV7hybHK3NQIr/rnNNPVMQBtLFkwR9DftOgeJWuYMpJroIyV7EIqIZByA0FfH7reiJfe65PhU6L28
	AmO6rnVzXyN1bU5xSqrdNwuWV+HZuDtTohSyspfvrAcfHz8GmQWKANtti56w+Tov3euGRBugCpEAP
	5bh9DOo4cZwPqLFbaUEJ4RyVsdomb7AeScAmEAwj8AFfpnb3SsylDsUFKOIf4ZyXhL5lAgWjYC38a
	lbyOKhhFI4jl/xd6/bEaJkAQ5z7dG1TA4hGjOuDbUzzAoLOVULjxVLH4luLRpPko+phpuqWGuX4A0
	oIyBqF0W8lMoQzp40mJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLl-0000000Gpvs-40Yk;
	Thu, 20 Feb 2025 05:43:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLi-0000000Gpu1-2y4o
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 05:43:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2212a930001so13476725ad.0
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 21:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740030230; x=1740635030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+uWDhaMgi+jxwkqAdo/eMNwsqE8P1kcmn3GiPEcAYA=;
        b=c3208fBvZ7cM8/+/CRvovdP5ynkG/Mshna+x3iTD8P/JWQR/togcZQvFgyXpUNm3b0
         67R0iAn1SCtgMjbZ8iGXExK6sXgd5hM2wUL6YPV4VG4a+1cduCTWyzExlltmySy6Fo3x
         w0bU++Au6R43pxHfW7a9d7EsRD+ghwD/km8AHEGEODlQktxJe0BECxJ+NT5rUUxYgf3G
         EjqfVxsTRK4MjqaV6N1oerNdS8qbnem9cj3j6K6GFK4aIumhkeO43GjjoOEgerxbsyKL
         LSxmHHTpxflZD//OWM3XCjGDatQlsUfhSbzf3DZPU5XEc7LcfAdf+BItGcAMcIh6Ijrd
         Lj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740030230; x=1740635030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+uWDhaMgi+jxwkqAdo/eMNwsqE8P1kcmn3GiPEcAYA=;
        b=qsfDMu2fiubGg5QHE8DWbTvVgp+4o1k94QLkdVjMFXVkVHtqWjJtbE0eipmajjfJB1
         dhQqn+q0BobOe/jZXM7PwPm+0Qm3OgsPvobzGsVLkVepM6PyOMx1oLPuMdGtBp2g1GM/
         VofNF1dTo0CdLbPy2OajJLKyGs0xjut4AHf1dZjLmFsC+R81ieycmq3s/SDDyTDqxYoE
         5kHD0M6c7dGU+VPLqgD3xFszRncDfp6cmQ99mbEfEIUkki9/dq1T+NUkqre1HXJ+6Cpg
         zzRIJdond6ys7gvGlfQk4XRAEHenPrgHAYuaElud0FLXPBgeCvSKAIIiys8puGkBm5/y
         LoZQ==
X-Forwarded-Encrypted: i=1; AJvYcCULQ/akVEjpGgWta76HvJAfErw4gPSRdkR0lcz7Ypc2NN637m/XLNimP+rBbKBX3nIHmACGHaiA6a8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBDZrF50kIRZK7nJHQRlqo7K7kG+7n0X5Ookg2yecilxFSXJIu
	vXj6PlflfpU2CWGcSeJycgY1nReCO+/lKOpRCU4Q6+wOYpQ0Nq6nCbn7jg==
X-Gm-Gg: ASbGncttWtaQdhy2yxD9nyEdhDRX8mPpiWSekM/dQ2SqAlw2s+6kl8du8W3unvR8UkE
	oUNktBGzBFkPgfpQawOcNs7SaYuDmfWRnQwwqtZbPZSbnos1/0+HpqMhZQbslrhIQU/9xU/27EO
	SMoIjiFJSyXaC7EaSI4myOL6mYxWG8+GxXEMyzrL5556lRh62rcAqIcWdKwmgiRydNvAMlRA/2E
	dwzptq84SmVs1/qM6+HuCKCnsg4iQXxNP4rKSb1cwq+sRct4Z9Y78UKpFPy2lLBOLFFOOEQD7gD
	TNwaITeZcRrNRoYhF2duBSv93g==
X-Google-Smtp-Source: AGHT+IGGhLQt8RYHyL3O5/X/szpd7Iw5l6Qfx7Qwl68H9aQX/UAag77wmnRGfcRwgAJCMHxr4lD11w==
X-Received: by 2002:a17:902:ce0d:b0:215:a179:14ca with SMTP id d9443c01a7336-22103ef5861mr324352105ad.2.1740030229980;
        Wed, 19 Feb 2025 21:43:49 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534951fsm114415335ad.25.2025.02.19.21.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 21:43:49 -0800 (PST)
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
Subject: [PATCH v2 3/4] i3c: master: svc: Fix npcm845 FIFO empty issue
Date: Thu, 20 Feb 2025 13:43:29 +0800
Message-Id: <20250220054330.1711979-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220054330.1711979-1-yschu@nuvoton.com>
References: <20250220054330.1711979-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_214350_768468_60283059 
X-CRM114-Status: GOOD (  13.32  )
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
