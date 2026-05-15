Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1128FCD4F48
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bfsag/MxMh9iymwvWq4qhIrTacgNSMnnVdwrbHiIWRU=; b=rV7RmKz8s3ZSBQ
	gR1BzQQlRH5I1m6znpILYbvFGv/OWCuWfEs3QNJBDRN0j1RhUZGa4uWLQ4i0CFc03cT7CVjjA08eM
	JZyAPCENt/9lfexzDvPz6oNP2Bs8bX+ZP0qMjR5VIHB/i8eVDW9aUJ7OBphWlpbgnJkhoPkaU4Njl
	/ftQL3mhuikB3/BSOWM/tdPC5bwXKWjp0HeY8icEYuZVhcNkYrx8lCPYOccmod6R2h0kpBUA0oE/k
	Civgm5F6h27qitTuHNHt/9MhjCjT3xTHbeSJsROA0iEVhoYMOJWOxO6189+Tac3iehiDMAjXXA3iH
	0hrhESLpCk6WzQwzP8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN5-00000008rLA-36mj;
	Fri, 15 May 2026 16:26:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN2-00000008rIk-2kpM
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862401; x=1810398401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T94SZ4H/vEWxvq2Fldpgqi4a7P/tZbuGeA0n1Ybnq3M=;
  b=DBSwT+ROAp86rv2TkXBFvhZgHxN2OUci4igV/xxX7cD7oswKzqORlJvZ
   Ur25QmOeAhqKq6mC0FizbdCYd4AZBU+a1rweR8yOxaxOn5IChi2M/1r7r
   nOOs/02+a4JOp+eHQuBdhZX82kGTlZqcoz53WhiNtKjit5le5QDSF1oZr
   PxTchfKGtf+vuQfQaJWZS+51sSmlmFQz7FfNMaZOZxlJ3l6l9+fOk6lxL
   pmdJ6w6TtSzpuSRcfu5Z0Yyd+vuCrUZe+gn9vzBLolyDDmsyA1Ou5UYs3
   p8nUmUNoEOmyGTxXetrB67PzHDmugBxR1Foo41nvdsQ5+svYFEbxYJ7kS
   Q==;
X-CSE-ConnectionGUID: R4BFbQoGQsq9N/hgvZSC0Q==
X-CSE-MsgGUID: bU6/0mPDRO+no5hmABAhfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785218"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:38 -0700
X-CSE-ConnectionGUID: ygMJeAFmRdWtGmQgR4BfSg==
X-CSE-MsgGUID: 8BE5A4nlT4SdpxicBnPIOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857089"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:31 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 00/17] i3c: mipi-i3c-hci: DMA abort, recovery and related improvements
Date: Fri, 15 May 2026 19:26:04 +0300
Message-ID: <20260515162621.57719-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092640_734262_6EBBB718 
X-CRM114-Status: GOOD (  13.28  )
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

This series improves the robustness of the MIPI I3C HCI DMA mode driver,
addressing issues observed during error handling and recovery.

Patch 1 ensures suspend always invokes io->suspend.

Patches 2-4 fix issues in the existing DMA abort path: preserving the RUN
bit during abort per the MIPI specification, blocking enqueue during
abort/error, and waiting for ring restart completion.

Patches 5-8 improve how partially completed transfer lists are handled
during dequeue: moving hci_dma_xfer_done() earlier so completed
responses are processed before NoOp replacement, completing transfer
lists immediately on error rather than deferring, and detecting when an
abort races with transfer completion to avoid restarting the wrong
transfer list.

Patches 9-11 add Intel-specific quirks for DMA ring abort: a PIO queue
reset after abort, and an HC_CONTROL ABORT before the ring-level abort.

Patch 12 factors out a reset-and-restore helper from the suspend path
for reuse.

Patch 13 adds a full DMA recovery path for internal controller errors.
When the hardware reports a TID mismatch or the ring becomes stuck, the
driver now resets and restores the controller, terminating all in-flight
transfers with an error status.

Patch 14 makes NoOp command handling observable: instead of discarding
NoOp responses, the driver now waits for them to complete and triggers
recovery if they fail.

Patch 15 adjusts transfer timeout accounting to start from when a
transfer actually begins execution rather than when it was queued,
preventing premature timeouts behind slow predecessors.

Patches 16-17 are minor optimizations: consolidating the DMA command and
response ring into a single coherent allocation, and increasing the ring
size to the maximum 255 entries to avoid ring-space exhaustion.


Changes in V4:

  i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
        Inline HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET check at call site
        instead of using a helper function

  i3c: mipi-i3c-hci: Factor out hci_dma_abort()
        New patch

  i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
        Factor out hci_dma_abort() into a preceding patch
        Make hci_dma_requires_hc_abort_quirk() void; move quirk check to caller

  i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
        Rename start_time to start_jiffies

  i3c: mipi-i3c-hci: Consolidate DMA ring allocation
        Cache allocation size in xfer_alloc_sz to avoid recomputing in
        hci_dma_free()


Changes in V3:

  i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
  i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
	Add Frank's rev'd-by

  i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
	When erroring out transfers, ensure the final transfer of a
	transfer list is processed last


Changes in V2:

  i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
	Always return 0 from suspend callback
	Amend commit message

  i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
	Improve commit message

  i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
	Improve commit message

  i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
	None

  i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
	Add Frank's Rev'd-by

  i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
	Add Frank's Rev'd-by

  i3c: mipi-i3c-hci: Complete transfer lists immediately on error
	Rename completing_xfer to final_xfer

  i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
	Rename completing_xfer to final_xfer

  i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
	None

  i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
	None

  i3c: mipi-i3c-hci: Factor out reset-and-restore helper
	Drop redundant i3c_hci_sync_irq_inactive(hci)
	from i3c_hci_reset_and_restore() because it is called by
	hci->io->suspend() anyway

  i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
	Rename completing_xfer to final_xfer
	Add hci_dma_xfer_done() before checking for an already complete
	transfer
	Improve commit message

  i3c: mipi-i3c-hci: Wait for NoOp commands to complete
	Rename completing_xfer to final_xfer
	Add missing reinit_completion()

  i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
	Do not flag the next transfer as started when there is an error
	which halts the controller
	Instead flag it started at the end of hci_dma_dequeue_xfer()
	Use hci_start_xfer() in pio.c

  i3c: mipi-i3c-hci: Consolidate DMA ring allocation
	Check for failed allocation before assignments to avoid doing
	arithmetic with NULL pointers

  i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
	None


Adrian Hunter (17):
      i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
      i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
      i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
      i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
      i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
      i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
      i3c: mipi-i3c-hci: Complete transfer lists immediately on error
      i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
      i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
      i3c: mipi-i3c-hci: Factor out hci_dma_abort()
      i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
      i3c: mipi-i3c-hci: Factor out reset-and-restore helper
      i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
      i3c: mipi-i3c-hci: Wait for NoOp commands to complete
      i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
      i3c: mipi-i3c-hci: Consolidate DMA ring allocation
      i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum

 drivers/i3c/master/mipi-i3c-hci/cmd.h  |   6 +
 drivers/i3c/master/mipi-i3c-hci/core.c |  82 ++++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 333 +++++++++++++++++++++++++--------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  22 +++
 drivers/i3c/master/mipi-i3c-hci/pio.c  |   1 +
 5 files changed, 354 insertions(+), 90 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
