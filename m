Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF37C021B5
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2025 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGJkRFVwx13TInp56RReDicXXS/L+WeNVKTDuth0p0M=; b=Jm7iyukuvkGS2d
	H8o93yucIjU1ppfy6H35wkJHNlF9eaHYAsbaKbSaNPV8+Hgxmd+8id7NnpfRr7CqFn7DUFlhW57lj
	9e6hpA16vN8Lm8FWpAJwiWrLhRPcUntkDU/x1NDrhzeYtbX6IaVaBlcbHPuJK38ggBdedL+Nrdx84
	76s6augZayNFCvLD9D+ebRR9DVlBvFukvIchy8GLIQ4CEtXbKsKqpVNl+KLDCrsG3RGxv8AvZbS/k
	bo6vQ9iPP5BFvuau97/ULNTbF+kcH68qESbTnalLZ2sNZwG/LPOvvZTh2wipY0c7Bigto5jjNS4rL
	nuRCRJqsxaex/+sRqYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUJO-0000000CnLO-2UJp;
	Mon, 24 Feb 2025 08:59:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU0E-0000000CjPv-0vyh
	for linux-i3c@lists.infradead.org;
	Mon, 24 Feb 2025 08:39:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2212a930001so111487185ad.0
        for <linux-i3c@lists.infradead.org>; Mon, 24 Feb 2025 00:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740386390; x=1740991190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2THBoMljTsJt94BbNpCp/YTgHXkT5f9Tt/dpOHOy6U=;
        b=BGMCqAcd35SooxupDTGtqg/mgJt0KaEG/FyAcsBJQn7NRVRzSZ+sqHz48RS+vDUV48
         HE9yDUxoz10cmrABTDwIXu9PqALMuMJC54joO9Ks0LVG10L+oqzP5HtaG/5i0TM2xWnk
         J5UQ7tooQGMnUAin2mC73EFP7e0fNYzuKzl9km7HWqOWq8GhzfrsqK52aeQmerhkUO9F
         639ZbDgRAOBWMSV9//qlKZC+Gdx/k7A0eIClTGwL08z/yhk8xes0m39H5xMVtG4vsepp
         9lfFKsWPIBNzzYvI7YsUv45TgV+HG3BtEnAsG9hp7qDYNjOLezDlc5KOqzEP/GgcQJYT
         Nipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740386390; x=1740991190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2THBoMljTsJt94BbNpCp/YTgHXkT5f9Tt/dpOHOy6U=;
        b=DsfS4hU6/oCfuLBXx3BuhTSatQuFI/klKHNurBZE90Ic1TXmShTd2wtfd8RrRJv+aI
         jpjHpqWOFL3RqSGlwzZqseWAbtGi7kioPJN0zB5DENp7rYuIzkMNK0L4/SoFKzvb9+Su
         RDAQ4fxTaoPqfZnSH69XmpjHxWoQkPOmIhLpxY1Qe8MKh0gZ6rSRsZUnPYADNxUehBK2
         mgJ57cnZHKbX6d51Ya0GbF8Br5RlXYtdNor177ytibWl+vkQujHv8Or3oMmVULvDNyyx
         DS41yPKfWd/X1sBSI2GHm1JJw9ZjewfD8y73LJJSkaY5OVDZvHB/bDZ7UAnARw0GxQBX
         0low==
X-Forwarded-Encrypted: i=1; AJvYcCVUF+Z4qgaWHmaRZHS/+78YuJXsxK5ziMZIZwZ+NWHgILz7jAD/twhLh0zB9Q/2ldmFGLIMSCyqpx8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtCIZeoIrsNWsCsUwk0OJxPj/YYb8al3fxReRnATkrwAUkjozz
	oJGgfhzKCGn5pOfoUfehoQE2naHHCjlFvgELq+yVfyakm9TPTpat
X-Gm-Gg: ASbGnctgmke7g/arBZM3oKWBM1p85rcoQvygXMukygr0I9eT56elaewrMSrGQ6MV+LX
	EFkehjDEu9Jwhb6IRTlSgvU/A6FPQRqlyoMw6ZiAE66zsVDEuELX0OADgbwYb2ddPSSJFwblHqx
	9hnrSjXUpSYoMppV5jcEo7d+9KIdyAXul2IHAG72ZelGsnVY4/mFrMB4M2j+j/wRAJRjJrohzUw
	ScUdQsAR+gjp1z8rzfkPCG2o/+FJLQGjPFQW1tJ3mtSkK32jyvtbFQa2SkFh5Lnfg3OfVD3HrLq
	68HQeMvmDa7CKWdpc9IBbmIzVZGZYav2q8FQ
X-Google-Smtp-Source: AGHT+IHPyq8u2np9gCVs9VjWgMl09L8z2ydAhriEM3Mo//Ztd8gpkj+ZbDCs/Wj2n6eQzW+dpn8+6A==
X-Received: by 2002:a05:6a00:3d0a:b0:730:888a:251d with SMTP id d2e1a72fcca58-73426d9ee22mr21997073b3a.20.1740386389638;
        Mon, 24 Feb 2025 00:39:49 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327590ff12sm14634793b3a.115.2025.02.24.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:39:49 -0800 (PST)
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
Subject: [PATCH v4 2/5] i3c: master: svc: Add support for Nuvoton npcm845 i3c
Date: Mon, 24 Feb 2025 16:39:05 +0800
Message-Id: <20250224083908.1880383-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224083908.1880383-1-yschu@nuvoton.com>
References: <20250224083908.1880383-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003950_285140_ECD6960A 
X-CRM114-Status: GOOD (  17.58  )
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

Nuvoton npcm845 SoC uses the same Silvico IP but an older version.
Add quirks to address the npcm845 specific issues.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 56 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..8834f87a4767 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -32,6 +32,7 @@
 #define   SVC_I3C_MCONFIG_ODBAUD(x) FIELD_PREP(GENMASK(23, 16), (x))
 #define   SVC_I3C_MCONFIG_ODHPP(x) FIELD_PREP(BIT(24), (x))
 #define   SVC_I3C_MCONFIG_SKEW(x) FIELD_PREP(GENMASK(27, 25), (x))
+#define   SVC_I3C_MCONFIG_SKEW_MASK GENMASK(27, 25)
 #define   SVC_I3C_MCONFIG_I2CBAUD(x) FIELD_PREP(GENMASK(31, 28), (x))
 
 #define SVC_I3C_MCTRL        0x084
@@ -133,6 +134,32 @@
 #define SVC_I3C_EVENT_IBI	GENMASK(7, 0)
 #define SVC_I3C_EVENT_HOTJOIN	BIT(31)
 
+/*
+ * SVC_I3C_QUIRK_FIFO_EMPTY:
+ * I3C HW stalls the write transfer if the transmit FIFO becomes empty,
+ * when new data is written to FIFO, I3C HW resumes the transfer but
+ * the first transmitted data bit may have the wrong value.
+ * Workaround:
+ * Fill the FIFO in advance to prevent FIFO from becoming empty.
+ */
+#define SVC_I3C_QUIRK_FIFO_EMPTY	BIT(0)
+/*
+ * SVC_I3C_QUIRK_FLASE_SLVSTART:
+ * I3C HW may generate an invalid SlvStart event when emitting a STOP.
+ * If it is a true SlvStart, the MSTATUS state is SLVREQ.
+ */
+#define SVC_I3C_QUIRK_FALSE_SLVSTART	BIT(1)
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
+
 struct svc_i3c_cmd {
 	u8 addr;
 	bool rnw;
@@ -158,6 +185,10 @@ struct svc_i3c_regs_save {
 	u32 mdynaddr;
 };
 
+struct svc_i3c_drvdata {
+	u32 quirks;
+};
+
 /**
  * struct svc_i3c_master - Silvaco I3C Master structure
  * @base: I3C master controller
@@ -183,6 +214,7 @@ struct svc_i3c_regs_save {
  * @ibi.tbq_slot: To be queued IBI slot
  * @ibi.lock: IBI lock
  * @lock: Transfer lock, protect between IBI work thread and callbacks from master
+ * @drvdata: Driver data
  * @enabled_events: Bit masks for enable events (IBI, HotJoin).
  * @mctrl_config: Configuration value in SVC_I3C_MCTRL for setting speed back.
  */
@@ -214,6 +246,7 @@ struct svc_i3c_master {
 		spinlock_t lock;
 	} ibi;
 	struct mutex lock;
+	const struct svc_i3c_drvdata *drvdata;
 	u32 enabled_events;
 	u32 mctrl_config;
 };
@@ -230,6 +263,27 @@ struct svc_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
+const struct svc_i3c_drvdata npcm845_drvdata = {
+	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY | SVC_I3C_QUIRK_FALSE_SLVSTART
+		| SVC_I3C_QUIRK_DAA_CORRUPT,
+};
+
+static bool svc_has_quirk(struct svc_i3c_master *master, u32 quirk)
+{
+	if (!master->drvdata)
+		return false;
+
+	if ((master->drvdata->quirks & quirk) == SVC_I3C_QUIRK_DAA_CORRUPT) {
+		if (master->mctrl_config &
+		    (SVC_I3C_MCONFIG_SKEW_MASK | SVC_I3C_MCONFIG_ODHPP(1)))
+			return false;
+		else
+			return true;
+	}
+
+	return (master->drvdata->quirks & quirk);
+}
+
 static inline bool is_events_enabled(struct svc_i3c_master *master, u32 mask)
 {
 	return !!(master->enabled_events & mask);
@@ -1868,6 +1922,7 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, master);
+	master->drvdata = of_device_get_match_data(dev);
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, SVC_I3C_PM_TIMEOUT_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1960,6 +2015,7 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 
 static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
 	{ .compatible = "silvaco,i3c-master-v1"},
+	{ .compatible = "nuvoton,npcm845-i3c", .data = &npcm845_drvdata },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, svc_i3c_master_of_match_tbl);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
