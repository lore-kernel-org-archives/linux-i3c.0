Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C78E7314A
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Feb 2026 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0PBzSUjzkO+aJ+Qfcmklezgm5gXNEmt2gBT7NqyPLKg=; b=GHAEV6X+pUNXUQ
	4PaOUHMc06HRMRHn1eEAjBVn/SX2193AFQJ7SXjIAsYa4rVUKmLH76AlVqddc6SNI5YbRQdh6HKoX
	c+nXU4y1LCpw4bTuiN4vBztk27rCp7Wefy4ddvpGEsP1oAgSv0tejuD0xICgWJZVtMqvjYSAngHaK
	MiKmSiy/Jwl8lOmddbVJDrHn86bW//3OfCnOijS39oRMfknSZpMZ+iXNrx0juMBDHlPx6DlVr6tdc
	qk73G86+GDMFgv/w9XTSrhRNUmjZ2xisj+UfuyCUYJIT/zP5ZHX/er4C0wAZ97UY1wIgWT16nPhcB
	2TmTN5pFrjFQTKJci+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqff-00000004kaL-1Ems;
	Mon, 02 Feb 2026 09:56:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqfc-00000004ka0-25Xy
	for linux-i3c@lists.infradead.org;
	Mon, 02 Feb 2026 09:56:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6381B42B83;
	Mon,  2 Feb 2026 09:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04864C116C6;
	Mon,  2 Feb 2026 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770026195;
	bh=To2VkYEmJRA5edR97P1H5WOqIjJetFQipCH+TeuvDts=;
	h=From:To:Cc:Subject:Date:From;
	b=nSt9BWUbMiJWt4qXGFjiKVn+G4YzRpsAAXIRMaITA0qsHNCoL0T6YbzAR5yD5hhH2
	 0cntAZEQ1TDGFa6bTKUaTWG/ffkX2sBBWHmjMuaXNTKy9TDSf+mAJKjNNkJLeFDI2/
	 BczdybJXbPy4lmFX2Vh6JW1jKLl4aarTpIhveSDE/fJUgwBjwovtDvLf6tNW6tHxSp
	 HeqyV5i5f/c1sXxrurNxkT0OS5oZl2E0qeRzlEGK6eeBtv/Mmme//Rj5OlFh2SCNR4
	 vbl5M2aYbhJoBYvCUTEI9SJGVbk1D4nN1P02k5020Tq0jaLY4yyjyEeM4M2K4p1Nnv
	 YNsIGZI8ZGSFQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH] i3c, iio: fix i3c driver dependencies
Date: Mon,  2 Feb 2026 10:55:31 +0100
Message-Id: <20260202095628.1254175-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_015636_575847_221AC521 
X-CRM114-Status: GOOD (  16.28  )
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
 drivers/hwmon/Kconfig            | 17 ++---------------
 drivers/i3c/Kconfig              | 12 ++++++++++++
 drivers/iio/magnetometer/Kconfig |  2 +-
 drivers/misc/amd-sbi/Kconfig     |  3 +--
 4 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 41c381764c2b..1ddb3f73fdc0 100644
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
@@ -2381,19 +2380,7 @@ config SENSORS_TMP102
 
 config SENSORS_TMP103
 	tristate "Texas Instruments TMP103"
-	depends on I2C
-	select REGMAP_I2C
-	help
-	  If you say yes here you get support for Texas Instruments TMP103
-	  sensor chips.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called tmp103.
-
-config SENSORS_TMP108
-	tristate "Texas Instruments TMP108"
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
