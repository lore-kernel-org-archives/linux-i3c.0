Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E5ACDB483
	for <linux-i3c@archiver.kernel.org>; Sun, 15 Oct 2023 22:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCsV6+4gny2qJTBhsI8FO5FBNI+eKtkQuPLBEnxvcQc=; b=qVPmanNzXt1Eoj
	DTwUzScZ9GnIHVjs3+lpyoUI+iHEe3F29/AvrfhYAIEJ8QaA4sjHPx43nY6AKk5PR8tpkhlkDVmny
	7Mt6PVojzoGsCu5g2dwYxntQlWhyxLurBCDxO1OshEEn+E2QNq6KeBi+lj4GDh3rnVgjZ9pajCqoe
	o1wpINQ7Vtv1G4hxMqZzYyvk406DCusQ4MSd04FIseQzdPkni+g/gS6mpt5bxZ8YbGODNEmjB/Lol
	i0XQj+LQhs+6+73pAccC4nlsoVqEquUl9cK1QBysIexULSAsSmHu6PAfT3T8pVGr6ejjMypY4KZrc
	/4C0F2kbkCo3wOMNFnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qs9Wg-007mSM-1Y;
	Sun, 15 Oct 2023 22:23:58 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qs9We-007mRs-0Q
	for linux-i3c@lists.infradead.org;
	Sun, 15 Oct 2023 22:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697408636; x=1728944636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KgJREo6gRmuWdhLud69FXQUc+lpLxyaQXEue7DTR1oI=;
  b=V+Cs8EFntuoGs78HXgM2MqBm0fIkorB1XpaGWK9e+elyp0u7rCjszFGV
   +dY+uu6xHO9UPlwAr9JFGyoS8zo3yvUVHSeE7YxxTHCdls82sc0mEbTst
   2e6LhdIuEfDehQLayc7mEYbga/cR16SqndgHhhAhCZVCFS1IiiQbIyMLH
   e+qeHasVfDXqzPvuglOgboLd4S7Z1xlsL/HG4Re1frmKn5PbF/5yoZcqx
   WjRY1K6m7bNlhLMhU62F6zF2U0pdt5G4W7pbcJaNufclKJ8lOHZ4LaCt7
   96JoXZLFy3i60eJMMObaTdGElc9mps1SQi6GULWxErVhG4h2HNM3sUoHd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449625049"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="449625049"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784877561"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="784877561"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:23:53 -0700
Received: from zlukwins-pc-neo.igk.intel.com (zlukwins-pc-neo.igk.intel.com [10.237.129.138])
	by linux.intel.com (Postfix) with ESMTP id 3F9C2580201;
	Sun, 15 Oct 2023 15:23:52 -0700 (PDT)
From: Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: alexandre.belloni@bootlin.com,
	Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
Subject: [PATCH v1 1/1] i3c: master: handle IBIs in order they came
Date: Mon, 16 Oct 2023 00:23:34 +0200
Message-Id: <20231015222334.1652401-2-zbigniew.lukwinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231015222334.1652401-1-zbigniew.lukwinski@linux.intel.com>
References: <20231015222334.1652401-1-zbigniew.lukwinski@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_152356_227394_8545F7F3 
X-CRM114-Status: GOOD (  16.53  )
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

IBI shall be handled in order they appear on the bus. Otherwise could hit
case when order of handling them in device driver will be different. It may
lead to invalid assembling fragmented packets or events order broken.

Added separate workqueue with option WQ_MEM_RECLAIM for each device driver.
This ensures IBI handling order and improves IBI handling performance: IBI
handlers for device B are not blocked by IBI handlers for device A.

Original solution (single workqueue in main driver) was able to handle also
general IBI (not related to specific device) like HJ or MR. So leaving this
for such purposes.

Signed-off-by: Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
---
 drivers/i3c/master.c       | 14 +++++++++++++-
 include/linux/i3c/master.h |  4 +++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 87283e4a4607..7d3785d11336 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2372,7 +2372,7 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
 void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
 {
 	atomic_inc(&dev->ibi->pending_ibis);
-	queue_work(dev->common.master->wq, &slot->work);
+	queue_work(dev->ibi->wq, &slot->work);
 }
 EXPORT_SYMBOL_GPL(i3c_master_queue_ibi);
 
@@ -2813,6 +2813,12 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 	if (!ibi)
 		return -ENOMEM;
 
+	ibi->wq = alloc_ordered_workqueue(dev_name(i3cdev_to_dev(dev->dev)), WQ_MEM_RECLAIM);
+	if (!ibi->wq) {
+		kfree(ibi);
+		return -ENOMEM;
+	}
+
 	atomic_set(&ibi->pending_ibis, 0);
 	init_completion(&ibi->all_ibis_handled);
 	ibi->handler = req->handler;
@@ -2840,6 +2846,12 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 		WARN_ON(i3c_dev_disable_ibi_locked(dev));
 
 	master->ops->free_ibi(dev);
+
+	if (dev->ibi->wq) {
+		destroy_workqueue(dev->ibi->wq);
+		dev->ibi->wq = NULL;
+	}
+
 	kfree(dev->ibi);
 	dev->ibi = NULL;
 }
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 0b52da4f2346..0a2a33a0f3af 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -129,6 +129,7 @@ struct i3c_ibi_slot {
  *		     rejected by the master
  * @num_slots: number of IBI slots reserved for this device
  * @enabled: reflect the IBI status
+ * @wq: workqueue used to execute IBI handlers.
  * @handler: IBI handler specified at i3c_device_request_ibi() call time. This
  *	     handler will be called from the controller workqueue, and as such
  *	     is allowed to sleep (though it is recommended to process the IBI
@@ -151,6 +152,7 @@ struct i3c_device_ibi_info {
 	unsigned int max_payload_len;
 	unsigned int num_slots;
 	unsigned int enabled;
+	struct workqueue_struct *wq;
 	void (*handler)(struct i3c_device *dev,
 			const struct i3c_ibi_payload *payload);
 };
@@ -469,7 +471,7 @@ struct i3c_master_controller_ops {
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
- * @wq: workqueue used to execute IBI handlers. Can also be used by master
+ * @wq: workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
