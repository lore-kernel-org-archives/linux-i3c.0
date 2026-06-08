Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63B9CD8C8E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NM6dvTw/23FWCjYPPCIXY6yxz4Ur6q0FN52kDgjIgtw=; b=ninUAny65byWne
	FQsOtF1Xs2hFesj/rYAaa/+eQVppNviLL6StvNXDEupzuI5aq7b1PCV9pOH3Dg+B2y3A0Y2Ibqaa6
	bq3RJsEDez/7Xlw3PxmvAxZx8J/ot636f3qVNREvwJWuqculM6UGyjO8sz21lD9kacf/yC1K3de+D
	nBXUn/deXaJqaFEUe/vhuB6XLuLpn3LqsIfDfloMY9ciWqsYooLjBVc+ZTpYOEThXEbBrSomafwaZ
	jBE3imT0SZv3CprAti/tJFlTPl3tjm10OBmzDaMMPvgzDIHfrWJI8Tzh4cR817NjK2kXUP2CkwBDi
	ROtrJNgZPcPv/X0RxNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlo-00000002qsf-2VYi;
	Mon, 08 Jun 2026 05:43:32 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlm-00000002qr4-1Hnh
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897410; x=1812433410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3a07xmMCrezd/42W9xRk8R3gFdpN/8jl6uCSmXimiqY=;
  b=a5prN25yhmVaBOf7U5HTjhV+D0WwVYhqtqLt98HW+dqQw6uPngoVi/mB
   1H5UQXtcz0oGdV3gLbyry+s9wvS9tkxmfgv4ZG2RcMy41JTCgIFWVOc/Z
   QrPqzia1ivTBuVt3+oc+0aICjFSLqJs5CQjWHuEn+PDvHTAJXNT+8jlJL
   qtK8ci/ScHIXCZUu+S+yoXD1e5hX4w/aAA3SYEi4ck12SMXo+cIIdmndM
   jhErfS087KVqcDiLisnuFAQmcYnlf6+ixriwYEW56taCocBJPF7pP2yyS
   /GE5lF7qm4B8UuXJ5bsQm0jKJYiPTFLmqjbWqHObAMGyY2sobGkJRhBON
   g==;
X-CSE-ConnectionGUID: ET54s+1ET+KzG3JEdhzuHQ==
X-CSE-MsgGUID: jtWujbdURIGaFhwCVJxG3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284035"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284035"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:30 -0700
X-CSE-ConnectionGUID: BfWE/rXuTrq16HSXA1nIJA==
X-CSE-MsgGUID: +LDSSo7gRN6At6MK6gBbuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505667"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:28 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 3/8] i3c: master: Consolidate Hot-Join DAA work in the core
Date: Mon,  8 Jun 2026 08:43:07 +0300
Message-ID: <20260608054312.10604-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224330_422039_18FE1B03 
X-CRM114-Status: GOOD (  20.64  )
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

Three master drivers (dw-i3c-master, i3c-master-cdns, svc-i3c-master)
each carry an essentially identical Hot-Join handler: a struct
work_struct embedded in their private state, a work function that just
calls i3c_master_do_daa() on the embedded i3c_master_controller, plus
matching INIT_WORK()/cancel_work_sync() boilerplate in probe/remove (and
shutdown for dw-i3c). The IBI/ISR paths then queue that work onto
master->wq, which already lives in the core.

Move this pattern into the I3C core:

 - Add struct work_struct hj_work to struct i3c_master_controller and
   initialise it in i3c_master_register() with a core-provided handler
   i3c_master_hj_work_fn() that performs i3c_master_do_daa().
 - Cancel the work in i3c_master_unregister() so all controllers get
   correct teardown ordering against the workqueue for free.
 - Export i3c_master_queue_hotjoin() as the single entry point drivers
   call from their Hot-Join IBI handler.

Convert the three existing users to the new API: drop their private
hj_work fields, work functions, INIT_WORK() and cancel_work_sync()
calls, and replace the queue_work(master->wq, &drv->hj_work) call sites
with i3c_master_queue_hotjoin(&drv->base). The dw-i3c shutdown path
still needs to flush pending Hot-Join work before tearing down the
hardware, so it is updated to cancel master->base.hj_work directly.

No functional change intended: the work is still queued on the same
master->wq, runs the same i3c_master_do_daa(), and is cancelled at
controller teardown.  Future Hot-Join improvements now only need to
be made in one place.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd by


 drivers/i3c/master.c                 | 21 +++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c   | 15 ++-------------
 drivers/i3c/master/dw-i3c-master.h   |  2 --
 drivers/i3c/master/i3c-master-cdns.c | 14 +-------------
 drivers/i3c/master/svc-i3c-master.c  | 14 +-------------
 include/linux/i3c/master.h           |  4 ++++
 6 files changed, 29 insertions(+), 41 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 38ffc8713167..cdb5cb2aa65d 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -633,6 +633,13 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(i2c_scl_frequency);
 
+static void i3c_master_hj_work_fn(struct work_struct *work)
+{
+	struct i3c_master_controller *master = container_of(work, typeof(*master), hj_work);
+
+	i3c_master_do_daa(master);
+}
+
 static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
 {
 	int ret;
@@ -711,6 +718,18 @@ int i3c_master_disable_hotjoin(struct i3c_master_controller *master)
 }
 EXPORT_SYMBOL_GPL(i3c_master_disable_hotjoin);
 
+/**
+ * i3c_master_queue_hotjoin - Queue DAA processing after a Hot-Join event
+ * @master: I3C master object
+ *
+ * Queue the hot-join worker on the master's workqueue.
+ */
+void i3c_master_queue_hotjoin(struct i3c_master_controller *master)
+{
+	queue_work(master->wq, &master->hj_work);
+}
+EXPORT_SYMBOL_GPL(i3c_master_queue_hotjoin);
+
 static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
@@ -3084,6 +3103,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 		ret = -ENOMEM;
 		goto err_put_dev;
 	}
+	INIT_WORK(&master->hj_work, i3c_master_hj_work_fn);
 
 	ret = i3c_master_bus_init(master);
 	if (ret)
@@ -3146,6 +3166,7 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
 void i3c_master_unregister(struct i3c_master_controller *master)
 {
 	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
+	cancel_work_sync(&master->hj_work);
 
 	if (master->ops->set_dev_nack_retry)
 		device_remove_file(&master->dev, &dev_attr_dev_nack_retry_count);
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..eb9a13a73684 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1445,7 +1445,7 @@ static void dw_i3c_master_irq_handle_ibis(struct dw_i3c_master *master)
 		if (IBI_TYPE_SIRQ(reg)) {
 			dw_i3c_master_handle_ibi_sir(master, reg);
 		} else if (IBI_TYPE_HJ(reg)) {
-			queue_work(master->base.wq, &master->hj_work);
+			i3c_master_queue_hotjoin(&master->base);
 		} else {
 			len = IBI_QUEUE_STATUS_DATA_LEN(reg);
 			dev_info(&master->base.dev,
@@ -1554,14 +1554,6 @@ static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
 	.set_dat_ibi = dw_i3c_platform_set_dat_ibi_nop,
 };
 
-static void dw_i3c_hj_work(struct work_struct *work)
-{
-	struct dw_i3c_master *master =
-		container_of(work, typeof(*master), hj_work);
-
-	i3c_master_do_daa(&master->base);
-}
-
 int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
@@ -1636,8 +1628,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
 		pm_runtime_get_noresume(&pdev->dev);
 
-	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
-
 	device_set_of_node_from_dev(&master->base.i2c.dev, &pdev->dev);
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
@@ -1659,7 +1649,6 @@ EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
 
 void dw_i3c_common_remove(struct dw_i3c_master *master)
 {
-	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
 
 	/* Balance pm_runtime_get_noresume() from probe() */
@@ -1804,7 +1793,7 @@ static void dw_i3c_shutdown(struct platform_device *pdev)
 		return;
 	}
 
-	cancel_work_sync(&master->hj_work);
+	cancel_work_sync(&master->base.hj_work);
 
 	/* Disable interrupts */
 	writel((u32)~INTR_ALL, master->regs + INTR_STATUS_EN);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..2f029bd36232 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -68,8 +68,6 @@ struct dw_i3c_master {
 
 	/* platform-specific data */
 	const struct dw_i3c_platform_ops *platform_ops;
-
-	struct work_struct hj_work;
 };
 
 struct dw_i3c_platform_ops {
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 5cfec6761494..6d221596ea35 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -398,7 +398,6 @@ struct cdns_i3c_data {
 };
 
 struct cdns_i3c_master {
-	struct work_struct hj_work;
 	struct i3c_master_controller base;
 	u32 free_rr_slots;
 	unsigned int maxdevs;
@@ -1357,7 +1356,7 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
 
 		case IBIR_TYPE_HJ:
 			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
-			queue_work(master->base.wq, &master->hj_work);
+			i3c_master_queue_hotjoin(&master->base);
 			break;
 
 		case IBIR_TYPE_MR:
@@ -1528,15 +1527,6 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.recycle_ibi_slot = cdns_i3c_master_recycle_ibi_slot,
 };
 
-static void cdns_i3c_master_hj(struct work_struct *work)
-{
-	struct cdns_i3c_master *master = container_of(work,
-						      struct cdns_i3c_master,
-						      hj_work);
-
-	i3c_master_do_daa(&master->base);
-}
-
 static struct cdns_i3c_data cdns_i3c_devdata = {
 	.thd_delay_ns = 10,
 };
@@ -1584,7 +1574,6 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
-	INIT_WORK(&master->hj_work, cdns_i3c_master_hj);
 	writel(0xffffffff, master->regs + MST_IDR);
 	writel(0xffffffff, master->regs + SLV_IDR);
 	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
@@ -1627,7 +1616,6 @@ static void cdns_i3c_master_remove(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master = platform_get_drvdata(pdev);
 
-	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
 }
 
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e2d99a3ac07d..62e5666798c8 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -208,7 +208,6 @@ struct svc_i3c_drvdata {
  * @free_slots: Bit array of available slots
  * @addrs: Array containing the dynamic addresses of each attached device
  * @descs: Array of descriptors, one per attached device
- * @hj_work: Hot-join work
  * @irq: Main interrupt
  * @num_clks: I3C clock number
  * @fclk: Fast clock (bus)
@@ -235,7 +234,6 @@ struct svc_i3c_master {
 	u32 free_slots;
 	u8 addrs[SVC_I3C_MAX_DEVS];
 	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
-	struct work_struct hj_work;
 	int irq;
 	int num_clks;
 	struct clk *fclk;
@@ -366,14 +364,6 @@ to_svc_i3c_master(struct i3c_master_controller *master)
 	return container_of(master, struct svc_i3c_master, base);
 }
 
-static void svc_i3c_master_hj_work(struct work_struct *work)
-{
-	struct svc_i3c_master *master;
-
-	master = container_of(work, struct svc_i3c_master, hj_work);
-	i3c_master_do_daa(&master->base);
-}
-
 static struct i3c_dev_desc *
 svc_i3c_master_dev_from_addr(struct svc_i3c_master *master,
 			     unsigned int ibiaddr)
@@ -651,7 +641,7 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
 		svc_i3c_master_emit_stop(master);
 		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
-			queue_work(master->base.wq, &master->hj_work);
+			i3c_master_queue_hotjoin(&master->base);
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
 		svc_i3c_master_emit_stop(master);
@@ -2022,7 +2012,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
 
-	INIT_WORK(&master->hj_work, svc_i3c_master_hj_work);
 	mutex_init(&master->lock);
 
 	ret = devm_request_irq(dev, master->irq, svc_i3c_master_irq_handler,
@@ -2081,7 +2070,6 @@ static void svc_i3c_master_remove(struct platform_device *pdev)
 {
 	struct svc_i3c_master *master = platform_get_drvdata(pdev);
 
-	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index e6112e5f6608..eb5c51608bd7 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -520,6 +520,8 @@ struct i3c_master_controller_ops {
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
  *	be done from a sleep-able context
+ * @hj_work: work item used to run DAA after a Hot-Join event is detected.
+ *           Queued to @wq by i3c_master_queue_hotjoin()
  * @dev_nack_retry_count: retry count when slave device nack
  *
  * A &struct i3c_master_controller has to be registered to the I3C subsystem
@@ -543,6 +545,7 @@ struct i3c_master_controller {
 	} boardinfo;
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
+	struct work_struct hj_work;
 	unsigned int dev_nack_retry_count;
 };
 
@@ -623,6 +626,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 void i3c_master_unregister(struct i3c_master_controller *master);
 int i3c_master_enable_hotjoin(struct i3c_master_controller *master);
 int i3c_master_disable_hotjoin(struct i3c_master_controller *master);
+void i3c_master_queue_hotjoin(struct i3c_master_controller *master);
 
 /**
  * i3c_dev_get_master_data() - get master private data attached to an I3C
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
