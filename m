Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D5CF01801
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjwBouhFZmzVC9+oNzTbXXpvVRhKOtUuPAcbENlhpDU=; b=GCxAM5WIrQnlj6
	XElUQTyMpVVKqF8fGiZ2OeZgO+UBWOY6LuxHkqtwlKBceupMRtAQ9yHJUD1PcKgbzjb6MBI1izAN+
	s6OcPnbpZBSwULDJxnXZp1ftnbBDCLYDqTOeXX8o8RC0L8tezAEwzJifsZDJGmW0F8mogZAi4PfL/
	/wK6Fl1CRFhAO6GEcJjRjbsYtqtTqXxqpN/uOBzZT/iCihoJWibTjzITSMJHQ0EwSfuDp0u/EhIUa
	xGSkY4aICmwKwOcNnLNHSw9YN5OO0UbDeFBTqnw0oo70OCbtvzhWviXilkRAX0cEBNdbmzZvSEsuP
	biBPSbGLvNTwQg4qvwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYv-000000039Iu-0vEP;
	Fri, 06 Mar 2026 07:25:29 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYs-000000039Ei-15Gn
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781926; x=1804317926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0g6t0NQsNnnIlJ4sKLMuG98PIsinBWotFNRlMfZAHL0=;
  b=dXTKnuXJuXXFSEKvn4D4Yk5+Wka8wIJ9PVLvA+Fong1Acd8yo+Og7RKb
   L153muUdoQ26oWHJCwUTwyqC9P6TGDqfwJnzYy8daU7gE/K0Cy+dzpr6B
   z+oJUFycYV8A6WBJl8v4aQvyqaXyDv/a1wLLzije4daFTSXD3JKURsT96
   YsEyo5aMemTNSucW1GKsxIvM8ubzx3j0QQjgW9fHitdoaIWSS1CQRvPf9
   wWku3/1ZVRaQR8RBeST2eWBzLxht4K9Q5LqccLU5sW2xLl5svWZgBFGrw
   idcnpFSL78DsNzTGIFps5hpaGzZdY2L8YlQ4paQT7++Musd7XRdz99So+
   w==;
X-CSE-ConnectionGUID: kshJFqeHR3Ox6z7cfoqYbw==
X-CSE-MsgGUID: 3VMXBYa0QB+d3qL8B/JoFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461361"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:26 -0800
X-CSE-ConnectionGUID: L8GNp1ESSRyjzrP6T04I9Q==
X-CSE-MsgGUID: sy7r4ajXT36BXot79IG8UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419974"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:23 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 13/14] i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
Date: Fri,  6 Mar 2026 09:24:50 +0200
Message-ID: <20260306072451.11131-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232526_327454_CE28C7F5 
X-CRM114-Status: GOOD (  12.28  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

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
