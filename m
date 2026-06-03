Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83B8CD6E55
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tqQhi4xfAbMXPkfc8P3MisSeR4fmCd6Lq7vsVxSc158=; b=NfPEJOM5GE4HGT
	Tt7BliQBWuNtzWG7HsGSdqF/QHK2uf38aNLmUvik34hG4VNMS/UF7DFfFIHXhuVxyhgRiSNX6cYyG
	otjAmsk+fMM5bC1FTyPKVcKH2QNZRC/X5kgpHdlKoumSkJ2M7Aio5fKfS5Y3DTGFLV8UcBwWX0h0B
	AY61SaVE8kIqtmOhu3nNd43APfJtfPVg1Q7cKmIvWJHnDgDpwF40jjF7QUEWN1OwqCW4ReuQXwyIs
	DpWc/yV4FnmUIkdhSZgo533LD25xVqdpB1qk58WvlgpX+IP1rmL+ZshyeP2QvsC7KlXGXl2qHwdWp
	66NfjbYBNq15SJpSI9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaI-0000000EfkF-24MH;
	Wed, 03 Jun 2026 09:08:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaG-0000000EfiS-3qI3
	for linux-i3c@bombadil.infradead.org;
	Wed, 03 Jun 2026 09:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=t+DH3S1uSltZbGzVflWPaTYWZXuhpHlflqa2dXKNLo8=; b=FbH7GiSxLS0KzDLLyi/3WZ1dO7
	bFYvulqbqkcsI7hPeofE1TYzJFYO6p/gzXj4kmqEEhfIlXncpuJ7qvXWmAhE9+yxJxprzeVoks1Q9
	zMcjBxH3RK8D4o/klhh1tg8avaMVRxp+VDb8XWlYp+QzfEn9SOFB1ylA89pv7fJyVDbvRDLm9+BMx
	3zUQDmPJRGT+AkZajB9QM6Th6BU60pxcOM0Qspy4LU6tnKLxC8+p0/74TW/W7xnjIIIl4QLpoO8ER
	Y9TOfQWc7Yb4wdvrpEDN8a6QbQ/MfOMl/1FGyelqXU71wFuzJITnvUgmnxZ0Nc0O7QdZ/3TGnOInk
	kM+1toUw==;
Received: from mgamail.intel.com ([192.198.163.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhaC-0000000BfSA-3ell
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477697; x=1812013697;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7j1s7VFY2SoDZRlfaEWhAcEFGNTUMoxSth5kz84yMzY=;
  b=BAKpdnkh3sTVkPm+aCw8vb0wxDIgXBvBWCJQHr+KPvjvsZLotEcVrmzj
   H+167mcKXulsrdw2XOpSHs/9szKBfC4Fc5xwK9LlMHtN9Uh1wFoodt0m4
   1nJEmkMGh2VrCMZ9nFPpKYGE3AxysxYMpPqromLJPZ+rkskC1GyMeJIJ3
   z7gW8f/PfjjbWK2hyF1NsQ1t70i57ZSWKebvyZE2H+DKg/b26NABceYNu
   7Fe5BCveOi1uaxUJySYZxC9EjXQdLa4zk/yrdpyVpE98LeCJDVCCaO3Cl
   YsxbojFq4lfmjcU5pfG5QTKwjqFN7X+QiI3owkRMq9BTijNM1+lwekDfU
   w==;
X-CSE-ConnectionGUID: W8OMMHZ7TK6I9LLE0nUQdQ==
X-CSE-MsgGUID: z4Eqr1opR1+c4kn9zm9OPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852584"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852584"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:10 -0700
X-CSE-ConnectionGUID: LPy4cfbETDmzNiUwdqvYWw==
X-CSE-MsgGUID: qu01NZRKRT6WiQzyf2ikfQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:08 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 00/17] i3c: mipi-i3c-hci: DMA abort, recovery and related improvements
Date: Wed,  3 Jun 2026 12:07:37 +0300
Message-ID: <20260603090754.16252-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_100817_329746_28337D05 
X-CRM114-Status: GOOD (  13.54  )
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


	Note all patches have now been reviewed by Frank.


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


Changes in V5:

  i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
  i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
  i3c: mipi-i3c-hci: Factor out hci_dma_abort()
  i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
  i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
  i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
  i3c: mipi-i3c-hci: Consolidate DMA ring allocation
	Add Frank's Rev'd-by

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
