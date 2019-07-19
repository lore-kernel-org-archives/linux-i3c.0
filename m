Return-Path: <SRS0=tlLU=VQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B5CC76197
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 13:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E1E42184E
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 13:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T9fPIjQo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MJ4f66N4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E1E42184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lD0lP0H8dxZRO7EFzTiX8MWX+OFp8fLr+jhQmNFGXds=; b=T9fPIjQovyRvdzm4Gy6/1jBWbo
	D++n9IH2Y3n7zvzV6F5sG7zQzNSylMweBWBLhHUzIgfNkHDQz2FEFuQfWAgX7FHf1AQeDe+HOSQb3
	OvkKinW8YO5a8PcAhLy2tmBWXFtpRtV7J4C5pUq7YBAtLf0jJNxgZbtnMvHTjiXwIYW6uPqmnS0vD
	gEdRfNAuJx0OO7kWEz4CoA107wIWH0SHKPhceieOJcGj+qhj/fD2ihesw2WJQJa0m7+FixwZEcguV
	rsoCWglyHi83W2qmEV27H+tQD7ecKIv6h/B/oovSkNK2w1iikcXRkaQ6bBsatew+HBbRUhRh1yIM4
	ZRQrlqEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoSyY-00047g-9G; Fri, 19 Jul 2019 13:31:06 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoSyV-00045k-7B
 for linux-i3c@lists.infradead.org; Fri, 19 Jul 2019 13:31:04 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7284EC1C31;
 Fri, 19 Jul 2019 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563543059; bh=IWE4IgsFTGM1o2zHKRf+4UcxiBsBeB369kGTyAAjvt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=MJ4f66N4IlO9O7ffMArgXSzyqUJix9RYb56YqHxzT2e7bUZ+1SbExmCg3Mw2/WBms
 +QA48xYcz8p+oxWWxx9/bCjNTYr09CTA4FUXqoJhXhXktAQ21Z7EPt0SQHeUkc5RXB
 JM43dD0z87IxPHCCDCQS637lxZ7sB0rn573j6HLhDyeBxq8458XI2ZgF7Fg3SeEPSA
 IgWsoK34GfgoFWRMlZ2uxsd9AHkLBZ7CIfFZ2B1TVxgpuRnHQ+rGq54/vdmBYxS7df
 XvK2oSANJofHVmDt/Ng3loSzudXx0i8yDV7f71zn6Hn3CKNZbOzoGANzvr55OoburC
 g0eDDSSQ64CVQ==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1F4E9A005F;
 Fri, 19 Jul 2019 13:30:57 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 06F383EBC9;
 Fri, 19 Jul 2019 15:30:57 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Date: Fri, 19 Jul 2019 15:30:55 +0200
Message-Id: <77c709aca8607f31f141ee7c4dc28bf89266bd23.1563542515.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563542515.git.vitor.soares@synopsys.com>
References: <cover.1563542515.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1563542515.git.vitor.soares@synopsys.com>
References: <cover.1563542515.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190719_063103_285824_2B109468 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: Joao.Pinto@synopsys.com, bbrezillon@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 lorenzo@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only in
spi and i2c mode.

The LSM6DSO and LSM6DSR are also i3c capable so let's give i3c support to
them.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v6:
  none

Changes in v5:
  Move regmap_config declaration inside st_lsm6dsx_i3c_probe()
  Fix warning [-Wint-to-void-pointer-cast] when compiling in 64-bit arch

Changes in v4:
  Remove hw_id variable

Changes in v3:
  Remove unnecessary st_lsm6dsx_i3c_data table used to hold device name
  Use st_lsm6dsx_probe new form

Changes in v2:
  Add support for LSM6DSR
  Set pm_ops to st_lsm6dsx_pm_ops

 drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
 drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 57 +++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 1 deletion(-)
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
index 0000000..57e6331
--- /dev/null
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
@@ -0,0 +1,57 @@
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
+static const struct i3c_device_id st_lsm6dsx_i3c_ids[] = {
+	I3C_DEVICE(0x0104, 0x006C, (void *)ST_LSM6DSO_ID),
+	I3C_DEVICE(0x0104, 0x006B, (void *)ST_LSM6DSR_ID),
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
+
+static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct regmap_config st_lsm6dsx_i3c_regmap_config = {
+		.reg_bits = 8,
+		.val_bits = 8,
+	};
+	const struct i3c_device_id *id = i3c_device_match_id(i3cdev,
+							    st_lsm6dsx_i3c_ids);
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(&i3cdev->dev, "Failed to register i3c regmap %d\n",
+			(int)PTR_ERR(regmap));
+		return PTR_ERR(regmap);
+	}
+
+	return st_lsm6dsx_probe(&i3cdev->dev, 0, (uintptr_t)id->data, regmap);
+}
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
