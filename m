Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D092CC6B38
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Oct 2026 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dySX718PZXBi6Vomlv4PsSI4zVwfiSvGtUEHon9YB0=; b=jCe/kyGjILBsHx
	f+UeLLnH4z/zmramKmaZgqLLpUrN6yd+cybH0TCwZRuwdoM4JLmo18OwvyhRNJHm56lM6Ut1RZMwj
	HxXU7GSaAmE/6+dug0iyhn3acemJdS0l9soc6a+JvnG07D6J8owPau90MspOCRqdSqQGiDVYqXjYs
	ohpUyKt/xZuJF25ej0OMLPtSnZ+aKfL9atHiNVjBhuvNliobiGRcdweWJf7Z/VnMIYTnYv0fAQcly
	i4BJ91EIQAhmUfWRnIX+GJCH43Y60TVmjf+KvPwpVfVk7ODhyV7YusAuCDbDUoeNEKJM1+MWoNRpe
	GKNk8AKEgrlh+h3ZSY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5E-00000003S3w-3Z79;
	Fri, 16 Oct 2026 16:47:04 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5B-00000003S1p-1K7Z
	for linux-i3c@lists.infradead.org;
	Fri, 16 Oct 2026 16:47:03 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DF5551A006F;
	Fri, 16 Oct 2026 18:46:59 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 757FE1A0223;
	Fri, 16 Oct 2026 18:46:59 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A642E18000B1;
	Sat, 17 Oct 2026 00:46:55 +0800 (+08)
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
Subject: [RFC PATCH 6/7] i3c: hub: p3h2x4x: configure target ports placed in GPIO mode
Date: Fri, 16 Oct 2026 22:16:24 +0530
Message-Id: <20261016164625.3166779-7-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094702_481309_01CF099A 
X-CRM114-Status: GOOD (  18.55  )
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

Add a GPIO target port mode, selected by a "gpio@N" device tree node, and
program the target port GPIO mode register that was defined but never
written.

GPIO mode has higher priority than the SMBus agent and the Hub Network
connection and leaves the port disconnected from the network, so commit it
with the other port mode bits while the protected registers are unlocked,
and exclude the port from the Controller Port multiplexer request along
with the SMBus ports.

The mode enable is a protected register owned by this driver, while the
direction and level registers are driven by the GPIO child, so move the
mode enable to the shared MFD header.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
---
 drivers/i3c/hub/p3h2840_i3c_hub.h        |  8 +-----
 drivers/i3c/hub/p3h2840_i3c_hub_common.c | 34 +++++++++++++++++++-----
 include/linux/mfd/p3h2840.h              |  8 ++++++
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index ad2e7cb7f5ea..595e3ec60fd2 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -73,7 +73,6 @@
 
 #define P3H2X4X_IBI_MDB_CUSTOM					0x1c
 #define P3H2X4X_JEDEC_CONTEXT_ID				0x1d
-#define P3H2X4X_TP_GPIO_MODE_EN					0x1e
 
 /* Device Status and IBI Registers */
 #define P3H2X4X_DEV_AND_IBI_STS					0x20
@@ -92,17 +91,11 @@
 
 #define P3H2X4X_TP_PULLUP_EN					0x53
 
-#define P3H2X4X_TP_SCL_OUT_EN					0x54
-#define P3H2X4X_TP_SDA_OUT_EN					0x55
-#define P3H2X4X_TP_SCL_OUT_LEVEL				0x56
-#define P3H2X4X_TP_SDA_OUT_LEVEL				0x57
 #define P3H2X4X_TP_IN_DETECT_MODE_CONF				0x58
 #define P3H2X4X_TP_SCL_IN_DETECT_IBI_EN				0x59
 #define P3H2X4X_TP_SDA_IN_DETECT_IBI_EN				0x5a
 
 /* Target Ports Status Registers */
-#define P3H2X4X_TP_SCL_IN_LEVEL_STS				0x60
-#define P3H2X4X_TP_SDA_IN_LEVEL_STS				0x61
 #define P3H2X4X_TP_SCL_IN_DETECT_FLG				0x62
 #define P3H2X4X_TP_SDA_IN_DETECT_FLG				0x63
 
@@ -302,6 +295,7 @@ enum p3h2x4x_rcv_buf {
 enum p3h2x4x_tp_mode {
 	P3H2X4X_TP_MODE_I3C,
 	P3H2X4X_TP_MODE_SMBUS,
+	P3H2X4X_TP_MODE_GPIO,
 };
 
 struct tp_configuration {
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
index 906034632a94..0caf69b3cc1d 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_common.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
@@ -98,7 +98,7 @@ static int p3h2x4x_configure_tp(struct device *dev)
 {
 	struct p3h2x4x_i3c_hub_dev *hub = dev_get_drvdata(dev);
 	struct p3h2x4x *p3h2x4x = dev_get_drvdata(dev->parent);
-	u8 mode = 0, smbus = 0, pullup = 0, target_port = 0;
+	u8 mode = 0, smbus = 0, pullup = 0, target_port = 0, gpio = 0;
 	u8 tp_mask;
 	int tp, ret;
 
@@ -110,6 +110,8 @@ static int p3h2x4x_configure_tp(struct device *dev)
 			 P3H2X4X_SET_BIT(tp) : 0;
 		target_port |= (hub->tp_bus[tp].tp_mask == P3H2X4X_SET_BIT(tp)) ?
 			       hub->tp_bus[tp].tp_mask : 0;
+		gpio |= (hub->hub_config.tp_config[tp].mode == P3H2X4X_TP_MODE_GPIO) ?
+			P3H2X4X_SET_BIT(tp) : 0;
 	}
 
 	/* Only touch the bits for the target ports this variant provides. */
@@ -127,7 +129,19 @@ static int p3h2x4x_configure_tp(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (target_port & ~smbus) {
+	/*
+	 * GPIO mode takes priority over the SMBus agent and the Hub Network
+	 * connection, and leaves the port disconnected from the network
+	 * (datasheet Table 10). Program it here, together with the other port
+	 * mode bits, so the port function is committed in one place. The GPIO
+	 * child driver then only touches the unprotected direction and level
+	 * registers.
+	 */
+	ret = regmap_update_bits(hub->regmap, P3H2X4X_TP_GPIO_MODE_EN, tp_mask, gpio);
+	if (ret)
+		return ret;
+
+	if (target_port & ~(smbus | gpio)) {
 		ret = regmap_write(hub->regmap, P3H2X4X_CP_MUX_SET,
 				   P3H2X4X_CONTROLLER_PORT_MUX_REQ);
 		if (ret)
@@ -206,14 +220,16 @@ static int p3h2x4x_parse_tp_dt_settings(struct device *dev,
 		enum p3h2x4x_tp_mode mode;
 
 		/*
-		 * Only "i3c" and "smbus" children describe target ports. Skip any
-		 * other child (for example the MFD "regulators" container), which
-		 * has no "reg" property.
+		 * Only "i3c", "smbus" and "gpio" children describe target ports.
+		 * Skip any other child (for example the MFD "regulators"
+		 * container), which has no "reg" property.
 		 */
 		if (of_node_name_eq(tp_node, "i3c"))
 			mode = P3H2X4X_TP_MODE_I3C;
 		else if (of_node_name_eq(tp_node, "smbus"))
 			mode = P3H2X4X_TP_MODE_SMBUS;
+		else if (of_node_name_eq(tp_node, "gpio"))
+			mode = P3H2X4X_TP_MODE_GPIO;
 		else
 			continue;
 
@@ -373,10 +389,14 @@ DEFINE_DEBUGFS_ATTRIBUTE(p3h2x4x_i3c_hub_offset_reg, p3h2x4x_i3c_hub_offset_reg_
 
 static int p3h2x4x_i3c_hub_tp_mode_show(struct seq_file *s, void *data)
 {
+	static const char * const mode_names[] = {
+		[P3H2X4X_TP_MODE_I3C] = "i3c",
+		[P3H2X4X_TP_MODE_SMBUS] = "smbus",
+		[P3H2X4X_TP_MODE_GPIO] = "gpio",
+	};
 	const struct tp_configuration *tp_config = s->private;
 
-	seq_printf(s, "%s\n",
-		   tp_config->mode == P3H2X4X_TP_MODE_SMBUS ? "smbus" : "i3c");
+	seq_printf(s, "%s\n", mode_names[tp_config->mode]);
 
 	return 0;
 }
diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
index eb4792de5440..537ff7d28690 100644
--- a/include/linux/mfd/p3h2840.h
+++ b/include/linux/mfd/p3h2840.h
@@ -24,6 +24,14 @@
 #define P3H2X4X_REGISTERS_UNLOCK_CODE				0x69
 #define P3H2X4X_CP1_REGISTERS_UNLOCK_CODE			0x6a
 
+/*
+ * Target port GPIO mode enable, one bit per target port. Shared because the
+ * hub driver owns this protected register while the GPIO driver depends on it
+ * to know which ports it may drive. The direction and level registers are not
+ * protected and are private to the GPIO driver.
+ */
+#define P3H2X4X_TP_GPIO_MODE_EN					0x1e
+
 #define I3C_MANUF_ID_NXP					0x011b
 
 struct p3h2x4x_i3c_hub_dev;
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
