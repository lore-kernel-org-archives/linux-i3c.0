Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F962C77B7C
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZKHC+T1Dizug0f3JS8EyOCwctIxHgD2elWR1dYl1jc=; b=YxT+NhsHZnSTbc
	eB99rcfPUvMKeFl2wpXqH6Yh6gd6ErcXPezLfX5OC1FxV6egdEaCjlPPWorRZiXogG4XSYkauqXk+
	ygiDg/ktMXlRd61RTJKhZbpi/FCpJiXyI9UALfuMo80ZqeHC+o7LDsl4bJ8rGyWjSPzsGakZ7MO0H
	Z4r/pbCdIHdymMs8c/hpJk4uSbzn65Se/z/J/kLlFf1ZgmLK0F6XRLVIlpUNRfZjPCl/+dFcrNj2n
	fnmHRVD9WocAx6JugK6HbkYL9AsEJQjYIn2pf/pmhot56iyIoSUuaGiTXgVxksc3bod5qwUUnTseP
	zNXB7F1MFOA+NP07rHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3N-00000009TXm-0A3K;
	Wed, 25 Jun 2025 17:36:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPsf-00000008kFp-3gmc
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 13:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=qlV2pGfL+6NRiVck31qVf+NWQf3K0ijblOepug5UF+A=; b=A+pmqm
	2zeOr0T/L7iYULFpu41V+YteuRdJubLxdDN/ddrzx+SJ+YS+1WBMLDimNL2M0azs
	/g5V7wbHToIpuKWBaU9pUCovFJ7dH+mheR80g6QPA2rSRyxiUF+tnvhOyKqfJ689
	5g14INz5KFH0KSDi0NuZnrXv2HNVz7URCey5GNmSfL2AJeKS75ETiw1YYCLYV33r
	l1qs9Q+MSsYqCoNJbMASvIe75WWpuR4mQnFmLvagjuyPG8rSC37k2U8I9+5nsNyF
	p0pBUhjeLVcRhrrewA2KUcTgSzl6zogr7cmdYDf6+bMauk1CcL0XOQJXviwuLIo0
	g1MqwCR6+l/ErCHw==
Received: (qmail 659004 invoked from network); 25 Jun 2025 15:09:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 15:09:35 +0200
X-UD-Smtp-Session: l3s3148p1@Wt0MKGU48JttKDAs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 1/3] i3c: core: switch to use SUSV4 error codes
Date: Wed, 25 Jun 2025 15:09:19 +0200
Message-ID: <20250625130918.14507-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
References: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_060938_793298_D5F1EA85 
X-CRM114-Status: GOOD (  12.88  )
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

This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
probably will get one. So, let's convert these error codes now, before
it will be forgotten in the future, and they could slip through to
applications.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e53c69d24873..354fef4a033c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -837,14 +837,14 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 		return -EINVAL;
 
 	if (!master->ops->send_ccc_cmd)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if ((cmd->id & I3C_CCC_DIRECT) && (!cmd->dests || !cmd->ndests))
 		return -EINVAL;
 
 	if (master->ops->supports_ccc_cmd &&
 	    !master->ops->supports_ccc_cmd(master, cmd))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	ret = master->ops->send_ccc_cmd(master, cmd);
 	if (ret) {
@@ -1439,7 +1439,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
 
 	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
 		ret = i3c_master_gethdrcap_locked(master, &dev->info);
-		if (ret && ret != -ENOTSUPP)
+		if (ret && ret != -EOPNOTSUPP)
 			return ret;
 	}
 
@@ -2210,7 +2210,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	 */
 	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
 		dev_err(dev, "I2C device with 10 bit address not supported.");
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
 
 	/* LVR is encoded in reg[2]. */
@@ -2340,13 +2340,13 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 		return -EINVAL;
 
 	if (!master->ops->i2c_xfers)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	/* Doing transfers to different devices is not supported. */
 	addr = xfers[0].addr;
 	for (i = 1; i < nxfers; i++) {
 		if (addr != xfers[i].addr)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 	}
 
 	i3c_bus_normaluse_lock(&master->bus);
@@ -2766,7 +2766,7 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
  *	    controller)
  * @ops: the master controller operations
  * @secondary: true if you are registering a secondary master. Will return
- *	       -ENOTSUPP if set to true since secondary masters are not yet
+ *	       -EOPNOTSUPP if set to true since secondary masters are not yet
  *	       supported
  *
  * This function takes care of everything for you:
@@ -2793,7 +2793,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	/* We do not support secondary masters yet. */
 	if (secondary)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	ret = i3c_master_check_ops(ops);
 	if (ret)
@@ -2954,7 +2954,7 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 		return -EINVAL;
 
 	if (!master->ops->priv_xfers)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	return master->ops->priv_xfers(dev, xfers, nxfers);
 }
@@ -3004,7 +3004,7 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 	int ret;
 
 	if (!master->ops->request_ibi)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (dev->ibi)
 		return -EBUSY;
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
