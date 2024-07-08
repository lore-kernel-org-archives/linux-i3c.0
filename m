Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F2C3271E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jul 2024 06:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ae3GDkmRIgh8DXczWUkPDtl7vOihaM79g1JrrD5MQlA=; b=Hn1XVErCtoLQTMAAIqjGjNwjnS
	uZajRMw/gszS7tOFsSYSCNXuS1iH9m/HxoE8NYlYWaUtvv9l3NYT1hD7V0A5mt0ydH496G1Dl0NuH
	viTvEgPJ3YybcxhG6X/k5aC6XyLZx9JUggUgTtip/esDMTAToKn4zDObEesRWmDCX1k0irQflKp2x
	p+MVSrgj/UXKRnTcCujCQ0EJQW/w5n8UgrosQS08VFLR9EhoMueZNkrOHvEFJ44ODt9EKrTZTn44N
	zAhI87+PwAxXhqjkWKSeszRZ/JDMb+IUhETsCMfgFAhovTn4QHoRxRlYvIOP8O3cv0jFPtNfQLtt1
	gZ5M3hvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhkW-00000002rMo-21ct;
	Mon, 08 Jul 2024 06:21:20 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhkU-00000002rLw-0TQD
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jul 2024 06:21:19 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fb90d7a4c3so2566675ad.1
        for <linux-i3c@lists.infradead.org>; Sun, 07 Jul 2024 23:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720419677; x=1721024477; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JBFBYt9OaLc4OX3uBfAr6G8BybiHmWegQe0q6D9D5b0=;
        b=B4H48boji9WlgjyTXN0HGLQgB1H1sP0N1YOBJQSMGJDSaxFpELp//Z8Fic/LpZvWfp
         O1NSCklJTpVqidt73gYSPXfl9u+onltdx1ZVXAnu1Bak+Qeb/mKys9m8/xQGuzgIUR9h
         eezcRlTFouXOyem9PptdDAQufsaI4Em4ybo1o/1PLwMbyMlhVoTu7jNqf5YlhFvUvYtL
         jtSF4818lLO0aWpnA2ttCLu0vQodpFJq+HpULO5MeGyzJP8bcO4RxVoTeDlzWS4VQuYz
         3OifE1B2tWdDjj2+ZIjeNMbsfOvEssXH4sZoReTTuM3U1TCcJkdAqB5QMBT5Ht7LMeWL
         TCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720419677; x=1721024477;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBFBYt9OaLc4OX3uBfAr6G8BybiHmWegQe0q6D9D5b0=;
        b=VpzV2ZFiPpOp2P9qmJ00Kttg7fqOeSmXYy1COucnSzCnlTRfpl3uCEmCy0M2SZ95vC
         EWSTf65hqQXYCAU7nVcrRhfPZLQYsSa2kO/j3Fhrr/kf9ODeOVzM4yEtSjnTeugKDM7E
         OsO4yd1UueBfIIXFiuxFuZlvvdQ6ENQFUQ95yU/FkhXYV00UedtHDA6vRTNbDxQvmniL
         BUk7dXYXcUCHO0ePyVKwpdcgW6H3Ve80vc2lRTl+BvoH9Mxz7fYyfRCf0tIJViUwyAXX
         4hL3QWPRcsIeLJ6jRfUJRfnHMDSRKIP/MpfR3ro2XBu0rE6jM1rruQwt/J/yjmXZJHMB
         fo5A==
X-Gm-Message-State: AOJu0YyRF8KuOiOZwpGPf94GUvoVw/oE36quM1KSJp7aunvywsTUYgZs
	/tQzNEqYdXJ8DhzLAcCfiAGepz5oWG1C+wCehdz9hwYSTPzyrPHjqe4ZyIy57K8E02ckLE/L7QU
	FswUG8YO3d7QL+BJIuSoKTDaiVA==
X-Google-Smtp-Source: AGHT+IGyxOofX5NtXwiv3RmzLQfz6C1YmxhTYd83aKt2ToUFb9JlL8B+I57wHdB8sG8W04bkwT3WNR5Ztv9XE9uNrHM=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a17:902:c404:b0:1f7:3763:5ff0 with
 SMTP id d9443c01a7336-1fb33e3d924mr6890585ad.1.1720419676561; Sun, 07 Jul
 2024 23:21:16 -0700 (PDT)
Date: Mon,  8 Jul 2024 06:21:01 +0000
In-Reply-To: <20240708062103.3296587-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240708062103.3296587-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240708062103.3296587-2-aniketmaurya@google.com>
Subject: [PATCH 1/3] i3c: dw: Save timing registers and other values
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	vamshigajjela@google.com, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_232118_175886_2DCD2623 
X-CRM114-Status: GOOD (  13.04  )
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

Add variables to store timing registers and other values.
These variables would be later used to restore registers
during resume without recomputation.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 15 +++++++++++++--
 drivers/i3c/master/dw-i3c-master.h |  9 +++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 0ca41782f3a6..fcfa37f55d86 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -543,18 +543,22 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
+	master->i3c_pp_timing = scl_timing;
 
 	/*
 	 * In pure i3c mode, MST_FREE represents tCAS. In shared mode, this
 	 * will be set up by dw_i2c_clk_cfg as tLOW.
 	 */
-	if (master->base.bus.mode == I3C_BUS_MODE_PURE)
+	if (master->base.bus.mode == I3C_BUS_MODE_PURE) {
 		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
+		master->bus_free_timing = BUS_I3C_MST_FREE(lcnt);
+	}
 
 	lcnt = max_t(u8,
 		     DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period), lcnt);
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
+	master->i3c_od_timing = scl_timing;
 
 	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
 	scl_timing = SCL_EXT_LCNT_1(lcnt);
@@ -565,6 +569,7 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
 	scl_timing |= SCL_EXT_LCNT_4(lcnt);
 	writel(scl_timing, master->regs + SCL_EXT_LCNT_TIMING);
+	master->ext_lcnt_timing = scl_timing;
 
 	return 0;
 }
@@ -586,16 +591,21 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	scl_timing = SCL_I2C_FMP_TIMING_HCNT(hcnt) |
 		     SCL_I2C_FMP_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I2C_FMP_TIMING);
+	master->i2c_fmp_timing = scl_timing;
 
 	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FM_TLOW_MIN_NS, core_period);
 	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_RATE) - lcnt;
 	scl_timing = SCL_I2C_FM_TIMING_HCNT(hcnt) |
 		     SCL_I2C_FM_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I2C_FM_TIMING);
+	master->i2c_fm_timing = scl_timing;
 
 	writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
+	master->bus_free_timing = BUS_I3C_MST_FREE(lcnt);
+
 	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_I2C_SLAVE_PRESENT,
 	       master->regs + DEVICE_CTRL);
+	master->i2c_slv_prsnt = true;
 
 	return 0;
 }
@@ -650,7 +660,7 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 
 	writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(ret),
 	       master->regs + DEVICE_ADDR);
-
+	master->dev_addr = ret;
 	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 
@@ -1077,6 +1087,7 @@ static int dw_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 
 	data->index = pos;
 	master->devs[pos].addr = dev->addr;
+	master->devs[pos].is_i2c_addr = true;
 	master->free_pos &= ~BIT(pos);
 	i2c_dev_set_master_data(dev, data);
 
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index fb7121c6c687..f23e9d5aca86 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -19,6 +19,7 @@ struct dw_i3c_master_caps {
 
 struct dw_i3c_dat_entry {
 	u8 addr;
+	bool is_i2c_addr;
 	struct i3c_dev_desc *ibi_dev;
 };
 
@@ -40,6 +41,14 @@ struct dw_i3c_master {
 	char version[5];
 	char type[5];
 	u32 sir_rej_mask;
+	bool i2c_slv_prsnt;
+	u32 dev_addr;
+	u32 i3c_pp_timing;
+	u32 i3c_od_timing;
+	u32 ext_lcnt_timing;
+	u32 bus_free_timing;
+	u32 i2c_fm_timing;
+	u32 i2c_fmp_timing;
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
-- 
2.45.2.803.g4e1b14247a-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
