Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A28DC282D1
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 07:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vQWPPhdJqHRqxHgNJKKUVlsdf0dr7nMT5io1U+1gxw=; b=aYnwx1YXPc4fZH
	b92qGy+2X0S8mmvYAvOZ+M58zRc+UF53zoorEcYJS+VBAhkdGEFSQcOr79YfJaBLofOZKdaWez2xG
	eBTEc/ly5l4XIx16MEP0sXrFjXRJa27/8FKsdg76r/tHMwzt+Jtsdqf4l8wSc2V5Pt0XFEqVFxhFu
	J+4PPHN2+3ZoB1o+5shYSY+bDE4jRd/7WPiq7e4C9IIgM4724e2F9O6cW+ruHG9nVRUBHGx4jHAVF
	w89QAB/TdO16yTnewwEIXuCwKRWPZb2aojtD7Ab+MXtw/E5GHOK1QEdR1HPU91AgeKKu3JXwPDg/G
	qtVC9RzFRfLetm/M23ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq64z-0000000AGOx-1Cwe;
	Thu, 06 Mar 2025 07:55:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq64C-0000000AGD0-2hr9
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 07:54:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223785beedfso4760285ad.1
        for <linux-i3c@lists.infradead.org>; Wed, 05 Mar 2025 23:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741247692; x=1741852492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeHU0+uQ+ewEIetG9U1VzF4scs/x4AYkl7k9gMV2eYc=;
        b=YowC+KBlQZdJtvnkJpOOjgxHJY+gW+c6cRGXkqSCIH08j7E0EYLBDbCQSitfwwHTdU
         +jVWB/xrrw/oxC13sWGuc1dvXn4QX94zzvnCAQz2aAs+ldrPdO5UcSfee4hec/6QpuLX
         lYBiYLhE+aCB+s7mlm5O0GT0fU69GTqohr9mb905GqjTziu/5XEnd+QsFiwHQNlc5Zxg
         lNa01YIvzaOZkPlWckgPOMv1CuqILQ/yhfFQt4IQrAw+IjVFBnPEJgiJfyUX0BAZjqa/
         T9DY4GduukupslDEaJGrXmliWH9HS80lBmgEZhfxAYUXFswyy+UsX5z7u3q4I7j1RlpR
         WOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741247692; x=1741852492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeHU0+uQ+ewEIetG9U1VzF4scs/x4AYkl7k9gMV2eYc=;
        b=AXQqFoKJ7DX93mUMSmcolWcuqQIgHR3YnbjLpFgeYE1+0B6yc4+vVa0g06bE8tVxr5
         zCYxwCUwECtRsWPOkJv7IWQ2lm4/+aNz3S7FSKUSYZnS6x5FSsbSXDSk5JhtsmtyuSZ2
         dQsuf0dm/pSuNTfRYkcRwBug/6ogO5UfiGG4wckNwrF+NCVZWd9B3hVLQgY+aENN0ULl
         Zvo4zHQHHfdjDMBxfxmwYyhWqaMOgFC+PXUln0uENBmc4/zAG+ItE2LW0Ef8EjvGbOoZ
         Ets67jzYZwfZjtmmw+JES/nRviTQNG5H3UmDa/WqbCBzPD+jIKrQi7S+/ksN8WPYH2oi
         zzMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2CMUr8Wb9GQnWU00J53LSO1NXGuf/GcWkJzL1JQhk0Cni1qSr5KXw5Ckg+HZbja+pTkGuDAkj5gs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRbjPLkg4tKjneoSb85+DmYG5yEtZ1e9OnNNgTRAivm3pneNTb
	JFVYrjB4ze2kz8LjQMynlzLu3lx627COks4Zo621VZP7SaOTwWC0
X-Gm-Gg: ASbGncv3xddOjV9V8ciQ6A7LY7fbmwi5FjitZwp9+phYVH4vBJ1j2INgCtgd6u+nJZG
	VePCPgOOXAH/6/CEwZeiDX+Abh4JUDS8pd5EzydSlE39jhDPqUuDhWcLnx1YCnz1rEV2euyR3G/
	reVFIa13paPne/+rzl0qtTMLsiT/N+wFEAPpQhIPOV7ySFJR0g/KIJw0uhd07rSvrC97nKowm/U
	ec4R90aj1LwXO/hM9TpOjpbVZe58cuD+AEvsxsAGeHUvt9AUgrswmcXaCXJCDel1VrMLlN8fX6G
	PmdmG8CjJzPOTlHzDbe8tHaGtp/JSXLfE8YfaVO+7PLiYc5R1gWCriU=
X-Google-Smtp-Source: AGHT+IGNTTEhiHJu3DzwlvrowX7noAbEyvQn1CqmoH1Ut3T89pAMQ/uSrN2Xy6F5yWg7r2FyzlOwew==
X-Received: by 2002:a17:903:fa7:b0:223:5525:6239 with SMTP id d9443c01a7336-223f1d0fe68mr106221875ad.38.1741247691779;
        Wed, 05 Mar 2025 23:54:51 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa448dsm6085485ad.210.2025.03.05.23.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 23:54:51 -0800 (PST)
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
Subject: [PATCH v7 5/5] i3c: master: svc: Fix npcm845 DAA process corruption
Date: Thu,  6 Mar 2025 15:54:29 +0800
Message-Id: <20250306075429.2265183-6-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306075429.2265183-1-yschu@nuvoton.com>
References: <20250306075429.2265183-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_235452_708195_5B04F9B3 
X-CRM114-Status: GOOD (  12.18  )
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
 drivers/i3c/master/svc-i3c-master.c | 30 ++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 1cab5b8594de..c086e0e38279 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -32,6 +32,7 @@
 #define   SVC_I3C_MCONFIG_ODBAUD(x) FIELD_PREP(GENMASK(23, 16), (x))
 #define   SVC_I3C_MCONFIG_ODHPP(x) FIELD_PREP(BIT(24), (x))
 #define   SVC_I3C_MCONFIG_SKEW(x) FIELD_PREP(GENMASK(27, 25), (x))
+#define   SVC_I3C_MCONFIG_SKEW_MASK GENMASK(27, 25)
 #define   SVC_I3C_MCONFIG_I2CBAUD(x) FIELD_PREP(GENMASK(31, 28), (x))
 
 #define SVC_I3C_MCTRL        0x084
@@ -150,6 +151,16 @@
  * If it is a true SlvStart, the MSTATUS state is SLVREQ.
  */
 #define SVC_I3C_QUIRK_FALSE_SLVSTART	BIT(1)
+/*
+ * SVC_I3C_QUIRK_DAA_CORRUPT:
+ * When MCONFIG.SKEW=0 and MCONFIG.ODHPP=0, the ENTDAA transaction gets
+ * corrupted and results in a no repeated-start condition at the end of
+ * address assignment.
+ * Workaround:
+ * Set MCONFIG.SKEW to 1 before initiating the DAA process. After the DAA
+ * process is completed, return MCONFIG.SKEW to its previous value.
+ */
+#define SVC_I3C_QUIRK_DAA_CORRUPT	BIT(2)
 
 struct svc_i3c_cmd {
 	u8 addr;
@@ -259,6 +270,13 @@ static inline bool svc_has_quirk(struct svc_i3c_master *master, u32 quirk)
 	return (master->drvdata->quirks & quirk);
 }
 
+static inline bool svc_has_daa_corrupt(struct svc_i3c_master *master)
+{
+	return ((master->drvdata->quirks & SVC_I3C_QUIRK_DAA_CORRUPT) &&
+		!(master->mctrl_config &
+		(SVC_I3C_MCONFIG_SKEW_MASK | SVC_I3C_MCONFIG_ODHPP(1))));
+}
+
 static inline bool is_events_enabled(struct svc_i3c_master *master, u32 mask)
 {
 	return !!(master->enabled_events & mask);
@@ -1144,7 +1162,16 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
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
@@ -2031,7 +2058,8 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 
 static const struct svc_i3c_drvdata npcm845_drvdata = {
 	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
-		SVC_I3C_QUIRK_FALSE_SLVSTART,
+		SVC_I3C_QUIRK_FALSE_SLVSTART |
+		SVC_I3C_QUIRK_DAA_CORRUPT,
 };
 
 static const struct svc_i3c_drvdata svc_default_drvdata = {};
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
