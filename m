Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B3AC282DE
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vn+nav1VYQ4DY4dK6OROQOetMCJuviPLJQ8bBSTTxjE=; b=KnYYi1sATl3tzL
	M4/bIdEBVRGBOFXkzxE/Ajqq0L8TBAN2MYAncvj+HD6dpCVJqzYuNovcKvs0TYii96V1itBZ74p/+
	dEggsdpmFPRlkQ+i+gg4dUO1ROiMIAExjXeWp1PmgbBhDKaGtzYAwI2MG0z8JF3UsxSe4A+qmhKGY
	JyObmd3elef2DWHZbFaOKMHsYtOgHXKgoBrVhHVsIN+4mtHTAWLBINnaNMnsNq4MZj1Tfl6WuV8mK
	I+37nZLmmZCTg21SG58h3KjA16lQc4IyBvYCV/SQPKEVEs8o3QMPuOrihlg9tGgy/3FKY14duUewI
	tBThE5ExWAbMok9htl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq64x-0000000AGNc-2eFJ;
	Thu, 06 Mar 2025 07:55:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq643-0000000AGAR-1Nza
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 07:54:44 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22349dc31bcso5006905ad.3
        for <linux-i3c@lists.infradead.org>; Wed, 05 Mar 2025 23:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741247682; x=1741852482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z+sL0RW4cJTOyML1J6fde/KORBWPqtZnRc7ageiDm8=;
        b=Lzw+Yx2XZer7Ze6/XaTa6HEIgXXrvMwPrDrBnxvM6tZGhq9SP5mSFl/LS/DldxaYvI
         jjdhvb+EhC52WLvXaM8vw7XDOYSUdRIYYSq+c88gkOrfHsmcCNMoR7JK6lsOzHsYpXdd
         6wjav7kZwYKb7+eWwfoxSZr65xe42rMLDLQ626qrGkBX6vm/pXggrnK5816I1VB/kxU6
         /JhUMd4ZkFlRcz9FFyOQt1gew2uhv7ODCsgojXQ+p4+r/r1jSPH0t5RI112WZXq5AYnk
         rIvZWfxsdRkgIIjVtpm6BnTkwG9iT+28Oxy15hLQP4ehw1y2Lv4BSqQPnSUXAwli/PCq
         ZMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741247682; x=1741852482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8z+sL0RW4cJTOyML1J6fde/KORBWPqtZnRc7ageiDm8=;
        b=rXB2MbGAcCG87Br0MdhKxsOD2epFY7apiOAk9XmGyoHb+ar8eFjEBEX6fvBs1tzQF2
         wjDWJqg5x8LSUJtOhbwTuTYJAPOZ3wPmnLIWpAy9f4tLAbr0GnkTG1QEl9QtOuJaGusU
         wxZ5+y3p4z6Sm5mzoeA93C5H0gCTot3e3myV5Hx/CUtvG4Mcl1L4gMd2rq8pLXumhV5z
         IGdp4PM7rWHArl8JAsXi+sIWBdDN4rqJllCsf9s7HDSjt0wxociYoDK636KFr50+ApEM
         PIcruH4SL4kgrrAYx+0laSAVC6JxU1Ilf5FdJIfV4rVyTwerg7oRvwP4cxmNiu4ZdOo3
         R1jA==
X-Forwarded-Encrypted: i=1; AJvYcCVISKgnxmfWVpo9zHugLDTEp49Ehp9g+J4ozj7MDiVBXRLNJUokoHv1uyXIrifLU3gqRaKXSxCy5x4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0jYOPiZpbbxcBpHUEfqj2CEcKhiVWgacT7OqcTi3RYzzx4dHq
	mZHWsW9BZmCnXb0gHhvpkVptHlx4f+PCi5QkDGicSpoqmQaxtaE9
X-Gm-Gg: ASbGncu+IUAA9UxvqQ6HuKbqmoCCaBKOi22dNY6Hko0jKxp7gBGMWxBcVS+ITyt3wBT
	leDdPSGCVBzBmU9dtgMgptJkTa8wbSz8RFaJ/W6O2gTZ2BmdLaqHdDTjLZaK0dbYRu9zZv3Wi1q
	sa7WFCnW2ks39T2R4WraYGb8yil+JjOc3SCg/J1kP8da5pfjqNb/PxRbZXICjnITdKvjtW+RaRk
	Jj9sIGO8DnfedCWd4oBYiqspE1InuCSJDHUEivBuN+NZ7llrrXbZPK3VbTw+V1E5aBiYztyKpUp
	9y4I18jijTE8W0bW9/y6VtDAOrwcIJrW3xXy0isnMWniSmrNs0g0EB8=
X-Google-Smtp-Source: AGHT+IGXAIOce42vV0eof1Rl6r+EywEWrktnOVXaG5lMZQPu7G/rBfveA9yLXalq4mL2qutxXfLdqg==
X-Received: by 2002:a17:903:230e:b0:223:3396:15e8 with SMTP id d9443c01a7336-223f1c81638mr107329295ad.22.1741247682439;
        Wed, 05 Mar 2025 23:54:42 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa448dsm6085485ad.210.2025.03.05.23.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 23:54:42 -0800 (PST)
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
Subject: [PATCH v7 2/5] i3c: master: svc: Add support for Nuvoton npcm845 i3c
Date: Thu,  6 Mar 2025 15:54:26 +0800
Message-Id: <20250306075429.2265183-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306075429.2265183-1-yschu@nuvoton.com>
References: <20250306075429.2265183-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_235443_409915_ED275150 
X-CRM114-Status: GOOD (  12.93  )
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

Nuvoton npcm845 SoC uses an older IP version, which has specific
hardware issues that need to be addressed with a different compatible
string.

Add driver data for different compatible strings to define platform
specific quirks.
Add compatible string for npcm845 to define its own driver data.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503061400.GGr64rkR-lkp@intel.com/
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..40269b692aa8 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -158,6 +158,10 @@ struct svc_i3c_regs_save {
 	u32 mdynaddr;
 };
 
+struct svc_i3c_drvdata {
+	u32 quirks;
+};
+
 /**
  * struct svc_i3c_master - Silvaco I3C Master structure
  * @base: I3C master controller
@@ -183,6 +187,7 @@ struct svc_i3c_regs_save {
  * @ibi.tbq_slot: To be queued IBI slot
  * @ibi.lock: IBI lock
  * @lock: Transfer lock, protect between IBI work thread and callbacks from master
+ * @drvdata: Driver data
  * @enabled_events: Bit masks for enable events (IBI, HotJoin).
  * @mctrl_config: Configuration value in SVC_I3C_MCTRL for setting speed back.
  */
@@ -214,6 +219,7 @@ struct svc_i3c_master {
 		spinlock_t lock;
 	} ibi;
 	struct mutex lock;
+	const struct svc_i3c_drvdata *drvdata;
 	u32 enabled_events;
 	u32 mctrl_config;
 };
@@ -1817,6 +1823,10 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
+	master->drvdata = of_device_get_match_data(dev);
+	if (!master->drvdata)
+		return -EINVAL;
+
 	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
@@ -1958,8 +1968,13 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 			   svc_i3c_runtime_resume, NULL)
 };
 
+static const struct svc_i3c_drvdata npcm845_drvdata = {};
+
+static const struct svc_i3c_drvdata svc_default_drvdata = {};
+
 static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
-	{ .compatible = "silvaco,i3c-master-v1"},
+	{ .compatible = "nuvoton,npcm845-i3c", .data = &npcm845_drvdata },
+	{ .compatible = "silvaco,i3c-master-v1", .data = &svc_default_drvdata },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, svc_i3c_master_of_match_tbl);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
