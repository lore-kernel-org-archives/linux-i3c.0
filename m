Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15835C982D0
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dL1j3sMY6rAA5nzsw54JKkxHeNLyyT8mmMdKKpZUvk=; b=zsQihPQRzHca8c
	afXrZADYQ3YB4FjIhGlE2DzghEtyggGtMWoVlYKLPZQhrMttcGdkjJb0cC5rpCZB3xqHmMLguD/1h
	RjXfdxlGt/V7/4GzjiLjeRETP3YfQjxIJ3IcsxJwJLlTwCy8LN7Og3Is6qeZ9rr1bKj7U+UzktJiw
	r/0aWDURMnj5EzlPoxG5vasIh/rUVbcE8I/OdSrGs1xry6ZFDcODuZci44Z0NyBobW03SIHLm3XBi
	k5+rByW+FdCnDfkkox56pC5Z+TXzw864qH+Tlm5diwYiMN4U5+AjPkA/0ggMAPjWsuW6K5G75T4K/
	7AaTOB4Y664MgAX+/GQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ESV-0000000HEWM-2tfK;
	Sun, 20 Sep 2026 10:07:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ESU-0000000HEVb-3fiZ
	for linux-i3c@bombadil.infradead.org;
	Sun, 20 Sep 2026 10:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k/55xTDmUL0AILwQ/vqtDUtBgq9gvHUQCy21hJdwVyM=; b=Mqb7WAYXNjC1Ag27S8nbeZTyzY
	CERW6zyYnrf8e0pmBjF7H4wTq2tra7lce4Pwy5sR7rEVHwbLcPysNJ+caHWy/DkHqn/JuW+yU7fhp
	SDMvJ4AMxLZabzAIH+r/pPQIPDzNC6Tu+nhHixeEkELBrziveYxEpk1tGv+c6qaVVU0xP/8vJCGLq
	E8YuL8JYV1iduQqfV8+vteeNbr/Uovykp0l/9QvvEblKso4Pxrrp+8M7ginV6Bj8XplLPQOitTejv
	oZlf3gqo//z3dwyLD70N1iQFOAveO2nZqZuO23ZVxZGQePKV3VOgm3mloN/lrGYJcA0QGShK6BoE0
	Lh0/Y4pQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ESP-0000000BJM6-0bNB
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 10:07:41 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68KA6aBsA1619123, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1789898796;
	bh=k/55xTDmUL0AILwQ/vqtDUtBgq9gvHUQCy21hJdwVyM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=lHVfDLlNQNysUd8mgPwyaEMDswrFFGd7ig1tLatigY3oJI5kB3gtLpd84G0WjRTQO
	 5aEU3FGR6wJcaq62ajHlz0x1WGmVzgPEvpk8GVa96aR0YG00el7RxBMnXNUsNYwON8
	 EFbdczZCwUmiIJ0icSOpargE1jzuPWDApljsoE1L8GCH4Tp/gdx/5HIO/7TaSBx0/D
	 oitu0beSXi8BMzctvDNVGCiZtfefpypcwBefihAeNN65zNlBY/AQf7H/WGHDExyt3E
	 qFqnxJ1RQTPRfhoMaQSKp2YZFeh0Il8O+bPW+R8K1H4uWY2ljm7JFF6tn3a6vD7ZZU
	 k86ZQ91b5U2kg==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68KA6aBsA1619123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 20 Sep 2026 18:06:36 +0800
Received: from localhost (172.29.57.213) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 18:06:36 +0800
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
Subject: [RFC PATCH 3/4] regulator: rts490x: Add driver for on-die regulators
Date: Sun, 20 Sep 2026 18:05:00 +0800
Message-ID: <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
MIME-Version: 1.0
X-Originating-IP: [172.29.57.213]
X-ClientProxiedBy: RS-EX-MBS1.realsil.com.cn (172.29.17.101) To
 RS-EX-MBS2.realsil.com.cn (172.29.17.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_110738_255717_52D8B785 
X-CRM114-Status: GOOD (  22.68  )
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

Add regulator support for the four programmable LDO outputs in the
Realtek RTS490x I3C hub. The driver exposes the LDO voltage and enable
controls through the regulator framework while preserving protected
register state across updates.

Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
---
 MAINTAINERS                           |   1 +
 drivers/regulator/Kconfig             |   9 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/rts490x-regulator.c | 284 ++++++++++++++++++++++++++
 4 files changed, 295 insertions(+)
 create mode 100644 drivers/regulator/rts490x-regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 659f553420eb..6e7cb4ca92f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22999,6 +22999,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
 F:	drivers/mfd/rts490x-core.c
+F:	drivers/regulator/rts490x-regulator.c
 F:	include/linux/mfd/rts490x.h
 
 REALTEK OTTO WATCHDOG
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 00b152d95d42..c65c319ee676 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1030,6 +1030,15 @@ config REGULATOR_P3H2X4X
 	  Say M here if you want to include support for this regulator as
 	  a module. The module will be named "p3h2840_i3c_hub_regulator".
 
+config REGULATOR_RTS490X
+	tristate "Realtek RTS490x regulator support"
+	depends on MFD_RTS490X
+	help
+	  Enable support for the four programmable LDO outputs provided by
+	  Realtek RTS490x I3C hub devices. These outputs supply the controller
+	  ports and the two target-port groups. Their voltage and enable state
+	  are managed through the regulator framework.
+
 config REGULATOR_PALMAS
 	tristate "TI Palmas PMIC Regulators"
 	depends on MFD_PALMAS
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index a07702a49be4..57a2eec77b53 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -130,6 +130,7 @@ obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
 obj-$(CONFIG_REGULATOR_P3H2X4X) += p3h2840_i3c_hub_regulator.o
 obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
+obj-$(CONFIG_REGULATOR_RTS490X) += rts490x-regulator.o
 obj-$(CONFIG_REGULATOR_PCA9450) += pca9450-regulator.o
 obj-$(CONFIG_REGULATOR_PF0900) += pf0900-regulator.o
 obj-$(CONFIG_REGULATOR_PF9453) += pf9453-regulator.o
diff --git a/drivers/regulator/rts490x-regulator.c b/drivers/regulator/rts490x-regulator.c
new file mode 100644
index 000000000000..dda5f2b1bb95
--- /dev/null
+++ b/drivers/regulator/rts490x-regulator.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
+
+#include <linux/cleanup.h>
+#include <linux/mfd/rts490x.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+#define RTS490X_LDO_COUNT		4
+
+#define RTS490X_CP0_LDO_ENABLE		BIT(0)
+#define RTS490X_CP1_LDO_ENABLE		BIT(1)
+#define RTS490X_TP0145_LDO_ENABLE	BIT(2)
+#define RTS490X_TP2367_LDO_ENABLE	BIT(3)
+
+#define RTS490X_CP0_LDO_VOLTAGE_MASK	GENMASK(1, 0)
+#define RTS490X_CP1_LDO_VOLTAGE_MASK	GENMASK(3, 2)
+#define RTS490X_TP0145_LDO_VOLTAGE_MASK	GENMASK(5, 4)
+#define RTS490X_TP2367_LDO_VOLTAGE_MASK	GENMASK(7, 6)
+
+struct rts490x_regulator {
+	struct rts490x *rts490x;
+};
+
+struct rts490x_reg_state {
+	unsigned int original;
+	bool restore;
+};
+
+static void rts490x_regulator_lock(struct regulator_dev *rdev)
+{
+	struct rts490x_regulator *priv = rdev_get_drvdata(rdev);
+
+	mutex_lock(&priv->rts490x->protected_reg_lock);
+}
+
+static void rts490x_regulator_unlock(struct regulator_dev *rdev)
+{
+	struct rts490x_regulator *priv = rdev_get_drvdata(rdev);
+
+	mutex_unlock(&priv->rts490x->protected_reg_lock);
+}
+
+DEFINE_LOCK_GUARD_1(rts490x_regulator, struct regulator_dev,
+		    rts490x_regulator_lock(_T->lock),
+		    rts490x_regulator_unlock(_T->lock));
+
+static int rts490x_regulator_unprotect(struct regulator_dev *rdev,
+				       struct rts490x_reg_state *state)
+{
+	int ret;
+
+	state->restore = false;
+
+	ret = regmap_read(rdev->regmap, RTS490X_PROTECTION_CODE,
+			  &state->original);
+	if (ret)
+		return ret;
+
+	if (state->original == RTS490X_REGISTERS_UNLOCK_CODE)
+		return 0;
+
+	ret = regmap_write(rdev->regmap, RTS490X_PROTECTION_CODE,
+			   RTS490X_REGISTERS_UNLOCK_CODE);
+	if (!ret)
+		state->restore = true;
+
+	return ret;
+}
+
+static int rts490x_regulator_protect(struct regulator_dev *rdev,
+				     const struct rts490x_reg_state *state)
+{
+	if (!state->restore)
+		return 0;
+
+	return regmap_write(rdev->regmap, RTS490X_PROTECTION_CODE,
+			    state->original);
+}
+
+static int rts490x_regulator_enable(struct regulator_dev *rdev)
+{
+	struct rts490x_reg_state state;
+	int ret, ret2;
+
+	guard(rts490x_regulator)(rdev);
+
+	ret = rts490x_regulator_unprotect(rdev, &state);
+	if (ret)
+		return ret;
+
+	ret = regulator_enable_regmap(rdev);
+	ret2 = rts490x_regulator_protect(rdev, &state);
+
+	return ret ?: ret2;
+}
+
+static int rts490x_regulator_disable(struct regulator_dev *rdev)
+{
+	struct rts490x_reg_state state;
+	int ret, ret2;
+
+	guard(rts490x_regulator)(rdev);
+
+	ret = rts490x_regulator_unprotect(rdev, &state);
+	if (ret)
+		return ret;
+
+	ret = regulator_disable_regmap(rdev);
+	ret2 = rts490x_regulator_protect(rdev, &state);
+
+	return ret ?: ret2;
+}
+
+static int rts490x_regulator_set_voltage_sel(struct regulator_dev *rdev,
+					     unsigned int selector)
+{
+	struct rts490x_reg_state state;
+	int ret, ret2;
+
+	guard(rts490x_regulator)(rdev);
+
+	ret = rts490x_regulator_unprotect(rdev, &state);
+	if (ret)
+		return ret;
+
+	ret = regulator_set_voltage_sel_regmap(rdev, selector);
+	ret2 = rts490x_regulator_protect(rdev, &state);
+
+	return ret ?: ret2;
+}
+
+static const struct regulator_ops rts490x_regulator_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = rts490x_regulator_set_voltage_sel,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.enable = rts490x_regulator_enable,
+	.disable = rts490x_regulator_disable,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const unsigned int rts490x_voltage_table[] = {
+	1000000,
+	1100000,
+	1200000,
+	1800000,
+};
+
+static const struct regulator_desc rts490x_regulators[] = {
+	{
+		.name = "ldo-cp0",
+		.of_match = of_match_ptr("ldo-cp0"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = rts490x_voltage_table,
+		.n_voltages = ARRAY_SIZE(rts490x_voltage_table),
+		.ops = &rts490x_regulator_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = RTS490X_LDO_AND_PULLUP_CONF,
+		.enable_mask = RTS490X_CP0_LDO_ENABLE,
+		.enable_time = 5000,
+		.vsel_reg = RTS490X_LDO_CONF,
+		.vsel_mask = RTS490X_CP0_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-cp1",
+		.of_match = of_match_ptr("ldo-cp1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = rts490x_voltage_table,
+		.n_voltages = ARRAY_SIZE(rts490x_voltage_table),
+		.ops = &rts490x_regulator_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = RTS490X_LDO_AND_PULLUP_CONF,
+		.enable_mask = RTS490X_CP1_LDO_ENABLE,
+		.enable_time = 5000,
+		.vsel_reg = RTS490X_LDO_CONF,
+		.vsel_mask = RTS490X_CP1_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-tp0145",
+		.of_match = of_match_ptr("ldo-tp0145"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = rts490x_voltage_table,
+		.n_voltages = ARRAY_SIZE(rts490x_voltage_table),
+		.ops = &rts490x_regulator_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = RTS490X_LDO_AND_PULLUP_CONF,
+		.enable_mask = RTS490X_TP0145_LDO_ENABLE,
+		.enable_time = 5000,
+		.vsel_reg = RTS490X_LDO_CONF,
+		.vsel_mask = RTS490X_TP0145_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-tp2367",
+		.of_match = of_match_ptr("ldo-tp2367"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = rts490x_voltage_table,
+		.n_voltages = ARRAY_SIZE(rts490x_voltage_table),
+		.ops = &rts490x_regulator_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = RTS490X_LDO_AND_PULLUP_CONF,
+		.enable_mask = RTS490X_TP2367_LDO_ENABLE,
+		.enable_time = 5000,
+		.vsel_reg = RTS490X_LDO_CONF,
+		.vsel_mask = RTS490X_TP2367_LDO_VOLTAGE_MASK,
+	},
+};
+
+static int rts490x_regulator_probe(struct platform_device *pdev)
+{
+	struct device_node *regulators __free(device_node) = NULL;
+	struct rts490x *rts490x = dev_get_drvdata(pdev->dev.parent);
+	struct rts490x_regulator *priv;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	int i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->rts490x = rts490x;
+	platform_set_drvdata(pdev, priv);
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+
+	if (!pdev->dev.of_node) {
+		dev_warn(&pdev->dev,
+			 "no OF node; skipping on-chip LDO registration\n");
+		return 0;
+	}
+
+	regulators = of_get_available_child_by_name(pdev->dev.of_node, "regulators");
+	if (!regulators)
+		return 0;
+
+	config.dev = &pdev->dev;
+	config.regmap = rts490x->regmap;
+	config.driver_data = priv;
+
+	for (i = 0; i < ARRAY_SIZE(rts490x_regulators); i++) {
+		struct device_node *node __free(device_node) = NULL;
+		const char *name = rts490x_regulators[i].of_match;
+
+		node = of_get_available_child_by_name(regulators, name);
+		if (!node)
+			continue;
+
+		config.of_node = node;
+		rdev = devm_regulator_register(&pdev->dev, &rts490x_regulators[i],
+					       &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
+					     "failed to register %s\n",
+					     rts490x_regulators[i].name);
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id rts490x_regulator_ids[] = {
+	{ "rts490x-regulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, rts490x_regulator_ids);
+
+static struct platform_driver rts490x_regulator_driver = {
+	.driver = {
+		.name = "rts490x-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = rts490x_regulator_probe,
+	.id_table = rts490x_regulator_ids,
+};
+module_platform_driver(rts490x_regulator_driver);
+
+MODULE_AUTHOR("Yin Zhou <zain_zhou@realsil.com.cn>");
+MODULE_DESCRIPTION("Realtek RTS490x I3C hub regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
