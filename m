Return-Path: <SRS0=FZv/=VM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577CFC76190
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2019 07:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5CF20868
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2019 07:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WB7GuGv5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LKToBncg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F5CF20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tAjOAfvaj+VsriRB0OXfaIwd8qdekaoSV9XpKrzFdvo=; b=WB7GuGv5hXVxgdlRnwP2ztmw0V
	eNVjHdITWtJRb7yXqVYuYeA7FiCUFbTE/O1Cm40+43tm/kJGdILi6Y+izAI+bJKn2CpZBmyBe0nM/
	d52k72I4uQaknA7IMSanB1LJ5t0ZSYtZwn45YJB2+6QZBgAH8zo3sWR8bSKD8kw7kSzPzs8VgCPVT
	UxIgJsSl9GOTsk8Zi9fi471hOPZyxQpG6PJ5ZiPkdZp7eE4DLmmG8aApaJPwIxmDg2p83qjCWc1cE
	qTBX1F+cHiYeJepxrtRplZIYSxYQfQR9MRbHEqaRJnWEyMcOALsD5/1lQHdB0WoXorwx59+Ze+CjN
	YvYVgAHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmvM5-0000sv-LQ; Mon, 15 Jul 2019 07:25:01 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlE1W-0000Or-Lv
 for linux-i3c@lists.infradead.org; Wed, 10 Jul 2019 14:56:48 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BFFCDC29DA;
 Wed, 10 Jul 2019 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562770604; bh=1V12/8vGPInih5p0qyGvRVu7+Sn4cjnbPSEjTahhJIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=LKToBncgunSxfr2w1kcVAXG8s8lQF8yjGRfJUNWE8SXCQ1Qh/5SxyYlE0kee+Wv79
 3uUsg0CKONgCu3UP3mUzOgRlDSer4Crk7zer/ZpK2bNJq2mp4l58UVdHNDy+span9j
 z2CLPkbdZRIBnxMFHTSXDmTzVvC73UirF/GHw6cUkMzDDWX8Tt0D+Y4EO40Ba/fPAh
 TYS3ULJ2IgTME+H5EB1OukR831gVIPv7jt41bDIYtve/KIc/FYMD+WZoxCiNpKDB04
 YugI3T4lgi1npV1n4kB8N+v4xBqpJS1IbLr+uuImiY28oKrrhswAjhC1tZGxmEKvaT
 GUZp3jsTjR4dQ==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 48A7CA005C;
 Wed, 10 Jul 2019 14:56:42 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 061C23FA39;
 Wed, 10 Jul 2019 16:56:42 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Date: Wed, 10 Jul 2019 16:56:39 +0200
Message-Id: <73955529ae0c31f428221abb88031ab3b4165659.1562767521.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562767521.git.vitor.soares@synopsys.com>
References: <cover.1562767521.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1562767521.git.vitor.soares@synopsys.com>
References: <cover.1562767521.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_075646_722341_5655E5A9 
X-CRM114-Status: GOOD (  15.98  )
X-Mailman-Approved-At: Mon, 15 Jul 2019 00:24:58 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Joao.Pinto@synopsys.com, rafael@kernel.org, gregkh@linuxfoundation.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, broonie@kernel.org,
 bbrezillon@knernel.org, lorenzo@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only in
spi and i2c mode.

The LSM6DSO and LSM6DSR are also i3c capable so lets give i3c support to
them.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
  Remove unnecessary st_lsm6dsx_i3c_data table used to hold device name
  Use st_lsm6dsx_probe new form

Changes in v2:
  Add support for LSM6DSR
  Set pm_ops to st_lsm6dsx_pm_ops

 drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
 drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 61 +++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c

diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
index 9e59297..6b5a73c 100644
--- a/drivers/iio/imu/st_lsm6dsx/Kconfig
+++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
@@ -1,11 +1,12 @@
 
 config IIO_ST_LSM6DSX
 	tristate "ST_LSM6DSx driver for STM 6-axis IMU MEMS sensors"
-	depends on (I2C || SPI)
+	depends on (I2C || SPI || I3C)
 	select IIO_BUFFER
 	select IIO_KFIFO_BUF
 	select IIO_ST_LSM6DSX_I2C if (I2C)
 	select IIO_ST_LSM6DSX_SPI if (SPI_MASTER)
+	select IIO_ST_LSM6DSX_I3C if (I3C)
 	help
 	  Say yes here to build support for STMicroelectronics LSM6DSx imu
 	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
@@ -23,3 +24,8 @@ config IIO_ST_LSM6DSX_SPI
 	tristate
 	depends on IIO_ST_LSM6DSX
 	select REGMAP_SPI
+
+config IIO_ST_LSM6DSX_I3C
+	tristate
+	depends on IIO_ST_LSM6DSX
+	select REGMAP_I3C
diff --git a/drivers/iio/imu/st_lsm6dsx/Makefile b/drivers/iio/imu/st_lsm6dsx/Makefile
index e5f733c..c676965 100644
--- a/drivers/iio/imu/st_lsm6dsx/Makefile
+++ b/drivers/iio/imu/st_lsm6dsx/Makefile
@@ -4,3 +4,4 @@ st_lsm6dsx-y := st_lsm6dsx_core.o st_lsm6dsx_buffer.o \
 obj-$(CONFIG_IIO_ST_LSM6DSX) += st_lsm6dsx.o
 obj-$(CONFIG_IIO_ST_LSM6DSX_I2C) += st_lsm6dsx_i2c.o
 obj-$(CONFIG_IIO_ST_LSM6DSX_SPI) += st_lsm6dsx_spi.o
+obj-$(CONFIG_IIO_ST_LSM6DSX_I3C) += st_lsm6dsx_i3c.o
diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
new file mode 100644
index 0000000..f683754
--- /dev/null
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
+ *
+ * Author: Vitor Soares <vitor.soares@synopsys.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/i3c/device.h>
+#include <linux/i3c/master.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include "st_lsm6dsx.h"
+
+static const struct i3c_device_id st_lsm6dsx_i3c_ids[];
+
+static const struct regmap_config st_lsm6dsx_i3c_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
+{
+	const struct i3c_device_id *id = i3c_device_match_id(i3cdev,
+							    st_lsm6dsx_i3c_ids);
+	struct regmap *regmap;
+	int hw_id = (int)id->data;
+
+	regmap = devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(&i3cdev->dev, "Failed to register i3c regmap %d\n",
+			(int)PTR_ERR(regmap));
+		return PTR_ERR(regmap);
+	}
+
+	return st_lsm6dsx_probe(&i3cdev->dev, 0, hw_id, regmap);
+}
+
+static const struct i3c_device_id st_lsm6dsx_i3c_ids[] = {
+	I3C_DEVICE(0x0104, 0x006C, (void *)ST_LSM6DSO_ID),
+	I3C_DEVICE(0x0104, 0x006B, (void *)ST_LSM6DSR_ID),
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
+
+static struct i3c_driver st_lsm6dsx_driver = {
+	.driver = {
+		.name = "st_lsm6dsx_i3c",
+		.pm = &st_lsm6dsx_pm_ops,
+	},
+	.probe = st_lsm6dsx_i3c_probe,
+	.id_table = st_lsm6dsx_i3c_ids,
+};
+module_i3c_driver(st_lsm6dsx_driver);
+
+MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
+MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
