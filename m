Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60B2C433F5
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Jan 2022 18:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDtogPKV+HGFDV9+a/ok1JTgaU8/m9jgZkaLr1ZtdlU=; b=tgYSf9/TuvyBve
	iDhXOc4Ix6IU3l/sWfjhHJgXi0Yh1EeZ4U0Hde/rvpPVkJApH+YBk7MhiRQN4VPoGmiQxTNDwU09N
	ePM7ERFTSjam16kVjsje+NdhwZlmUsV/WyYxpzjUJH2/dztxCh1EOlGigQW+z82/mPsTwaWeRVjjx
	/5qUWMbxfskaDOH/1YQstks3l/C4B6+e0bm0pqknnRSVyQb+DfCvi9HHLwp4ZL8I7GwZk0gxfkWZV
	CHm9QD33BhG/LAgHULR7fcPxDX+mgOHcw5f025RccFzSXnKyjwoUXPUAmv6vflF9I1WTFvUWEBALa
	Lvx7e/7e0QZab75kgrTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9WcL-00G4VH-Un; Mon, 17 Jan 2022 18:20:33 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9W7Q-00Fzpq-7I
 for linux-i3c@lists.infradead.org; Mon, 17 Jan 2022 17:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642441716; x=1673977716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pHYS2NC97QQMHxos6LdZ2Eft9qG4DvH4WPP0qTsUQVA=;
 b=zoJ3sA7vYc1OXUfzf6fQIm6oEkUQH4xao+GhvFqDDwERg11SHwdSQfFN
 w0WZ76nMNSuc6w3jNxbyibtiKIfjaBmSTq/kSKiNxZwhd9AQ8xmiABuB2
 NS3uVIj3fQSuZs1Lft2vCbNjz92lzAgRjcQ4QOSPaA/FWGYNMIPiJeiIN U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Jan 2022 09:48:36 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 09:48:35 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 17 Jan 2022 09:48:34 -0800
Received: from localhost (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 17 Jan
 2022 09:48:34 -0800
From: Jamie Iles <quic_jiles@quicinc.com>
To: <linux-i3c@lists.infradead.org>
CC: Jamie Iles <quic_jiles@quicinc.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] i3c: remove i2c board info from i2c_dev_desc
Date: Mon, 17 Jan 2022 17:48:15 +0000
Message-ID: <20220117174816.1963463-2-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117174816.1963463-1-quic_jiles@quicinc.com>
References: <20220117174816.1963463-1-quic_jiles@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_094836_328393_9145993E 
X-CRM114-Status: GOOD (  14.14  )
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

I2C board info is only required during adapter setup so there is no
requirement to keeping a pointer to it once running.  To support dynamic
device addition we can't rely on board info - user-space creation
through sysfs won't have a boardinfo.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
---
 drivers/i3c/master.c       | 18 ++++++++++--------
 include/linux/i3c/master.h |  1 -
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index dfe18dcd008d..9a09109da8cc 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -609,7 +609,7 @@ static void i3c_master_free_i2c_dev(struct i2c_dev_desc *dev)
 
 static struct i2c_dev_desc *
 i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
-			 const struct i2c_dev_boardinfo *boardinfo)
+			 u16 addr, u8 lvr)
 {
 	struct i2c_dev_desc *dev;
 
@@ -618,9 +618,8 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
 		return ERR_PTR(-ENOMEM);
 
 	dev->common.master = master;
-	dev->boardinfo = boardinfo;
-	dev->addr = boardinfo->base.addr;
-	dev->lvr = boardinfo->lvr;
+	dev->addr = addr;
+	dev->lvr = lvr;
 
 	return dev;
 }
@@ -694,7 +693,7 @@ i3c_master_find_i2c_dev_by_addr(const struct i3c_master_controller *master,
 	struct i2c_dev_desc *dev;
 
 	i3c_bus_for_each_i2cdev(&master->bus, dev) {
-		if (dev->boardinfo->base.addr == addr)
+		if (dev->addr == addr)
 			return dev;
 	}
 
@@ -1689,7 +1688,9 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 					     i2cboardinfo->base.addr,
 					     I3C_ADDR_SLOT_I2C_DEV);
 
-		i2cdev = i3c_master_alloc_i2c_dev(master, i2cboardinfo);
+		i2cdev = i3c_master_alloc_i2c_dev(master,
+						  i2cboardinfo->base.addr,
+						  i2cboardinfo->lvr);
 		if (IS_ERR(i2cdev)) {
 			ret = PTR_ERR(i2cdev);
 			goto err_detach_devs;
@@ -2175,6 +2176,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 {
 	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
 	struct i2c_dev_desc *i2cdev;
+	struct i2c_dev_boardinfo *i2cboardinfo;
 	int ret;
 
 	adap->dev.parent = master->dev.parent;
@@ -2194,8 +2196,8 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	 * We silently ignore failures here. The bus should keep working
 	 * correctly even if one or more i2c devices are not registered.
 	 */
-	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
-		i2cdev->dev = i2c_new_client_device(adap, &i2cdev->boardinfo->base);
+	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node)
+		i2cdev->dev = i2c_new_client_device(adap, &i2cboardinfo->base);
 
 	return 0;
 }
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 9cb39d901cd5..604a126b78c8 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -85,7 +85,6 @@ struct i2c_dev_boardinfo {
  */
 struct i2c_dev_desc {
 	struct i3c_i2c_dev_desc common;
-	const struct i2c_dev_boardinfo *boardinfo;
 	struct i2c_client *dev;
 	u16 addr;
 	u8 lvr;
-- 
2.32.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
