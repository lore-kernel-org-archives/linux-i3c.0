Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4E1CCF2C2
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrIIBRYdIMgnA1GRoaRmy6zh3CLKj7GeGTaq6RDaED8=; b=sdSZE6D1NBV1zo
	FCD00O/hPvOLf0MbAALiaj2bWcG/pl8x1gAH8etrRGSMiEYoVXCDefzcchw9Fb8oxXWx54O9cP6CM
	YP26rfB7OdlAMtX1LGdZ0TzmDUqYHH6j8c5AoVU6mGcFFEqWQYwESvgtPfb91jJVav/+SqAR2rQPd
	xcxXWbpy5lnhWNhJL4srPS986I2EbRhUy+VGRwoRMWe8YORNiturC7FhiuLRFS3F8S3Sj1B4S/dWq
	qq2GVLSKnZDo9iss3xH8OcVu0lGeavVZuhI4VdbFQpFVimXrGLA+OF8LJJocb7ypoN1y4zC2twkrI
	gOsUyDh8AjreBj9ioFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl4x-00000003RxP-25r6;
	Fri, 16 Oct 2026 16:46:47 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl4u-00000003RwA-3YmH
	for linux-i3c@lists.infradead.org;
	Fri, 16 Oct 2026 16:46:46 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C4341A0225;
	Fri, 16 Oct 2026 18:46:43 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 02CFA1A006F;
	Fri, 16 Oct 2026 18:46:43 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 021FF1800068;
	Sat, 17 Oct 2026 00:46:38 +0800 (+08)
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
Subject: [RFC PATCH 2/7] i3c: hub: add i2c-tools support for SMBus-configured target ports
Date: Fri, 16 Oct 2026 22:16:20 +0530
Message-Id: <20261016164625.3166779-3-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094645_166345_A58B1DC5 
X-CRM114-Status: GOOD (  20.69  )
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

Add support for standard i2c-tools on hub target ports configured
to operate in SMBus mode.

This change implements the .smbus_xfer callback in the i2c_algorithm
structure of the I2C adapters created by the hub driver for each
SMBus-enabled port.

With this support in place, user-space utilities such as i2cdetect,
i2cget, and i2cset can access and operate on I2C/SMBus devices
connected behind the hub target ports.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
 drivers/i3c/hub/p3h2840_i3c_hub.h       |   3 +
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c | 211 +++++++++++++++++++++++-
 2 files changed, 213 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index 5b3fb1752c7b..38f02500b6a9 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -188,6 +188,9 @@
 
 #define ONE_BYTE_SIZE						0x01
 
+/* Payload size of an SMBus word transaction. */
+#define P3H2X4X_SMBUS_WORD_SIZE					0x02
+
 /* holding SDA low when both SMBus Target Agent received data buffers are full.
  * This feature can be used as a flow-control mechanism for MCTP applications to
  * avoid MCTP transmitters on Target Ports time out when the SMBus agent buffers
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
index 7fdfa79dfeb6..2f301134b978 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -7,6 +7,7 @@
 #include <linux/i3c/device.h>
 #include <linux/mfd/p3h2840.h>
 #include <linux/regmap.h>
+#include <linux/unaligned.h>
 
 #include "p3h2840_i3c_hub.h"
 
@@ -387,9 +388,216 @@ static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, i
 	return ret_sum;
 }
 
+/*
+ * p3h2x4x_tp_smbus_xfer_msg() - Run a single SMBus transaction through the
+ * SMBus Controller Agent of @target_port. The descriptor and the payload are
+ * written into the port's controller buffer page, which is located by
+ * multiplying the target port index by the number of pages per port and adding
+ * the base page number.
+ *
+ * @read is true for an SMBus read transaction. Note that for I2C_SMBUS_QUICK
+ * the I2C core passes @data as NULL and the transfer direction itself is the
+ * information sent to the device, so @data must not be dereferenced for it.
+ */
+static int p3h2x4x_tp_smbus_xfer_msg(struct p3h2x4x_i3c_hub_dev *hub,
+				     u8 target_port,
+				     u16 addr,
+				     bool read,
+				     u8 cmd,
+				     int sz,
+				     union i2c_smbus_data *data)
+{
+	u8 controller_buffer_page = P3H2X4X_CONTROLLER_BUFFER_PAGE +
+				    P3H2X4X_NO_PAGE_PER_TP * target_port;
+	u8 target_port_status = P3H2X4X_TP0_SMBUS_AGNT_STS + target_port;
+	u8 transaction_type = P3H2X4X_SMBUS_400kHz;
+	u8 desc[P3H2X4X_SMBUS_DESCRIPTOR_SIZE] = { 0 };
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	u8 read_length = 0, write_length = 0;
+	u8 rw_address = addr << 1;
+	int ret, ret2;
+
+	switch (sz) {
+	case I2C_SMBUS_QUICK:
+		/*
+		 * A QUICK transaction carries no data at all: only the address
+		 * byte including the R/W bit is sent.
+		 */
+		if (read)
+			rw_address |= P3H2X4X_SET_BIT(0);
+		break;
+	case I2C_SMBUS_BYTE:
+		if (read) {
+			rw_address |= P3H2X4X_SET_BIT(0);
+			read_length = ONE_BYTE_SIZE;
+		} else {
+			buf[0] = cmd;
+			write_length = ONE_BYTE_SIZE;
+		}
+		break;
+	case I2C_SMBUS_BYTE_DATA:
+		buf[0] = cmd;
+		write_length = ONE_BYTE_SIZE;
+		if (read) {
+			read_length = ONE_BYTE_SIZE;
+			transaction_type |= P3H2X4X_SET_BIT(0);
+		} else {
+			buf[1] = data->byte;
+			write_length += ONE_BYTE_SIZE;
+		}
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		buf[0] = cmd;
+		write_length = ONE_BYTE_SIZE;
+		if (read) {
+			read_length = P3H2X4X_SMBUS_WORD_SIZE;
+			transaction_type |= P3H2X4X_SET_BIT(0);
+		} else {
+			put_unaligned_le16(data->word, &buf[1]);
+			write_length += P3H2X4X_SMBUS_WORD_SIZE;
+		}
+		break;
+	case I2C_SMBUS_BLOCK_DATA:
+		buf[0] = cmd;
+		write_length = ONE_BYTE_SIZE;
+		if (read) {
+			/*
+			 * The agent returns the length byte followed by the
+			 * payload, so reserve room for the maximum block size.
+			 */
+			read_length = I2C_SMBUS_BLOCK_MAX + 1;
+			transaction_type |= P3H2X4X_SET_BIT(0);
+		} else {
+			if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
+				return -EINVAL;
+
+			memcpy(&buf[1], data->block, data->block[0] + 1);
+			write_length += data->block[0] + 1;
+		}
+		break;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
+
+		buf[0] = cmd;
+		write_length = ONE_BYTE_SIZE;
+		if (read) {
+			read_length = data->block[0];
+			transaction_type |= P3H2X4X_SET_BIT(0);
+		} else {
+			memcpy(&buf[1], &data->block[1], data->block[0]);
+			write_length += data->block[0];
+		}
+		break;
+	default:
+		dev_dbg(hub->dev, "Unsupported SMBus transaction %d\n", sz);
+		return -EOPNOTSUPP;
+	}
+
+	if (write_length + read_length > P3H2X4X_SMBUS_PAYLOAD_SIZE)
+		return -EINVAL;
+
+	desc[P3H2X4X_DESC_ADDR] = rw_address;
+	desc[P3H2X4X_DESC_TYPE] = transaction_type;
+	desc[P3H2X4X_DESC_WRITE_LEN] = write_length;
+	desc[P3H2X4X_DESC_READ_LEN] = read_length;
+
+	ret = regmap_write(hub->regmap, target_port_status, P3H2X4X_TP_BUFFER_STATUS_MASK);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(hub->regmap, P3H2X4X_PAGE_PTR, controller_buffer_page);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(hub->regmap, P3H2X4X_CONTROLLER_AGENT_BUFF,
+				desc, P3H2X4X_SMBUS_DESCRIPTOR_SIZE);
+	if (ret)
+		goto out_page;
+
+	if (write_length) {
+		ret = regmap_bulk_write(hub->regmap, P3H2X4X_CONTROLLER_AGENT_BUFF_DATA,
+					buf, write_length);
+		if (ret)
+			goto out_page;
+	}
+
+	ret = regmap_write(hub->regmap, P3H2X4X_TP_SMBUS_AGNT_TRANS_START,
+			   hub->tp_bus[target_port].tp_mask);
+	if (ret)
+		goto out_page;
+
+	ret = p3h2x4x_read_smbus_transaction_status(hub, target_port_status,
+						    write_length + read_length);
+	if (ret)
+		goto out_page;
+
+	if (read && read_length) {
+		ret = regmap_bulk_read(hub->regmap,
+				       P3H2X4X_CONTROLLER_AGENT_BUFF_DATA + write_length,
+				       buf, read_length);
+		if (ret)
+			goto out_page;
+
+		switch (sz) {
+		case I2C_SMBUS_BYTE:
+		case I2C_SMBUS_BYTE_DATA:
+			data->byte = buf[0];
+			break;
+		case I2C_SMBUS_WORD_DATA:
+			data->word = get_unaligned_le16(buf);
+			break;
+		case I2C_SMBUS_BLOCK_DATA:
+			/*
+			 * The device reports the payload length in the first
+			 * byte. Clamp it so a misbehaving device cannot make
+			 * the I2C core copy out more than the block buffer.
+			 */
+			data->block[0] = min_t(u8, buf[0], I2C_SMBUS_BLOCK_MAX);
+			memcpy(&data->block[1], &buf[1], data->block[0]);
+			break;
+		case I2C_SMBUS_I2C_BLOCK_DATA:
+			memcpy(&data->block[1], buf, read_length);
+			break;
+		}
+	}
+
+out_page:
+	ret2 = regmap_write(hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
+	if (!ret && ret2)
+		ret = ret2;
+
+	return ret;
+}
+
+static s32 p3h2x4x_tp_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+				 unsigned short flags,
+				 char read_write, u8 command,
+				 int size, union i2c_smbus_data *data)
+{
+	struct tp_bus *bus = i2c_get_adapdata(adap);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+
+	if (flags & I2C_CLIENT_PEC)
+		return -EOPNOTSUPP;
+
+	guard(mutex)(&hub->etx_mutex);
+	guard(mutex)(&bus->port_mutex);
+
+	return p3h2x4x_tp_smbus_xfer_msg(hub, bus->tp_port, addr,
+					 read_write == I2C_SMBUS_READ,
+					 command, size, data);
+}
+
 static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
 {
-	u32 funcs = I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
+	u32 funcs = I2C_FUNC_SMBUS_QUICK |
+		    I2C_FUNC_SMBUS_BYTE |
+		    I2C_FUNC_SMBUS_BYTE_DATA |
+		    I2C_FUNC_SMBUS_WORD_DATA |
+		    I2C_FUNC_SMBUS_BLOCK_DATA |
+		    I2C_FUNC_SMBUS_I2C_BLOCK |
+		    I2C_FUNC_I2C;
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	struct tp_bus *bus = i2c_get_adapdata(adapter);
@@ -528,6 +736,7 @@ static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
  */
 static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
 	.master_xfer    = p3h2x4x_tp_i2c_xfer,
+	.smbus_xfer     = p3h2x4x_tp_smbus_xfer,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	.reg_slave = p3h2x4x_tp_i2c_reg_slave,
 	.unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
