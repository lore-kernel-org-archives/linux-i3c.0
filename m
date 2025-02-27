Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86067C282C2
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2025 06:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/3ayrnY/pshmgHNm0B59pvmsgJAlF/RdaTaEEDfSpw=; b=ITKud+QWguWLbI
	GULE0RpGcHhgGz2osKJjI56QoNAhYahhsBSw4QsOngi+I9vEw/EQEnsVLi1Os8n67UEQ28E6QhULA
	CY+R3DFHkjLuFD/N5GmdVq6M2w7P51eajMIICj6NUgbfeebdZHudU0N39Q2ojyKyqiefuswH7XWxw
	cnfiYrAs0IcaGrLlYt/EHHVV6c5P6jpYe6aH1xD+Pvy4/tD1fMYYO7AfZd6YVgAvYdhf2o/EDHoLc
	OFIrlXXNYaZwbu7PfhP2duC9vJyVjEmsN/TJc5K1bHDj6tGubRigaCgCYG1VoVIgH8yWRafTj2f47
	7VWetKNJbGqy9aWo4kKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnX0L-00000006ReM-0csZ;
	Thu, 27 Feb 2025 06:04:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWy8-00000006RB6-3C0k
	for linux-i3c@lists.infradead.org;
	Thu, 27 Feb 2025 06:02:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220c8f38febso8876625ad.2
        for <linux-i3c@lists.infradead.org>; Wed, 26 Feb 2025 22:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740636120; x=1741240920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OREH+iLC47dZ2hUuoqhiGCsdCQC5cRnPwerNbjmWOc=;
        b=b2dV0oARmmDPerY9f5XO8cQT2LxxXnwCueM3QCGUF3APR8DY6k17YvPE6D4b4m1Nv/
         +FHq2vph4LKMotSlD6y0LNSUYVYZ913Z4r8uEZLD7fYvWQPDVb0KJQs/zI/5GlvnRSiH
         MZWkfUgRk3TT3YFKh47lb4mg4dG/2bdinLgLME9fr+eAjR5FrjDPpugLsk8iFY+4pl/G
         SWLzurN147Put3psNzv7Y1R/wxFde9CjR87TsTaZwfLh2HKcCH1Heud3yDsRgOVzP7c3
         1+XI2sSv78BNQ8ATLdIW0cU5fzHvAEjbLRzQ7WOTe3xukApo5S2hs/tUSOW/1O/kuuKR
         /Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636120; x=1741240920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OREH+iLC47dZ2hUuoqhiGCsdCQC5cRnPwerNbjmWOc=;
        b=pabTCQaJvesOPKoSwz59DyIg0AKWa7EPRmDZNBeEM3p5ReR+F0HCj1tBedzPOPrFkC
         v95pzntwBZwfP8+FiRv0LpArX6CQ6/tCEgBx4vDhEqOJVTpCaoNstQ31s7iJk1Stxscb
         yuNMqvFTtENb9R7Z5E26cFX/+OFq9zTuyHCfsQOqD+ziepabWHLMMIa4Y+/0r7gYd9fH
         fTAR/KzeaFIt/mVExDzoYyAFKGdLJNwfvyI6v6MWVAHC3yb4UwXg8zCkVgjy/hPUc37D
         /YOVqzsppIXgCILv4dfSzI1fEKNLCy4nVoRAYY8564hRvOZy4LLFHY8GtY1X+PZPnMHo
         xb1w==
X-Forwarded-Encrypted: i=1; AJvYcCXYLo3tnXzwkFyNRNN1ymx7mM998gJGizhLqwY4UDADrFBSjGZxkrwQ1iDWY02G1LX6roN+0tQK8oE=@lists.infradead.org
X-Gm-Message-State: AOJu0YykUy3GS84TTMvv+rtselWc2jIvYr23w18ehfRvmblfzk1aYOU9
	gry60GMGOLMSxzPZ+we/Qi7YxIqhnK5wTA0nlXpMxt5hI4YvQWP6
X-Gm-Gg: ASbGnctk7WK5ggLx3cEaEffyp3ZfF3f+9NtpD07TR61n/pPrmlnMw8ANArnUoTz0FQR
	MoiKFro10va2ZWKW8MRWo48wbsrlyeggafrtA/+Y4uMlQB4SoDLlEOXbksvATsz8ts4LCiFwswC
	U+/Zs4nzBG1hXbz0n/20hpwADQNHY/Bn2zupBQpxAusUmB26bF0ZmycvTKFf+J5awsSlbeVjRdt
	KhW6m69F3LcVsm+xywAncRsIgzL0uEalcFlL6ekpaV4Ym2EvQN0nP2O0F2utrCGS0K2Md4sGJ8J
	0cdX3pOzMWkRuwk1nfJeAcUzr9VVeObZJhS2
X-Google-Smtp-Source: AGHT+IEqIBEjElcYfutyZm2+ie7egiFz7kMRAMyX+Q/RVxplxMI9mjXMEKkY217XYnf9eGB2wXWsGg==
X-Received: by 2002:a17:902:d502:b0:21a:8300:b9ce with SMTP id d9443c01a7336-221a002afb5mr415841785ad.49.1740636119772;
        Wed, 26 Feb 2025 22:01:59 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe824b67a1sm2728177a91.0.2025.02.26.22.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:01:59 -0800 (PST)
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
Subject: [PATCH v5 5/5] i3c: master: svc: Fix npcm845 DAA process corruption
Date: Thu, 27 Feb 2025 14:01:31 +0800
Message-Id: <20250227060131.2206860-6-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227060131.2206860-1-yschu@nuvoton.com>
References: <20250227060131.2206860-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_220200_797144_89D10099 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
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

When MCONFIG.SKEW=0 and MCONFIG.ODHPP=0, the ENTDAA transaction gets
corrupted and results in a no repeated-start condition at the end of
address assignment.

Workaround: Set MCONFIG.SKEW to 1 before initiating the DAA process.
After the DAA process is completed, return MCONFIG.SKEW to its previous
value.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 952afc75f6e4..774f94ee761c 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1169,7 +1169,16 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
 	}
 
 	spin_lock_irqsave(&master->xferqueue.lock, flags);
+
+	if (svc_has_daa_corrupt(master))
+		writel(master->mctrl_config | SVC_I3C_MCONFIG_SKEW(1),
+		       master->regs + SVC_I3C_MCONFIG);
+
 	ret = svc_i3c_master_do_daa_locked(master, addrs, &dev_nb);
+
+	if (svc_has_daa_corrupt(master))
+		writel(master->mctrl_config, master->regs + SVC_I3C_MCONFIG);
+
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 
 	svc_i3c_master_clear_merrwarn(master);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
