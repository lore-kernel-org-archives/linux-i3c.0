Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF15E7DEFC
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Feb 2026 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ok8dg28jwxh82rF0ByPbceg6fZ08Gdd1uBPmzpKUJhY=; b=fNolpanVqge6ji
	hNCa+7zlGbT3DPOBY4YsvykkO/j0u11om9Bbyqjtsyu86STpOVuXMhK+RzTi4/JTe9a7pcjuI4Thz
	KRSrc1QuK6wFV/brckALQYTx0DZA3dCAzJbDr/cB/k8VgDsXSwBmrpMf1y+mjYC5AwUm+/SRQg4ax
	LrepWmJzqspeU8lsnmLX93ttWwOIdmQfjHYiis7YUTAXwP/wUmCKbGBHLg+BxaofZIT1n0Byl0e/s
	LyTQOvV2DUnAJswCzFHyLfShPFXAiN5kpk+qieXhgAnkN/FfyeK9wckiM91kb/oqniPnOxSJBVT7f
	1O5ceaJl/HTBgPcOuFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwRA-00000005GTF-03BI;
	Mon, 02 Feb 2026 16:06:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwR2-00000005GSL-2kyQ
	for linux-i3c@lists.infradead.org;
	Mon, 02 Feb 2026 16:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDD6644271;
	Mon,  2 Feb 2026 16:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F472C116C6;
	Mon,  2 Feb 2026 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770048355;
	bh=6zlsVMXoUs03fo4jscYWHBazLhYMUk5W8Pnd2ev5N9U=;
	h=From:To:Cc:Subject:Date:From;
	b=NflDZ+jJyNzCNQ5uBXUGaoU0dnOedElD7wMf5eW+jLp0aNKeQXJavC3hUgPfyOJ8X
	 MX6JX5kHiHfiFzR+zi8q5ukOMtbucuno/U1825rzpWzPROlWcAzFEuQaIH+Aadg4cE
	 khJjW+cIYw66On/nMrElgj8tygtJnqA96wYHnNsDjJs59qappgtA3efC8wECo6CSDC
	 ThQY+xCkchVi7AbRMtgPSOcpgmN5nYgiXwyKfxnzWPUTyPyT+cEDABQoXC9iTUmRcT
	 H47Qw01Eywc4RGcA6F3lPDG6IA0TbKVEOJhgVpvR1aPO617iAy32diRFG4o4iALjOz
	 +8UDml/hYKbUA==
From: Arnd Bergmann <arnd@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>,
	Carlos Song <carlos.song@nxp.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH] [v2] i3c, iio: fix i3c driver dependencies
Date: Mon,  2 Feb 2026 17:04:46 +0100
Message-Id: <20260202160543.3654499-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_080558_526965_988AFFF1 
X-CRM114-Status: GOOD (  14.94  )
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

This was previously fixed several times by marking individual
drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
tedious and is somewhat confusing.

Add a Kconfig symbol 'I3C_OR_I2C' to help replace those dependencies,
and use this in all the existing drivers that had already fixed it
as well as the new mmc5633 driver.

Fixes: 6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: restore accidentally deleted lines
---
 drivers/hwmon/Kconfig            |  6 ++----
 drivers/i3c/Kconfig              | 12 ++++++++++++
 drivers/iio/magnetometer/Kconfig |  2 +-
 drivers/misc/amd-sbi/Kconfig     |  3 +--
 4 files changed, 16 insertions(+), 7 deletions(-)

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
index 2b81b22c9550..448fef4e5716 100644
--- a/drivers/iio/magnetometer/Kconfig
+++ b/drivers/iio/magnetometer/Kconfig
@@ -143,7 +143,7 @@ config MMC5633
 	tristate "MEMSIC MMC5633 3-axis magnetic sensor"
 	select REGMAP_I2C if I2C
 	select REGMAP_I3C if I3C
-	depends on I2C || I3C
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
