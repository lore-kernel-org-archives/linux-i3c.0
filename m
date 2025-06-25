Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B09C7EE3A
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBqdcrLKePL7WjC1QRESbScDof0aI/wuKXYNz/uVLmE=; b=3ZnKhGk+7fZp3v
	efEfdLszgzrxsxhG6yXMkTIHDa/ezAbX6Fm+Q7mUws2YggZEI6T+2173zHMGQcdexHns2fsIZZ40B
	DwgY3XqT7JDPiJ2m1agIMBONq7sCgFu2NfMCTn1K7JIBnCBD5jIuGUV47fYA4a3naM1sC+6a/EMTb
	cyq8UznmLDCWQCrhGignUl7GABJB2OXCKTgm/4TxrRvtLq52DWb6BDLmBhqEt+VC8HkS/GuF8A+bk
	daBoWI0A2gPEsgq+2MeiAwxIlAsT2CO1QnQxxHit91jFPXEcs5h8eycIwxJRGxjnCBYg6AsyNLe6E
	57A3n8sm/eU230R9DMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3O-00000009Tbh-33Ye;
	Wed, 25 Jun 2025 17:36:58 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPsj-00000008kHN-3pvD
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 13:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=dzna/XsontEgN7I82CZjapfkRA2NWPYiVq+jFArEruA=; b=fpTQB+
	X4pGM+hafE35IbU+g3OLA5cMu4VqMGt55Alkc3ocqgSp4t+sxlAdnswpMRw3jUi7
	5qslby0Rzb+JzAMZNZynX8uP7BBz99pWSyxqjNm9E77cISE9gJ3biQn3cHrwy5aI
	CeFmhN3lI8CKWD9IwtRZPVAf3ZWCKWuYyXpYT292YLEXYoOXP2vSNwDqoHdx9wjB
	jRKHnUzPLjT0lcgaQsEs1REOy9aHHKUrxAeWHtFX4SrV90Lx1L5aeECZ+7DOu0vk
	yXdyXIm/zqSK7LxdA9HznZoKCSv5n4HsgtCDQYydCxl552PX48o/xbewg9mcpFk5
	kSckQBeHF0pWQttQ==
Received: (qmail 659096 invoked from network); 25 Jun 2025 15:09:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 15:09:40 +0200
X-UD-Smtp-Session: l3s3148p1@YTdLKGU4XNdtKDAs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 3/3] i3c: cdns: switch to use SUSV4 error codes
Date: Wed, 25 Jun 2025 15:09:21 +0200
Message-ID: <20250625130918.14507-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
References: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_060942_242066_E3032CCB 
X-CRM114-Status: GOOD (  10.64  )
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
 drivers/i3c/master/i3c-master-cdns.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654..e24d93a82e1c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -742,7 +742,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	for (i = 0; i < nxfers; i++) {
 		if (xfers[i].len > CMD0_FIFO_PL_LEN_MAX)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 	}
 
 	if (!nxfers)
@@ -750,7 +750,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	if (nxfers > master->caps.cmdfifodepth ||
 	    nxfers > master->caps.cmdrfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	/*
 	 * First make sure that all transactions (block of transfers separated
@@ -765,7 +765,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	if (rxslots > master->caps.rxfifodepth ||
 	    txslots > master->caps.txfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	cdns_xfer = cdns_i3c_master_alloc_xfer(master, nxfers);
 	if (!cdns_xfer)
@@ -822,11 +822,11 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	int i, ret = 0;
 
 	if (nxfers > master->caps.cmdfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < nxfers; i++) {
 		if (xfers[i].len > CMD0_FIFO_PL_LEN_MAX)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (xfers[i].flags & I2C_M_RD)
 			nrxwords += DIV_ROUND_UP(xfers[i].len, 4);
@@ -836,7 +836,7 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 
 	if (ntxwords > master->caps.txfifodepth ||
 	    nrxwords > master->caps.rxfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	xfer = cdns_i3c_master_alloc_xfer(master, nxfers);
 	if (!xfer)
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
