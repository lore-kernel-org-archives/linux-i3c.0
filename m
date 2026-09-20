Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF262C982DA
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xScC8U9304crg8yuGhh69GzfUG3fUmH9yT4SXvnobNo=; b=ENBbJGZAswYbm6
	2yQyBXbeVqsZhL8GfwrQaCXtM2uQyjxrdGxLp7FUeAKmYDgrz0smrcuc0QkG8OsoLtpA+mVAxUvdu
	kCTXWJiZTMM7q8/cFPd5u+YFNhU1fMZc8aUWeXqOVnAS5/sn+h5gUqNOiPG+tEruAOGnL1UXVmY+P
	b5Y8u9IVqRy/7cFEvcSy7N97GRYY/V6rp76QTGLvYw1a69VMRHTpIu3DX0OL05uPjAmLnETSqz6NF
	4H2DA7JeM2WZWm5hbyLdCswbVSy+8nV7tbPFPjP9p/xf2Ot9SA1i3su7pi7h9ib4pe7O+T3uluWMd
	CfZU5WL2LTzieQJAy3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ESV-0000000HEW2-2TmR;
	Sun, 20 Sep 2026 10:07:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EST-0000000HEVX-3UjA
	for linux-i3c@bombadil.infradead.org;
	Sun, 20 Sep 2026 10:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3Ttc9xI3wvHkWLTMxinCngOphSnT79iYbDfAK1Pi57Y=; b=nxcSwDmAkP0MCwrNge9iK5RdFw
	VCvAen8XS0yVWJj++qMyqNsGmKJc+9MHk392C3FKqWsTgSLvUQ8zeQKi8C8Ogrf5ZHI38VyDaFTKg
	1a7CZHAIvd/v65Z95g2/fONlPSlb2c82Cdv9sw+rvE72B43dZR1aJlngT0YF4sfzGSogjklQYjK8/
	+pD8KnuDS3+a/bjsGktOSU/a2ylTX1nKE5Ixj4Pxp6qh2zH54b11eZWAjsv0o2Hj/XXcRj8c3Ui34
	mSXoeA2fe+a9dMdYuC1VtIHz332zieN+y0tKA4pHi1GkLhUwZNFOcjCR+kB3/qdep81ZYcJgxXHvg
	CtBaOwPg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ESP-0000000BJM7-0liQ
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 10:07:40 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68KA6YsG41619117, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1789898795;
	bh=3Ttc9xI3wvHkWLTMxinCngOphSnT79iYbDfAK1Pi57Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kFAHorf/r888nfZbZWQ5UbmVQ7EpXCdTfw6SbP2HW7oB0+vAB0YHZmPfN7MTo1BXY
	 2BgjtHUKKQLbHq8MZOMz4PoRYkipw5FAgXDIOXY4i9zrpwHHjjT/oBBeN/E/KELmGB
	 2yhEcBdmK+rTKRZOubazG89znuLDqurIJ0KL16TKOFZaZEJ6Le7QtIJdEP2Oakk+S4
	 1WoZP6zBrVI1JwxSdraw1OquiCke1LfEk1MN2FfwKTtLJFyp9JpC9f3nqxGeF2iAxv
	 LlCKBVwzxvqwGeNVb02fqAUDJTJeI4BtK/eAEaclVKUOfuHOsm75UroXATwk092eQh
	 BExBA8RddsaJQ==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68KA6YsG41619117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 20 Sep 2026 18:06:34 +0800
Received: from localhost (172.29.57.213) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 18:06:34 +0800
From: <zain_zhou@realsil.com.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Vikash Bansal <vikash.bansal@nxp.com>, Aman Kumar
 Pandey <aman.kumarpandey@nxp.com>, Lakshay Piplani <lakshay.piplani@nxp.com>
CC: <devicetree@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mfd@lists.linux.dev>, Wei Wang
	<wei_wang@realsil.com.cn>, Yin Zhou <zain_zhou@realsil.com.cn>
Subject: [RFC PATCH 2/4] mfd: Add driver for Realtek RTS490x I3C hub
Date: Sun, 20 Sep 2026 18:04:59 +0800
Message-ID: <20260920100501.4091351-3-zain_zhou@realsil.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
MIME-Version: 1.0
X-Originating-IP: [172.29.57.213]
X-ClientProxiedBy: RS-EX-MBS1.realsil.com.cn (172.29.17.101) To
 RS-EX-MBS2.realsil.com.cn (172.29.17.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_110738_209062_F69E08DD 
X-CRM114-Status: GOOD (  25.02  )
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

From: Yin Zhou <zain_zhou@realsil.com.cn>

Add the MFD core driver for the Realtek RTS490x family of I3C hubs.
The driver initializes the shared register map, identifies the hub
variant, and registers the regulator and I3C hub child devices.

Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
---
 MAINTAINERS                 |   2 +
 drivers/mfd/Kconfig         |  11 +++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/rts490x-core.c  | 131 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rts490x.h |  53 +++++++++++++++
 5 files changed, 198 insertions(+)
 create mode 100644 drivers/mfd/rts490x-core.c
 create mode 100644 include/linux/mfd/rts490x.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a2c171a28cd2..659f553420eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22998,6 +22998,8 @@ L:	linux-i3c@lists.infradead.org
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
+F:	drivers/mfd/rts490x-core.c
+F:	include/linux/mfd/rts490x.h
 
 REALTEK OTTO WATCHDOG
 M:	Sander Vanheule <sander@svanheule.net>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ee809b0c1b8f..6da8967de1a2 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -630,6 +630,17 @@ config MFD_P3H2X4X
 	  This driver provides support for I3C hub and regulator, each subdriver
 	  can be enabled independently depending on the required functionality.
 
+config MFD_RTS490X
+	tristate "Realtek RTS490x I3C hub"
+	depends on I3C
+	select MFD_CORE
+	select REGMAP_I3C
+	help
+	  Enable support for the Realtek RTS490x family of I3C hub devices.
+	  This driver provides the shared register map and parent state used by
+	  the I3C hub and regulator child drivers. The hub is connected to the
+	  host through I3C.
+
 config MFD_PF1550
 	tristate "NXP PF1550 PMIC Support"
 	depends on I2C=y && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index ec4e093f3540..97988277bee9 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_P3H2X4X)	+= p3h2840.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
+obj-$(CONFIG_MFD_RTS490X)	+= rts490x-core.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
 
diff --git a/drivers/mfd/rts490x-core.c b/drivers/mfd/rts490x-core.c
new file mode 100644
index 000000000000..c10718397167
--- /dev/null
+++ b/drivers/mfd/rts490x-core.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
+
+#include <linux/bitfield.h>
+#include <linux/i3c/device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/rts490x.h>
+#include <linux/regmap.h>
+
+struct rts490x_device_info {
+	const char *model;
+	u16 part_id;
+	u8 num_target_ports;
+};
+
+static const struct rts490x_device_info rts490x_devices[] = {
+	{ "RTS4900", 0x4000, 4 },
+	{ "RTS4901", 0x4100, 4 },
+	{ "RTS4902", 0x8000, 8 },
+	{ "RTS4903", 0x8100, 8 },
+	{ "RTS4904", 0x4001, 4 },
+	{ "RTS4906", 0x8001, 8 },
+};
+
+static const struct mfd_cell rts490x_cells[] = {
+	MFD_CELL_NAME("rts490x-regulator"),
+	MFD_CELL_NAME("rts490x-i3c-hub"),
+};
+
+static const struct regmap_config rts490x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+};
+
+static int rts490x_read_device_info(struct device *dev, struct rts490x *rts490x)
+{
+	unsigned int value;
+	u16 part_id;
+	int ret;
+	int i;
+
+	ret = regmap_read(rts490x->regmap, RTS490X_DEV_INFO_0, &value);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read device information\n");
+
+	part_id = value << 8;
+
+	ret = regmap_read(rts490x->regmap, RTS490X_DEV_REV, &value);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read device revision\n");
+
+	part_id |= FIELD_GET(RTS490X_DEV_REV_LDO_MASK, value);
+
+	for (i = 0; i < ARRAY_SIZE(rts490x_devices); i++) {
+		if (rts490x_devices[i].part_id != part_id)
+			continue;
+
+		rts490x->model = rts490x_devices[i].model;
+		rts490x->part_id = part_id;
+		rts490x->num_target_ports = rts490x_devices[i].num_target_ports;
+		return 0;
+	}
+
+	return dev_err_probe(dev, -ENODEV,
+			     "unsupported RTS490x device ID 0x%04x\n", part_id);
+}
+
+static int rts490x_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct i3c_device_info info;
+	struct rts490x *rts490x;
+	int ret;
+
+	i3c_device_get_info(i3cdev, &info);
+	if (I3C_PID_MANUF_ID(info.pid) != RTS490X_MANUFACTURER_ID)
+		return -ENODEV;
+
+	rts490x = devm_kzalloc(dev, sizeof(*rts490x), GFP_KERNEL);
+	if (!rts490x)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &rts490x->protected_reg_lock);
+	if (ret)
+		return ret;
+
+	rts490x->regmap = devm_regmap_init_i3c(i3cdev, &rts490x_regmap_config);
+	if (IS_ERR(rts490x->regmap))
+		return dev_err_probe(dev, PTR_ERR(rts490x->regmap),
+				     "failed to initialize regmap\n");
+
+	rts490x->i3cdev = i3cdev;
+	i3cdev_set_drvdata(i3cdev, rts490x);
+
+	ret = rts490x_read_device_info(dev, rts490x);
+	if (ret)
+		return ret;
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				   rts490x_cells, ARRAY_SIZE(rts490x_cells),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add child devices\n");
+
+	dev_info(dev, "%s I3C hub with %u target ports\n",
+		 rts490x->model, rts490x->num_target_ports);
+
+	return 0;
+}
+
+static const struct i3c_device_id rts490x_i3c_ids[] = {
+	{
+		.match_flags = I3C_MATCH_DCR | I3C_MATCH_MANUF,
+		.dcr = I3C_DCR_HUB,
+		.manuf_id = RTS490X_MANUFACTURER_ID,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(i3c, rts490x_i3c_ids);
+
+static struct i3c_driver rts490x_driver = {
+	.driver.name = "rts490x",
+	.probe = rts490x_probe,
+	.id_table = rts490x_i3c_ids,
+};
+module_i3c_driver(rts490x_driver);
+
+MODULE_AUTHOR("Yin Zhou <zain_zhou@realsil.com.cn>");
+MODULE_DESCRIPTION("Realtek RTS490x I3C hub MFD driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/rts490x.h b/include/linux/mfd/rts490x.h
new file mode 100644
index 000000000000..2af77d22dab9
--- /dev/null
+++ b/include/linux/mfd/rts490x.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
+#ifndef _LINUX_MFD_RTS490X_H
+#define _LINUX_MFD_RTS490X_H
+
+#include <linux/bits.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#define RTS490X_MAX_TARGET_PORTS		8
+
+/* Device information registers shared by the MFD children. */
+#define RTS490X_DEV_INFO_0		0x00
+#define RTS490X_DEV_REV			0x0b
+#define RTS490X_DEV_REV_LDO_MASK	GENMASK(7, 6)
+
+/* Regulator registers shared with the regulator child. */
+#define RTS490X_LDO_CONF		0x16
+#define RTS490X_LDO_AND_PULLUP_CONF	0x19
+
+/* Protected-register access shared by the MFD children. */
+#define RTS490X_PROTECTION_CODE		0x10
+#define RTS490X_REGISTERS_LOCK_CODE	0x00
+#define RTS490X_REGISTERS_UNLOCK_CODE	0x69
+
+#define RTS490X_MANUFACTURER_ID		0x025d
+
+struct i3c_device;
+struct regmap;
+struct rts490x_hub;
+
+/**
+ * struct rts490x - shared state for RTS490x MFD children
+ * @i3cdev: upstream I3C device
+ * @regmap: register map shared by all child drivers
+ * @protected_reg_lock: serializes protected-register transactions
+ * @model: detected chip model
+ * @part_id: hardware part identifier
+ * @num_target_ports: number of implemented target ports
+ * @hub: hub child state used by the hub-device IBI handler
+ */
+struct rts490x {
+	struct i3c_device *i3cdev;
+	struct regmap *regmap;
+	/* Serializes protected-register transactions across child drivers. */
+	struct mutex protected_reg_lock;
+	const char *model;
+	u16 part_id;
+	u8 num_target_ports;
+	struct rts490x_hub *hub;
+};
+
+#endif /* _LINUX_MFD_RTS490X_H */
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
