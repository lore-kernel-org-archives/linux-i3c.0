Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61DAC982D2
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkeFMFtQ1Bfl1Sjrcc9bZaxjb000kJ4OrJqnRaqFRBk=; b=Km3rB3bRMWCKXq
	HU4ejXcV1X19sQdqRiKDJloqMqE3jO2oQfi6/HlRxM1A0b8ruI+JHkKp7XSpl2Lun5szIKmVQNriJ
	6x0ynm7peaNCDrt23LG/04pmENsdVtCk5tGOwr/Lzr7I1iVXzV9tRNf9pWFeIddA9r87kH3nX7ZS9
	TiQK3ZV6zZflrSslJ/YlooJ6lG/3iiyVq367VcF8ANeYj2p3KNJDcuvf3gz0YVii+j4GykBJDiZVT
	hrzuclvEU98+QLk2he9Cp8GkxOHKI2U1RCOfM2ZmizNcFifBC+LX4GntXEmiM9yc5jM22Ytjt11gM
	b0xEiHNJ9PzgvARO9KGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HZ1-0000000CJSw-2VT2;
	Thu, 17 Sep 2026 19:14:31 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYy-0000000CJFz-1a6J
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672468; x=1821208468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xBXfhYs+FCGJrpS7RXz4stRbaZY3ELw42FjGgHuabIc=;
  b=n2e8u6FwtSMeDUhylPY6S54m3lFa/cgoQR4EDYf5iDAPZi51tjdmfTHZ
   Rfc1UgnmfGMeW+M02Ut0eOG01bo7RhDfMWKn6LgSANNJtyigSj1UMlCLK
   e+K54oaJXY4z837iJYgbuN09szJVz9DuwTiT03FSJ0QNcOAuwSA4VOmlQ
   C9PkKkrMOlGZlBRQnANeobmRzT/UyRmLe4yHI9XSSROEOfYZRPuXDNS7m
   N9tddVXdlfNfzSSgkhcCWpwth66jtEgg74WR6PAOkbzwcwCYUiMvFJI/7
   4zTA0RwLqDUQF7TcZxOGKATcCuXE3y83mWzqdKJmdXmQSB1TmDbFX43gF
   w==;
X-CSE-ConnectionGUID: Sw+qw4zoRy+sUol9x8jNvg==
X-CSE-MsgGUID: Unl8GLgNRIKLcq/5qsBhdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639951"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639951"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:28 -0700
X-CSE-ConnectionGUID: ilY3x95ERD2C9p36sQOVEw==
X-CSE-MsgGUID: S7yHHxKFQCKynJUUXLlj+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271993"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:26 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 11/17] i3c: mipi-i3c-hci: Stop rings gracefully when suspending
Date: Thu, 17 Sep 2026 22:13:50 +0300
Message-ID: <20260917191356.133242-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121428_432565_DE02E940 
X-CRM114-Status: GOOD (  17.80  )
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

hci_dma_suspend() tore the rings down with a single write of zero to
RH_RING_CONTROL, clearing the RS and ENABLE fields together and without
waiting for the ring to stop.  I3C HCI v1.1 section 6.1.2 separates those
steps: clear RS for all running Ring Bundles, and only then clear ENABLE
for all enabled Ring Bundles.

The ring registers were also written outside hci->lock, while the
interrupt handler, which takes that lock, could still be running on
another CPU.  i3c_hci_sync_irq_inactive() was called only afterwards.

Finally, an IBI can still be sitting in the IBI Status Ring when suspend
runs.  Clearing HC_CONTROL.BUS_ENABLE is deferred: per the description of
that field, if a disable request occurs while receiving an IBI, the
actual disabling does not occur until reception of the IBI is complete.

Instead, clear RS under hci->lock, wait for RING_STATUS_RUNNING to clear,
and make the interrupt handler inactive.  Only then disable the ring
interrupt signals, drain anything left in the IBI ring, and clear ENABLE.

Fixes: 816958720443 ("i3c: mipi-i3c-hci: Add DMA suspend and resume support")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Added comments explaining the choice of the RING_STOP_TIMEOUT_US
	and RING_STOP_SLEEP_US values.


 drivers/i3c/master/mipi-i3c-hci/dma.c | 57 +++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index ec4b469abd33..b8fcea0870ab 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include "hci.h"
 #include "cmd.h"
@@ -1052,19 +1053,67 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 	return handled;
 }
 
+/*
+ * With the bus disabled, a ring should stop within a few microseconds. The
+ * timeout is therefore only expected to expire if the hardware is stuck.
+ * Allow sufficient margin for slow systems, but keep the delay acceptable
+ * during suspend.
+ */
+#define RING_STOP_TIMEOUT_US	(100 * USEC_PER_MSEC)
+/*
+ * The ring is usually already stopped, so polling typically completes on the
+ * first iteration. Use a modest sleep interval to avoid busy-waiting without
+ * adding excessive latency.
+ */
+#define RING_STOP_SLEEP_US	100
+
 static void hci_dma_suspend(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings = hci->io_data;
 	int n = rings ? rings->total : 0;
+	struct hci_rh_data *rh;
+	u32 regval;
 
-	for (int i = 0; i < n; i++) {
-		struct hci_rh_data *rh = &rings->headers[i];
+	/* Gracefully stop the rings */
+	scoped_guard(spinlock_irqsave, &hci->lock) {
+		for (int i = 0; i < n; i++) {
+			rh = &rings->headers[i];
+			regval = rh_reg_read(RING_CONTROL);
+			if (regval & RING_CTRL_RUN_STOP)
+				rh_reg_write(RING_CONTROL, regval & ~RING_CTRL_RUN_STOP);
+		}
+	}
 
-		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
-		rh_reg_write(RING_CONTROL, 0);
+	/* Wait for actual stop */
+	for (int i = 0; i < n; i++) {
+		rh = &rings->headers[i];
+		if (readx_poll_timeout(readl, rh->regs + RH_RING_STATUS, regval,
+				       !(regval & RING_STATUS_RUNNING),
+				       RING_STOP_SLEEP_US, RING_STOP_TIMEOUT_US))
+			dev_err(&hci->master.dev, "%s: Ring did not stop, status %#x\n",
+				__func__, regval);
 	}
 
+	/*
+	 * With the rings stopped, no more IBIs can be received. Flush and make
+	 * the interrupt handler inactive.
+	 */
 	i3c_hci_sync_irq_inactive(hci);
+
+	/* Disable interrupt signals and disable the rings */
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		for (int i = 0; i < n; i++) {
+			rh = &rings->headers[i];
+			rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+			/*
+			 * Be absolutely certain there is no unprocessed IBI.
+			 * hci_dma_drain_ibi_ring() will do nothing if there is
+			 * none.
+			 */
+			if (i < IBI_RINGS)
+				hci_dma_drain_ibi_ring(hci, rh);
+			rh_reg_write(RING_CONTROL, 0);
+		}
 }
 
 static void hci_dma_resume(struct i3c_hci *hci)
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
