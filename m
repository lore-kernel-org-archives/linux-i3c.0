Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FF9C7EE39
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Jun 2025 19:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUheQfYz8ZD9uIET4rDRCUjTDh1ClsxOnVo/WD3nrKc=; b=MNw8weQXGnVGU0
	XBjvTqipfc7ANYYfupMQw5eWMsm/itykQKq8XDJfEyXkQ6VDHiUIGVpuYQc2SRDJetc346154MfNc
	j67LQFD1n2iFMHkFJXKtStKaBa/RKktPRlOEJnbiti03FnE5m3WSTKa6SDh7U75apIobELRrX5GVn
	WqSw0DPU7GC1lqadX1amfXM6TyTBiRF0wwgYAEq2CqXXQevi7R2dIdAApnVH4bd3gECbh5X0PumRm
	LX1S0XPs7jY0wSChz7jpHLZEgODZKBQZUpC/kqwabUQ7Ht0k4vl2J0w7fBHwP2mJg+sg3l/vxP9gO
	ufwA9Os0lMrF/RMkNVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVb6X-0000000HFG8-22CZ;
	Sat, 28 Jun 2025 19:20:49 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVb6U-0000000HFF7-3tXz
	for linux-i3c@lists.infradead.org;
	Sat, 28 Jun 2025 19:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=JILg3zbmmZGnh2VjUJzTPc01xz6OtlqeYKutgyhBUEs=; b=eTepmD
	OuEFc9nZIe7anAWoRC9u0tnMe5nv6n0KX6ZHS2mcgdXV8AeZeuKuDj+LjI8U1J07
	gNYCfePU6Ak+putkglcWhz1Xi81MmY90PClnXDnlbyfRBZim95NuZzrptxcVxMRt
	VGCv7h8XovdN0ZcYROrgpxXlEXwKDtb++LX4++jw1fxuvfJGoHhdQbIWEn8qD2Br
	rumRRsH9CaTBdiCzOr1nxlf7jAqFcfZG9Yn53QqFqO6+U2Y3ihxPtI77jQHaSepT
	a50W6FNk27UqYYgVmCK4t2J+7eIa5L/sviLskI9Cr8rl87r/yM9d+M3HqZYqLkXv
	SQb5yq7UtxQhkEBQ==
Received: (qmail 1918969 invoked from network); 28 Jun 2025 21:20:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 21:20:45 +0200
X-UD-Smtp-Session: l3s3148p1@K+vxsKY4NoQtnPBw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 1/3] i3c: master: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Sat, 28 Jun 2025 21:20:28 +0200
Message-ID: <20250628192027.3932-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
References: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_122047_239974_07526101 
X-CRM114-Status: GOOD (  12.20  )
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

Replace non-standard ENOTSUPP with the SUSV4-defined error code
EOPNOTSUPP to fix below checkpatch warning:
  "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"

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
