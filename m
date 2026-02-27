Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF1EFEFB58
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJmymL5H3TBw+1lpIQBOwKiph3l44jAVThj+rWXJ2tY=; b=qSFabrXRLOzbCH
	7e6DHJ2owNzdR13iSqEx0aSce/uwXwxALUnfkq0mXbjAaF6hfcTora5GBiU4RI6dbr4dpy3V28xHd
	oRe7WrlwkxfeqBL99+TzYP2/TKobGIlaaaG9x7GX5jZs/guxRP28BLC5wAKlVrz0GZsAnjNaJc3fK
	OhIwAukmTD2zbbHfNaWl7C/U3lSAAGHsoX+slZBdz8BOG1Pt1kJSjq7DeNcwnwKAESunVJYkT3ygc
	vAF/elzZ5yqII3bI6aanox6UXmmwjOgo3Qps8vS/NBLOAqBx8S5wLsZZP2cIJqZx6as0kNozqVO9M
	LP/icpTdFdUU8yJ0GMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZp-00000008TbZ-1KVq;
	Fri, 27 Feb 2026 14:12:21 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZm-00000008TRS-3oCG
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201539; x=1803737539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3DXs5YS3oPMIBeZcuJ1Fdfd6lmAUS/3i9nHAEOwto9Y=;
  b=aeY/NAXmRmu4HWysQkEup0CQ0wGZYMYkU6aqHw8JYOlXulUkxSndhDiv
   +lbdyoMF153lk8cd4684sr+IpIoWELjigik18eHB1cir1dwssbfOBvFQ7
   R4VCd9kbrBop5yPxlmPBeBH64vGXHd+h53N4ki06LqolIG/MC+rMDraCk
   HuRFgKwmYvMVpk1mcn9Ib+Jlv6Zq9aaIT7YcV5k9iMW1eDOe6ORALXF79
   aeNxXJthMTlN7g7t5Nc6Kf52eTLhjjp1FaY3LBQl7XAKVWEOfcjGNC33P
   0D7Stqo1pjpBObJqqNhVj8YijLvcIMKnX2qHdez6N+w2WnbQLOqxlgxf3
   A==;
X-CSE-ConnectionGUID: mREs3TDQQBOc6IxxyUb8bA==
X-CSE-MsgGUID: +8JGIwCGTZW/kL7SRKrK6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750061"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750061"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:19 -0800
X-CSE-ConnectionGUID: e2fpUQNZQdiPp2eYEJHfDQ==
X-CSE-MsgGUID: N5M8WnCLTJuZ+b+tJBZSrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015785"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:17 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 11/12] i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
Date: Fri, 27 Feb 2026 16:11:48 +0200
Message-ID: <20260227141149.184980-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061218_966455_856F9C00 
X-CRM114-Status: GOOD (  14.81  )
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

To enforce correct ordering around transitions of irq_inactive, add
explicit memory barriers: place smp_wmb() before updates that clear or set
the flag, and add a corresponding smp_rmb() after testing it in the IRQ
handler.  While kernel I/O accessors already provide ordering guarantees in
practice, adding explicit barriers makes the intent unambiguous and correct
on all architectures.

Fixes: b8460480f62e1 ("i3c: mipi-i3c-hci: Allow for Multi-Bus Instances")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 741f543aae68..2909e3d35d8b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -152,6 +152,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
 		amd_set_resp_buf_thld(hci);
 
+	/* Ensure changes are visible to interrupt handler */
+	smp_wmb();
+	hci->irq_inactive = false;
+
 	/* Enable bus with Hot-Join disabled */
 	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
 	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
@@ -184,6 +188,8 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
 	int irq = platform_get_irq(pdev, 0);
 
 	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	/* Ensure changes are visible to interrupt handler */
+	smp_wmb();
 	hci->irq_inactive = true;
 	synchronize_irq(irq);
 }
@@ -592,6 +598,8 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	 */
 	if (hci->irq_inactive)
 		return IRQ_NONE;
+	/* Ensure irq_inactive is read first */
+	smp_rmb();
 
 	val = reg_read(INTR_STATUS);
 	reg_write(INTR_STATUS, val);
@@ -779,10 +787,12 @@ static int i3c_hci_runtime_resume(struct device *dev)
 
 	mipi_i3c_hci_dat_v1.restore(hci);
 
-	hci->irq_inactive = false;
-
 	hci->io->resume(hci);
 
+	/* Ensure changes are visible to interrupt handler */
+	smp_wmb();
+	hci->irq_inactive = false;
+
 	/* Enable bus with Hot-Join disabled */
 	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
 
@@ -970,6 +980,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
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
