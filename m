Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8960DCD5BC0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 06:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTX4Ck77E3KGqegcqQcl//eYuX4Ar4AZsEEDScF05OQ=; b=Q83wKwZzc8hZOe
	H53aKHA8Y9M9cFd8zcN5F8/uSs7N2kJB0tyzxBiP3UDP7ep3QAwH4y01A+iGwTrjBDLOjnlt2MblP
	vpZIt9zv7SzQkATBOjk+/Ciq8O6WSh73+5HQdhXCzirGp70sc84m5jxBUIahOwq5R/Fy3XXam3D7B
	kZbUVoslN4qkiWCRJwgiqrRt7RSGLLnCBmUymPuG6M5YyhpbPNtoiyUid7HVl113jphoU3elIdjo4
	lE69SF5Vd/rq30koo7tUfiHKYh8GiBvLLwAx8qNm8L9mFS/uXyfs5oL2mKAYBLBQ+W22XGrK4k3AY
	bTehnZQvIyNY8zuJOvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRP1A-0000000GRl1-0ZkO;
	Mon, 25 May 2026 06:42:28 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRP17-0000000GRjH-1dOm
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 06:42:27 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5F33A1A2C9F;
	Mon, 25 May 2026 08:42:22 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1F3ED1A20F6;
	Mon, 25 May 2026 08:42:22 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id CB51A1800071;
	Mon, 25 May 2026 14:42:20 +0800 (+08)
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
Subject: [PATCH v10 1/9] i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked
Date: Mon, 25 May 2026 12:12:01 +0530
Message-Id: <20260525064209.2263045-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_234225_554959_3309CE7D 
X-CRM114-Status: UNSURE (   9.30  )
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

---
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
