Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92EDC4332F
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Jan 2022 18:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbdL5zUlO+R4PPaCj+BtWU52jN/O2Tz7yX0szHgk8Lw=; b=al51O3GtvPywJr
	GlLh4Q8mipM8v0tkwutgz045fcuIFmVC6JANqLfJMqnxzKCHP1+kYCxPcR6bXN2xvFVxkq3SLUm+Q
	On5eeHbmcooHEvjyH49yWvYdga+JnFhryeakdNY3tdHucAKJelyIcRvBUafF5Y4/k8kCdTpmyCOHz
	sPqJeLPpUjV03e5eKk3Zw014mZTUze5MuTZNBOe67k0zrFc1O1JU99sOthPew6zwtpl7uQoBooRFm
	P15vmuTD3BAR5jDeDZG/20lj0dyK+Vdm95Vqeo64vy+0bstyd9qQF5rI54VfFHvj4E1576G9HuuHw
	yWq8c+wl/dak90ovSdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9WcM-00G4VM-1l; Mon, 17 Jan 2022 18:20:34 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9W7U-00FzrR-6k
 for linux-i3c@lists.infradead.org; Mon, 17 Jan 2022 17:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642441720; x=1673977720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x9bPuFu9x5+5+0bxCN7730iOsVfAjh1EYNHmtViA4h8=;
 b=voYMVdRKcTqfVBPuCQaLENpxhyo+wJ8kreL38TVz8hOllA8T7l4yWBbw
 JPRNa4p3kk3xVAG19RMAuVBhx60bUQB0wMZZ59R3RBsvipAtp12fPRlAf
 X5kSxs1vqbKA2zGYVyV1+39P6kUt0aXgalxKZmjGE2cS62i6bi/Zr7r9B Q=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 17 Jan 2022 09:48:38 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 09:48:38 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 17 Jan 2022 09:48:37 -0800
Received: from localhost (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 17 Jan
 2022 09:48:36 -0800
From: Jamie Iles <quic_jiles@quicinc.com>
To: <linux-i3c@lists.infradead.org>
CC: Jamie Iles <quic_jiles@quicinc.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] i3c: support dynamically added i2c devices
Date: Mon, 17 Jan 2022 17:48:16 +0000
Message-ID: <20220117174816.1963463-3-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117174816.1963463-1-quic_jiles@quicinc.com>
References: <20220117174816.1963463-1-quic_jiles@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_094840_303691_DEC75A7C 
X-CRM114-Status: GOOD (  15.85  )
X-Mailman-Approved-At: Mon, 17 Jan 2022 10:20:33 -0800
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

I2C devices can be added to the system dynamically through several
sources other than static board info including device tree overlays and
sysfs i2c new_device.

Add an I2C bus notifier to attach the clients at runtime if they were
not defined in the board info.  For DT devices find the LVR in the reg
property, for user-space new_device additions we synthesize a
conservative setting of no spike filters and fast mode only.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
---
 drivers/i3c/master.c | 127 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9a09109da8cc..7f79b283dc45 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2167,11 +2167,122 @@ static u32 i3c_master_i2c_funcs(struct i2c_adapter *adapter)
 	return I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C;
 }
 
+static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
+{
+	/* Fall back to no spike filters and FM bus mode. */
+	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
+
+	if (client->dev.of_node) {
+		u32 reg[3];
+
+		if (!of_property_read_u32_array(client->dev.of_node, "reg",
+						reg, ARRAY_SIZE(reg)))
+			lvr = reg[2];
+	}
+
+	return lvr;
+}
+
+static int i3c_master_i2c_attach(struct i2c_adapter *adap, struct i2c_client *client)
+{
+	struct i3c_master_controller *master = i2c_adapter_to_i3c_master(adap);
+	enum i3c_addr_slot_status status;
+	struct i2c_dev_desc *i2cdev;
+	int ret;
+
+	/* Already added by board info? */
+	if (i3c_master_find_i2c_dev_by_addr(master, client->addr))
+		return 0;
+
+	status = i3c_bus_get_addr_slot_status(&master->bus, client->addr);
+	if (status != I3C_ADDR_SLOT_FREE)
+		return -EBUSY;
+
+	i3c_bus_set_addr_slot_status(&master->bus, client->addr,
+				     I3C_ADDR_SLOT_I2C_DEV);
+
+	i2cdev = i3c_master_alloc_i2c_dev(master, client->addr,
+					  i3c_master_i2c_get_lvr(client));
+	if (IS_ERR(i2cdev)) {
+		ret = PTR_ERR(i2cdev);
+		goto out_clear_status;
+	}
+
+	ret = i3c_master_attach_i2c_dev(master, i2cdev);
+	if (ret)
+		goto out_free_dev;
+
+	return 0;
+
+out_free_dev:
+	i3c_master_free_i2c_dev(i2cdev);
+out_clear_status:
+	i3c_bus_set_addr_slot_status(&master->bus, client->addr,
+				     I3C_ADDR_SLOT_FREE);
+
+	return ret;
+}
+
+static int i3c_master_i2c_detach(struct i2c_adapter *adap, struct i2c_client *client)
+{
+	struct i3c_master_controller *master = i2c_adapter_to_i3c_master(adap);
+	struct i2c_dev_desc *dev;
+
+	dev = i3c_master_find_i2c_dev_by_addr(master, client->addr);
+	if (!dev)
+		return -ENODEV;
+
+	i3c_master_detach_i2c_dev(dev);
+	i3c_bus_set_addr_slot_status(&master->bus, dev->addr,
+				     I3C_ADDR_SLOT_FREE);
+	i3c_master_free_i2c_dev(dev);
+
+	return 0;
+}
+
 static const struct i2c_algorithm i3c_master_i2c_algo = {
 	.master_xfer = i3c_master_i2c_adapter_xfer,
 	.functionality = i3c_master_i2c_funcs,
 };
 
+static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action,
+				 void *data)
+{
+	struct i2c_adapter *adap;
+	struct i2c_client *client;
+	struct device *dev = data;
+	struct i3c_master_controller *master;
+	int ret;
+
+	if (dev->type != &i2c_client_type)
+		return 0;
+
+	client = to_i2c_client(dev);
+	adap = client->adapter;
+
+	if (adap->algo != &i3c_master_i2c_algo)
+		return 0;
+
+	master = i2c_adapter_to_i3c_master(adap);
+
+	i3c_bus_maintenance_lock(&master->bus);
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		ret = i3c_master_i2c_attach(adap, client);
+		break;
+	case BUS_NOTIFY_DEL_DEVICE:
+		ret = i3c_master_i2c_detach(adap, client);
+		break;
+	}
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	return ret;
+}
+
+static struct notifier_block i2cdev_notifier = {
+	.notifier_call = i3c_i2c_notifier_call,
+};
+
 static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 {
 	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
@@ -2699,12 +2810,26 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 
 static int __init i3c_init(void)
 {
-	return bus_register(&i3c_bus_type);
+	int res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);
+	if (res)
+		return res;
+
+	res = bus_register(&i3c_bus_type);
+	if (res)
+		goto out_unreg_notifier;
+
+	return 0;
+
+out_unreg_notifier:
+	bus_unregister_notifier(&i2c_bus_type,&i2cdev_notifier);
+
+	return res;
 }
 subsys_initcall(i3c_init);
 
 static void __exit i3c_exit(void)
 {
+	bus_unregister_notifier(&i2c_bus_type, &i2cdev_notifier);
 	idr_destroy(&i3c_bus_idr);
 	bus_unregister(&i3c_bus_type);
 }
-- 
2.32.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
