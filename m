Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6CACCA46C
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r35HpGoTEaAliklrd45Ylbv14BfMJ3/BP63yOBWOumw=; b=tnpTb9ioMEWFlL
	5SORjQa2BkZKvzzevG0Vf3XM/nw7V0bC/vXmQ2MyvtYCbH9l/Qa74B/CkY62lsRMII6ITrwMF0IZJ
	kQzcCxIZV1rCmvA+gKzBQk0T2cawaSzgkr15oYi9sfmVkhQD8lefP7UrOsVna19leyarQ5QL546L1
	or9U6My8QtkSqheQSb4cWQGCwW+kslmZFVYMJzhkDPfodJfSe3Uf0lcxE4GF3GxVpiYC9d300DhF7
	/NzFFcJUGKZ+DmdM33dTKgikMRh59LzCll7Umn8+P71oPVw3mNJHIreA9WHPuKM/6nnfY2B7HafWw
	cNMuKfAMNS9RV2V6bMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl4t-00000003Rvz-1s8L;
	Fri, 16 Oct 2026 16:46:43 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl4q-00000003Rup-1YIs
	for linux-i3c@lists.infradead.org;
	Fri, 16 Oct 2026 16:46:41 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ECDFC1A0224;
	Fri, 16 Oct 2026 18:46:38 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 83EA31A006F;
	Fri, 16 Oct 2026 18:46:38 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B487A1800068;
	Sat, 17 Oct 2026 00:46:34 +0800 (+08)
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
Subject: [RFC PATCH 1/7] i3c: hub: p3h2x4x: Add support for debugfs
Date: Fri, 16 Oct 2026 22:16:19 +0530
Message-Id: <20261016164625.3166779-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094640_681631_A34ED93B 
X-CRM114-Status: GOOD (  20.19  )
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

Add debugfs support to expose configurations and registers information
for the P3H2x4x I3C hub.

This change adds a debugfs interface that allows inspection of current HUB,
control port and target port configurations. It also provides a simple
mechanism to read and write HUB registers.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
 drivers/i3c/hub/p3h2840_i3c_hub.h        |   7 +
 drivers/i3c/hub/p3h2840_i3c_hub_common.c | 188 ++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index 0e59351e7b6d..5b3fb1752c7b 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -14,6 +14,9 @@
 #include <linux/i3c/master.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
+#endif
 
 /* I3C HUB REGISTERS */
 
@@ -313,6 +316,10 @@ struct tp_bus {
 };
 
 struct p3h2x4x_i3c_hub_dev {
+#ifdef CONFIG_DEBUG_FS
+	u8 reg_addr;			/* Offset of the HUB register to read or write. */
+	struct dentry *debugfs_dir;
+#endif
 	struct device *dev;
 	struct regmap *regmap;
 	struct mutex etx_mutex;      /* all port mutex */
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
index 0c18459d7ec6..906034632a94 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_common.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
@@ -298,6 +298,192 @@ static void p3h2x4x_clear_i3c_hub_priv(void *data)
 	p3h2x4x->i3c_hub_priv = NULL;
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+static int p3h2x4x_i3c_hub_access_reg_get(void *dvrdata, u64 *val)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dvrdata;
+	u32 reg_val;
+	int ret;
+
+	ret = regmap_read(p3h2x4x_i3c_hub->regmap, p3h2x4x_i3c_hub->reg_addr, &reg_val);
+	if (ret)
+		return ret;
+
+	*val = reg_val & 0xFF;
+	return 0;
+}
+
+static int p3h2x4x_i3c_hub_access_reg_set(void *dvrdata, u64 val)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dvrdata;
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(p3h2x4x_i3c_hub->dev->parent);
+	int ret, ret2;
+
+	/* HUB registers are one byte wide, reject anything that does not fit. */
+	if (val > U8_MAX)
+		return -EINVAL;
+
+	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
+		ret = regmap_write(p3h2x4x_i3c_hub->regmap,
+				   P3H2X4X_DEV_REG_PROTECTION_CODE,
+				   P3H2X4X_REGISTERS_UNLOCK_CODE);
+		if (ret)
+			break;
+
+		ret = regmap_write(p3h2x4x_i3c_hub->regmap,
+				   p3h2x4x_i3c_hub->reg_addr, val);
+
+		ret2 = regmap_write(p3h2x4x_i3c_hub->regmap,
+				    P3H2X4X_DEV_REG_PROTECTION_CODE,
+				    P3H2X4X_REGISTERS_LOCK_CODE);
+		if (!ret && ret2)
+			ret = ret2;
+	}
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(p3h2x4x_i3c_hub_access_reg, p3h2x4x_i3c_hub_access_reg_get,
+			 p3h2x4x_i3c_hub_access_reg_set, "%llx\n");
+
+static int p3h2x4x_i3c_hub_offset_reg_get(void *dvrdata, u64 *val)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dvrdata;
+
+	*val = p3h2x4x_i3c_hub->reg_addr;
+
+	return 0;
+}
+
+static int p3h2x4x_i3c_hub_offset_reg_set(void *dvrdata, u64 val)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dvrdata;
+
+	if (val > U8_MAX)
+		return -EINVAL;
+
+	p3h2x4x_i3c_hub->reg_addr = val;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(p3h2x4x_i3c_hub_offset_reg, p3h2x4x_i3c_hub_offset_reg_get,
+			 p3h2x4x_i3c_hub_offset_reg_set, "%llx\n");
+
+static int p3h2x4x_i3c_hub_tp_mode_show(struct seq_file *s, void *data)
+{
+	const struct tp_configuration *tp_config = s->private;
+
+	seq_printf(s, "%s\n",
+		   tp_config->mode == P3H2X4X_TP_MODE_SMBUS ? "smbus" : "i3c");
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(p3h2x4x_i3c_hub_tp_mode);
+
+static void p3h2x4x_i3c_hub_debugfs_remove(void *data)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = data;
+
+	debugfs_remove_recursive(p3h2x4x_i3c_hub->debugfs_dir);
+}
+
+static int p3h2x4x_i3c_hub_debugfs_init(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub)
+{
+	struct device *dev = p3h2x4x_i3c_hub->dev;
+	struct dentry *conf_dir;
+	struct dentry *tp_dir;
+	struct dentry *cp_dir;
+	struct dentry *reg_dir;
+	char hub_id[64];
+	char dir_name[32];
+	int i;
+
+	if (p3h2x4x_i3c_hub->i3cdev) {
+		snprintf(hub_id, sizeof(hub_id), "i3c-hub-device-%d-%llx",
+			 i3c_dev_get_master(p3h2x4x_i3c_hub->i3cdev->desc)->bus.id,
+			 p3h2x4x_i3c_hub->i3cdev->desc->info.pid);
+	} else {
+		struct i2c_client *client = to_i2c_client(dev->parent);
+
+		/*
+		 * Include the client address, the adapter number alone is not
+		 * unique when more than one HUB sits on the same I2C adapter
+		 * and the resulting debugfs directory name would collide.
+		 */
+		snprintf(hub_id, sizeof(hub_id), "i3c-hub-device-%d-%02x",
+			 client->adapter->nr, client->addr);
+	}
+
+	p3h2x4x_i3c_hub->debugfs_dir = debugfs_create_dir(hub_id, NULL);
+
+	conf_dir = debugfs_create_dir("dt-p3h2x4x-conf", p3h2x4x_i3c_hub->debugfs_dir);
+
+	cp_dir = debugfs_create_dir("p3h2x4x-control-ports", conf_dir);
+
+	debugfs_create_u32("cp0-io-strength-ohms", 0400, cp_dir,
+			   &p3h2x4x_i3c_hub->hub_config.cp0_io_strength);
+
+	debugfs_create_u32("cp1-io-strength-ohms", 0400, cp_dir,
+			   &p3h2x4x_i3c_hub->hub_config.cp1_io_strength);
+
+	for (i = 0; i < P3H2X4X_TP_MAX_COUNT; ++i) {
+		struct tp_configuration *tp_config = &p3h2x4x_i3c_hub->hub_config.tp_config[i];
+
+		snprintf(dir_name, sizeof(dir_name), "target-port-%d", i);
+
+		tp_dir = debugfs_create_dir(dir_name, conf_dir);
+
+		debugfs_create_file("mode", 0400, tp_dir, tp_config,
+				    &p3h2x4x_i3c_hub_tp_mode_fops);
+
+		debugfs_create_bool("pullup-enable", 0400, tp_dir, &tp_config->pullup_en);
+
+		debugfs_create_bool("ibi-enable", 0400, tp_dir, &tp_config->ibi_en);
+
+		debugfs_create_bool("always-enable", 0400, tp_dir, &tp_config->always_enable);
+
+		/*
+		 * Target ports are grouped in fours (0145 and 2367) and each
+		 * group shares a single I/O strength and pull-up setting.
+		 */
+		if ((i / 2) % 2 == 0) {
+			debugfs_create_u32("io-strength-ohms", 0400, tp_dir,
+					   &p3h2x4x_i3c_hub->hub_config.tp0145_io_strength);
+
+			debugfs_create_u32("internal-pullups-ohms", 0400, tp_dir,
+					   &p3h2x4x_i3c_hub->hub_config.tp0145_pullup);
+		} else {
+			debugfs_create_u32("io-strength-ohms", 0400, tp_dir,
+					   &p3h2x4x_i3c_hub->hub_config.tp2367_io_strength);
+
+			debugfs_create_u32("internal-pullups-ohms", 0400, tp_dir,
+					   &p3h2x4x_i3c_hub->hub_config.tp2367_pullup);
+		}
+	}
+
+	reg_dir = debugfs_create_dir("reg", p3h2x4x_i3c_hub->debugfs_dir);
+
+	debugfs_create_file_unsafe("access", 0600, reg_dir, p3h2x4x_i3c_hub,
+				   &p3h2x4x_i3c_hub_access_reg);
+
+	debugfs_create_file_unsafe("offset", 0600, reg_dir, p3h2x4x_i3c_hub,
+				   &p3h2x4x_i3c_hub_offset_reg);
+
+	return devm_add_action_or_reset(dev, p3h2x4x_i3c_hub_debugfs_remove,
+					p3h2x4x_i3c_hub);
+}
+
+#else
+
+static inline int p3h2x4x_i3c_hub_debugfs_init(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub)
+{
+	return 0;
+}
+
+#endif /* CONFIG_DEBUG_FS */
+
 static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
 {
 	struct p3h2x4x *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
@@ -387,7 +573,7 @@ static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return 0;
+	return p3h2x4x_i3c_hub_debugfs_init(p3h2x4x_i3c_hub);
 }
 
 static const struct platform_device_id p3h2x4x_i3c_hub_id[] = {
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
