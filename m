Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACE6EFCE2A
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/yzIU9egguFzFi5FcIwkFPra6swdF8W0XXJ4sIeHK/U=; b=PDGWEuGmlDEzXn
	rOyxj9MhuvclKw617dApUJUVYfFSZMQrlhMojN8XavS4eJnYmCCGN8tfFG9MxJzAqyB1QHrwQ+OZ7
	IIjYRaHMMd76mIanrCS5TXqwfKaIVar8T8M0ScLnDg7ZKCHzg+CmcLAvl9+jktxMLNYt256lziv2U
	VirPgl0r1fjqSc7Hd+Cun9+H3nzfDEVP8Ok0TK15ngwzuA5nIX8JQNFqFar44AHpNi5PcfCrQX1bt
	IcmuUzRykD/36X8aeKZVJ77hQzWGpuPmsy8n02+//pejCV1W7WkqcZw+8aOrjdXmCTDY56dV6u2pD
	G7EUQtywOrp7Q3i8PJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqml-00000000K2A-0KYq;
	Wed, 04 Mar 2026 18:17:27 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmg-00000000K0o-3ava
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648243; x=1804184243;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rtdkG0yAbNCSYAm77qUbAqt+G8hK6Egc2HgkcfuXUOM=;
  b=Z4E6LWMJ5PXJk5rZRBcHL83M9Bsp1BEOSs90JcSzWISUkBlAdEA+oSI1
   CxrXFRFel4h+jzS4QNRT8kROU7v8DZgQDTuqm385XO75GKt+TCPVTtKMC
   b5dvf83czI7DzdtTzkYgr5Gm4neay4yDtTjTqP8BtZRtJ5gq3ljq2yoIU
   jJtLGCo4TxSFAPf137xicIq54vgS3taLMShFBm24ZAMbMir4yAXW27hdP
   utvw4blgTN61IoMXUGqsAEALhVo4VdYGvvujB/YQSiel65MMritAsP07A
   LdLuKpW7D+YUs9weYFWXxvHqpyD+2JpiRtv8UBwHlEQsELHBOzdcoH3tf
   A==;
X-CSE-ConnectionGUID: NGVnehFtRS+5sHXB4wwW2Q==
X-CSE-MsgGUID: DJnCZICFRZmZzcuSsnU6Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745871"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:21 -0800
X-CSE-ConnectionGUID: gV95/yOtQJu2HcZatPZJKg==
X-CSE-MsgGUID: ShwevcB2QpekUFQYunR7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656697"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:19 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 00/14] i3c: mipi-i3c-hci: Fixes for v7.0
Date: Wed,  4 Mar 2026 20:16:51 +0200
Message-ID: <20260304181706.143841-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Enatecoding: 8bit
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101722_915634_DEBBB8BB 
X-CRM114-Status: UNSURE (   9.21  )
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

Here are some fixes to the MIPI I3C HCI driver.  Please consider them
as fixes for v7.0.

They are mostly related to error recovery and a lack of serialization.

There is a minor conflict with the "i3c: mipi-i3c-hci-pci: Enable IBI
while runtime suspended for Intel controllers" patch set.  So I will
re-send that patch set in in due course.


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
