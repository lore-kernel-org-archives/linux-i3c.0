Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A0ECA0EED
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Aug 2025 03:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpGBb3BOU9tlpI9iWdRPGG3Y2aVIdgp8AxM4PJ4RlSE=; b=cro1ZpTQg9EPxS
	1/yVVwkyFKQ1HDQGsfgKg7ieceDZyJ9AIkPvYs7Dfq7ra3FGPmKoXvHaBG7/yVz5nQlpDvI+6C1K1
	7D0h6fJYVeeZIZGtTU6g3BAgJ3Y05m5YYJGv9rEbnHDTQPPjksbzmzfTQZjV5eQPEsJK34h22BgOf
	OGBaUq4cus2JrhB+hCkAb3+9pvsBTFbV/xr4Q6EDSMiRIPQt0WrYcfZXQL8cs7huKocdQK/bWE393
	ev/Zmq/Yu1DPR81hy9TYPrX7NNkV7eVwBIQDy49AtumTmIsBMzpyDEisn8A8MSvxqtE6X/1/Xs0cq
	9lkSte7Ilj16/HBtqQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urpxI-00000004F5j-3K0D;
	Fri, 29 Aug 2025 03:39:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnpm-000000040ND-0UYv
	for linux-i3c@lists.infradead.org;
	Fri, 29 Aug 2025 01:23:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2445826fd9dso19189685ad.3
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 18:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756430597; x=1757035397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCc+9KPYWnXlW7uF+KcOgI9YRTfMpRpG2O6mgKyAsFA=;
        b=kLLYx3wpnTJxxEUwODtm1UaTnWTITKdre0Jue8W/x5MPoiIgoh+XFwUg3c4yCVkTCq
         HtO+P4yyyvL1w83T9cb11kfSF69oWUlREBT+1nrVOssyqGWDrUvm8Bfubhd1j0vKnvxg
         +gXz3LsDDWBlFzu43nkkLLo8WdtUix07e4/iQLQ6to34BPrfMmorbp7yos60raqgThQi
         vxR6wJhM4NTFnMgmQ5hHCyWSm1Q6nWuxEHPoDQKEsywWFZDlpsBiGXdOwr+qQEG+geLl
         Sf9q4dwF4BAhBlln3NMnYiMfqNoXEr3JudA8MX1/uDccHgmbsYR7PemqEdEbd4a7Do6v
         2EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756430597; x=1757035397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCc+9KPYWnXlW7uF+KcOgI9YRTfMpRpG2O6mgKyAsFA=;
        b=ps0fG8BZPyE59/vW2bFPUvFRX2Y80FIi3RxOhznXXRA9Q4IHi5KoyNA7FTftnrigN7
         BFvOVrElkJsYaEc8Yb5OldXE42vRtKjuILC+ws8xMzUNqC9AgtNcPqsakDaFkeK1DysX
         f4Mau/F7NTahmzY6Dnfc8ZATELT9Padqs0gVgAaFzuXLcLHyE03z2u2NH4Pnn07tSeqU
         T+rqD45qSNhMMd/3mRrVs0puVKZVODJQgpC15xbmyNLY9kkjR42nKQO5Nhj6hQYc/8jM
         TZI650VoH9ClOmBNxZ1hAnP4p5xr8buas8MonGgDbyeffzsTVcfzL8Hh2zcXcHNLiJzi
         8KWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP9wcbNs5eVJ+WWCvxC0GUHCkgr7nYu51DppypdKnjmUv5LSo5eTIUN0ucVmp3TFPqvonwAad1O0Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg5FpAIkgmBv1Wtvcra5YlnnEPd3fGkUMeq0yBkm9s76nlul6F
	Tz2RgafenBpnl+g3s/iom1P26gZUWpYEG3mMvotIGjI+14HIRdE1E2/M
X-Gm-Gg: ASbGncsX1aQJOGBcGd7YaX2MC1FfBBQUgL14krHx5MUg1KBr+BgemD4eMpcphyQrpOd
	TTqQa/S6QD2PAjU3+V/NxMLbImu4b/1emiB0FOXeN62oA7lDe4by0WYv4UJFWS6+o1AeXDjsbJ+
	mVHROrSMEho8uktMjLJcG+WvRKawKEFBQTp3HV2bWsiNo5Yv+Sy8RdI9K9WZf7JFRPa3cu3CHvP
	h39v7NBzey9S+X3cjzgPxVZXBZG3wDdCD6S08D4WBKW/LkYalIpW+ERkQDmSlvtOgi9HDvatNxh
	4v+6YaUrwWA6DeKd4ykp6jFIvoQZgC9ytJN3Kjhe4SMUH/a15N2SKLzxompZdPvLynQ7YrBX0Rl
	S01OeXOpS27ApzGVvlcnljHbfLOnBgE3bjdV7tyv29tI=
X-Google-Smtp-Source: AGHT+IHmO6ojEFw+n3wHVhsw/EFAK1mSMF5sDMQeXbOj8huc/adhHS7E4f1wH0RYuA2hnfjxzOdWeA==
X-Received: by 2002:a17:903:943:b0:240:5549:7094 with SMTP id d9443c01a7336-2462ee53d7dmr335075475ad.18.1756430597328;
        Thu, 28 Aug 2025 18:23:17 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da183asm7686885ad.74.2025.08.28.18.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 18:23:17 -0700 (PDT)
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
Subject: [PATCH v2 1/2] i3c: master: svc: Use manual response for IBI events
Date: Fri, 29 Aug 2025 09:23:08 +0800
Message-Id: <20250829012309.3562585-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829012309.3562585-1-yschu@nuvoton.com>
References: <20250829012309.3562585-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_182318_158531_F9EC7390 
X-CRM114-Status: GOOD (  15.34  )
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

Driver wants to nack the IBI request when the target is not in the
known address list. In below code, svc_i3c_master_nack_ibi() will
cause undefined behavior when using AUTOIBI with auto response rule,
because hw always auto ack the IBI request.

    switch (ibitype) {
    case SVC_I3C_MSTATUS_IBITYPE_IBI:
            dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
            if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
                    svc_i3c_master_nack_ibi(master);
            ...
            break;

AutoIBI has another issue that the controller doesn't quit AutoIBI state
after IBIWON polling timeout when there is a SDA glitch(high->low->high).
1. SDA high->low: raising an interrupt to execute IBI ISR
2. SDA low->high
3. Driver writes an AutoIBI request
4. AutoIBI process does not start because SDA is not low
5. IBIWON polling times out
6. Controller reamins in AutoIBI state and doesn't accept EmitStop request

Emitting broadcast address with IBIRESP_MANUAL avoids both issues.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
Changes since v1:
 * Specify full fileds in the MCTRL register
 * Add Fixes tag
---
 drivers/i3c/master/svc-i3c-master.c | 30 ++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 701ae165b25b..8e7b4ab919e3 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -517,9 +517,24 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	 */
 	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
 
-	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
-	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
-	       SVC_I3C_MCTRL_IBIRESP_AUTO,
+	/*
+	 * Write REQUEST_START_ADDR request to emit broadcast address for arbitration,
+	 * instend of using AUTO_IBI.
+	 *
+	 * Using AutoIBI request may cause controller to remain in AutoIBI state when
+	 * there is a glitch on SDA line (high->low->high).
+	 * 1. SDA high->low, raising an interrupt to execute IBI isr.
+	 * 2. SDA low->high.
+	 * 3. IBI isr writes an AutoIBI request.
+	 * 4. The controller will not start AutoIBI process because SDA is not low.
+	 * 5. IBIWON polling times out.
+	 * 6. Controller reamins in AutoIBI state and doesn't accept EmitStop request.
+	 */
+	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
+	       SVC_I3C_MCTRL_TYPE_I3C |
+	       SVC_I3C_MCTRL_IBIRESP_MANUAL |
+	       SVC_I3C_MCTRL_DIR(SVC_I3C_MCTRL_DIR_WRITE) |
+	       SVC_I3C_MCTRL_ADDR(I3C_BROADCAST_ADDR),
 	       master->regs + SVC_I3C_MCTRL);
 
 	/* Wait for IBIWON, should take approximately 100us */
@@ -539,10 +554,15 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	switch (ibitype) {
 	case SVC_I3C_MSTATUS_IBITYPE_IBI:
 		dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
-		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
+		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI)) {
 			svc_i3c_master_nack_ibi(master);
-		else
+		} else {
+			if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
+				svc_i3c_master_ack_ibi(master, true);
+			else
+				svc_i3c_master_ack_ibi(master, false);
 			svc_i3c_master_handle_ibi(master, dev);
+		}
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
 		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
