Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD0AC77B60
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSeqVMLUEGAEFvM+1M6tbtRbnIvL0F5UkEljrbA9OoU=; b=poafVz8TAFuCKm
	k2G9LGhHPoh9Xn9o19QYMa+joQ8z1KchEL+3VtDAiqe1vNmHKts5sqHDNavFAvK7tSwGEiUDJxkm/
	2yRgYw+Vpxw2Ozl9lHeGHEY2TlORbXxhF/DbD3V/UvUAMFWliy9SKv2w6yzrEJfAFy/83CKtWZ2S2
	mO2UGDJMD3geZQ65gx9sHZUbwtOHEg4nB9rIXiSclI9+aruQbGr4dXPRHkp312ABq2IF1M3NUR7tF
	aWlcMbyG5+J5laiWbChwyehjeadz8YfLZg7I7+CfEjCZS8mSFmv8/tcNPA7Pe2iwNJdCkpysGA6Lv
	BRl7rg4xvFD0NkrwnozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phscu-003vUF-2C;
	Thu, 30 Mar 2023 13:47:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn3b-002yjv-12
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:50:53 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id AF555201F2; Thu, 30 Mar 2023 15:50:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680162649;
	bh=ZdaVymXUnq5Ns0W1+hSf0wiOjoc2I6ncYW7UzKHfH74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cpvtq2CpKLdVEkDBoqgELl7U4mvXszIFN3Wn9kET/0FbuAQMSyy9FO3chdj4vf4ml
	 akBl6APnvp1EL0uD+v+eUqgA6p+gJSuMdOt4qvPQgPZnkmuRxmNneeNDjp5gCasvW3
	 KMa10/tDm+jHPG2OljeICFrStVX8GUlkhiHY7NuMFNfwowJZNweTnG5P++bnayw+3O
	 jZOADzXTaTf0AOqyvXZ/Q7KB6dcmOY06F74Y8ZSowllPpQKEMg+vZGdYrBoU3Hp1hN
	 89CRnlaQIRSdh3wNF9WbSQ3U4LFMDrmGMyoVypgVRHETla/VRM7suLR0ZF9VwpuihR
	 5WpjyVhxi6cPw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/5] i3c: dw: Turn DAT array entry into a struct
Date: Thu, 30 Mar 2023 15:50:33 +0800
Message-Id: <9dc0d9e2857e851a0cf04819df48e5d31921f83e.1680161823.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680161823.git.jk@codeconstruct.com.au>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005051_740887_F3AA38C9 
X-CRM114-Status: GOOD (  13.43  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:47:39 -0700
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

In an upcoming change, we will want to store additional data about the
devices we have in the data address table.

Change the type of the DAT entries into a struct, which currently just
has the address data.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 22 +++++++++++-----------
 drivers/i3c/master/dw-i3c-master.h | 11 ++++++++++-
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index cb38ef95f21a..a086d9c5ff35 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -291,7 +291,7 @@ static int dw_i3c_master_get_addr_pos(struct dw_i3c_master *master, u8 addr)
 	int pos;
 
 	for (pos = 0; pos < master->maxdevs; pos++) {
-		if (addr == master->addrs[pos])
+		if (addr == master->devs[pos].addr)
 			return pos;
 	}
 
@@ -769,7 +769,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		if (ret < 0)
 			return -ENOSPC;
 
-		master->addrs[pos] = ret;
+		master->devs[pos].addr = ret;
 		p = even_parity(ret);
 		last_addr = ret;
 		ret |= (p << 7);
@@ -806,7 +806,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 
 	for (pos = 0; pos < master->maxdevs; pos++) {
 		if (newdevs & BIT(pos))
-			i3c_master_add_i3c_dev_locked(m, master->addrs[pos]);
+			i3c_master_add_i3c_dev_locked(m, master->devs[pos].addr);
 	}
 
 	dw_i3c_master_free_xfer(xfer);
@@ -905,11 +905,11 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 		       master->regs +
 		       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
-		master->addrs[data->index] = 0;
+		master->devs[data->index].addr = 0;
 		master->free_pos |= BIT(data->index);
 
 		data->index = pos;
-		master->addrs[pos] = dev->info.dyn_addr;
+		master->devs[pos].addr = dev->info.dyn_addr;
 		master->free_pos &= ~BIT(pos);
 	}
 
@@ -917,7 +917,7 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
-	master->addrs[data->index] = dev->info.dyn_addr;
+	master->devs[data->index].addr = dev->info.dyn_addr;
 
 	return 0;
 }
@@ -938,11 +938,11 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
 		return -ENOMEM;
 
 	data->index = pos;
-	master->addrs[pos] = dev->info.dyn_addr ? : dev->info.static_addr;
+	master->devs[pos].addr = dev->info.dyn_addr ? : dev->info.static_addr;
 	master->free_pos &= ~BIT(pos);
 	i3c_dev_set_master_data(dev, data);
 
-	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->addrs[pos]),
+	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
@@ -960,7 +960,7 @@ static void dw_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
 	i3c_dev_set_master_data(dev, NULL);
-	master->addrs[data->index] = 0;
+	master->devs[data->index].addr = 0;
 	master->free_pos |= BIT(data->index);
 	kfree(data);
 }
@@ -1046,7 +1046,7 @@ static int dw_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 		return -ENOMEM;
 
 	data->index = pos;
-	master->addrs[pos] = dev->addr;
+	master->devs[pos].addr = dev->addr;
 	master->free_pos &= ~BIT(pos);
 	i2c_dev_set_master_data(dev, data);
 
@@ -1069,7 +1069,7 @@ static void dw_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
 	i2c_dev_set_master_data(dev, NULL);
-	master->addrs[data->index] = 0;
+	master->devs[data->index].addr = 0;
 	master->free_pos |= BIT(data->index);
 	kfree(data);
 }
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 9f1e48211aa4..dd0b77e2c66a 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -17,6 +17,10 @@ struct dw_i3c_master_caps {
 	u8 datafifodepth;
 };
 
+struct dw_i3c_dat_entry {
+	u8 addr;
+};
+
 struct dw_i3c_master {
 	struct i3c_master_controller base;
 	u16 maxdevs;
@@ -33,7 +37,12 @@ struct dw_i3c_master {
 	struct clk *core_clk;
 	char version[5];
 	char type[5];
-	u8 addrs[DW_I3C_MAX_DEVS];
+
+	/*
+	 * Per-device hardware data, used to manage the device address table
+	 * (DAT)
+	 */
+	struct dw_i3c_dat_entry devs[DW_I3C_MAX_DEVS];
 
 	/* platform-specific data */
 	const struct dw_i3c_platform_ops *platform_ops;
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
