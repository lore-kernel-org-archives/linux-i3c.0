Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95302EFCE37
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnqJXYbQHDfjBdLey+Ft8WeL2YVWBEp16GHSMyFcFkY=; b=LT0KliTCMkzFn0
	r7eGonto3KPNTIxebX/fxUUfDd7G6TGP40qNHT9b6St/yGyQE6Xt3IaXToibWUo4qpxEgUeNwwMlV
	eff5GvGqMRU25NdCSs22ucP91FFrN9MYxwEG+X2L4h0xpvvkXTdQiLRg4b/m2ekmuIzykKhOkuhQV
	KfAYKqVwBZgD8WACyXv6M6alk4hpALCcf0r7iUpSUJpEbf2CBmU7NsHE8rdffQqzztiMn/XmB1UYZ
	ybulQxQuUlDMrUTdAMD26tXZ3Fed+uSs3nRZmepp5AHmpy29jYJ56i1e38dCe3gNHLBziOZx2I8ln
	J5kWV9m7gCTccjR53F/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqn5-00000000KGc-0yCA;
	Wed, 04 Mar 2026 18:17:47 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqn1-00000000K1V-3YKT
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648264; x=1804184264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQo+J0xB4O6DAqZB/rj/COKTFzabTxH33Gc/OCzEcL0=;
  b=U14fEaA+NaWMMgmAsGy27r+Vm8/06vZxH482QkBVtyIurN5nHaPWsvCr
   MM7Vi/Rn53JwszBe/XMA6q0wtexgi2uISpnPuMkIqHzb9R//yJeWdfilb
   F0qCEWF6hOt/9oKXzQnA61NGRXlqlliIQx7qt4osVlgSMxJmENijv9s8L
   ZxfhCbL0nPVCT+yVtgrDVm3e0kLAITIdN//rMpmcfsEXxM+UasJYKfFGZ
   znSHc6m0N/wj2TQpYd6j0ZmL+0ixYZRSEfrbOfpa+WT0L79lD2WwNMRot
   fvXmm4e/CqpIrP0EROYCk861Zar/moJV+TXhEnxHtKXtOvH8tTLwRe4bN
   w==;
X-CSE-ConnectionGUID: 6X//HEFMSxmq1YwTFhvBbQ==
X-CSE-MsgGUID: RT31Y33kTKGsWkqrQc22TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745941"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:44 -0800
X-CSE-ConnectionGUID: HNl30N5vR465v7CFTFVfAw==
X-CSE-MsgGUID: +hAXrv+NRGafMHrlJeC6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656791"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:42 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 13/14] i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
Date: Wed,  4 Mar 2026 20:17:04 +0200
Message-ID: <20260304181706.143841-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101743_907836_17ED92E8 
X-CRM114-Status: GOOD (  13.05  )
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

Shared interrupts may fire unexpectedly, including during periods when the
controller is not yet fully initialized. Commit b9a15012a1452
("i3c: mipi-i3c-hci: Add optional Runtime PM support") addressed this issue
for the runtime-suspended state, but the same problem can also occur before
the bus is enabled for the first time.

Ensure the IRQ handler ignores interrupts until initialization is complete
by making consistent use of the existing irq_inactive flag.  The flag is
now set to false immediately before enabling the bus.

To guarantee correct ordering with respect to the IRQ handler, protect
all transitions of irq_inactive with the same spinlock used inside the
handler.

Fixes: b8460480f62e1 ("i3c: mipi-i3c-hci: Allow for Multi-Bus Instances")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Place irq_inactive under the protection of the now unified
	spinlock, eliminating the need for explict memory barriers.
	Correctly position the update of irq_inactive in
	i3c_hci_sync_irq_inactive() to after synchronize_irq()


 drivers/i3c/master/mipi-i3c-hci/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b98952d12d7c..d5e91af7d569 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -152,6 +152,9 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
 		amd_set_resp_buf_thld(hci);
 
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->irq_inactive = false;
+
 	/* Enable bus with Hot-Join disabled */
 	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
 	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
@@ -184,8 +187,9 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
 	int irq = platform_get_irq(pdev, 0);
 
 	reg_write(INTR_SIGNAL_ENABLE, 0x0);
-	hci->irq_inactive = true;
 	synchronize_irq(irq);
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->irq_inactive = true;
 }
 
 static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
@@ -781,10 +785,11 @@ static int i3c_hci_runtime_resume(struct device *dev)
 
 	mipi_i3c_hci_dat_v1.restore(hci);
 
-	hci->irq_inactive = false;
-
 	hci->io->resume(hci);
 
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->irq_inactive = false;
+
 	/* Enable bus with Hot-Join disabled */
 	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
 
@@ -975,6 +980,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	hci->irq_inactive = true;
+
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
 			       IRQF_SHARED, NULL, hci);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
