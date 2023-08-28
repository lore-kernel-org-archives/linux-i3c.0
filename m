Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B882C83F11
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Aug 2023 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ij5I4TOJh0Rg2oHS6FQvcql9IPWIdX3A1ZWyW26eeto=; b=zRBl1ec1e1R35W
	gGwdVfjIpU+s9K7G0fQov9ULbHhHmobOdi+DGm7oU9faMyUunRgnZaJZDMG4D0y0So/kA5hCJic4H
	osKYEflJ2nk2mWcw1haD5nQo4AnI2w7GIr5xVvUZEv4DwyCgmFfoxi4YXpiAKXyzZ2rbU8D44vJ4F
	IF+rsRfqanZbEpoevwPZe3+ESjWXOZ/xxOaPBOAsrxHI7Zty//BnrEBy/ZUfcN2UwP16AZJjGrOT7
	VGyrvlONnWMR/P8QLvifwY+BJc6m56rWgQJUxLxiA3kelhHVsSjzDSN2gws0nK4m0PCVkhy+x1dTP
	HYeVyHCH70RTP7BB/3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qae3I-009mrS-18;
	Mon, 28 Aug 2023 15:21:16 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qae3E-009mpf-1n
	for linux-i3c@lists.infradead.org;
	Mon, 28 Aug 2023 15:21:14 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6A77924E057
	for <linux-i3c@lists.infradead.org>; Mon, 28 Aug 2023 23:20:44 +0800 (CST)
Received: from localhost.localdomain (161.142.156.149) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 28 Aug
 2023 23:20:43 +0800
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: <linux-i3c@lists.infradead.org>
CC: Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: [PATCH] i3c: Add fallback method for GETMXDS CCC
Date: Mon, 28 Aug 2023 23:20:35 +0800
Message-ID: <20230828152035.15498-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [161.142.156.149]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX166.cuchost.com
 (172.16.6.76)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_082113_321385_9CC46A89 
X-CRM114-Status: GOOD (  15.66  )
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

Some I3C hardware will report error when incorrect length is received from device. GETMXDS CCC are availble in 2 formats; without turnaround time (format 1) and with turnaround time (format 2). There is no mechanics to determine which format is supported by device. In case sending GETMXDS CCC format 2 resulted failure, try sending GETMXDS CCC format 1 instead.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 drivers/i3c/master.c    | 33 ++++++++++++++++++++++++++++-----
 include/linux/i3c/ccc.h | 17 +++++++++++++++--
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 351c81a929a6..8e6449ca724b 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1076,10 +1076,37 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 				     struct i3c_device_info *info)
 {
 	struct i3c_ccc_getmxds *getmaxds;
+	struct i3c_ccc_getmxds_turnaround *getmaxds_ta;
 	struct i3c_ccc_cmd_dest dest;
 	struct i3c_ccc_cmd cmd;
 	int ret;
 
+	getmaxds_ta = i3c_ccc_cmd_dest_init(&dest, info->dyn_addr,
+					 sizeof(*getmaxds_ta));
+	if (!getmaxds_ta)
+		return -ENOMEM;
+
+	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	if (ret) {
+		goto alternative;
+	}
+
+	if (dest.payload.len != 2 && dest.payload.len != 5) {
+		ret = -EIO;
+		goto out;
+	}
+
+	info->max_read_ds = getmaxds_ta->maxrd;
+	info->max_write_ds = getmaxds_ta->maxwr;
+	if (dest.payload.len == 5)
+		info->max_read_turnaround = getmaxds_ta->maxrdturn[0] |
+					    ((u32)getmaxds_ta->maxrdturn[1] << 8) |
+					    ((u32)getmaxds_ta->maxrdturn[2] << 16);
+
+alternative:
+	i3c_ccc_cmd_dest_cleanup(&dest);
+
 	getmaxds = i3c_ccc_cmd_dest_init(&dest, info->dyn_addr,
 					 sizeof(*getmaxds));
 	if (!getmaxds)
@@ -1090,17 +1117,13 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != 2 && dest.payload.len != 5) {
+	if (dest.payload.len != 2) {
 		ret = -EIO;
 		goto out;
 	}
 
 	info->max_read_ds = getmaxds->maxrd;
 	info->max_write_ds = getmaxds->maxwr;
-	if (dest.payload.len == 5)
-		info->max_read_turnaround = getmaxds->maxrdturn[0] |
-					    ((u32)getmaxds->maxrdturn[1] << 8) |
-					    ((u32)getmaxds->maxrdturn[2] << 16);
 
 out:
 	i3c_ccc_cmd_dest_cleanup(&dest);
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index ad59a4ae60d1..50ed41d4d5a1 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -269,14 +269,27 @@ enum i3c_tsco {
 #define I3C_CCC_MAX_SDR_FSCL(x)		((x) & I3C_CCC_MAX_SDR_FSCL_MASK)
 
 /**
- * struct i3c_ccc_getmxds - payload passed to GETMXDS CCC
+ * struct i3c_ccc_getmxds - payload passed to GETMXDS CCC without turnaround
+ * (format 1)
+ *
+ * @maxwr: write limitations
+ * @maxrd: read limitations
+ */
+struct i3c_ccc_getmxds {
+	u8 maxwr;
+	u8 maxrd;
+} __packed;
+
+/**
+ * struct i3c_ccc_getmxds_ta - payload passed to GETMXDS CCC with turnaround
+ * (format 2)
  *
  * @maxwr: write limitations
  * @maxrd: read limitations
  * @maxrdturn: maximum read turn-around expressed micro-seconds and
  *	       little-endian formatted
  */
-struct i3c_ccc_getmxds {
+struct i3c_ccc_getmxds_turnaround {
 	u8 maxwr;
 	u8 maxrd;
 	u8 maxrdturn[3];
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
