Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB91FE9D40F
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ilDfFmxRXpWGAcoIU+/RzBL38hdiKQ1CiwTrTta88Es=; b=LK8J2WhSHVkhpe
	+ZUti93OlkHjt5urLOWnDQZR9nnPEFUge0e1dwQoykuQT876+iEwDDNDmpXPCqUvdPkw60pUPB4/v
	7w4B+bugNebuN2QMzzrJzc6rICUMPMsRGoPQsa1zL1L0G6DDI0cFcstXIdiTE4GaL6eAyqOkEpAmP
	xhVR6qMVRVYHwBSOTmuibS3XnZddovjlybKfVgGMYd+u1qXVvCfXtM/yPNAphDmwBvYGLtY8glX9d
	tJJd1EVqONXJ+2p6F+vcqUOZbFaljWsmOjT8z8bBk1wXR2JFp6U9QBhunROBlQUGIbymUz50w2a2j
	3nvwnw0ichH/dGazbGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfxS-00000008mTj-0X7d;
	Wed, 04 Feb 2026 16:42:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfxP-00000008mSs-2lIs
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 16:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85A45408CC;
	Wed,  4 Feb 2026 16:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA6EC4CEF7;
	Wed,  4 Feb 2026 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770223342;
	bh=8vlCqZN8hg/vKDcQStitR8SkolD3k0bhlYMeJ63mYRA=;
	h=From:To:Cc:Subject:Date:From;
	b=Gm/kNNoVNwrjDDx2urSYktUZmEnqy0m934PRoaxD4nU8LRVk7/+a79twhIcIbWa4f
	 KNpKjCkzhKmLeP00WYgh6VreESUFatjOJwumsLg9tCR/aqRohAPG2/4MZr16aPBeFn
	 FQqLi8Z/fkY0iVbpoGpF/Fixy6qC4sX+0bTCZ4579EvyOu66fTpvbK2dzx8cPPOQNt
	 FJNtOaq4kxhB/pxDm0600TXTE2cVexQ8juM0yA14l2bzajYVjd9LEUk/ytj761sc6O
	 vtimFY8NVi3paqPz50vnJA4LiN4gMhOFVzniyxmU/uqgfs15dHTQc7mPU1oieRZOIE
	 IqhFgV9pphlMw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH] [v3, apply after -rc1] i3c: simplify combined i3c/i2c dependencies
Date: Wed,  4 Feb 2026 17:41:58 +0100
Message-Id: <20260204164216.544409-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_084223_738940_FA659C5A 
X-CRM114-Status: GOOD (  14.61  )
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

From: Arnd Bergmann <arnd@arndb.de>

All combined i2c/i3c drivers appear to suffer from the same link
time problem when CONFIG_I3C is set to 'm':

arm-linux-gnueabi-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_i3c_driver_init':
mmc5633.c:(.init.text+0x30): undefined reference to `i3c_driver_register_with_owner'

This was previously fixed every time by marking individual
drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
tedious and is somewhat confusing.

Add a Kconfig symbol 'I3C_OR_I2C' to help replace those dependencies,
and use this in all the existing drivers that had already fixed it
as well as the new mmc5633 driver.

Fixes: 6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: restore accidentally deleted lines
v3: rebase on top of Jonathan's IIO patch in linux-next
---
 drivers/hwmon/Kconfig            |  6 ++----
 drivers/i3c/Kconfig              | 12 ++++++++++++
 drivers/iio/magnetometer/Kconfig |  3 +--
 drivers/misc/amd-sbi/Kconfig     |  3 +--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 41c381764c2b..ecfba861f66d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1493,8 +1493,7 @@ config SENSORS_LM73
 
 config SENSORS_LM75
 	tristate "National Semiconductor LM75 and compatibles"
-	depends on I2C
-	depends on I3C || !I3C
+	depends on I3C_OR_I2C
 	select REGMAP_I2C
 	select REGMAP_I3C if I3C
 	help
@@ -2392,8 +2391,7 @@ config SENSORS_TMP103
 
 config SENSORS_TMP108
 	tristate "Texas Instruments TMP108"
-	depends on I2C
-	depends on I3C || !I3C
+	depends on I3C_OR_I2C
 	select REGMAP_I2C
 	select REGMAP_I3C if I3C
 	help
diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
index 30a441506f61..626c54b386d5 100644
--- a/drivers/i3c/Kconfig
+++ b/drivers/i3c/Kconfig
@@ -22,3 +22,15 @@ menuconfig I3C
 if I3C
 source "drivers/i3c/master/Kconfig"
 endif # I3C
+
+config I3C_OR_I2C
+	tristate
+	default m if I3C=m
+	default I2C
+	help
+	  Device drivers using module_i3c_i2c_driver() can use either
+	  i2c or i3c hosts, but cannot be built-in for the kernel when
+	  CONFIG_I3C=m.
+
+	  Add 'depends on I2C_OR_I3C' in Kconfig for those drivers to
+	  get the correct dependencies.
diff --git a/drivers/iio/magnetometer/Kconfig b/drivers/iio/magnetometer/Kconfig
index 9345fb6d5317..fb313e591e85 100644
--- a/drivers/iio/magnetometer/Kconfig
+++ b/drivers/iio/magnetometer/Kconfig
@@ -143,8 +143,7 @@ config MMC5633
 	tristate "MEMSIC MMC5633 3-axis magnetic sensor"
 	select REGMAP_I2C
 	select REGMAP_I3C if I3C
-	depends on I2C
-	depends on I3C || !I3C
+	depends on I3C_OR_I2C
 	help
 	  Say yes here to build support for the MEMSIC MMC5633 3-axis
 	  magnetic sensor.
diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index be022c71a90c..30e7fad7356c 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -1,10 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config AMD_SBRMI_I2C
 	tristate "AMD side band RMI support"
-	depends on I2C
+	depends on I3C_OR_I2C
 	depends on ARM || ARM64 || COMPILE_TEST
 	select REGMAP_I2C
-	depends on I3C || !I3C
 	select REGMAP_I3C if I3C
 	help
 	  Side band RMI over I2C/I3C support for AMD out of band management.
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
