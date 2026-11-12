Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66962606A8B0
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pycLPY5B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BLDhqbhEzTs2GnwWwC4NcewrH/0jyy4wt2ErrHucRRE=; b=pycLPY5BCo5KF3fPqX/ELSd40C
	mbzlIekmpe36gNfGVsRTu3P6+YkRJFhj/+wRlw8/5p/6ZTE2it78HSB5uEABrt3WjsTFOQCSCsz8X
	CgwskotUvDMkTpWj5lKzAvEDm5NA3NUIDaWUo62WfBxshIDIqhve+u3cEa/f0TccmmAvbTi9PzSuf
	bKMp6siiXpiaHsQyHVEsMrbovc/P/o303bd2EYVEjzt5cwrKPlEPc/PQJM5URK45J1LG+VEoRkduw
	Nb871rbUS8ThJXVhD0tcU2ORi1K+dv95uLRdoTb+XrekfaIP8+2UeqBvDcGIa3mle4irVE0r1Jopt
	ozffx/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUAs-00000009uxw-0V0r;
	Thu, 12 Nov 2026 12:45:06 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUAp-00000009uw9-1Zyn
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 12:45:04 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DB9C91A000D;
	Thu, 12 Nov 2026 13:45:01 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B9861A0007;
	Thu, 12 Nov 2026 13:45:01 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9D89E1800068;
	Thu, 12 Nov 2026 20:44:58 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v21 4/4] i3c: hub: p3h2x4x: Add SMBus slave mode support
Date: Thu, 12 Nov 2026 18:14:37 +0530
Message-Id: <20261112124437.3367252-5-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_044503_832877_AD893851 
X-CRM114-Status: GOOD (  28.87  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add SMBus slave mode support for the P3H2x4x hub SMBus target ports.

The hub SMBus slave agent can receive downstream payloads into target
buffers and report receive events through IBI. Add CONFIG_I2C_SLAVE
to support the receive path and forward the received payloads to the
registered I2C slave client through i2c_slave_event().

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v21:
 - Handle both receive-buffer flags independently, including on overflow
 - Acknowledge only the overflow flag to preserve buffer-refill events and
   report the affected port
 - Initialize optional IBI support before acquiring the routing mutex

Changes in v20:
 - No change

Changes in v19:
 - No change

Changes in v18:
 - Rebased onto v7.3-rc1; no intended driver behaviour changes

Changes in v17:
 - No change

Changes in v16:
 - Always clear the software slave state on unregister: even if the hardware
   IBI-disable write fails, log the error but still set bus->tp_smbus_client = NULL
   and return 0, so a later IBI cannot deref a dangling client and call a freed slave_cb
 - Use a heap DMA-safe buffer for the SMBus-agent RX path
   instead of a stack buffer passed to regmap_bulk_read() over I3C
 - Advertise I2C_FUNC_SLAVE when CONFIG_I2C_SLAVE is enabled, and reject slave
   registration with -EOPNOTSUPP unless an I3C upstream device and working IBI
   path are available (hub->i3cdev and hub->ibi_ready)
 - Validate the IBI payload length and bound the target-port loop by
   num_target_ports

Changes in v15:
 - Retrieve the hub context through the shared MFD data instead of replacing
   the I3C device's parent driver data
 - Rework SMBus slave registration and unregistration to use the shared
   protected-register lock
 - Report protected-register relock failures separately from the original
   enable or disable operation

Changes in v14:
 - Clear receive-buffer flags even on SMBus receive error paths to avoid
   repeated IBI storms
 - Decode receive-buffer status using FIELD_GET()
 - Fix overflow status value and explicitly clear overflow after reading both
   target buffers

Changes in v13:
 - Make IBI setup optional and robust: avoid probe failure when IBI is unsupported and add proper
   cleanup using devm actions
 - Fix SMBus slave receive path: avoid over-clearing buffer status, handle unregistered ports,
   and ensure correct event delivery
 - Improve safety by adding proper locking around shared state

Changes in v12:
 - Add devm cleanup for IBI request/enable path
 - Fix NULL pointer dereference before tp_smbus_client check
 - Clear tp_smbus_client before disabling SMBus-agent IBI in unreg_slave()

Changes in v11:
 - Improve SMBus slave mode payload validation and parsing

Changes in v10:
 - Split SMBus slave mode support into a separate patch
---
---
 drivers/i3c/hub/p3h2840_i3c_hub.h       |  14 ++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c   |  51 ++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c | 298 +++++++++++++++++++++++-
 3 files changed, 362 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index 5eecc972514b..d477b0f8ec27 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -314,6 +314,10 @@ struct p3h2x4x_i3c_hub_dev {
 	struct i2c_client *i2c_client;
 	struct hub_configuration hub_config;
 	struct tp_bus tp_bus[P3H2X4X_TP_MAX_COUNT];
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	bool ibi_ready;
+	u8 *slave_rx_buffer;
+#endif
 	struct i3c_hub *hub;
 };
 
@@ -339,4 +343,14 @@ int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
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
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
index a070be32ffed..31d088a49b9e 100644
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
@@ -67,6 +75,16 @@ static void p3h2x4x_unregister_i3c_master(void *data)
 	i3c_master_unregister(controller);
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void p3h2x4x_free_ibi(void *data)
+{
+	struct i3c_device *i3cdev = data;
+
+	i3c_device_disable_ibi(i3cdev);
+	i3c_device_free_ibi(i3cdev);
+}
+#endif
+
 /**
  * p3h2x4x_tp_i3c_algo - Register I3C virtual masters for I3C target ports.
  * @p3h2x4x_hub: p3h2x4x device structure.
@@ -140,6 +158,39 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
 		p3h2x4x_hub->tp_bus[tp].is_registered = true;
 	}
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	p3h2x4x_hub->slave_rx_buffer = devm_kzalloc(p3h2x4x_hub->dev,
+						    P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE,
+						    GFP_KERNEL);
+	if (!p3h2x4x_hub->slave_rx_buffer)
+		return -ENOMEM;
+
+	ret = i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
+	if (ret) {
+		dev_warn(p3h2x4x_hub->dev,
+			 "IBI not available, SMBus slave mode disabled\n");
+		p3h2x4x_hub->ibi_ready = false;
+	} else {
+		ret = i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);
+		if (ret) {
+			i3c_device_free_ibi(p3h2x4x_hub->i3cdev);
+			dev_warn(p3h2x4x_hub->dev,
+				 "Failed to enable IBI, SMBus slave mode disabled\n");
+			p3h2x4x_hub->ibi_ready = false;
+		} else {
+			p3h2x4x_hub->ibi_ready = true;
+
+			ret = devm_add_action_or_reset(p3h2x4x_hub->dev,
+						       p3h2x4x_free_ibi,
+						       p3h2x4x_hub->i3cdev);
+			if (ret) {
+				p3h2x4x_hub->ibi_ready = false;
+				return ret;
+			}
+		}
+	}
+#endif
+
 	/*
 	 * Take the routing lock used by the hub callbacks so they cannot
 	 * observe always_enable before the route is programmed.
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
index 247d0f4883b7..02b50d1eb938 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -3,6 +3,7 @@
  * Copyright 2025-2026 NXP
  * This P3H2X4X driver file contain functions for SMBus/I2C virtual Bus creation and read/write.
  */
+#include <linux/i3c/device.h>
 #include <linux/mfd/p3h2840.h>
 #include <linux/regmap.h>
 
@@ -15,6 +16,171 @@ enum p3h2x4x_smbus_desc_idx {
 	P3H2X4X_DESC_READ_LEN,
 };
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, enum p3h2x4x_rcv_buf rfbuf,
+					    enum p3h2x4x_tp tp)
+{
+	struct p3h2x4x *p3h2x4x = i3cdev_get_drvdata(i3cdev);
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
+	u8 target_buffer_page, flag_clear, temp = 0, i, addr;
+	u32 packet_len, slave_address;
+	struct i2c_client *client;
+	u8 *slave_rx_buffer;
+	int ret;
+
+	if (!p3h2x4x || !p3h2x4x->i3c_hub_priv)
+		return;
+
+	p3h2x4x_i3c_hub = p3h2x4x->i3c_hub_priv;
+	slave_rx_buffer = p3h2x4x_i3c_hub->slave_rx_buffer;
+
+	switch (rfbuf) {
+	case RCV_BUF_0:
+		target_buffer_page = P3H2X4X_TARGET_BUFF_0_PAGE;
+		flag_clear = P3H2X4X_TARGET_BUF_0_RECEIVE;
+		break;
+	case RCV_BUF_1:
+		target_buffer_page = P3H2X4X_TARGET_BUFF_1_PAGE;
+		flag_clear = P3H2X4X_TARGET_BUF_1_RECEIVE;
+		break;
+	default:
+		return;
+	}
+
+	target_buffer_page += P3H2X4X_NO_PAGE_PER_TP * tp;
+
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
+	client = p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client;
+	if (!client)
+		goto ibi_err;
+
+	/* notify slave driver about received data */
+	if ((client->addr & 0x7f) == (slave_address >> 1)) {
+		addr = slave_address >> 1;
+		i2c_slave_event(client,
+				I2C_SLAVE_WRITE_REQUESTED, &addr);
+		for (i = 0; i < packet_len; i++) {
+			temp = slave_rx_buffer[i];
+			i2c_slave_event(client,
+					I2C_SLAVE_WRITE_RECEIVED, &temp);
+		}
+		i2c_slave_event(client, I2C_SLAVE_STOP, &temp);
+	}
+
+ibi_err:
+	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
+
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
+	struct p3h2x4x *p3h2x4x = i3cdev_get_drvdata(i3cdev);
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
+	u8 payload_byte_one, payload_byte_two;
+	u32 target_port_status;
+	const u8 *data;
+	int ret, i;
+
+	if (!payload || payload->len < P3H2X4X_MAX_PAYLOAD_LEN)
+		return;
+
+	data = payload->data;
+	payload_byte_one = data[0];
+
+	if (!(payload_byte_one & P3H2X4X_SMBUS_AGENT_EVENT_FLAG_STATUS))
+		return;
+
+	p3h2x4x_i3c_hub = p3h2x4x ? p3h2x4x->i3c_hub_priv : NULL;
+
+	if (!p3h2x4x_i3c_hub || !p3h2x4x_i3c_hub->regmap)
+		return;
+
+	payload_byte_two = data[1];
+	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
+
+	for (i = 0; i < p3h2x4x->num_target_ports; ++i) {
+		if (!((payload_byte_two >> i) & 0x01))
+			continue;
+
+		if (!p3h2x4x_i3c_hub->tp_bus[i].is_registered) {
+			dev_dbg(&i3cdev->dev, "IBI for unregistered SMBus port %u\n", i);
+			regmap_write(p3h2x4x_i3c_hub->regmap,
+				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				     BUF_RECEIVED_FLAG_TF_MASK);
+			continue;
+		}
+
+		ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				  &target_port_status);
+		if (ret) {
+			dev_err(&i3cdev->dev, "target port read status failed %d\n", ret);
+			continue;
+		}
+
+		if (target_port_status & P3H2X4X_TARGET_BUF_CA_TF)
+			regmap_write(p3h2x4x_i3c_hub->regmap,
+				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				     P3H2X4X_TARGET_BUF_CA_TF);
+
+		/* Service the receive flags independently of the overflow flag. */
+		if (target_port_status & P3H2X4X_TARGET_BUF_0_RECEIVE)
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
+
+		if (target_port_status & P3H2X4X_TARGET_BUF_1_RECEIVE)
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
+
+		if (target_port_status & P3H2X4X_TARGET_BUF_OVRFL) {
+			/*
+			 * The helpers handle receive-flag acknowledgment. Clear only
+			 * overflow here, as a released buffer may already have refilled.
+			 */
+			regmap_write(p3h2x4x_i3c_hub->regmap,
+				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				     P3H2X4X_TARGET_BUF_OVRFL);
+			dev_err(&i3cdev->dev,
+				"SMBus receive buffer overflow on port %d\n", i);
+		}
+	}
+}
+#endif
+
 static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
 						 u8 target_port_status,
 						 u8 data_length)
@@ -220,8 +386,134 @@ static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, i
 
 static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
+	u32 funcs = I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	struct tp_bus *bus = i2c_get_adapdata(adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+
+	/*
+	 * Only advertise slave support when the upstream IBI path is usable.
+	 * Otherwise reg_slave() returns -EOPNOTSUPP while functionality()
+	 * reports I2C_FUNC_SLAVE, which is inconsistent for callers.
+	 */
+	if (hub->ibi_ready)
+		funcs |= I2C_FUNC_SLAVE;
+#endif
+
+	return funcs;
+}
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
+{
+	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(hub->dev->parent);
+	int relock_ret = 0;
+	int ret = 0;
+
+	guard(mutex)(&hub->etx_mutex);
+
+	if (!hub->i3cdev || !hub->ibi_ready)
+		return -EOPNOTSUPP;
+
+	if (bus->tp_smbus_client)
+		return -EBUSY;
+
+	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
+		/* Unlock access to protected registers */
+		ret = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+				   P3H2X4X_REGISTERS_UNLOCK_CODE);
+		if (ret)
+			break;
+
+		ret = regmap_set_bits(hub->regmap,
+				      P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
+				      bus->tp_mask);
+
+		/* Lock access to protected registers */
+		relock_ret = regmap_write(hub->regmap,
+					  P3H2X4X_DEV_REG_PROTECTION_CODE,
+					  P3H2X4X_REGISTERS_LOCK_CODE);
+	}
+
+	/*
+	 * A relock failure does not undo the IBI enable, so report it
+	 * separately and keep the callback result tied to the IBI operation.
+	 */
+	if (relock_ret)
+		dev_err(hub->dev,
+			"failed to restore protected register lock: %d\n",
+			relock_ret);
+
+	if (ret)
+		return ret;
+
+	/*
+	 * Publish the software state only after the hardware IBI has been
+	 * enabled successfully.
+	 */
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
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(hub->dev->parent);
+	int relock_ret = 0;
+	int ret = 0;
+
+	guard(mutex)(&hub->etx_mutex);
+
+	if (bus->tp_smbus_client != slave)
+		return -EINVAL;
+
+	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
+		/* Unlock access to protected registers */
+		ret = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+				   P3H2X4X_REGISTERS_UNLOCK_CODE);
+		if (ret)
+			break;
+
+		ret = regmap_clear_bits(hub->regmap,
+					P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
+					bus->tp_mask);
+
+		/* Lock access to protected registers */
+		relock_ret = regmap_write(hub->regmap,
+					  P3H2X4X_DEV_REG_PROTECTION_CODE,
+					  P3H2X4X_REGISTERS_LOCK_CODE);
+	}
+
+	if (relock_ret)
+		dev_err(hub->dev,
+			"failed to restore protected register lock: %d\n",
+			relock_ret);
+
+	if (ret)
+		dev_err(hub->dev,
+			"failed to disable SMBus agent IBI on port %u: %d\n",
+			bus->tp_port, ret);
+
+	/*
+	 * Slave backend removal cannot be rolled back. Detach the
+	 * callback-visible state even if disabling the hardware IBI failed,
+	 * and return 0 so the core completes teardown; the failure is still
+	 * visible in the log above. etx_mutex serializes this with the IBI
+	 * handler, so later events are acknowledged without invoking the
+	 * removed client.
+	 */
+	bus->tp_smbus_client = NULL;
+	hub->hub_config.tp_config[bus->tp_port].ibi_en = false;
+
+	return 0;
 }
+#endif
 
 static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
 	.max_read_len  = P3H2X4X_SMBUS_PAYLOAD_SIZE,
@@ -233,6 +525,10 @@ static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
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
