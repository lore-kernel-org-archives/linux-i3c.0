Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F254C44507
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Jul 2026 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVCX+fWs2NZvmqhVJkaOMTXGBIh8I/G933t0oCSyiHU=; b=A5DhFSmKIZ/Nft
	Ap5Glp3s/iRoPT5OsOku+mdgZfIQhjf/isYmrq1ISLfYwguH3nmLc5aq+4gpFKo3i65rYpkmiWv0f
	Y57i5L3DGFzydpdVF+LRuiOHxQ+USrd51FCM10wnZuuBivVZmeMGBpcclfvaFwAkPxyVXVUiIaKxu
	1tpkNLuoYxTn+AC7x/jwzcKs6NK0xlFLLq9xcV3f2YnyxvJUx1Loeb6a8PVHvXgjPrpo3CMaHc+7i
	pJgno7M0QoEy87/lONGLVPPA/uVBkoxFs4PqfaObF0m+s8s+HId7tpBwmr3ALGdbGYAkVo3zFUyqn
	WsgZY7ZFCPEFr88W8Eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZK5-0000000BRSI-164u;
	Tue, 14 Jul 2026 09:21:05 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZK2-0000000BRQk-477m
	for linux-i3c@lists.infradead.org;
	Tue, 14 Jul 2026 09:21:04 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 92A25200053;
	Tue, 14 Jul 2026 11:21:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5ADE320004C;
	Tue, 14 Jul 2026 11:21:01 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 05BDE18000B5;
	Tue, 14 Jul 2026 17:20:59 +0800 (+08)
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
Subject: [PATCH v14 2/8] i3c: master: Fix IBI request and free cleanup paths
Date: Tue, 14 Jul 2026 14:50:47 +0530
Message-Id: <20260714092053.2461482-3-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_022103_155742_08FCA87A 
X-CRM114-Status: GOOD (  13.30  )
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

i3c_dev_request_ibi_locked() allocates the generic IBI object and its
workqueue before calling the controller request_ibi() callback. If the
callback fails, destroy the workqueue before freeing the IBI object.

Also, a controller callback may clear dev->ibi while forwarding the request
or free operation to another controller. Avoid touching dev->ibi after the
callback if it has already been cleared.

This prevents a workqueue leak in the request failure path and avoids NULL
pointer dereference in the free path when the callback has already released
the IBI object.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

---
Changes in v14:
 - Destroy the allocated IBI workqueue when request_ibi() callback fails
 - Avoid touching dev->ibi after request/free callbacks if a forwarding
   controller callback has already cleared it
---
---
 drivers/i3c/master.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2cb94face156..01c6e048485c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3499,8 +3499,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 
 	dev->ibi = ibi;
 	ret = master->ops->request_ibi(dev, req);
-	if (ret) {
-		kfree(ibi);
+
+	/*
+	 * The controller callback may have already released and cleared dev->ibi
+	 * when the request is forwarded by a virtual controller. Only clean up the
+	 * IBI object if the callback left dev->ibi valid.
+	 */
+	if (ret && dev->ibi) {
+		/* Avoid leaking the workqueue allocated for this IBI request. */
+		if (dev->ibi->wq)
+			destroy_workqueue(dev->ibi->wq);
+
+		kfree(dev->ibi);
 		dev->ibi = NULL;
 	}
 
@@ -3540,6 +3550,13 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 
 	master->ops->free_ibi(dev);
 
+	/*
+	 * The controller callback may have already released dev->ibi, for example
+	 * when the request was forwarded by a virtual controller.
+	 */
+	if (!dev->ibi)
+		return;
+
 	if (dev->ibi->wq) {
 		destroy_workqueue(dev->ibi->wq);
 		dev->ibi->wq = NULL;
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
