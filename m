Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2955F01804
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZVt52F86qL8NWIeMg3b4Y11PrTi+PxTcELituqhdI8=; b=NBHAAA0xhLIBn4
	ZpBg3ojUCTqGotUjXatRNeMgkkxS+5J4+NddhGpSoGWtlHzgjPV0PSPR9rALGt/C7stzm4eLQEOm9
	+Nro3jb//diR90XVHLKncEW/LROkfrcDQQusqXJQABtU61bCpgXbtZJuFObBcRhvqdaWfzgWlb65P
	2yQphdEvuzy11PexUMDTFoNmgNuQDrw3jf3UEiStwDQHgYF9MQGfsoAtAIImddxhC1RNvP9sbedGz
	z0EuTxZ4ugSy6lpYp5wXmaOR6YBImZ7ououJz6K50I5ORMxLqEvylAKJye5diF8CsXMIuJqS6d8Ue
	ImYCBE8Y9k4R1e6+A5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYv-000000039J6-1wRM;
	Fri, 06 Mar 2026 07:25:29 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYt-000000039Hw-15nm
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781927; x=1804317927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IYBwsxqVhgjfJh1KhNcV9JJocFNo9kIUVss/KsT+674=;
  b=e0sLvkra3FtkNGnEeKL7DeUhx0bRDD2IupC2g/F/O/poZeslildT7DVH
   /Qif2b4O+1J06VSFOC3/MLt1RSFNNdduwaRztC7DVRVLTkx/gZ9CVTikm
   aM71EM66IH6doUow8K8s/y8xR7ip+pAGKC9ICHpCMNWOTOHxHwT0N3XmG
   sRbisOURPRKIemsiRorIURRv3xYNtdv9RJYfgwvhHL4X44TRUDOSAu7XC
   E2B+3CgicQEzA9SCmDEDCVFL6kPidIdnIlZFwpUQcxjJWpIEwOqYeKVcN
   SwXM55GXyE7UuRC1WG8UJKErDAFAJSd0BKPMO3dozjrnyrTOIKuN81f87
   w==;
X-CSE-ConnectionGUID: 9+94O3bOTQqU/ykuZFv5uQ==
X-CSE-MsgGUID: Ua6ik0XnSH+r93RlSlElRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461364"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461364"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:27 -0800
X-CSE-ConnectionGUID: wcxQfdIsSRK12Dy0eIB2vA==
X-CSE-MsgGUID: z0amogPESkafayha3i9tlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419979"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:25 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 14/14] i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails
Date: Fri,  6 Mar 2026 09:24:51 +0200
Message-ID: <20260306072451.11131-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232527_324454_AC8B912E 
X-CRM114-Status: GOOD (  16.62  )
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

Disruption of the MIPI I3C HCI controller's internal state can cause
i3c_hci_bus_disable() to fail when attempting to shut down the bus.

In the code paths where bus disable is invoked - bus clean-up and runtime
suspend - the controller does not need to remain operational afterward, so
a full controller reset is a safe recovery mechanism.

Add a fallback to issue a software reset when disabling the bus fails.
This ensures the bus is reliably halted even if the controller's state
machine is stuck or unresponsive.

The fallback is used both during bus clean-up and in the runtime suspend
path.  In the latter case, ensure interrupts are quiesced after reset.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/core.c | 65 ++++++++++++++------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d5e91af7d569..284f3ed7af8c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -181,6 +181,34 @@ static int i3c_hci_bus_disable(struct i3c_hci *hci)
 	return ret;
 }
 
+static int i3c_hci_software_reset(struct i3c_hci *hci)
+{
+	u32 regval;
+	int ret;
+
+	/*
+	 * SOFT_RST must be clear before we write to it.
+	 * Then we must wait until it clears again.
+	 */
+	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(&hci->master.dev, "%s: Software reset stuck\n", __func__);
+		return ret;
+	}
+
+	reg_write(RESET_CONTROL, SOFT_RST);
+
+	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(&hci->master.dev, "%s: Software reset failed\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
 {
 	struct platform_device *pdev = to_platform_device(hci->master.dev.parent);
@@ -196,7 +224,8 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	i3c_hci_bus_disable(hci);
+	if (i3c_hci_bus_disable(hci))
+		i3c_hci_software_reset(hci);
 	hci->io->cleanup(hci);
 }
 
@@ -626,34 +655,6 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	return result;
 }
 
-static int i3c_hci_software_reset(struct i3c_hci *hci)
-{
-	u32 regval;
-	int ret;
-
-	/*
-	 * SOFT_RST must be clear before we write to it.
-	 * Then we must wait until it clears again.
-	 */
-	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
-				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
-	if (ret) {
-		dev_err(&hci->master.dev, "%s: Software reset stuck\n", __func__);
-		return ret;
-	}
-
-	reg_write(RESET_CONTROL, SOFT_RST);
-
-	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
-				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
-	if (ret) {
-		dev_err(&hci->master.dev, "%s: Software reset failed\n", __func__);
-		return ret;
-	}
-
-	return 0;
-}
-
 static inline bool is_version_1_1_or_newer(struct i3c_hci *hci)
 {
 	return hci->version_major > 1 || (hci->version_major == 1 && hci->version_minor > 0);
@@ -764,8 +765,12 @@ static int i3c_hci_runtime_suspend(struct device *dev)
 	int ret;
 
 	ret = i3c_hci_bus_disable(hci);
-	if (ret)
+	if (ret) {
+		/* Fall back to software reset to disable the bus */
+		ret = i3c_hci_software_reset(hci);
+		i3c_hci_sync_irq_inactive(hci);
 		return ret;
+	}
 
 	hci->io->suspend(hci);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
