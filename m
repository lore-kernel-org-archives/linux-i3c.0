Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA449CD98D9
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2Ml+/cala/gLeofa2nplyUz/5Uh0MaYDxva3C5EDzg=; b=KmzkQabDPdVcSd
	AN8/3P39C219WIVzEVHfis+kCaeA1V4ZWJYNJsliwq/bzXx1jiYEA56yJL1veWKYyLviDdo/2cIqX
	5vCc2NXxJKnXGvBNBmEfPAG7arnJV7vqqUaCzQ//5jKbnEy441Zw70xjD2M0fUfFD5MMaS6uQctOm
	Gz68nnA1iDhSH9rMMJ2SSU7EQyYF8KTx2ACDoAPaXvOlsgPPCKHNFykF3mk+NxsTDiftTxz7BJuwT
	cyhSWKDZvFPaQMX3kK1JihE9iA4B5rwijVDgu0lXrvsY63BLRc9ufd+Y74buh9MbAcuA+VdxlBUeB
	sYCzasRi9sllAThB8hRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzuA-0000000Anbx-22yL;
	Fri, 12 Jun 2026 11:18:30 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzu7-0000000AnaK-2AVu
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 11:18:28 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 744721A06FD;
	Fri, 12 Jun 2026 13:18:24 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E1311A06ED;
	Fri, 12 Jun 2026 13:18:24 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E2860180004C;
	Fri, 12 Jun 2026 19:18:22 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v11 1/9] i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked
Date: Fri, 12 Jun 2026 16:48:08 +0530
Message-Id: <20260612111816.3688240-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_041827_711261_733CD244 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

Rename i3c_master_reattach_i3c_dev() to *_locked() to make the locking
requirement explicit and consistent with other I3C core helpers that
require the bus lock to be held by the caller.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v11:
 - No change, added Reviewed-By tag

Changes in v10:
 - Rename i3c_master_reattach_i3c_dev() to *_locked to reflect required
   bus locking
---
---
 drivers/i3c/master.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5cd4e5da2233..e89d73508b9a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1652,8 +1652,8 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
-				       u8 old_dyn_addr)
+static int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
+					      u8 old_dyn_addr)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
 	int ret;
@@ -1742,7 +1742,7 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 		goto err_detach_dev;
 
 	i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
-	ret = i3c_master_reattach_i3c_dev(i3cdev, 0);
+	ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
 	if (ret)
 		goto err_rstdaa;
 
@@ -2358,7 +2358,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 		if (!ret) {
 			old_dyn_addr = newdev->info.dyn_addr;
 			newdev->info.dyn_addr = expected_dyn_addr;
-			i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
+			i3c_master_reattach_i3c_dev_locked(newdev, old_dyn_addr);
 		} else {
 			dev_err(&master->dev,
 				"Failed to assign reserved/old address to device %d%llx",
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
