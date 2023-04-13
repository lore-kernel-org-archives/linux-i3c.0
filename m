Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D411AC77B61
	for <linux-i3c@archiver.kernel.org>; Sun, 16 Apr 2023 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6eB5Pt0TfsV9JlcGIVhdjl+XByVughe289qHMcTkAE=; b=2CtD03lk6QIT0G
	6DVGAM5TbxzN10UL0UUDrJqedqhXoeBXzvDbZsQvHDlRoDtnatsjUtTr2ksG6277Hg4HUk4lm51jz
	J681+SQDZZ6JW/W7N6ROF/z7+cAQqlVoRnETM+aJfb6ugea1RwLkPLy+GmLPOzgmbQRtcvmZrIlLc
	KmnG71NaahSJchptZlx9bUcr8t6q8Q6HIozsb068vPlxnB9qQwzNT1omUfwtiQvxYVaaqz5Y6RG19
	WflEby+ALTvm4jG5eYv2VcDBzGSO4pg1pNGEHYNGMfGlJTM52uAEPuDqrSUeFVpTebwrCRBhIupAj
	WNdtp0oOVoGHFW22a6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poAl9-00EUzO-0H;
	Sun, 16 Apr 2023 22:22:11 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pms3o-005Mz9-2a
	for linux-i3c@lists.infradead.org;
	Thu, 13 Apr 2023 08:12:06 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id A968F2013B; Thu, 13 Apr 2023 16:11:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1681373511;
	bh=692AZKHxPPmqJUn2u2zQ/zySnqXPa7YedEllPXKnXk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=We2fbdl3UmsnRcrsyF1O7SInjSC/DPF/z57FrbEnSNNjmk8iNRjJfsKzRwVt1sqzd
	 QO8WrVeiGgP4HUGmxt/mVEAZpYf4PSCafG8z3LuqPTUhs1B/a+h7SWTF3vLk8kgNck
	 RNkZtU6vNuCiwKqrIrmd2Nf34oUPvBZkb6d5yzRujaEUYPg1YH0/A6ImRNEn1keThy
	 V0JRisxu5Uq7hoVwYVrJMNexkk0mnuoZNggSrzUZdrAC550dxe8aYRQgZrc6mNnK9k
	 +9isWtQeDkDYvTuksPxy6QmU3lkA+lal8W7+SozaCHRd9l0EwiTXc7abpDEg2K9U6m
	 GbSou9Aqq483Q==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Joel Stanley <joel@jms.id.au>
Subject: [RFC PATCH 1/2] i3c: Add support for bus enumeration & notification
Date: Thu, 13 Apr 2023 16:11:37 +0800
Message-Id: <20230413081139.15673-2-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413081139.15673-1-matt@codeconstruct.com.au>
References: <20230413081139.15673-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_011205_214657_6E8A6829 
X-CRM114-Status: GOOD (  10.46  )
X-Mailman-Approved-At: Sun, 16 Apr 2023 15:22:09 -0700
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

From: Jeremy Kerr <jk@codeconstruct.com.au>

This allows other drivers to be notified when new i3c busses are
attached, referring to a whole i3c bus as opposed to individual
devices.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master.c       | 35 +++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h | 11 +++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 54e4c34b4a22..a2071e6f0ec9 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -21,6 +21,7 @@
 
 static DEFINE_IDR(i3c_bus_idr);
 static DEFINE_MUTEX(i3c_core_lock);
+static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
 
 /**
  * i3c_bus_maintenance_lock - Lock the bus for a maintenance operation
@@ -441,6 +442,36 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
 	return 0;
 }
 
+void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
+			     void *data)
+{
+	struct i3c_bus *bus;
+	int id;
+
+	mutex_lock(&i3c_core_lock);
+	idr_for_each_entry(&i3c_bus_idr, bus, id)
+		fn(bus, data);
+	mutex_unlock(&i3c_core_lock);
+}
+EXPORT_SYMBOL_GPL(i3c_for_each_bus_locked);
+
+int i3c_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&i3c_bus_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(i3c_register_notifier);
+
+int i3c_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&i3c_bus_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(i3c_unregister_notifier);
+
+static void i3c_bus_notify(struct i3c_bus *bus, unsigned int action)
+{
+	blocking_notifier_call_chain(&i3c_bus_notifier, action, bus);
+}
+
 static const char * const i3c_bus_mode_strings[] = {
 	[I3C_BUS_MODE_PURE] = "pure",
 	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
@@ -2666,6 +2697,8 @@ int i3c_master_register(struct i3c_master_controller *master,
 	if (ret)
 		goto err_del_dev;
 
+	i3c_bus_notify(i3cbus, I3C_NOTIFY_BUS_ADD);
+
 	/*
 	 * We're done initializing the bus and the controller, we can now
 	 * register I3C devices discovered during the initial DAA.
@@ -2700,6 +2733,8 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
  */
 int i3c_master_unregister(struct i3c_master_controller *master)
 {
+	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
+
 	i3c_master_i2c_adapter_cleanup(master);
 	i3c_master_unregister_i3c_devs(master);
 	i3c_master_bus_cleanup(master);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 604a126b78c8..8153c2bd99e1 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -22,6 +22,12 @@
 #define I3C_BROADCAST_ADDR		0x7e
 #define I3C_MAX_ADDR			GENMASK(6, 0)
 
+/* notifier actions. notifier call data is the struct i3c_bus */
+enum {
+	I3C_NOTIFY_BUS_ADD,
+	I3C_NOTIFY_BUS_REMOVE,
+};
+
 struct i3c_master_controller;
 struct i3c_bus;
 struct i2c_device;
@@ -651,4 +657,9 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
 
 struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
 
+void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
+			     void *data);
+int i3c_register_notifier(struct notifier_block *nb);
+int i3c_unregister_notifier(struct notifier_block *nb);
+
 #endif /* I3C_MASTER_H */
-- 
2.37.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
