Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D631ECD5BBF
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 06:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCctVK4jv6bF4nG0nyKslH25Z+65hnBEoelGT/OVItw=; b=ZZNdPmaEBXrLXh
	sFjpFXirfGsoUTJ4PTurFpa7o/DsaUkwFPakUXEwsKoDJL16Z/NxgnpRSArGNfnwLCi4fLmsT2Loy
	cY190YigRPqwCpXIj4aHTwkZi1CXLRa6a0IuOZswqhHg9/G90dx468CZ4jEvX1PhyWybiJEur2E/Z
	eJIi/F04TUr++SS+ok0EBm2CvCyV28a/c7W1yqjo7t29ItRb59ky0zwd0nwP0lURt+QSOxHc8Ji/f
	4oyeZmSLqqg08qOF8LkCRL+1hRM/QmASAXhHK8o6APshb6z2jV7/SmTM9hpBSzlgPryujOoWUF4sq
	dzruQS5chNXeNA1FnKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRP1J-0000000GRs2-2cxN;
	Mon, 25 May 2026 06:42:37 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRP1G-0000000GRov-2gl7
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 06:42:36 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 45999202D45;
	Mon, 25 May 2026 08:42:33 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0EA10202163;
	Mon, 25 May 2026 08:42:33 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BD9501800071;
	Mon, 25 May 2026 14:42:31 +0800 (+08)
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
Subject: [PATCH v10 9/9] i3c: hub: p3h2x4x: Add SMBus slave mode support
Date: Mon, 25 May 2026 12:12:09 +0530
Message-Id: <20260525064209.2263045-10-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_234234_945699_23878771 
X-CRM114-Status: GOOD (  17.99  )
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

Add SMBus slave mode support for the P3H2x4x hub SMBus target ports.

The hub SMBus slave agent can receive downstream payloads into target
buffers and report receive events through IBI. Add CONFIG_I2C_SLAVE
to support the receive path and forward the received payloads to the
registered I2C slave client through i2c_slave_event().

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

---
Changes in v10:
 - Split SMBus slave mode support into a separate patch
---
---
 drivers/i3c/hub/p3h2840_i3c_hub.h        |  10 ++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c |   6 +
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c    |  17 +++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c  | 181 +++++++++++++++++++++++
 4 files changed, 214 insertions(+)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index d69fafbac584..84d9c66547c6 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -324,4 +324,14 @@ int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
  */
 int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
 
+/**
+ * p3h2x4x_ibi_handler - IBI handler.
+ * @i3cdev: i3c device.
+ * @payload: two byte IBI payload data.
+ */
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
+			 const struct i3c_ibi_payload *payload);
+#endif
+
 #endif /* P3H2840_I3C_HUB_H */
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
index f1a24a3d3ffa..26d5e13455ca 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_common.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
@@ -328,6 +328,12 @@ static void p3h2x4x_i3c_hub_remove(struct platform_device *pdev)
 			i3c_master_unregister(&p3h2x4x_i3c_hub->tp_bus[i]
 					      .hub_controller.controller);
 	}
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (p3h2x4x->i3cdev) {
+		i3c_device_disable_ibi(p3h2x4x->i3cdev);
+		i3c_device_free_ibi(p3h2x4x->i3cdev);
+	}
+#endif
 }
 
 static struct platform_driver p3h2x4x_i3c_hub_driver = {
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
index 38505dda0e81..544d961d0b8a 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
@@ -10,6 +10,14 @@
 
 #include "p3h2840_i3c_hub.h"
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static const struct i3c_ibi_setup p3h2x4x_ibireq = {
+	.handler = p3h2x4x_ibi_handler,
+	.max_payload_len = P3H2X4X_MAX_PAYLOAD_LEN,
+	.num_slots = P3H2X4X_NUM_SLOTS,
+};
+#endif
+
 static inline struct tp_bus *
 p3h2x4x_bus_from_controller(struct i3c_master_controller *controller)
 {
@@ -120,5 +128,14 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
 		p3h2x4x_hub->tp_bus[tp].is_registered = true;
 		p3h2x4x_hub->hub_config.tp_config[tp].always_enable = true;
 	}
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	ret = i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
+	if (ret)
+		return ret;
+
+	ret = i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);
+	if (ret)
+		return ret;
+#endif
 	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
 }
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
index 43639f04b77a..12fac276b041 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -15,6 +15,135 @@ enum p3h2x4x_smbus_desc_idx {
 	P3H2X4X_DESC_READ_LEN,
 };
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, enum p3h2x4x_rcv_buf rfbuf,
+					    enum p3h2x4x_tp tp, bool is_of)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = i3cdev_get_drvdata(i3cdev);
+	u8 slave_rx_buffer[P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE] = { 0 };
+	u8 target_buffer_page, flag_clear = 0x0f, temp, i;
+	u32 packet_len, slave_address, ret;
+
+	target_buffer_page = (((rfbuf) ? P3H2X4X_TARGET_BUFF_1_PAGE : P3H2X4X_TARGET_BUFF_0_PAGE)
+				+  (P3H2X4X_NO_PAGE_PER_TP * tp));
+	ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, target_buffer_page);
+	if (ret)
+		goto ibi_err;
+
+	/* read buffer length */
+	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_LENGTH, &packet_len);
+	if (ret)
+		goto ibi_err;
+
+	if (packet_len)
+		packet_len = packet_len - 1;
+
+	if (packet_len > P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE) {
+		dev_err(&i3cdev->dev, "Received message too big for p3h2x4x buffer\n");
+		goto ibi_err;
+	}
+
+	/* read slave  address */
+	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_ADDRESS, &slave_address);
+	if (ret)
+		goto ibi_err;
+
+	/* read data */
+	if (packet_len) {
+		ret = regmap_bulk_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_DATA,
+				       slave_rx_buffer, packet_len);
+		if (ret)
+			goto ibi_err;
+	}
+
+	if (is_of)
+		flag_clear = BUF_RECEIVED_FLAG_TF_MASK;
+	else
+		flag_clear = (((rfbuf == RCV_BUF_0) ? P3H2X4X_TARGET_BUF_0_RECEIVE :
+				P3H2X4X_TARGET_BUF_1_RECEIVE));
+
+	/* notify slave driver about received data */
+	if ((p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client->addr & 0x7f) == (slave_address >> 1)) {
+		i2c_slave_event(p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client,
+				I2C_SLAVE_WRITE_REQUESTED, (u8 *)&slave_address);
+		for (i = 0; i < packet_len; i++) {
+			temp = slave_rx_buffer[i];
+			i2c_slave_event(p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client,
+					I2C_SLAVE_WRITE_RECEIVED, &temp);
+		}
+		i2c_slave_event(p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client, I2C_SLAVE_STOP, &temp);
+	}
+
+ibi_err:
+	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
+	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + tp, flag_clear);
+}
+
+/**
+ * p3h2x4x_ibi_handler - IBI handler.
+ * @i3cdev: i3c device.
+ * @payload: two byte IBI payload data.
+ *
+ */
+void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
+			 const struct i3c_ibi_payload *payload)
+{
+	u32 target_port_status, payload_byte_one, payload_byte_two;
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
+	u32 ret, i;
+
+	payload_byte_one = (*(int *)payload->data);
+
+	if (!(payload_byte_one & P3H2X4X_SMBUS_AGENT_EVENT_FLAG_STATUS))
+		return;
+
+	p3h2x4x_i3c_hub = i3cdev_get_drvdata(i3cdev);
+
+	if (!p3h2x4x_i3c_hub || !p3h2x4x_i3c_hub->regmap)
+		return;
+
+	payload_byte_two = (*(int *)(payload->data + 4));
+	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
+
+	for (i = 0; i < P3H2X4X_TP_MAX_COUNT; ++i) {
+		if (p3h2x4x_i3c_hub->tp_bus[i].is_registered && (payload_byte_two >> i) & 0x01) {
+			ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+					  &target_port_status);
+			if (ret) {
+				dev_err(&i3cdev->dev, "target port read status failed %d\n", ret);
+				return;
+			}
+
+			/* process data receive buffer */
+			switch (target_port_status & BUF_RECEIVED_FLAG_MASK) {
+			case P3H2X4X_TARGET_BUF_CA_TF:
+				break;
+			case P3H2X4X_TARGET_BUF_0_RECEIVE:
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i, false);
+				break;
+			case P3H2X4X_TARGET_BUF_1_RECEIVE:
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i, false);
+				break;
+			case P3H2X4X_TARGET_BUF_0_1_RECEIVE:
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i, false);
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i, false);
+				break;
+			case P3H2X4X_TARGET_BUF_OVRFL:
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i, false);
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i, true);
+				dev_err(&i3cdev->dev, "Overflow, reading buffer zero and one\n");
+				break;
+			default:
+				regmap_write(p3h2x4x_i3c_hub->regmap,
+					     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+					     BUF_RECEIVED_FLAG_TF_MASK);
+				break;
+			}
+		}
+	}
+}
+#endif
+
 static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
 						 u8 target_port_status,
 						 u8 data_length)
@@ -199,11 +328,63 @@ static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
+{
+	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+	int ret;
+
+	guard(mutex)(&hub->etx_mutex);
+
+	if (bus->tp_smbus_client)
+		return -EBUSY;
+
+	ret = regmap_set_bits(hub->regmap,
+			      P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
+			      bus->tp_mask);
+	if (ret)
+		return ret;
+
+	bus->tp_smbus_client = slave;
+	hub->hub_config.tp_config[bus->tp_port].ibi_en = true;
+
+	return 0;
+}
+
+static int p3h2x4x_tp_i2c_unreg_slave(struct i2c_client *slave)
+{
+	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+	int ret;
+
+	guard(mutex)(&hub->etx_mutex);
+
+	if (bus->tp_smbus_client != slave)
+		return -EINVAL;
+
+	ret = regmap_clear_bits(hub->regmap,
+				P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
+				bus->tp_mask);
+	if (ret)
+		return ret;
+
+	bus->tp_smbus_client = NULL;
+	hub->hub_config.tp_config[bus->tp_port].ibi_en = false;
+
+	return 0;
+}
+#endif
+
 /*
  * I2C algorithm Structure
  */
 static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
 	.master_xfer    = p3h2x4x_tp_i2c_xfer,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave = p3h2x4x_tp_i2c_reg_slave,
+	.unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
+#endif
 	.functionality  = p3h2x4x_tp_smbus_funcs,
 };
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
