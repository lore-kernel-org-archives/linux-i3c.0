Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31CFC76188
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Apr 2023 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hk6a8wQFwiBk07YhGZaMAlxBOH6OThUmJ0tSKXXBWG0=; b=vkxu6poQbFxCRC
	Q3xneRm0h69Wn/PrRkzw69HkjJmkMCLsDuC1DT3B579Epflu881Tz7t1rU6GUWcSYU8LPipYN58BW
	6yVRVeAd4J0SfKcIax2nL2+B/vo3VgXEvZKCEyxjUxzFIv1Q5bWHBwnqLK6SAV6Oe46zrncNwWd+c
	5gnrpNsZlu6sNfNW1ChbV2Bo35qQoRgY9yUrYGjcpMT/rvTQvLZVnuuMoAPxw0rrGpy+yX0xh26Q0
	27yyg6AdrbTunzY6gTjc4DhAx16zIkYj3MhykseZv8vfzHxzR2NPRfA+XMpU3IX/DUQ2RuU7rG6+1
	LwTXvuHu3AEwcRT/mgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzec-003zaC-17;
	Wed, 05 Apr 2023 09:42:10 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzeZ-003zXs-2D
	for linux-i3c@lists.infradead.org;
	Wed, 05 Apr 2023 09:42:09 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id B4FE22009F; Wed,  5 Apr 2023 17:41:58 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680687718;
	bh=ScSLoA4vlLuuG1fvCVZcqAe6Mt2w7xjO6FE7uaHEdg8=;
	h=From:To:Cc:Subject:Date;
	b=a2DYkkZ8e45MVPEqoVEzPDrU9tVwIcY7+7bDAWNeQbd7T9NVTfojV2siUDlqncMCs
	 S0SeNxnDn0D6phrv+NrLBTMclWH8SeNduE9iT9Rws3RxV6nR4AT71X30bG4Qy0jyBv
	 JTfROoRmOt9z+sLP7Nl9+RzfIm1S22kxuT/fXM9EQTjxng5CBbfjQ4FxxdAvpfm3qP
	 27uFSlXF1U/pDq2kUmIfXXPIdukFqzriMLeiXJCxO5jtdqfd7nBb2vwkej/IryU41J
	 AEaNw02qZFbVewvXM6WFOvVLuJ48tAmcNaQnqT0mUAhpaIOsdg5oeqm7BzEjgQ31XM
	 zzAKCILWGo4HA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH] i3c: Allow OF-alias-based persistent bus numbering
Date: Wed,  5 Apr 2023 17:41:49 +0800
Message-Id: <20230405094149.1513209-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_024207_932270_544ED36E 
X-CRM114-Status: GOOD (  11.63  )
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

Parse the /aliases node to assign any fixed bus numbers, as is done with
the i2c subsystem. Numbering for non-aliased busses will start after the
highest fixed bus number.

This allows an alias node such as:

    aliases {
        i3c0 = &bus_a,
	i3c4 = &bus_b,
    };

to set the numbering for a set of i3c controllers:

    /* fixed-numbered bus, assigned "i3c-0" */
    bus_a: i3c-master {
    };

    /* another fixed-numbered bus, assigned "i3c-4" */
    bus_b: i3c-master {
    };

    /* dynamic-numbered bus, likely assigned "i3c-5" */
    bus_c: i3c-master {
    };

If no i3c device aliases are present, the numbering will stay as-is,
starting from 0.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index af8b9ebaec34..6a3169e4606e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -21,6 +21,7 @@
 
 static DEFINE_IDR(i3c_bus_idr);
 static DEFINE_MUTEX(i3c_core_lock);
+static int __i3c_first_dynamic_bus_num;
 
 /**
  * i3c_bus_maintenance_lock - Lock the bus for a maintenance operation
@@ -419,9 +420,9 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
 	mutex_unlock(&i3c_core_lock);
 }
 
-static int i3c_bus_init(struct i3c_bus *i3cbus)
+static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
 {
-	int ret;
+	int ret, start, end, id = -1;
 
 	init_rwsem(&i3cbus->lock);
 	INIT_LIST_HEAD(&i3cbus->devs.i2c);
@@ -429,8 +430,19 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
 	i3c_bus_init_addrslots(i3cbus);
 	i3cbus->mode = I3C_BUS_MODE_PURE;
 
+	if (np)
+		id = of_alias_get_id(np, "i3c");
+
 	mutex_lock(&i3c_core_lock);
-	ret = idr_alloc(&i3c_bus_idr, i3cbus, 0, 0, GFP_KERNEL);
+	if (id >= 0) {
+		start = id;
+		end = start + 1;
+	} else {
+		start = __i3c_first_dynamic_bus_num;
+		end = 0;
+	}
+
+	ret = idr_alloc(&i3c_bus_idr, i3cbus, start, end, GFP_KERNEL);
 	mutex_unlock(&i3c_core_lock);
 
 	if (ret < 0)
@@ -2618,7 +2630,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
-	ret = i3c_bus_init(i3cbus);
+	ret = i3c_bus_init(i3cbus, master->dev.of_node);
 	if (ret)
 		return ret;
 
@@ -2846,8 +2858,16 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 
 static int __init i3c_init(void)
 {
-	int res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);
+	int res;
+
+	res = of_alias_get_highest_id("i3c");
+	if (res >= 0) {
+		mutex_lock(&i3c_core_lock);
+		__i3c_first_dynamic_bus_num = res + 1;
+		mutex_unlock(&i3c_core_lock);
+	}
 
+	res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);
 	if (res)
 		return res;
 
-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
