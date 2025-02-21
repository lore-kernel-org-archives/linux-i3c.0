Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24224C021AA
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2025 06:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vWbY81ustA8NpLjxMOTQyOIk0ph7/latzF0mUdZmCs=; b=VJAq7q0LEqzq7j
	HWOS1bC/v8q2fXAcFpdcxEanySkFASBId3KrNUbvPHvkDmy5u15KzddTpXHOn7EorSphM6/ysyVwY
	byiSCWweuRN7/Bww0cQXaOyGpVYCyT0wQsW/Cg7aFUdHxbPOW4SeQHxwEIIhZuqfWI77KymMFf+bS
	JOsEqx6aDUOOrfqmVBD+zCWyltHpl7Whx5DnapbKU8SLPia74tZULSmmGSMKSAwTMgIGXKt96jP+F
	ItuFW09XeyVom2P/5vfKZ+qDQe17xSmt1f8btUwW2XUAc0OeJq365DQkK2Hv799Q5U6IFSVUDByla
	2QelnLgzPsYF3/n//K+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdT-00000004OOm-3DUv;
	Fri, 21 Feb 2025 06:35:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdR-00000004ONT-2bCI
	for linux-i3c@lists.infradead.org;
	Fri, 21 Feb 2025 06:35:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-221050f3f00so36974795ad.2
        for <linux-i3c@lists.infradead.org>; Thu, 20 Feb 2025 22:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740119741; x=1740724541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0UmhVr497ovNg9ejUAc8bbMw7RbeVAmmP57+q0HxTw=;
        b=kxQd+TiRuXSflHDWXau5+q8QwCkb4OjP0KtR32t2KGT4f+0uSby4dcJuYohovR6Wqz
         TxCxzUTFb59GNnNxiuq6fZRjZ9EkBBNsoZO5idC0rGFYYe+4KumuKlnAxO0nYsB8NACn
         h1dSaFAe2+loTnQ2qFwV54RgdtmYLKGMkOs75zxOVvaWuSW8r0Ip68MYWcQ/BLCuuiwx
         M8L91f/YiDJsKk/jdbUPw7/Xwo/Nz7RVQWuf+uHRYq3SefURc/8nhCg9AVe24/xqeyxA
         BngChLJ6bwpFU89gTuG/jA02aUNRNoKrt7YpgnyMbXShQjK4YBstGVeMiwmA4SqcQ0OX
         v29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119741; x=1740724541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0UmhVr497ovNg9ejUAc8bbMw7RbeVAmmP57+q0HxTw=;
        b=KqnWymAtim8ZPmwyrV8cp7nVcvc9de4Ft1UIxC9zO19iH5QGx2NrEJCA3JSPaapZWN
         YjADA+yx0iGnoTIKaPDVg3bDGTgaFROt38Ihky5oQRXY+d3U1ddUqwS8UEZARCv4d/mV
         MFuPfME85c62ACalzbKeQoh5umZosV9ohRh2Ll0+nx8vVQ9SR8vfgFMQVb4eBiAMd7PF
         gaS/3lhbMmREF0jqbk8zmJ3DXNcuh/G4ZmARtPB565DOnjPei5h1iFGT7SXGXfHdbsOv
         oidRMJOGKma+5UWYgvKRo2uDPUF75hBfie3WdG0VYQdNYq5BMOV2uw/mFOrVzkf5LXAk
         B8vg==
X-Forwarded-Encrypted: i=1; AJvYcCUsjiml+t/zCySYbRPxeTajXN1GOCTZmSFU+kUQqQFGsoUzM9ujK5B1ky8VFQo6ZHkjFpV4nnucZAQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWbxBsKqM1IGmscvmhQo2CFHgyKhbA4iMM+xfSAB7nn/mz9neg
	2ojMv+9BqsdkGrGC0GZVZTLOsNvFYQrFZCMUKKIDByyf5PyzfAe3UGcZpg==
X-Gm-Gg: ASbGncsTzNA47mFUjKt0DKu17BHRckK9TZCzHS04TPTyGKnOElSHJznoFS0fmccyBjh
	FWz2jTV++nmGN4VhPmtIk6lLAXHBdvngmBdUH9lifFkI1EPkwOsxkSBDlgSVSU8KjfyICI33PoQ
	mwScd9UW42ijqfxWj5hxq4SHYQDfiDpbrolBv2OP5NzlpAOGEkh9TzUkI+TLWXe8reIENpQiFgJ
	nalv4s/JtDwaAZcd+rjP4LgAFCxTSBQM2Mmr+oiZU2iaHl6FDBlvo985kEkj3UTen/StYE/wej5
	zG1spBjC71xJNNvT/ewBhyU32uhirDLGEPt0
X-Google-Smtp-Source: AGHT+IExk4fm0MpazRHrquV5b4b+qLPghd14iv0oO0qS+yk53d9y18NJGOOCf2qnXgXgyqH2xQdxBg==
X-Received: by 2002:a05:6a21:6b0f:b0:1ee:c093:e23c with SMTP id adf61e73a8af0-1eef3db70e6mr4214308637.41.1740119740736;
        Thu, 20 Feb 2025 22:35:40 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5dc68sm13777275a12.9.2025.02.20.22.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:35:40 -0800 (PST)
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
Subject: [PATCH v3 2/4] i3c: master: svc: Add support for Nuvoton npcm845 i3c
Date: Fri, 21 Feb 2025 14:35:26 +0800
Message-Id: <20250221063528.1810007-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221063528.1810007-1-yschu@nuvoton.com>
References: <20250221063528.1810007-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_223541_661824_28A32AAE 
X-CRM114-Status: GOOD (  13.86  )
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
Add npcm845 specific quirks.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..1e7e3e1f3d22 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -133,6 +133,22 @@
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
+
 struct svc_i3c_cmd {
 	u8 addr;
 	bool rnw;
@@ -158,6 +174,10 @@ struct svc_i3c_regs_save {
 	u32 mdynaddr;
 };
 
+struct svc_i3c_drvdata {
+	u32 quirks;
+};
+
 /**
  * struct svc_i3c_master - Silvaco I3C Master structure
  * @base: I3C master controller
@@ -214,6 +234,7 @@ struct svc_i3c_master {
 		spinlock_t lock;
 	} ibi;
 	struct mutex lock;
+	const struct svc_i3c_drvdata *drvdata;
 	u32 enabled_events;
 	u32 mctrl_config;
 };
@@ -230,6 +251,15 @@ struct svc_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
+const struct svc_i3c_drvdata npcm845_drvdata = {
+	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY | SVC_I3C_QUIRK_FALSE_SLVSTART,
+};
+
+static inline bool svc_has_quirk(struct svc_i3c_master *master, u32 quirk)
+{
+	return (master->drvdata && (master->drvdata->quirks & quirk));
+}
+
 static inline bool is_events_enabled(struct svc_i3c_master *master, u32 mask)
 {
 	return !!(master->enabled_events & mask);
@@ -1868,6 +1898,7 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, master);
+	master->drvdata = of_device_get_match_data(dev);
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, SVC_I3C_PM_TIMEOUT_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1960,6 +1991,7 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 
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
