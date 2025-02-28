Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5117BC19776
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2025 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mYiUkktF67/NXiZJbPTGxCoIR1fTr2kxZlH7DccDcE8=; b=exjCtazDnRY6+C
	VZgNNJ6uK13/AHXOZDycO/Bdb/SdfN/JC7CzUREIF2zm8Rnz/P6luYDeXySiDNxd/V5zceY+ZwEGR
	eG4gApytb833Xo0O5QN0BKyuVJs6/Mrej6Mud03Us78riiI54j6NNWBRHKmGW3uurLbHAlcdk4jLf
	ctf7ZApgJYE6v38B3VRcHOy9VXqXAyb55iXEyC/mmIm55JCeYfQkinq6mwyE9g71XnGbpoiW9MGmu
	T+FH7Be44oR0hAh6yrur3XAmohWvKJFHi7RKEY2IgH2FCmpyzp0b2Gl3SzVQ2VBbFBhfJ5kYEG1ki
	PyZwQLOH0ZpB6kyaoSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Xx-0000000BIoB-3xC5;
	Fri, 28 Feb 2025 14:41:01 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Bp-0000000BEAO-1dwp
	for linux-i3c@lists.infradead.org;
	Fri, 28 Feb 2025 14:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740752290; x=1772288290;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L2m5gE1zLy0DFRWT74hM+54trWsiX/7YNWZDMGezj7c=;
  b=abIERXIpuvj5wZlMnqktQG6uwn7pb+j1EeImZ+6InhtEyA+izZyRY/Or
   Xz6hbFSQE/8vnnC9U/RGN01KGCbnME1kPnnvJvlD+Uq55qOFUpzWFasRD
   RkyY2IDWJKwukzn2ziquOgL0hZTOJZs3punnP1zUqHrWPiM3Mk6qvV8Zo
   dyYh9xB0O/8Z/SPesaURp0ri0r5SrV6r5D5QcWa7HHOkY7bSqXyMYiU7s
   KG2OP4Y1AigY5/GNWiG7gBrqQwgB/UjkjhjTb5ej13X6CszBsn4v2FYH/
   Xtrq9eYWwWFsfUdIMbRgU1a3lPlRpQednJR4E6zTC4gmP4YPIm4mcvygg
   A==;
X-CSE-ConnectionGUID: fyKA9IugR4atmL8Cde4aJg==
X-CSE-MsgGUID: Gx+7T9xnR6GQQw3HRwhxdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45600731"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="45600731"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 06:18:07 -0800
X-CSE-ConnectionGUID: 8pSPAo6RQFeRbkr/4q2TWg==
X-CSE-MsgGUID: tsk6/t5QRWi4vErFHLz9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154517438"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.59])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2025 06:18:05 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/4] i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS bit updates
Date: Fri, 28 Feb 2025 16:17:59 +0200
Message-ID: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_061809_438890_E2E81CAE 
X-CRM114-Status: GOOD (  10.98  )
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

Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
current driver code and not needed in DMA transfers.

PIO transfers with v0.5 would require changes to both
core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.

For these reasons don't enable signal updates from INTR_STATUS bits 9:0.

This change is a no-op for specification versions v0.8 and beyond but
gets rid of "unexpected INTR_STATUS" errors if somebody (read me) wants
to run code on old v0.5 IP version.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a71226d7ca59..e139d7e4d252 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -699,9 +699,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (ret)
 		return -ENXIO;
 
-	/* Disable all interrupts and allow all signal updates */
+	/* Disable all interrupts */
 	reg_write(INTR_SIGNAL_ENABLE, 0x0);
-	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+	/* Allow signal updates relevant to IP versions 0.8 and beyond */
+	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
 
 	/* Make sure our data ordering fits the host's */
 	regval = reg_read(HC_CONTROL);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
