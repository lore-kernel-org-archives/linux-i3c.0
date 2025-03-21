Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C565DC36000
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Mar 2025 20:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xpWIF4tAm6iF34+jPnP0vdcYD3tZfHmFyn73S3u7AYY=; b=Xfwrq8X76MTKQN
	Ey2oC4t28nz8ttWILBkcciC7zK6VlLX8JApssO7tmEUfmAbTRlf31lnzV8YBcYqE8s8IKgIoKdO2/
	yHetkSri+a9lB9yeDOZlAdig/kkWRfFPhkB+hGufS587n9+MKkW9+oB8Z3c1Gx8WZc+DhVBvHdKo6
	198+tclRHoJXBSczjja9jJeuj03oLkON80Vfal0uxslrntiVS5lrXyLHChsTvEYIG8OfLCo8cDjwN
	dlITlFV0kJaaOwOGcq1G64LZiszlPUazj+7y0KyA3A/QSj1PjloNGZBCUHOimWtVMDALt13pbQORq
	IGKBqDK7QqK6F1y27DVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvj4W-0000000GCBz-1aOY;
	Fri, 21 Mar 2025 20:34:28 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvi4w-0000000G2xz-2pNy
	for linux-i3c@lists.infradead.org;
	Fri, 21 Mar 2025 19:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742585451; x=1774121451;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E+DhP9Ym5+nIfAnV1TufHdck737gGEL1ECgnaI4jSTE=;
  b=Z46iuK4HRFOMTvpD8N1nK+eNZW5ZQ5Vay8B+nWV/UsTGbdmMa6iSE6lZ
   c2o6+DIBOXo2AyWoYlK5AMuF51eEN+jVEVR/qilf4dRijVe3Gsx1QvnsY
   5Md0FMfUorGZGV7aJRXpiA/hEtMBWMX4qLMMzLe5/1udCT7bB/2HVNgCP
   ZGzREAM6uO+YymXHImHhIKpk2Z1aK5TILlziV+J3L0huDCapsSKAUkngk
   7Ssl8UEKEQBLBTSbssrwgrl7cZpV1SXtjNEqixe27UKPgDEOS3BIePt0s
   yvE/uLc7FPoXMcLZSKjndMGpjwGWY/e8IEKp9vZyUPz4XulhD5LNBrEFi
   g==;
X-CSE-ConnectionGUID: l5AtfnbYRbWbztz+9YOm7g==
X-CSE-MsgGUID: ercMXxFqQIO4Yadnaw0AMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43746517"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="43746517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:30:49 -0700
X-CSE-ConnectionGUID: BaSjNI3JSnyLE94B/nMkSA==
X-CSE-MsgGUID: YZQLM8Q2SqOCiitmsyYiTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="127631808"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 21 Mar 2025 12:30:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3C2BC14B; Fri, 21 Mar 2025 21:30:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] i3c: master: Drop duplicate check before calling OF APIs
Date: Fri, 21 Mar 2025 21:30:06 +0200
Message-ID: <20250321193044.457649-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_123050_750010_9A56FF7A 
X-CRM114-Status: GOOD (  10.82  )
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

v2: added missed updates (hit 'send' too early in v1)

 drivers/i3c/master.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d5dc4180afbc..fd26c4bb8b34 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2276,7 +2276,7 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 	u32 reg[3];
 	int ret;
 
-	if (!master || !node)
+	if (!master)
 		return -EINVAL;
 
 	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
@@ -2369,14 +2369,10 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
 {
 	/* Fall back to no spike filters and FM bus mode. */
 	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
+	u32 reg[3];
 
-	if (client->dev.of_node) {
-		u32 reg[3];
-
-		if (!of_property_read_u32_array(client->dev.of_node, "reg",
-						reg, ARRAY_SIZE(reg)))
-			lvr = reg[2];
-	}
+	if (!of_property_read_u32_array(client->dev.of_node, "reg", reg, ARRAY_SIZE(reg)))
+		lvr = reg[2];
 
 	return lvr;
 }
@@ -2486,7 +2482,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
 	struct i2c_dev_desc *i2cdev;
 	struct i2c_dev_boardinfo *i2cboardinfo;
-	int ret, id = -ENODEV;
+	int ret, id;
 
 	adap->dev.parent = master->dev.parent;
 	adap->owner = master->dev.parent->driver->owner;
@@ -2497,9 +2493,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
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
