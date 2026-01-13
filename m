Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9E4D0C857
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUUz/R3QoNsiHkFmIdLqMPFK5ydIvPHNdukKsQR5gC8=; b=C03GIzaVBoyL/i
	dYF/LEM3fhr2PFnzKeOpjuZjXu2xzd6zNY8ePwIw7c/OEoEm+2WKkMzOHatjtnHyjXLO5AmnMgUeS
	Yc+syfTqDUS+VJ1MIaAU5J/HeSiwthwBg76j60+vCPcvcIVtp/Ww8humAx8IbGeaqA/81bn096HV/
	gv8PWp7bD374RfOBYnnUwl2YvhUle4jJQxWBBINhIiN+u6FBIRv2DcsxEEj9kqVTSkAkA9ndiLyuq
	ORwkBCuTkNyREgFGsgWV+ZWaWEgtp+UytOz6j5mTWZ2l7ms6i+knK7qRVWBDOw1KT3JzufKoVarVh
	xaA1yycVCoKbSNRhpnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcqb-000000072Je-3LsC;
	Tue, 13 Jan 2026 11:46:05 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcqX-000000072IS-3rJ7
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 11:46:05 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8B3832023B3;
	Tue, 13 Jan 2026 12:46:00 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 87FBE2023A5;
	Tue, 13 Jan 2026 12:46:00 +0100 (CET)
Received: from lsv15573.swis.ro-buh01.nxp.com (lsv15573.swis.ro-buh01.nxp.com [10.172.0.77])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 889D0202F3;
	Tue, 13 Jan 2026 12:45:58 +0100 (CET)
From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
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
	shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: [PATCH v4 4/5] regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub
Date: Tue, 13 Jan 2026 13:45:28 +0200
Message-Id: <20260113114529.1692213-4-aman.kumarpandey@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_034603_934618_AB7B7992 
X-CRM114-Status: GOOD (  20.90  )
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

The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
functionality. This driver registers the regulators using the MFD
framework and exposes them via the regulator subsystem.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

---
Changes in v4:
 - Split the driver into three separate patches (mfd, regulator and I3C hub) 
 - Introduced driver for on-die regulators in NXP P3H2x4x I3C hub
---
---
 MAINTAINERS                                   |   3 +
 drivers/regulator/Kconfig                     |  10 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 162 ++++++++++++++++++
 4 files changed, 176 insertions(+)
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aa7043499223..4bcd52d65f1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18934,6 +18934,9 @@ F:	Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml
 F:	drivers/mfd/Kconfig
 F:	drivers/mfd/Makefile
 F:	drivers/mfd/p3h2840.c
+F:	drivers/regulator/Kconfig
+F:	drivers/regulator/Makefile
+F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
 F:	include/linux/mfd/p3h2840.h
 
 NXP SGTL5000 DRIVER
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d2335276cce5..aa8c06c1253a 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1085,6 +1085,16 @@ config REGULATOR_PF8X00
 	  on the NXP PF8100/PF8121A/PF8200 PMIC. The module will be named
 	  "pf8x00-regulator".
 
+config REGULATOR_P3H2X4X
+       tristate "P3H2X4X regulator support"
+       depends on MFD_P3H2X4X
+       help
+         This driver provides support for the voltage regulators of the
+         P3H244x/P3H284x multi-function I3C Hub device.
+
+         Say M here if you want to include support for this regulator as
+         a module. The module will be named "p3h2840_i3c_hub_regulator".
+
 config REGULATOR_PFUZE100
 	tristate "Freescale PFUZE100/200/3000/3001 regulator driver"
 	depends on I2C && OF
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 1beba1493241..4cece550b4c1 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -214,5 +214,6 @@ obj-$(CONFIG_REGULATOR_WM831X) += wm831x-ldo.o
 obj-$(CONFIG_REGULATOR_WM8350) += wm8350-regulator.o
 obj-$(CONFIG_REGULATOR_WM8400) += wm8400-regulator.o
 obj-$(CONFIG_REGULATOR_WM8994) += wm8994-regulator.o
+obj-$(CONFIG_REGULATOR_P3H2X4X) += p3h2840_i3c_hub_regulator.o
 
 ccflags-$(CONFIG_REGULATOR_DEBUG) += -DDEBUG
diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regulator/p3h2840_i3c_hub_regulator.c
new file mode 100644
index 000000000000..bf34e5f1f3ba
--- /dev/null
+++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ * This P3H2x4x driver file contain functions for enable/disable regulator and voltage set/get.
+ */
+#include <linux/regulator/driver.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/mfd/p3h2840.h>
+
+#define P3H2x4x_LDO_AND_PULLUP_CONF				0x19
+#define P3H2x4x_LDO_ENABLE_DISABLE_MASK				GENMASK(3, 0)
+#define P3H2x4x_CP0_EN_LDO				        BIT(0)
+#define P3H2x4x_CP1_EN_LDO				        BIT(1)
+#define P3H2x4x_TP0145_EN_LDO					BIT(2)
+#define P3H2x4x_TP2367_EN_LDO					BIT(3)
+
+#define P3H2x4x_NET_OPER_MODE_CONF				0x15
+#define P3H2x4x_VCCIO_LDO_CONF					0x16
+#define P3H2x4x_CP0_VCCIO_LDO_VOLTAGE_MASK			GENMASK(1, 0)
+#define P3H2x4x_CP0_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2x4x_CP0_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2x4x_CP1_VCCIO_LDO_VOLTAGE_MASK			GENMASK(3, 2)
+#define P3H2x4x_CP1_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2x4x_CP1_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE_MASK			GENMASK(5, 4)
+#define P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE_MASK			GENMASK(7, 6)
+#define P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2x4x_LDO_COUNT					4
+
+struct p3h2x4x_regulator_dev {
+	struct regulator_dev *rp3h2x4x_dev[P3H2x4x_LDO_COUNT];
+	struct regmap *regmap;
+};
+
+static const struct regulator_ops p3h2x4x_ldo_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const unsigned int p3h2x4x_voltage_table[] = {
+	1000000,
+	1100000,
+	1200000,
+	1800000,
+};
+
+static struct regulator_desc p3h2x4x_regulators[] = {
+	{
+		.name = "cp0",
+		.of_match = of_match_ptr("cp0"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2x4x_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2x4x_CP0_EN_LDO,
+		.vsel_reg = P3H2x4x_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2x4x_CP0_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "cp1",
+		.of_match = of_match_ptr("cp1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2x4x_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2x4x_CP1_EN_LDO,
+		.vsel_reg = P3H2x4x_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2x4x_CP1_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "tp0145",
+		.of_match = of_match_ptr("tp0145"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2x4x_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2x4x_TP0145_EN_LDO,
+		.vsel_reg = P3H2x4x_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "tp2367",
+		.of_match = of_match_ptr("tp2367"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2x4x_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2x4x_TP2367_EN_LDO,
+		.vsel_reg = P3H2x4x_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE_MASK,
+	},
+};
+
+static int p3h2x4x_regulator_probe(struct platform_device *pdev)
+{
+	struct p3h2x4x_dev *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
+	struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
+	struct regulator_config rcfg = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+	int ret, i;
+
+	p3h2x4x_regulator = devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), GFP_KERNEL);
+	if (!p3h2x4x_regulator)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, p3h2x4x_regulator);
+
+	p3h2x4x_regulator->regmap = p3h2x4x->regmap;
+	device_set_of_node_from_dev(dev, dev->parent);
+
+	rcfg.dev = dev;
+	rcfg.dev->of_node = dev->of_node;
+	rcfg.regmap = p3h2x4x_regulator->regmap;
+	rcfg.driver_data = p3h2x4x_regulator;
+
+	for (i = 0; i < ARRAY_SIZE(p3h2x4x_regulators); i++) {
+		rdev = devm_regulator_register(&pdev->dev, &p3h2x4x_regulators[i], &rcfg);
+		if (IS_ERR(rdev)) {
+			ret = PTR_ERR(rdev);
+			dev_err(dev, "Failed to register %s\n", p3h2x4x_regulators[i].name);
+			return ret;
+		}
+		p3h2x4x_regulator->rp3h2x4x_dev[i] = rdev;
+	}
+	return 0;
+}
+
+static struct platform_driver p3h2x4x_regulator_driver = {
+	.driver = {
+		.name = "p3h2x4x-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = p3h2x4x_regulator_probe,
+};
+module_platform_driver(p3h2x4x_regulator_driver);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_DESCRIPTION("P3H2x4x I3C HUB driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
