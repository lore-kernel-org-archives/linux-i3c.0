Return-Path: <SRS0=pqjR=ZU=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E95AC43215
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 01:15:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF852158A
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 01:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QPwQ4yhk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EkwEGMFE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF852158A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y5ccQtA+5nDQviFuPFjcMTcdmN3AwwixM45B/argTQs=; b=QPwQ4yhkB9ePcaYipeZXrEhW5U
	+5RBswBeir+wIt2IUd+b4yc7qz6v6U1eHN1jcJP2oE/hDOgqYvNzbl7PzuiNuDHD9HUkhKLyL5vZD
	p/hmXiZ+ZXSm+1h5YAlLR9FL2MgJwung4i7X4pYL82cre29P/hRwt4bv/k2lzp5reU/4JKJ8OMtmj
	2VlNYonI5ciNQZzkzFRHiurCooT2ySJyeFQsp4Y449C0zZznI96qeQolgc+ompPcJHkWCum9M4q7l
	zfYROslV8Ul2Daw9iYLuA7O79KeIW3L/hSqwFlBnjJu2N7R5Orh364ETawTOKKeMzU9QyA1sAZKx+
	p4QlDfNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia8Oz-00023j-AI; Thu, 28 Nov 2019 01:15:25 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia8Ov-00021x-Or
 for linux-i3c@lists.infradead.org; Thu, 28 Nov 2019 01:15:23 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ECFB8C00AB;
 Thu, 28 Nov 2019 01:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574903717; bh=1uc62gNsRN4NwK+RC7g2VEnn49+0kivebCgMNt8j0iA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=EkwEGMFEnZf5NyPDoMQey4TUzj22ft0cRxtvOFBu+/7qUBx2kLFIC+gruaEyyV4G+
 RozZMYMGonbprsE1WypkPVk8Zx2rmzIwy4TQ50A6CAocO6n6S6ULODQdiSt4u2MJ06
 bgEurrov9dU3u1PNAqRm/dj8c7uARZgKq7VcK5BbD+QAkZBBQZfrZHRfYZ1gBNUQ6i
 wP2RPRBNs/w1YyCCKMuVUL4ac/HpuePhmk6xah36/1dLCZsxkHDlxzom6M6ZFzI3Hy
 gIi7bKhtSFyWzFaCEeLlVtT9rP4VFJjfO/H6sPBoMEmkcQtvKZjlHWHHYWIWJk2KDg
 /7ziOnu/2wxDg==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 90F61A0067;
 Thu, 28 Nov 2019 01:15:15 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 8464A7017;
 Thu, 28 Nov 2019 02:15:15 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [RFC 1/2] i3c: Add preliminary support for secondary master
Date: Thu, 28 Nov 2019 02:15:11 +0100
Message-Id: <a9466e3de90e1aae1111a17bbbd08311e7bf87c3.1574897246.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574897246.git.vitor.soares@synopsys.com>
References: <cover.1574897246.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1574897246.git.vitor.soares@synopsys.com>
References: <cover.1574897246.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_171521_878075_44037F09 
X-CRM114-Status: GOOD (  24.11  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: pgaj@cadence.com, Joao.Pinto@synopsys.com,
 Vitor Soares <Vitor.Soares@synopsys.com>, bbrezillon@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch adds the preliminary support for secondary master feature to
i3c Framework for testing purposes.

Key points for consideration:
  - mastership_[show/store] are only used for testing
  - secondary master registration is made in two steps, one in
  i3c_master_register() and another in i3c_sec_master_bus_init() when
  secondary master became current master first time. This is made in this
  way to get all dt declared boardinfo list, create defslvs list and
  provide work_queue.
  - When the current master wants to deliver_mastership it necessary to
  disable all in-band events to avoid unwanted interrupt during bus
  ownership exchange. For now this patch doesn't reflect all
  improvements/changes made in v1.1 I3C Bus spec. But it can be extended
  by adding some commands and checks to the flow.
  - i3c_defslvs_info: The DEFSLVS info can be differently stored in
  diferen HC. Hence it is used a defslvs list similar to boardinfo list in
  the bus structure to hold this data. Them HC is taccking over the bus
  ownership can initialize each device of that list. For now, this not
  address the i2c devices since they are only statically described.
  - [request/deliver]_mastership(): Mastership request deliver may be done
  differently in different HC, hence the need to have a call back for each
  process.
  - Add dr_mode to DT: Similar to USB, HC can be programmed to Master only
  mode, Slave only mode or Secondary Master which aren't necessarily
  hardcoded.
  - bus_mode definition: The bus mode is defined even without defslvs
  information with DT info since the definition of i2c devices are those
  that have impact on bus_mode definition and need to statically declared.
  The only use case that may cause issues is when i2c devices aren't
  declared in secondary master side and bus mode doesn't match the
  main master. Anyway this can be solde without extra complexity.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master.c       | 365 ++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/master.h |  39 +++++
 2 files changed, 396 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0436916..b398d77 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -449,6 +449,46 @@ static ssize_t mode_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(mode);
 
+static ssize_t
+mastership_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
+	ssize_t ret;
+
+	if (master->secondary)
+		ret = sprintf(buf, "Secondary Master\n");
+	else
+		ret = sprintf(buf, "Master\n");
+
+	return ret;
+}
+
+static ssize_t
+mastership_store(struct device *dev, struct device_attribute *attr,
+		 const char *buf, size_t count)
+{
+	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+
+	if (i3cbus->cur_master == master->this) {
+		dev_err(dev, "I'm current mater.");
+		return count;
+	}
+
+	if (!master->ops->request_mastership) {
+		dev_err(dev, "mastership_request not supported.");
+		return count;
+	}
+
+	if (master->ops->request_mastership(master))
+		dev_err(dev, "mastership_request failed");
+	else
+		dev_err(dev, "mastership_request success");
+
+	return count;
+}
+static DEVICE_ATTR_RW(mastership);
+
 static ssize_t current_master_show(struct device *dev,
 				   struct device_attribute *da,
 				   char *buf)
@@ -457,8 +497,11 @@ static ssize_t current_master_show(struct device *dev,
 	ssize_t ret;
 
 	i3c_bus_normaluse_lock(i3cbus);
-	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
-		      i3cbus->cur_master->info.pid);
+	if (i3cbus->cur_master)
+		ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
+			      i3cbus->cur_master->info.pid);
+	else
+		ret = sprintf(buf, "Not Current Master\n");
 	i3c_bus_normaluse_unlock(i3cbus);
 
 	return ret;
@@ -497,6 +540,7 @@ static DEVICE_ATTR_RO(i2c_scl_frequency);
 
 static struct attribute *i3c_masterdev_attrs[] = {
 	&dev_attr_mode.attr,
+	&dev_attr_mastership.attr,
 	&dev_attr_current_master.attr,
 	&dev_attr_i3c_scl_frequency.attr,
 	&dev_attr_i2c_scl_frequency.attr,
@@ -854,6 +898,53 @@ int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
 EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
 
 /**
+ * i3c_master_getaccmst_locked() - send an GETACCMST CCC command
+ * @master: master used to send frames on the bus
+ * @addr: a valid I3C slave address
+ *
+ * Sends an GETACCMST CCC command to offer bus Mastership to an
+ * I3C Secondary Master.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * Return: 0 in case of success, a positive I3C error code if the error is
+ * one of the official Mx error codes, and a negative error code otherwise.
+ */
+int i3c_master_getaccmst_locked(struct i3c_master_controller *master, u8 addr)
+{
+	enum i3c_addr_slot_status addrstat;
+	struct i3c_ccc_getaccmst *accmst;
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	if (!master)
+		return -EINVAL;
+
+	addrstat = i3c_bus_get_addr_slot_status(&master->bus, addr);
+	if (addr == I3C_BROADCAST_ADDR || addrstat != I3C_ADDR_SLOT_I3C_DEV)
+		return -EINVAL;
+
+	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
+	if (!accmst)
+		return -ENOMEM;
+
+	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
+
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	if (ret)
+		goto out;
+
+	if (accmst->newmaster >> 1 != addr)
+		ret = -EIO;
+out:
+	i3c_ccc_cmd_dest_cleanup(&dest);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_getaccmst_locked);
+
+/**
  * i3c_master_defslvs_locked() - send a DEFSLVS CCC command
  * @master: master used to send frames on the bus
  *
@@ -1542,8 +1633,7 @@ int i3c_master_set_info(struct i3c_master_controller *master,
 	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
 		return -EINVAL;
 
-	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
-	    master->secondary)
+	if (I3C_BCR_DEVICE_ROLE(info->bcr) != I3C_BCR_I3C_MASTER)
 		return -EINVAL;
 
 	if (master->this)
@@ -2381,6 +2471,81 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 	return 0;
 }
 
+int i3c_sec_master_bus_init(struct i3c_master_controller *master)
+{
+	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
+	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
+	enum i3c_bus_mode mode = i3cbus->mode;
+	struct i3c_defslvs_info *defslvsinfo;
+	int ret = 0;
+
+	if (master->init_done)
+		return -EINVAL;
+
+	list_for_each_entry(defslvsinfo, &master->defslvs, node) {
+		if (defslvsinfo->slave.dyn_addr)
+			continue;
+
+		switch (defslvsinfo->slave.lvr & I3C_LVR_I2C_INDEX_MASK) {
+		case I3C_LVR_I2C_INDEX(0):
+			if (mode < I3C_BUS_MODE_MIXED_FAST)
+				mode = I3C_BUS_MODE_MIXED_FAST;
+			break;
+		case I3C_LVR_I2C_INDEX(1):
+		case I3C_LVR_I2C_INDEX(2):
+			if (mode < I3C_BUS_MODE_MIXED_SLOW)
+				mode = I3C_BUS_MODE_MIXED_SLOW;
+			break;
+		default:
+			ret = -EINVAL;
+			goto err_put_dev;
+		}
+		if (defslvsinfo->slave.lvr & I3C_LVR_I2C_FM_MODE)
+			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
+	}
+
+	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
+	if (ret)
+		goto err_put_dev;
+
+	/*
+	 * Now execute the controller specific ->bus_init() routine, which
+	 * might configure its internal logic to match the bus limitations.
+	 */
+	ret = master->ops->bus_init(master);
+	if (ret)
+		goto err_put_dev;
+
+	/*
+	 * The master device should have been instantiated in ->bus_init(),
+	 * complain if this was not the case.
+	 */
+	if (!master->this) {
+		dev_err(&master->dev,
+			"master_set_info() was not called in ->bus_init()\n");
+		ret = -EINVAL;
+		goto err_put_dev;
+	}
+
+	ret = device_add(&master->dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * Expose our I3C bus as an I2C adapter so that I2C devices are exposed
+	 * through the I2C subsystem.
+	 */
+	ret = i3c_master_i2c_adapter_init(master);
+	if (ret)
+		goto err_put_dev;
+
+	master->init_done = true;
+
+err_put_dev:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_sec_master_bus_init);
+
 /**
  * i3c_master_register() - register an I3C master
  * @master: master used to send frames on the bus
@@ -2413,10 +2578,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 	struct i2c_dev_boardinfo *i2cbi;
 	int ret;
 
-	/* We do not support secondary masters yet. */
-	if (secondary)
-		return -ENOTSUPP;
-
 	ret = i3c_master_check_ops(ops);
 	if (ret)
 		return ret;
@@ -2430,6 +2591,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->secondary = secondary;
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
+	INIT_LIST_HEAD(&master->defslvs);
 
 	ret = i3c_bus_init(i3cbus);
 	if (ret)
@@ -2475,6 +2637,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 		goto err_put_dev;
 	}
 
+	if (secondary)
+		return 0;
+
 	ret = i3c_master_bus_init(master);
 	if (ret)
 		goto err_put_dev;
@@ -2547,6 +2712,11 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 	if (!master || !xfers)
 		return -EINVAL;
 
+	if (master->bus.cur_master != master->this) {
+		master->ops->request_mastership(master);
+		return -EBUSY;
+	}
+
 	if (!master->ops->priv_xfers)
 		return -ENOTSUPP;
 
@@ -2638,6 +2808,185 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 	dev->ibi = NULL;
 }
 
+static const char *const i3c_dr_modes[] = {
+	[I3C_DR_MODE_MASTER]		= "master",
+	[I3C_DR_MODE_SEC_MASTER]	= "sec-master",
+	[I3C_DR_MODE_SLAVE]		= "slave",
+};
+
+static enum i3c_dr_mode i3c_get_dr_mode_from_string(const char *str)
+{
+	int ret;
+
+	ret = match_string(i3c_dr_modes, ARRAY_SIZE(i3c_dr_modes), str);
+	return (ret < 0) ? I3C_DR_MODE_MASTER : ret;
+}
+
+enum i3c_dr_mode i3c_get_dr_mode(struct device *dev)
+{
+	const char *dr_mode;
+	int err;
+
+	err = device_property_read_string(dev, "dr-mode", &dr_mode);
+	if (err < 0)
+		return I3C_DR_MODE_MASTER;
+
+	return i3c_get_dr_mode_from_string(dr_mode);
+}
+EXPORT_SYMBOL_GPL(i3c_get_dr_mode);
+
+int i3c_sec_master_request_mastership(struct i3c_master_controller *master)
+{
+	int ret;
+
+	i3c_bus_normaluse_lock(&master->bus);
+	ret = master->ops->request_mastership(master);
+	i3c_bus_normaluse_unlock(&master->bus);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_sec_master_request_mastership);
+
+int i3c_master_deliver_mastership(struct i3c_master_controller *master, u8 addr)
+{
+	struct i3c_dev_desc *dev;
+	int ret;
+
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_bus_for_each_i3cdev(&master->bus, dev) {
+		if (dev->ibi) {
+			mutex_lock(&dev->ibi_lock);
+			i3c_dev_disable_ibi_locked(dev);
+			mutex_unlock(&dev->ibi_lock);
+		}
+	}
+	i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
+				I3C_CCC_EVENT_MR | I3C_CCC_EVENT_HJ);
+
+	ret = master->ops->deliver_mastership(master, addr);
+	i3c_bus_normaluse_unlock(&master->bus);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_deliver_mastership);
+
+int defslvs_populate_i3c_bus(struct i3c_master_controller *master,
+			     struct i3c_ccc_dev_desc defslvs)
+{
+	struct i3c_defslvs_info *defslvsinfo;
+	struct device *dev = &master->dev;
+
+	i3c_bus_maintenance_lock(&master->bus);
+	defslvsinfo = devm_kzalloc(dev, sizeof(*defslvsinfo), GFP_KERNEL);
+	if (!defslvsinfo)
+		return -ENOMEM;
+
+	defslvsinfo->slave = defslvs;
+
+	list_add_tail(&defslvsinfo->node, &master->defslvs);
+
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(defslvs_populate_i3c_bus);
+
+static void i3c_master_add_new_defslvs(struct i3c_master_controller *master)
+{
+	struct i3c_defslvs_info *defslvsinfo;
+
+	list_for_each_entry(defslvsinfo, &master->defslvs, node) {
+		/* TODO: add i2c devices to the bus */
+		if (!defslvsinfo->slave.dyn_addr)
+			continue;
+
+		if (defslvsinfo->slave.dyn_addr == master->this->info.dyn_addr)
+			continue;
+
+		if (!i3c_bus_dev_addr_is_avail(&master->bus,
+					       defslvsinfo->slave.dyn_addr))
+			continue;
+
+		i3c_master_add_i3c_dev_locked(master, defslvsinfo->slave.dyn_addr);
+	}
+
+	while (!list_empty(&master->defslvs)) {
+		defslvsinfo = list_first_entry(&master->defslvs,
+					       struct i3c_defslvs_info, node);
+		list_del(&defslvsinfo->node);
+	}
+}
+
+int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
+				     bool secondary)
+{
+	struct i3c_dev_desc *dev;
+	int ret;
+
+	if (master->secondary == secondary)
+		return -EEXIST;
+
+	/* TODO: get the current master information */
+	if (secondary)
+		master->bus.cur_master = NULL;
+	else
+		master->bus.cur_master = master->this;
+
+	if (!master->init_done && !secondary)
+		i3c_sec_master_bus_init(master);
+
+	master->secondary = secondary;
+
+	dev_info(&master->dev, "changing to %s\n",
+		 master->secondary ? "Sec Master" : "Master");
+
+	/* TODO: Analyse the use of maintenan_lock for everything */
+	if (!list_empty(&master->defslvs) && !secondary) {
+		i3c_bus_maintenance_lock(&master->bus);
+		i3c_master_add_new_defslvs(master);
+		i3c_bus_maintenance_unlock(&master->bus);
+
+		i3c_bus_normaluse_lock(&master->bus);
+		i3c_master_register_new_i3c_devs(master);
+		i3c_bus_normaluse_unlock(&master->bus);
+	}
+
+	if (!secondary) {
+		i3c_bus_normaluse_lock(&master->bus);
+		i3c_bus_for_each_i3cdev(&master->bus, dev) {
+			if (dev->ibi) {
+				mutex_lock(&dev->ibi_lock);
+				ret = i3c_dev_enable_ibi_locked(dev);
+				if (ret)
+					dev_err(&master->dev,
+						"Failed to re-enable IBI on device %d-%llx",
+						master->bus.id, dev->info.pid);
+				mutex_unlock(&dev->ibi_lock);
+				}
+		}
+
+		/* TODO: Enable MR only for the elegible devices */
+		i3c_master_enec_locked(master, I3C_BROADCAST_ADDR,
+					I3C_CCC_EVENT_MR | I3C_CCC_EVENT_HJ);
+		i3c_bus_normaluse_unlock(&master->bus);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_switch_operation_mode);
+
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
+{
+	int res;
+
+	mutex_lock(&i3c_core_lock);
+	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
+	mutex_unlock(&i3c_core_lock);
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(i3c_for_each_dev);
+
 static int __init i3c_init(void)
 {
 	return bus_register(&i3c_bus_type);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 9cb39d9..09bd99c 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -426,6 +426,8 @@ struct i3c_bus {
  *		      for a future IBI
  *		      This method is mandatory only if ->request_ibi is not
  *		      NULL.
+ * @request_mastership: Request mastership.
+ * @deliver_mastership: Deliver mastership
  */
 struct i3c_master_controller_ops {
 	int (*bus_init)(struct i3c_master_controller *master);
@@ -452,6 +454,21 @@ struct i3c_master_controller_ops {
 	int (*disable_ibi)(struct i3c_dev_desc *dev);
 	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
 				 struct i3c_ibi_slot *slot);
+	int (*request_mastership)(struct i3c_master_controller *master);
+	int (*deliver_mastership)(struct i3c_master_controller *master,
+				  u8 addr);
+};
+
+/**
+ * struct i3c_defslvs_info - defslvs information object
+ * @node: used to insert the defslvs object in the  list
+ * @slave: I3C/I2C device descriptor used for DEFSLVS
+ *
+ * This structure is used to hold defslvs information on Secondary Master.
+ */
+struct i3c_defslvs_info {
+	struct list_head node;
+	struct i3c_ccc_dev_desc slave;
 };
 
 /**
@@ -468,6 +485,7 @@ struct i3c_master_controller_ops {
  * @boardinfo.i3c: list of I3C  boardinfo objects
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
+ * @defslvs: List of defslvs objects
  * @bus: I3C bus exposed by this master
  * @wq: workqueue used to execute IBI handlers. Can also be used by master
  *	drivers if they need to postpone operations that need to take place
@@ -491,6 +509,7 @@ struct i3c_master_controller {
 		struct list_head i3c;
 		struct list_head i2c;
 	} boardinfo;
+	struct list_head defslvs;
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
 };
@@ -525,6 +544,7 @@ int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
 			    u8 evts);
 int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
 			   u8 evts);
+int i3c_master_getaccmst_locked(struct i3c_master_controller *master, u8 addr);
 int i3c_master_entdaa_locked(struct i3c_master_controller *master);
 int i3c_master_defslvs_locked(struct i3c_master_controller *master);
 
@@ -652,4 +672,23 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
 
 struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
 
+enum i3c_dr_mode {
+	I3C_DR_MODE_MASTER,
+	I3C_DR_MODE_SEC_MASTER,
+	I3C_DR_MODE_SLAVE,
+};
+
+enum i3c_dr_mode i3c_get_dr_mode(struct device *dev);
+
+int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
+				     bool secondary);
+
+int i3c_sec_master_request_mastership(struct i3c_master_controller *master);
+int i3c_master_deliver_mastership(struct i3c_master_controller *master,
+				  u8 addr);
+
+int i3c_sec_master_bus_init(struct i3c_master_controller *master);
+int defslvs_populate_i3c_bus(struct i3c_master_controller *master,
+			     struct i3c_ccc_dev_desc defslvs);
+
 #endif /* I3C_MASTER_H */
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
