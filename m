Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15210C282C1
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2025 06:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqpgqmwzHE852tWECXes6y+7HRQe1DO4RZLTLuwR4Hw=; b=aV/D0BREXuK7Tr
	MEtDlcmNsoM8IuIpRcOW0eRIKLwZYrmVUOc1JX35xn8ob++MwlljfQCxl5UwA70iIIVuykoIbOYEV
	t2FCvSsTDtgOvupbPppkOlWJ9bDHJCQLSYD22q1dPyaFbS7CrVuyT0Pq2yJF+1pMOi4Mjyy2QMpZu
	5ArZk/zXezYyJexS5iNd8056pkkBAXusSBJlEowvMtZzb2VndmgdK+xbBnYqfnz8bI0ZuztRjf768
	EYfmflGi6H1e5vSAoR0vLZXk8LkiVrFRswb9gCPSz+phBsn6VlMN3gm0JeRunOt41msUxx/xu9FvT
	efwsYjEQxntuEOHCBKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnX0K-00000006Re9-3W3b;
	Thu, 27 Feb 2025 06:04:16 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWy5-00000006R9i-2Jjg
	for linux-i3c@lists.infradead.org;
	Thu, 27 Feb 2025 06:01:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2fc3db58932so932345a91.2
        for <linux-i3c@lists.infradead.org>; Wed, 26 Feb 2025 22:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740636116; x=1741240916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfcsKyxsqqNF1ObsRkAL+Fr53iDPz5SE+sP10CWPKmY=;
        b=DZuyMJSXdvnQNtibm/7KEhjVxy86UgyRtEZGllhtX2ryRprR1bz/LfBgKkhPEB9dIY
         ByOYDfA/HfHcA+oZn2MXSCowTZuCRfmlsr+vPNYlsM+CU1El0Rdxh9boRCZWoWIvvJ0y
         SAFkpkejtLNfuIBqpm9AeWhjNH2rkUZtxYYIKDFuUfQjVWEU66UAlkKW77kDJvW3ovbK
         16zJasu5QefEOpj1RF2oKZeunk7jJisuWJ59eSHJaJwRUrFDjm109j+Sg4EtfTor67oQ
         BG+2b0QMFWQ5gm2xDkgXWYGlMCHCY4aYXHIyBrqVQztRmxEyn7ZEoKRyDOK6XtQVhuHI
         ugFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636116; x=1741240916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfcsKyxsqqNF1ObsRkAL+Fr53iDPz5SE+sP10CWPKmY=;
        b=Fn0W+BXZduIdbqaZaMx3Yt5RRSDActhGSG/W9ND412I29ZRQtBShRTDG5zRkzFUCdW
         vUig2qEBKB9qLdzt+XMmu64fO3DAWzo2Hs3haodVViay4zawWmhRW3w5ppu28z6D2Sz9
         AJSw1Ha6Q7EY606Au9J2A1mWOLseRty5xsXYAFf3bewyHl+mKmjl16nJA0QzIqOffAwk
         AZb2LPwkKgt7zj+s8aJj8dB8MuLaptWIBbPmKLs/ANaZ5sJyPoKANIyegx9AQxnlb5lO
         ANHJWE5fJ+6vM12qQ7e+DSM90yzgeH1byvuAKARwF/W4RmhkKaI/9X1LGX+M5fRZEvVz
         oosQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbdgOmH6eRP5G7tz0fJeubpK5Edqk6jLDJvnDA8T0U4H0gXvphbw+jzmbv3fwDdcp97Nnsz0NOEtg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzwaO2dNCGGGvZLDMysj0SloqLsTeqN8gdFELMhloo5Xa3AiYa
	9aYsZTebuArVeinbRadBdAW40sOb20iChZ0LsE+SQaB+4dcH2ZIU
X-Gm-Gg: ASbGncseQB77gCyVhC3Va1RN2MUQSbNpPI3C3JMvSnzUqUkXplEWCfrVqHWoycMynN6
	pIokonFvOq7Tnors7UegqYygDdGc+qwvil9UCci7AwEmbENPkswfEJ4GmYf8qfs126rgYH0cTb7
	e9Vg+vcVza6+8OB2IhUtf2F2vUGXBzWiVlCvEDo5ZY9GHSYnZkRo/m/HoYDSv78RB7CQGgVrEUd
	dUXYeO29o7mLQhLsX4EtXkYqYx/nJ0iUjmh/ouhebnO8neYooBV5wwam818zpZ8FgYyR4exqEtr
	MAKcGkdfZ6srpO4g7SAYlZKHkA3rgE3XTaRg
X-Google-Smtp-Source: AGHT+IE958nyxT/MQ1RXRPl3RO6BV1mQ+QuBOyNiN7aTAS3Jr7cbgeA5uuT5xa5jaBuU3GsTGvI1Fg==
X-Received: by 2002:a17:90b:1808:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-2fe9e6cb035mr4296027a91.18.1740636116626;
        Wed, 26 Feb 2025 22:01:56 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe824b67a1sm2728177a91.0.2025.02.26.22.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:01:56 -0800 (PST)
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
	yschu@nuvoton.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 4/5] i3c: master: svc: Fix npcm845 invalid slvstart event
Date: Thu, 27 Feb 2025 14:01:30 +0800
Message-Id: <20250227060131.2206860-5-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227060131.2206860-1-yschu@nuvoton.com>
References: <20250227060131.2206860-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_220157_589895_FEDE66F2 
X-CRM114-Status: GOOD (  10.15  )
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

I3C HW may generate an invalid SlvStart event when emitting a STOP.
If it is a true SlvStart, the MSTATUS state is SLVREQ. Check the
MSTATUS state to ignore the false event.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index a0c6d8053a25..952afc75f6e4 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -59,6 +59,7 @@
 #define SVC_I3C_MSTATUS      0x088
 #define   SVC_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
 #define   SVC_I3C_MSTATUS_STATE_DAA(x) (SVC_I3C_MSTATUS_STATE(x) == 5)
+#define   SVC_I3C_MSTATUS_STATE_SLVREQ(x) (SVC_I3C_MSTATUS_STATE(x) == 1)
 #define   SVC_I3C_MSTATUS_STATE_IDLE(x) (SVC_I3C_MSTATUS_STATE(x) == 0)
 #define   SVC_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
 #define   SVC_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
@@ -617,6 +618,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	/* Clear the interrupt status */
 	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 
+	/* Ignore the false event */
+	if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART) &&
+	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
+		return IRQ_HANDLED;
+
 	svc_i3c_master_disable_interrupts(master);
 
 	/* Handle the interrupt in a non atomic context */
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
