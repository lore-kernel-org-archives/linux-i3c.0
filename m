Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C212C282D3
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Mar 2025 05:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19sYu8kNNP4n6TDZL5JPXZbb4an5nrFMcmu/5eznU+w=; b=2Qc1bQLX7788gW
	a3IehbQJY7fIsHbVof1wlDNeC15Up49JPLU94ioLG6nBWvYNDLsn0r71WpZKJeNfxYfUpMq+8h50J
	DwMBrILra7R6E0biMYdhRhiM2edZi8LbscKnjr+j0nZ+mduecKUAJU+bFFbBE98EfKEYUUTzY9tGN
	OO1LRD92pkC8RIaDVJDTtffR4qq4fmLvmLqbASFkcbhEW1okqKvxsWIjl4cPvpG5TxQefpVWDV+36
	zsRlnV4BikMn5mwq0iuM9L5tDGOj6H42mhRxjDkDFX96HNnwDdH/7zeUxZ0l5WgQf7L9PWRWaVV/x
	Y0L9IK98ntU9XnVtzc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tphnN-000000074lD-0IuS;
	Wed, 05 Mar 2025 05:59:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgi-00000006u0a-1COh
	for linux-i3c@lists.infradead.org;
	Wed, 05 Mar 2025 03:44:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22355618fd9so109698895ad.3
        for <linux-i3c@lists.infradead.org>; Tue, 04 Mar 2025 19:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741146291; x=1741751091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSYH5+SwcmtCe+p0n+lRYfrltYt+gVN39RZaCf2MCi8=;
        b=S26khqbnSdVzE0X42/KxyCDPLhICYaneOUhxZ6tBqBPS0h5lfe/ItJBFpSbS2PV9FE
         XdQR97WsUK3LOdECGs75bp//6bxvbfjZ2Kndem1xZIl2UEOmkZBtIcjY3G+YU6pI27Ze
         FdKV4dxcC1ouyo08Bm/6sTwAaS+NVNL2bQXA7C8ZybxebhMoqPyY+jOL4aM4BOOnflkd
         z3MZFD/AFZqNBf5PbT8gDdVZLEV7s2GiZwrQTHYQGzahiVqjvPymleUzYUjFyrid4fvQ
         GYU5QDh3Jtln+xu8hoJmgd0gAMcJo0/Bvr0VlY4xPKez1rGC0XVahYwHEeW2fb0h0236
         /3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741146291; x=1741751091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSYH5+SwcmtCe+p0n+lRYfrltYt+gVN39RZaCf2MCi8=;
        b=IqFkVsqZzJ+F3OE7dddRmGObSbAzpMvagg0UgEtGzolGmEyyTePFx+2lvKi4RUDVMl
         EA3MqBwhFNwgWqEIUn659t1sKJYp84K9KDGh/dPDoApMmt6On2Y4fSOAPH13d6TB7BbI
         YlY+rfiYi6vYphE7ZcuWHLZjNsMnM3NcrGX0O+CDoHwbMrcsEZgKsmLHlzb97GLNcWQa
         mzuNU/rq8plhYqrDxTtMk+vRY5xh01usyFUpT5+KrMeGfsuq5GM9xPsZSrYxV+kGNfE7
         yON3zUvI95GKa2pQjNfKHkeOnLaJPZ6jia0YBXq/jxUUuDJpUyYBeI96Fp7N5RkNabIg
         GuSA==
X-Forwarded-Encrypted: i=1; AJvYcCVUE9cYxzRj13J9YX5mnEjYq61eY2eiFzb8BhpbruYqiE+/6WaLjIXMy2VHc23OwrwaOHK16A9+6qs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCmCNCzZ4mjaS7GSr/2ftKPv8qv8kNYfU4M4vjI3iat3a1pIn2
	aMzCs4kmhxLmUR8IffarQo4A+wYD44PvHlwe2f7Fdz1Q0Mkg7PLg
X-Gm-Gg: ASbGnct9HM/sv8+8/I6fkik9CPOD+qgzahQc+12MCGFcTlflytkm6w8qiQGs0hoLphZ
	dmG7qJ7NuZoPw+oUTY2I27Ox7WeEAiyHPbhThZW26irUg7XBKQppdr4lu4nUbT3u/CjhF9onW2x
	6Kni5wVAK0dySeHfUc2IywRqoMnYMj9SXHDgN/M6HQ6nzhFeyvbJM3Af0PZ0WMFBG2Gp+4TJlgg
	QwQNVj+1hbEpzDF4hosNazcDTaVhVl/CeiUG3k3PTHXwdyo0Ipy1w3Cda1z22U966Mc48coQ1Ix
	z05nlOcuCQmRvYPStXpCkQ9PbbQdHczM8E+s3FkPhsd7KStFBsXGZeM=
X-Google-Smtp-Source: AGHT+IEY/W5EzK2xQM9ApeNVjlE0dvEXpH3lZiSewWlXGQlloKZ5FWhsNbQOOWfviYkdHfIw/kEpyg==
X-Received: by 2002:a17:903:11c3:b0:215:4a4e:9262 with SMTP id d9443c01a7336-223f1c6af8fmr20720365ad.8.1741146291089;
        Tue, 04 Mar 2025 19:44:51 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c37sm102734335ad.133.2025.03.04.19.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 19:44:50 -0800 (PST)
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
Subject: [PATCH v6 5/5] i3c: master: svc: Fix npcm845 DAA process corruption
Date: Wed,  5 Mar 2025 11:44:14 +0800
Message-Id: <20250305034414.2246870-6-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305034414.2246870-1-yschu@nuvoton.com>
References: <20250305034414.2246870-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_194452_331065_CEC59CB8 
X-CRM114-Status: GOOD (  13.19  )
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
index 5c29912e0a69..df7eb038c6c9 100644
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
 
 const struct svc_i3c_drvdata npcm845_drvdata = {
 	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
-		SVC_I3C_QUIRK_FALSE_SLVSTART,
+		SVC_I3C_QUIRK_FALSE_SLVSTART |
+		SVC_I3C_QUIRK_DAA_CORRUPT,
 };
 
 const struct svc_i3c_drvdata svc_default_drvdata = {};
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
