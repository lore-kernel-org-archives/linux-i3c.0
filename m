Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F4FF01804
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+owV4QtXSsZ4VE8iyo1zxiC2xwwrm8KJAOYMdi62sic=; b=aAwnx+cXjUbb8e
	I2s4FQ5oUO1+YMxnfK254m9v1BXvYIDUs0/7RXoCbEv3i4ipz1FbBPcJiy7zzZ6QcpyQub8selmc2
	3E303JiYsRKOWUdlK3prDAujBnNXBjEMtYHxpPSVYt+wj0xAVgUEH8bIUjlFl7lbYv6dH7cK5D+n5
	KmrsKxumQ9dcFXiXbjvI+ujlv31vgzFrC8Y11jQ6qathf4scbiWWcG45qImt9HjxpNN0S2vPqG9Bn
	pp4rZfPUiQM1l5WG8Aem+oAPJWIoE8YRZg+z0sGNhwkDGXISDDsSKlmv5LXX+6QvvloU0+/zFH+7+
	72ZnRL273Wl9HoyY1x2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYa-0000000394M-0Q6X;
	Fri, 06 Mar 2026 07:25:08 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYX-0000000393X-3M8s
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781906; x=1804317906;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t5Lc1/45y6Jd0NzF6d8IJD+g0W0z+YU/6ViIzbjIraY=;
  b=MtUj0BEqwplNJEnBon6+fVGF7p5exD2kc77Ynqy67PFxXOPPIVtQK9pC
   oOPGjfYnxYMo0+THG8lXhCXhrVqVJX+sCaaqEMhQd7FZPesNS6v7oVNcl
   qsPmhgjb87ty+wWjBAGz60GRmGX4t3bHw48EpHUPmQDBTOx2M854x7vD3
   wafOQmo6AvMuG9wRJuGk+t1HwkCVN/ZMYuSSec/6bEMhNTHneDwbhVOMK
   MHfSNJV9dwoS12f7JpsPkEdJkADTb1IyXvnesmuGApajTqZS5Tr/bmpXn
   9gsYeMUqqlnUvAYaz/J/50EBxGGCZ+bvzd7NL/tcLaO6GAzkxJvz7DE4C
   g==;
X-CSE-ConnectionGUID: 4g0Uxu5HTH2HKDM8cU0qUA==
X-CSE-MsgGUID: GerfybcCSJ6DTD01Lf7Rnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461306"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:03 -0800
X-CSE-ConnectionGUID: 5tY86FQ9SLe/2fhDh9KiPQ==
X-CSE-MsgGUID: xDAXXsKwQ+KkDTm8BZemDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419856"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:01 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 00/14] i3c: mipi-i3c-hci: Fixes for v7.0
Date: Fri,  6 Mar 2026 09:24:37 +0200
Message-ID: <20260306072451.11131-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Enatecoding: 8bit
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232505_860371_3CE0C9DF 
X-CRM114-Status: UNSURE (   8.44  )
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

Hi


    Please note, all patches now have Frank's Reviewed-by.


Here are some fixes to the MIPI I3C HCI driver.  Please consider them
as fixes for v7.0.

They are mostly related to error recovery and a lack of serialization.

There is a minor conflict with the "i3c: mipi-i3c-hci-pci: Enable IBI
while runtime suspended for Intel controllers" patch set.  So I will
re-send that patch set in in due course.


Changes in V3:

    i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
    i3c: mipi-i3c-hci: Consolidate spinlocks
    i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers
    i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
    i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and interrupt handler
    i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
    i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
	Add Frank's Rev'd-by

Changes in V2:

    i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
	Added Frank's Rev'd-by

    i3c: mipi-i3c-hci: Fix Hot-Join NACK
	Added Frank's Rev'd-by

    i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
	New patch split out from "i3c: mipi-i3c-hci: Fix race in DMA ring
	enqueue for parallel xfers"

    i3c: mipi-i3c-hci: Consolidate spinlocks
	New patch

    i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers
	Refactor of hci_dma_queue_xfer() to do all DMA mapping first, is
	now a separate earlier patch: "i3c: mipi-i3c-hci: Factor out DMA
	mapping from queuing path"

    i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
	Mutex now defined in struct i3c_hci instead of struct hci_rh_data

    i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and interrupt handler
	Now uses unified spinlock (as per earlier patch "i3c: mipi-i3c-hci:
	Consolidate spinlocks") and extends coverage to the entire interrupt
	handler

    i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
	Add Frank's Rev'd-by
	Mutex is now defined in struct i3c_hci

    i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci: Consolidate common xfer processing logic
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
	None

    i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
	Place irq_inactive under the protection of the now unified
	spinlock, eliminating the need for explict memory barriers.
	Correctly position the update of irq_inactive in
	i3c_hci_sync_irq_inactive() to after synchronize_irq()

    i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails
	Add Frank's Rev'd-by


Adrian Hunter (14):
      i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
      i3c: mipi-i3c-hci: Fix Hot-Join NACK
      i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
      i3c: mipi-i3c-hci: Consolidate spinlocks
      i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers
      i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
      i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and interrupt handler
      i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
      i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
      i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
      i3c: mipi-i3c-hci: Consolidate common xfer processing logic
      i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
      i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
      i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails

 drivers/i3c/master/mipi-i3c-hci/cmd.h    |   1 +
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |   8 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |   8 +-
 drivers/i3c/master/mipi-i3c-hci/core.c   | 143 +++++++++++++++++-----------
 drivers/i3c/master/mipi-i3c-hci/dma.c    | 156 ++++++++++++++++---------------
 drivers/i3c/master/mipi-i3c-hci/hci.h    |   5 +
 drivers/i3c/master/mipi-i3c-hci/pio.c    |  16 +---
 7 files changed, 190 insertions(+), 147 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
