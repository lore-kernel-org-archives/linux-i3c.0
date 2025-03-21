Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F41C36000
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Mar 2025 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sA+f68gstgWcK+vLIy35TzPUcRW2aKuCHCTEOHPnc08=; b=AR/KgkTgJfU6mU
	kB8Rqf4yQgzeTMI2QuBkKBt0+HcaA9SCL4nlngBtmtXF7wmRCZC7tDIjMCdROiLiMDIgk3HMonVHX
	YqlI5KTkW4p5NckCTl4TtXTANuGOA6Ye2KeEvysGvYTmTshgtP0pvwI8z5F8zz9Oteup9LVWihOZO
	MGHsVsgPFWGpL34iCeiCVRzylJ/ZTRpmoAdjr0oX80rWSDJrxEzx7rPNvCHmtYd6IvHwkszmx3SEl
	saF9KNsQY7cAYekM/sIGzMY1CoUE9pFIH1yqq6OuLPy/ENIRW56+qKt5zdrBdHrITgcTsdyDKadK6
	D0PpQATsEep6Xr3+J4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvi07-0000000G2PI-3PY6;
	Fri, 21 Mar 2025 19:25:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvi07-0000000G2Ox-1JT6
	for linux-i3c@bombadil.infradead.org;
	Fri, 21 Mar 2025 19:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=imBDIQaaCuI8GepxVyQR7RhmxO0UV5gN7ZiAIEUCXpM=; b=pSk3vUEpxKtw7YG8YyVjqSyZqG
	GJkvisLGay9BXXqnSUweJjjF5g7/1p26rJpP/2+VflRfK2ENI5iZUpqzSODSm5PsF0uIIWCCamZIy
	IOHVOQCep344iH+iMiesN/rE2bKu4ohrTgK1hWu3PJbDXbmwa0lrCMpAoDMGEqsXJGHl4rmhOTOO4
	0PpvAvoV4oVrkJRywBbyw04284620f4Qbi6F8J7sOkIrwWTtP+AipmkDFZik5GdGFY4AoQ9IosYFW
	6CjTdPziHyf0iRIEBFnTIJ+/j8HaelLnj5mEX9H5QsVVTOWMQ/sEhOMM1brZUKzftXugCeXPpe+bI
	sckefdvQ==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvi03-00000004WGL-2Fgp
	for linux-i3c@lists.infradead.org;
	Fri, 21 Mar 2025 19:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742585147; x=1774121147;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3IuvYQyG9EosyVBfW3oIksk9W/HDKCe373SOs77IIVw=;
  b=Iw0Jl8d2S+NBc2d6mAlG7uJifJiuOHO9m78YShz3+gQ9u7k2r8OoR/LJ
   VUPMImYjEjpi6LkaDe1bOoGePQ2+sHAugd+NFVMnyoDbIJYAxE7bCRHiE
   8vbo5o12/ICOzMhlktS4J98jyjJQ43BI5+ZRZZMyJfNay6tWrDPATOVTm
   cN8uQaqXbx2nBSB+GSIJjNOFxk+cDTNet1lPCUE8Glnfd/hYGBxaMEIVG
   6O7avROmJk3wFVOJHfCXWbP1Ac+FKF2EKcuS5LG4uwLj96cfU6o7ohZRd
   9zYTTKJOxvsDxVAfF1deiBdkwqDzHUMh2hbOhvHDLHd3kztsO+DNqlgPQ
   w==;
X-CSE-ConnectionGUID: UcO+XtWXRiu2TYa8ZWNEcw==
X-CSE-MsgGUID: EgdOe2ImQKm0JOlTgtb+sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47520359"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="47520359"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:25:30 -0700
X-CSE-ConnectionGUID: d62vawfxQ/iwqt0Ny/r06A==
X-CSE-MsgGUID: IAkKrnsEQFqqF5BqDDim2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123945194"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 21 Mar 2025 12:25:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 909A014B; Fri, 21 Mar 2025 21:25:27 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i3c: master: Drop duplicate check before calling OF APIs
Date: Fri, 21 Mar 2025 21:25:26 +0200
Message-ID: <20250321192527.457324-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_192548_056809_745DA1CD 
X-CRM114-Status: UNSURE (   9.98  )
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

OF APIs are usually NULL-aware and returns an error in case when
device node is not present or supported. We already have a check
for the returned value, no need to check for the parameter.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i3c/master.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d5dc4180afbc..1580e2630dfe 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2486,7 +2486,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
 	struct i2c_dev_desc *i2cdev;
 	struct i2c_dev_boardinfo *i2cboardinfo;
-	int ret, id = -ENODEV;
+	int ret, id;
 
 	adap->dev.parent = master->dev.parent;
 	adap->owner = master->dev.parent->driver->owner;
@@ -2497,9 +2497,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->timeout = 1000;
 	adap->retries = 3;
 
-	if (master->dev.of_node)
-		id = of_alias_get_id(master->dev.of_node, "i2c");
-
+	id = of_alias_get_id(master->dev.of_node, "i2c");
 	if (id >= 0) {
 		adap->nr = id;
 		ret = i2c_add_numbered_adapter(adap);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
