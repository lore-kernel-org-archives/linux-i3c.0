Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D87CC6B38
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Oct 2026 16:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dNcX4iGtvNh1XF6i3RjTxZjLeoRPnhKOgCzmyorvxs=; b=oUEfCOfjQkrcOl
	yDOPejlQYachZ0Uci0PJC81OuBYbU/ezFTVcCHecWipo3uSo7p0Gs6q1yV/X26CoRBJ+KGxhx/9EJ
	nnKF6bN0zLZwlyTvpSsFXvtVLmZ8QH8ef90GhUD+dv0qIYcUk1gw0qHBh7chQ06XRFYblUcgvcGJh
	QzrX+lKNFFH1ZMDbGHhpBHKWrAGboK3xy/XjJ9i3tBJeHAkV6tWydrKPBxXZF/DuIuQZ+h+sYWXWF
	q8l1nJhMSU7cdo+mfgmUJ8Sovt3QlaxPgwqhgvK8uBYoKsBURTi/992cXX4cZe048e4BE+5p69JPC
	zd2Mo3iigOQwwOSwGqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5L-00000003S7s-14Un;
	Fri, 16 Oct 2026 16:47:11 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5F-00000003S3i-2izu
	for linux-i3c@lists.infradead.org;
	Fri, 16 Oct 2026 16:47:09 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 466AE1A0225;
	Fri, 16 Oct 2026 18:47:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A53731A0223;
	Fri, 16 Oct 2026 18:47:03 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D786C1800068;
	Sat, 17 Oct 2026 00:46:59 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com,
	linux-gpio@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP P3H2x4x I3C hub
Date: Fri, 16 Oct 2026 22:16:25 +0530
Message-Id: <20261016164625.3166779-8-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094706_091238_4EA9C162 
X-CRM114-Status: GOOD (  30.86  )
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

Expose the pins of the target ports placed in GPIO mode as a gpio_chip, so
the hub can be used as an IO expander.

Each port contributes two lines, the SCL pin first, so target port N owns
the lines 2 * N and 2 * N + 1, and the line number is also the port bit
position in the direction and level registers. Ports that carry bus traffic
are masked out through init_valid_mask. The port function is taken from the
device tree rather than from the GPIO mode register, because the hub child
that programs that register and this child are independent MFD devices with
no probe ordering guarantee.

Direction is the output enable: clearing it leaves the pin in Hi-Z. An
output drives the level before the buffer is enabled to avoid a glitch, and
the input level register is used for reads in both directions. These
registers are not protected, so the callbacks do not take the shared
register lock. Implement get_multiple and set_multiple so an access to all
lines of the hub costs two register accesses instead of one per line.

Interrupts on input level changes are not supported yet: they arrive as an
I3C in-band interrupt and the edge detection configuration is shared by
groups of four ports.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
---
 MAINTAINERS                 |   1 +
 drivers/gpio/Kconfig        |  11 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-p3h2x4x.c | 294 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/p3h2840.c       |   5 +
 5 files changed, 312 insertions(+)
 create mode 100644 drivers/gpio/gpio-p3h2x4x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 33d6e5178955..2578dadaa021 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19766,6 +19766,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-i3c@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+F:	drivers/gpio/gpio-p3h2x4x.c
 F:	drivers/i3c/hub.c
 F:	drivers/i3c/hub/*
 F:	drivers/mfd/p3h2840.c
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..996555c61a53 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1624,6 +1624,17 @@ config GPIO_PALMAS
 	  Select this option to enable GPIO driver for the TI PALMAS
 	  series chip family.
 
+config GPIO_P3H2X4X
+	tristate "NXP P3H2X4X I3C HUB GPIO support"
+	depends on MFD_P3H2X4X
+	help
+	  Select this option to enable the GPIO driver for the NXP
+	  P3H244x/P3H284x I3C hub. Target ports placed in GPIO mode expose
+	  their SCL and SDA pins as two general purpose IOs each.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called gpio-p3h2x4x.
+
 config GPIO_PMIC_EIC_SPRD
 	tristate "Spreadtrum PMIC EIC support"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..ee6d764310d8 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -138,6 +138,7 @@ obj-$(CONFIG_GPIO_NOVALAKE)		+= gpio-novalake-events.o
 obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
+obj-$(CONFIG_GPIO_P3H2X4X)		+= gpio-p3h2x4x.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
 obj-$(CONFIG_GPIO_PCA953X)		+= gpio-pca953x.o
 obj-$(CONFIG_GPIO_PCA9570)		+= gpio-pca9570.o
diff --git a/drivers/gpio/gpio-p3h2x4x.c b/drivers/gpio/gpio-p3h2x4x.c
new file mode 100644
index 000000000000..5e944965487d
--- /dev/null
+++ b/drivers/gpio/gpio-p3h2x4x.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 NXP
+ *
+ * GPIO expander driver for the NXP P3H2x4x I3C hub.
+ *
+ * Each target port that is put in GPIO mode contributes its two bus pins as
+ * generic IOs: SCL becomes GPIOn0 and SDA becomes GPIOn1 (datasheet 8.8.5).
+ * Ports are placed in GPIO mode by the hub driver, which owns the protected
+ * port mode register; this driver only drives the direction and level
+ * registers, which are not protected.
+ */
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/*
+ * Two GPIOs per target port. The SCL pin is the even line and the SDA pin the
+ * odd one, matching the GPIOn0 and GPIOn1 names used by the datasheet.
+ */
+#define P3H2X4X_GPIO_PER_PORT			2
+#define P3H2X4X_GPIO_PIN_SCL			0
+
+/*
+ * Target port direction and level registers, one bit per target port. These are
+ * not protected, so unlike the GPIO mode enable in the shared MFD header they
+ * are private to this driver. The output enable doubles as the direction: with
+ * it cleared the pin stays in Hi-Z, and the input level register reads back the
+ * pin in both directions.
+ */
+#define P3H2X4X_TP_SCL_OUT_EN			0x54
+#define P3H2X4X_TP_SDA_OUT_EN			0x55
+#define P3H2X4X_TP_SCL_OUT_LEVEL		0x56
+#define P3H2X4X_TP_SDA_OUT_LEVEL		0x57
+#define P3H2X4X_TP_SCL_IN_LEVEL_STS		0x60
+#define P3H2X4X_TP_SDA_IN_LEVEL_STS		0x61
+
+struct p3h2x4x_gpio {
+	struct gpio_chip chip;
+	struct regmap *regmap;
+};
+
+static unsigned int p3h2x4x_gpio_port(unsigned int offset)
+{
+	return offset / P3H2X4X_GPIO_PER_PORT;
+}
+
+static bool p3h2x4x_gpio_is_scl(unsigned int offset)
+{
+	return (offset % P3H2X4X_GPIO_PER_PORT) == P3H2X4X_GPIO_PIN_SCL;
+}
+
+static unsigned int p3h2x4x_gpio_out_en_reg(unsigned int offset)
+{
+	return p3h2x4x_gpio_is_scl(offset) ? P3H2X4X_TP_SCL_OUT_EN :
+					     P3H2X4X_TP_SDA_OUT_EN;
+}
+
+static unsigned int p3h2x4x_gpio_out_level_reg(unsigned int offset)
+{
+	return p3h2x4x_gpio_is_scl(offset) ? P3H2X4X_TP_SCL_OUT_LEVEL :
+					     P3H2X4X_TP_SDA_OUT_LEVEL;
+}
+
+static unsigned int p3h2x4x_gpio_in_level_reg(unsigned int offset)
+{
+	return p3h2x4x_gpio_is_scl(offset) ? P3H2X4X_TP_SCL_IN_LEVEL_STS :
+					     P3H2X4X_TP_SDA_IN_LEVEL_STS;
+}
+
+static int p3h2x4x_gpio_get_direction(struct gpio_chip *chip,
+				      unsigned int offset)
+{
+	struct p3h2x4x_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(gpio->regmap, p3h2x4x_gpio_out_en_reg(offset), &val);
+	if (ret)
+		return ret;
+
+	return (val & BIT(p3h2x4x_gpio_port(offset))) ? GPIO_LINE_DIRECTION_OUT :
+							GPIO_LINE_DIRECTION_IN;
+}
+
+static int p3h2x4x_gpio_direction_input(struct gpio_chip *chip,
+					unsigned int offset)
+{
+	struct p3h2x4x_gpio *gpio = gpiochip_get_data(chip);
+
+	/* Clearing the output enable puts the pin in Hi-Z. */
+	return regmap_clear_bits(gpio->regmap, p3h2x4x_gpio_out_en_reg(offset),
+				 BIT(p3h2x4x_gpio_port(offset)));
+}
+
+static int p3h2x4x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
+{
+	struct p3h2x4x_gpio *gpio = gpiochip_get_data(chip);
+
+	return regmap_update_bits(gpio->regmap,
+				  p3h2x4x_gpio_out_level_reg(offset),
+				  BIT(p3h2x4x_gpio_port(offset)),
+				  value ? BIT(p3h2x4x_gpio_port(offset)) : 0);
+}
+
+static int p3h2x4x_gpio_direction_output(struct gpio_chip *chip,
+					 unsigned int offset, int value)
+{
+	struct p3h2x4x_gpio *gpio = gpiochip_get_data(chip);
+	int ret;
+
+	/* Drive the requested level before enabling the output buffer. */
+	ret = p3h2x4x_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(gpio->regmap, p3h2x4x_gpio_out_en_reg(offset),
+			       BIT(p3h2x4x_gpio_port(offset)));
+}
+
+static int p3h2x4x_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct p3h2x4x_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	/*
+	 * The input level status register reflects the pin level in both
+	 * directions, so it also reads back what an output is driving.
+	 */
+	ret = regmap_read(gpio->regmap, p3h2x4x_gpio_in_level_reg(offset), &val);
+	if (ret)
+		return ret;
+
+	return !!(val & BIT(p3h2x4x_gpio_port(offset)));
+}
+
+static int p3h2x4x_gpio_get_multiple(struct gpio_chip *chip,
+				     unsigned long *mask, unsigned long *bits)
+{
+	struct p3h2x4x_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int scl, sda, off;
+	int ret;
+
+	/* One register per pin type covers every port, so two reads suffice. */
+	ret = regmap_read(gpio->regmap, P3H2X4X_TP_SCL_IN_LEVEL_STS, &scl);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(gpio->regmap, P3H2X4X_TP_SDA_IN_LEVEL_STS, &sda);
+	if (ret)
+		return ret;
+
+	for_each_set_bit(off, mask, chip->ngpio) {
+		unsigned int val = p3h2x4x_gpio_is_scl(off) ? scl : sda;
+
+		__assign_bit(off, bits, val & BIT(p3h2x4x_gpio_port(off)));
+	}
+
+	return 0;
+}
+
+static int p3h2x4x_gpio_set_multiple(struct gpio_chip *chip,
+				     unsigned long *mask, unsigned long *bits)
+{
+	struct p3h2x4x_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int scl_mask = 0, scl_val = 0;
+	unsigned int sda_mask = 0, sda_val = 0;
+	unsigned int off;
+	int ret;
+
+	/* Coalesce the requested lines into one write per pin type. */
+	for_each_set_bit(off, mask, chip->ngpio) {
+		unsigned int bit = BIT(p3h2x4x_gpio_port(off));
+
+		if (p3h2x4x_gpio_is_scl(off)) {
+			scl_mask |= bit;
+			if (test_bit(off, bits))
+				scl_val |= bit;
+		} else {
+			sda_mask |= bit;
+			if (test_bit(off, bits))
+				sda_val |= bit;
+		}
+	}
+
+	if (scl_mask) {
+		ret = regmap_update_bits(gpio->regmap,
+					 P3H2X4X_TP_SCL_OUT_LEVEL,
+					 scl_mask, scl_val);
+		if (ret)
+			return ret;
+	}
+
+	if (sda_mask)
+		return regmap_update_bits(gpio->regmap,
+					  P3H2X4X_TP_SDA_OUT_LEVEL,
+					  sda_mask, sda_val);
+
+	return 0;
+}
+
+/*
+ * Only the ports the device tree describes as "gpio" are usable as GPIOs. The
+ * remaining lines belong to ports running I2C, I3C or SMBus traffic and must
+ * not be handed out to consumers.
+ *
+ * The port function is derived from the device tree rather than from
+ * P3H2X4X_TP_GPIO_MODE_EN, because the hub child that programs that register
+ * and this child are independent MFD devices with no probe ordering
+ * guarantee. Reading the register here could therefore observe its reset
+ * value and mask off every line.
+ */
+static int p3h2x4x_gpio_init_valid_mask(struct gpio_chip *chip,
+					unsigned long *valid_mask,
+					unsigned int ngpios)
+{
+	unsigned int num_ports = ngpios / P3H2X4X_GPIO_PER_PORT;
+	struct device_node *np = dev_of_node(chip->parent);
+
+	bitmap_zero(valid_mask, ngpios);
+
+	for_each_available_child_of_node_scoped(np, child) {
+		u32 tp;
+
+		if (!of_node_name_eq(child, "gpio"))
+			continue;
+
+		if (of_property_read_u32(child, "reg", &tp) || tp >= num_ports)
+			continue;
+
+		bitmap_set(valid_mask, tp * P3H2X4X_GPIO_PER_PORT,
+			   P3H2X4X_GPIO_PER_PORT);
+	}
+
+	return 0;
+}
+
+static int p3h2x4x_gpio_probe(struct platform_device *pdev)
+{
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct p3h2x4x_gpio *gpio;
+
+	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->regmap = p3h2x4x->regmap;
+
+	device_set_of_node_from_dev(dev, dev->parent);
+
+	gpio->chip.label = dev_name(dev);
+	gpio->chip.parent = dev;
+	gpio->chip.owner = THIS_MODULE;
+	gpio->chip.base = -1;
+	gpio->chip.ngpio = p3h2x4x->num_target_ports * P3H2X4X_GPIO_PER_PORT;
+	gpio->chip.can_sleep = true;
+	gpio->chip.get_direction = p3h2x4x_gpio_get_direction;
+	gpio->chip.direction_input = p3h2x4x_gpio_direction_input;
+	gpio->chip.direction_output = p3h2x4x_gpio_direction_output;
+	gpio->chip.get = p3h2x4x_gpio_get;
+	gpio->chip.get_multiple = p3h2x4x_gpio_get_multiple;
+	gpio->chip.set = p3h2x4x_gpio_set;
+	gpio->chip.set_multiple = p3h2x4x_gpio_set_multiple;
+	gpio->chip.init_valid_mask = p3h2x4x_gpio_init_valid_mask;
+
+	return devm_gpiochip_add_data(dev, &gpio->chip, gpio);
+}
+
+static const struct platform_device_id p3h2x4x_gpio_id[] = {
+	{ .name = "p3h2x4x-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, p3h2x4x_gpio_id);
+
+static struct platform_driver p3h2x4x_gpio_driver = {
+	.driver = {
+		.name = "p3h2x4x-gpio",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = p3h2x4x_gpio_probe,
+	.id_table = p3h2x4x_gpio_id,
+};
+module_platform_driver(p3h2x4x_gpio_driver);
+
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
index c48984482148..87c0329e6272 100644
--- a/drivers/mfd/p3h2840.c
+++ b/drivers/mfd/p3h2840.c
@@ -15,9 +15,14 @@
 #include <linux/mfd/p3h2840.h>
 #include <linux/regmap.h>
 
+/*
+ * The hub cell owns the protected target port mode registers, including the
+ * GPIO mode enable, so it is listed before the GPIO cell.
+ */
 static const struct mfd_cell p3h2x4x_devs[] = {
 	MFD_CELL_NAME("p3h2x4x-regulator"),
 	MFD_CELL_NAME("p3h2x4x-i3c-hub"),
+	MFD_CELL_NAME("p3h2x4x-gpio"),
 };
 
 static const struct regmap_config p3h2x4x_regmap_config = {
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
