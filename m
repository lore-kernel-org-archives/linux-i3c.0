Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3A8C4450A
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Jul 2026 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8yQJT0ox0GYIqkhxGn+EfJ7KJxDpicInWkF703eeJg=; b=VB1Nb8r0460UR8
	DT6FIYtxrm9nSX1UUakmH0Qw8+MZVzDDaOH8SGpCpi0AQPUq9yr8mwzb0wnQE1ZpKhz8rKw6G1IF5
	ERHptgaO/P3E5piKlcAPUXPgnSkevokPNMSlJyvBOLtdgyPyeagKg9ai2iGznlvW4ijFOimet6MC7
	za54pEAGBj2frgWC3UjfyZPr/FWRqxojBg+hbdkc3ZXkUEX3kEVBbaQQyFH0swVZWKMi7AsKCF0IQ
	MqZ4UJvULraw+2DvZ/EnmvqJOV+vNLKvwvxdXPjE4tKAhtqIKeeU0vemSmgJ2MDld6+L0B9DovVtF
	AzqwxBgJxb7/qpwqDzZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZK7-0000000BRTy-2ECd;
	Tue, 14 Jul 2026 09:21:07 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZK5-0000000BRRh-1zzF
	for linux-i3c@lists.infradead.org;
	Tue, 14 Jul 2026 09:21:06 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 14536200029;
	Tue, 14 Jul 2026 11:21:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CFEBA20005B;
	Tue, 14 Jul 2026 11:21:03 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7E41218000B5;
	Tue, 14 Jul 2026 17:21:02 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v14 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
Date: Tue, 14 Jul 2026 14:50:49 +0530
Message-Id: <20260714092053.2461482-5-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_022105_787720_3C55DC7E 
X-CRM114-Status: GOOD (  25.08  )
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

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
family of multiport I3C hub devices. These devices connect to a host via
I3C/I2C/SMBus and expose multiple downstream target ports.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v14:
 - Clean up MFD driver comments, formatting, variable names and author
   information
 - Define and document the I3C hub DCR value in hexadecimal form
 - Use direct regmap bit-width values instead of local macros
 - Add a shared protected_reg_lock for protected register accesses across
   P3H2X4X child drivers

Changes in v13:
 - Use i3c_device helpers (i3cdev_to_dev()) instead of direct struct access
   to maintain API abstraction
 - Avoid including internal I3C headers and use public device headers instead
 - Ensure proper device matching by relying on manufacturer ID checks in probe

Changes in v12:
 - No change, added Reviewed-By tag

Changes in v11:
 - Use MFD_CELL_NAME() for child device registration
 - Rename local variables for consistency
 - Rename driver names to follow subsystem conventions:
   - Use '-' instead of '_' in driver names
   - Drop the "_drv" suffix from driver names

Changes in v10:
 - Drop redundant is_p3h2x4x_in_i3c flag

Changes in v9:
 - Renamed macros to follow consistent uppercase naming conventions
 - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional,
   to avoid I3C/I2C dependency issues

Changes in v8:
 - No change

Changes in v7:
 - Use new config I3C_OR_I2C

Changes in v6:
 - No change

Changes in v5:
 - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
 - Updated dev_err_probe() for regmap_init failure.
 - Updated module description

Changes in v4:
 - Split the driver into three separate patches(mfd, regulator and I3C hub)
 - Added support for NXP P3H2x4x MFD functionality
---
---
 MAINTAINERS                 |   2 +
 drivers/mfd/Kconfig         |  13 ++++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/p3h2840.c       | 139 ++++++++++++++++++++++++++++++++++++
 include/linux/i3c/device.h  |   2 +
 include/linux/mfd/p3h2840.h |  25 +++++++
 6 files changed, 182 insertions(+)
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 include/linux/mfd/p3h2840.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ba65ae5a008b..3420701a75c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19311,6 +19311,8 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-i3c@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+F:	drivers/mfd/p3h2840.c
+F:	include/linux/mfd/p3h2840.h
 
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
 M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..405b50c3c77b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -617,6 +617,19 @@ config MFD_MX25_TSADC
 	  i.MX25 processors. They consist of a conversion queue for general
 	  purpose ADC and a queue for Touchscreens.
 
+config MFD_P3H2X4X
+	tristate "NXP P3H2X4X I3C Hub Device"
+	depends on I3C_OR_I2C
+	select MFD_CORE
+	select REGMAP_I3C if I3C
+	select REGMAP_I2C if I2C
+	help
+	  Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2C
+	  communication interface.
+
+	  This driver provides support for I3C hub and regulator, each subdriver
+	  can be enabled independently depending on the required functionality.
+
 config MFD_PF1550
 	tristate "NXP PF1550 PMIC Support"
 	depends on I2C=y && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..a284b22c7b13 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
+obj-$(CONFIG_MFD_P3H2X4X)	+= p3h2840.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
new file mode 100644
index 000000000000..652077408dbd
--- /dev/null
+++ b/drivers/mfd/p3h2840.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025-2026 NXP
+ *
+ * Authors:
+ *	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+ *	Vikash Bansal <vikash.bansal@nxp.com>
+ *	Lakshay Piplani <lakshay.piplani@nxp.com>
+ *
+ * P3H2X4X multi-function device driver.
+ */
+#include <linux/i2c.h>
+#include <linux/i3c/device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/regmap.h>
+
+static const struct mfd_cell p3h2x4x_devs[] = {
+	MFD_CELL_NAME("p3h2x4x-regulator"),
+	MFD_CELL_NAME("p3h2x4x-i3c-hub"),
+};
+
+static const struct regmap_config p3h2x4x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xFF,
+};
+
+static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct i3c_device_info devinfo;
+	struct p3h2x4x *ddata;
+	int ret;
+
+	i3c_device_get_info(i3cdev, &devinfo);
+
+	if (I3C_PID_MANUF_ID(devinfo.pid) != I3C_MANUF_ID_NXP)
+		return -ENODEV;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &ddata->protected_reg_lock);
+	if (ret)
+		return ret;
+
+	i3cdev_set_drvdata(i3cdev, ddata);
+
+	ddata->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(dev, PTR_ERR(ddata->regmap),
+				     "Failed to register HUB regmap\n");
+
+	/* The hub child driver retrieves information from i3cdev. */
+	ddata->i3cdev = i3cdev;
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add sub devices\n");
+
+	return 0;
+}
+
+static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
+{
+	struct p3h2x4x *ddata;
+	int ret;
+
+	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&client->dev, &ddata->protected_reg_lock);
+	if (ret)
+		return ret;
+
+	i2c_set_clientdata(client, ddata);
+
+	ddata->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(ddata->regmap),
+				     "Failed to register HUB regmap\n");
+
+	ddata->i3cdev = NULL;
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
+				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
+
+	return 0;
+}
+
+static const struct i3c_device_id p3h2x4x_i3c_ids[] = {
+	I3C_CLASS(I3C_DCR_HUB, NULL),
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
+
+static const struct i2c_device_id p3h2x4x_i2c_id_table[] = {
+	{ "nxp-i3c-hub" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
+
+static const struct of_device_id p3h2x4x_i2c_of_match[] = {
+	{ .compatible = "nxp,p3h2840", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);
+
+static struct i3c_driver p3h2x4x_i3c = {
+	.driver = {
+		.name = "p3h2x4x-i3c",
+	},
+	.probe = p3h2x4x_device_probe_i3c,
+	.id_table = p3h2x4x_i3c_ids,
+};
+
+static struct i2c_driver p3h2x4x_i2c = {
+	.driver = {
+		.name = "p3h2x4x-i2c",
+		.of_match_table = p3h2x4x_i2c_of_match,
+	},
+	.probe = p3h2x4x_device_probe_i2c,
+	.id_table = p3h2x4x_i2c_id_table,
+};
+module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB multi function driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 971d53349b6f..1dcfc4cc1cef 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -82,9 +82,11 @@ struct i3c_xfer {
 /**
  * enum i3c_dcr - I3C DCR values
  * @I3C_DCR_GENERIC_DEVICE: generic I3C device
+ * @I3C_DCR_HUB: I3C hub device
  */
 enum i3c_dcr {
 	I3C_DCR_GENERIC_DEVICE = 0,
+	I3C_DCR_HUB = 0xC2,
 };
 
 #define I3C_PID_MANUF_ID(pid)		(((pid) & GENMASK_ULL(47, 33)) >> 33)
diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
new file mode 100644
index 000000000000..ba9a38756ecb
--- /dev/null
+++ b/include/linux/mfd/p3h2840.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025-2026 NXP
+ */
+
+#ifndef _LINUX_MFD_P3H2840_H
+#define _LINUX_MFD_P3H2840_H
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/* Device Configuration Registers */
+#define P3H2X4X_DEV_REG_PROTECTION_CODE				0x10
+#define P3H2X4X_REGISTERS_LOCK_CODE				0x00
+#define P3H2X4X_REGISTERS_UNLOCK_CODE				0x69
+#define P3H2X4X_CP1_REGISTERS_UNLOCK_CODE			0x6a
+
+#define I3C_MANUF_ID_NXP					0x011b
+
+struct p3h2x4x {
+	struct i3c_device *i3cdev;
+	struct regmap *regmap;
+	struct mutex protected_reg_lock; /* Serializes protected register unlock/lock sequences. */
+};
+#endif /* _LINUX_MFD_P3H2840_H */
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
