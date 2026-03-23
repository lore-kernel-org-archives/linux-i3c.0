Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B2DD58CDC
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 06:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFqWFhoMcfJ/eiSkQJXg6kvsc618FiZUDNtPP7mQDWQ=; b=WWg7NOsC56W4Yo
	84KXHvMQpsgOajoHhTcrZpFcqNKulELO/sXLGtQZPMFdsFvRsy/BqM9XK+pjf3Xvc+ZHqCJyEFYRk
	TcqbdzoVi6O6o52xaEpTKsrjkaPEiUQhnfCg4IBLKAZQuBUZTqgaFwrhIqxLQh67iqax6dkc+29w4
	hzH1M8olHWxus4oMGWf3KrfLU2MvrlrpjaFhZ/2ZG2ltS8hlbAqDYIa2c+TI7hyNBkq7vjEj0/dJX
	sUPmnlmUQWm7qO/Aq6UfoBYrhPLrzyOQN+ykhyeEfwUby6LL9SLrrQ9LjdaN5dXfOBWPTAt0wSZsH
	YEQmyqNLakSDVS6J5T5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4YlW-0000000G7pC-0OZU;
	Mon, 23 Mar 2026 06:27:54 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4YlT-0000000G7nN-3uRZ
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 06:27:53 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 24B541A09F4;
	Mon, 23 Mar 2026 07:27:50 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E1FA91A0A04;
	Mon, 23 Mar 2026 07:27:49 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 952DE180221C;
	Mon, 23 Mar 2026 14:27:48 +0800 (+08)
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
	lakshay.piplani@nxp.com
Subject: [PATCH v8 4/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
Date: Mon, 23 Mar 2026 11:57:34 +0530
Message-Id: <20260323062737.886728-5-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260323062737.886728-1-lakshay.piplani@nxp.com>
References: <20260323062737.886728-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_232752_256812_6ED9A85F 
X-CRM114-Status: GOOD (  20.71  )
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

---
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
 drivers/mfd/p3h2840.c       | 125 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/p3h2840.h |  27 ++++++++
 5 files changed, 168 insertions(+)
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 include/linux/mfd/p3h2840.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c72976dbdf31..4f67fe64c833 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19101,6 +19101,8 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-i3c-owner@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+F:	drivers/mfd/p3h2840.c
+F:	include/linux/mfd/p3h2840.h
 
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
 M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..14f4736683a1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -617,6 +617,19 @@ config MFD_MX25_TSADC
 	  i.MX25 processors. They consist of a conversion queue for general
 	  purpose ADC and a queue for Touchscreens.
 
+config MFD_P3H2X4X
+       tristate "NXP P3H2X4X I3C Hub Device"
+       depends on I3C_OR_I2C
+       select MFD_CORE
+       select REGMAP_I3C
+       select REGMAP_I2C
+       help
+         Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2C
+         communication interface.
+
+         This driver provides support for I3C hub and regulator, each subdriver
+         can be enabled independently depending on the required functionality.
+
 config MFD_PF1550
 	tristate "NXP PF1550 PMIC Support"
 	depends on I2C=y && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..aaadf50fedf4 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
+obj-$(CONFIG_MFD_P3H2X4X) 	+= p3h2840.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
new file mode 100644
index 000000000000..65090a09f7c6
--- /dev/null
+++ b/drivers/mfd/p3h2840.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ * P3H2x4x i3c hub and regulator device.
+ */
+
+#include <linux/i3c/master.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/regmap.h>
+
+static const struct mfd_cell p3h2x4x_devs[] = {
+	{
+		.name = "p3h2x4x-regulator",
+	},
+	{
+		.name = "p3h2x4x-i3c-hub",
+	},
+};
+
+static const struct regmap_config p3h2x4x_regmap_config = {
+	.reg_bits = P3H2x4x_REG_BITS,
+	.val_bits = P3H2x4x_VAL_BITS,
+	.max_register = 0xFF,
+};
+
+static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
+{
+	struct p3h2x4x_dev *p3h2x4x;
+	int ret;
+
+	p3h2x4x = devm_kzalloc(&i3cdev->dev, sizeof(*p3h2x4x), GFP_KERNEL);
+	if (!p3h2x4x)
+		return -ENOMEM;
+
+	i3cdev_set_drvdata(i3cdev, p3h2x4x);
+
+	p3h2x4x->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
+	if (IS_ERR(p3h2x4x->regmap))
+		return dev_err_probe(&i3cdev->dev, PTR_ERR(p3h2x4x->regmap),
+				     "Failed to register I3C HUB regmap\n");
+
+	p3h2x4x->is_p3h2x4x_in_i3c = true;
+	p3h2x4x->i3cdev = i3cdev;
+
+	ret = devm_mfd_add_devices(&i3cdev->dev, PLATFORM_DEVID_NONE,
+				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(&i3cdev->dev, ret, "Failed to add sub devices\n");
+
+	return 0;
+}
+
+static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
+{
+	struct p3h2x4x_dev *p3h2x4x;
+	int ret;
+
+	p3h2x4x = devm_kzalloc(&client->dev, sizeof(*p3h2x4x), GFP_KERNEL);
+	if (!p3h2x4x)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, p3h2x4x);
+
+	p3h2x4x->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
+	if (IS_ERR(p3h2x4x->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(p3h2x4x->regmap),
+				     "Failed to register I3C HUB regmap\n");
+
+	p3h2x4x->is_p3h2x4x_in_i3c = false;
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
+
+	return 0;
+}
+
+/* p3h2x4x ids (i3c) */
+static const struct i3c_device_id p3h2x4x_i3c_ids[] = {
+	I3C_CLASS(I3C_DCR_HUB, NULL),
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
+
+/* p3h2x4x ids (i2c) */
+static const struct i2c_device_id p3h2x4x_i2c_id_table[] = {
+	{ "nxp-i3c-hub" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
+
+static const struct of_device_id  p3h2x4x_i2c_of_match[] = {
+	{ .compatible = "nxp,p3h2840", },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);
+static struct i3c_driver p3h2x4x_i3c = {
+	.driver = {
+		.name = "p3h2x4x_i3c_drv",
+	},
+	.probe = p3h2x4x_device_probe_i3c,
+	.id_table = p3h2x4x_i3c_ids,
+};
+
+static struct i2c_driver p3h2x4x_i2c = {
+	.driver = {
+		.name = "p3h2x4x_i2c_drv",
+		.of_match_table = p3h2x4x_i2c_of_match,
+	},
+	.probe =  p3h2x4x_device_probe_i2c,
+	.id_table = p3h2x4x_i2c_id_table,
+};
+
+module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_DESCRIPTION("P3H2x4x I3C HUB multi function driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
new file mode 100644
index 000000000000..cba6fa516d1e
--- /dev/null
+++ b/include/linux/mfd/p3h2840.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025 NXP
+ * This header file contain private Reg address and its bit mapping etc.
+ */
+
+#ifndef _LINUX_MFD_P3H2840_H
+#define _LINUX_MFD_P3H2840_H
+
+#include <linux/types.h>
+
+/* Device Configuration Registers */
+#define P3H2x4x_DEV_REG_PROTECTION_CODE				0x10
+#define P3H2x4x_REGISTERS_LOCK_CODE				0x00
+#define P3H2x4x_REGISTERS_UNLOCK_CODE				0x69
+#define P3H2x4x_CP1_REGISTERS_UNLOCK_CODE			0x6a
+
+/* Reg config for Regmap */
+#define P3H2x4x_REG_BITS					8
+#define P3H2x4x_VAL_BITS					8
+
+struct p3h2x4x_dev {
+	struct i3c_device *i3cdev;
+	struct regmap *regmap;
+	bool is_p3h2x4x_in_i3c;
+};
+#endif /* _LINUX_MFD_P3H2840_H */
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
