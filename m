Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA1EF8D763
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OoJ7i3tT9eLVIj4UaP19c/b6tJGSss6AH+6SAWHsisg=; b=dWM+9188HtwnJK
	o5xqAoBfpexaAtaAZAnKH3t1rInrC8AllABCxqneF5nDuRuij0GYMGeShb7IasRDGwKue8ZIqIAaE
	/88hY+DRB8wfobcapWU8JqetTIODHHI6DAFHXp5DslAjReGedKInCEXqMz3JPc3knMXBJoltKUEIe
	PuQAJ+kU3DbkfFdgmpiijuzN9qHoK8SzBt60CHGaQdNvXr208ZEifg7rzgux+UHNxdsiD8bgR3Jxp
	UV49ZJG2eLFFpe8nkjwMZ+vHsI7DLYqkyBPjss1Jd4CP9klOb9+kchk0k6rkb9f93z2pJp/g0ITht
	T4Vht2huLh44V8FtYykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxu-00000002jd8-1vZR;
	Thu, 16 Apr 2026 17:57:22 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxr-00000002jc2-1LNl
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362239; x=1807898239;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sJY3VobxGecL25YciXHTjzMGpjAyw94lPfU95UScldc=;
  b=h5HSHVQ8YpnQmchncMgckhlyS7f212JE5qZWzJzUtaeHG25BhLymDV1O
   r/Cd583ZKGlkGgDHCHc7do8PbLuDrcj79gEH1NGGoh7oGOZFtH3UThf5S
   GZwP26NISYimjX/7y/BeZm6VKUrLHugefrbBjj+/LCSp17LbucGiBzbFL
   jzUGTDmP5kCLMuf4OFGmCiVOaKs//AjCNbuSBbZ0RjdPGZ5eRVW5Na5FT
   ymy8GNsLjrwTq0t9fKUVptzGzgJQYN7UF8gtN0KLUDVE0z/eieWzbM4Y/
   lp6/MZewrNgrTH+5U4CszdyaZLsKX4jK8rFTkO4MK4lYdXjF6gOPrkM5y
   A==;
X-CSE-ConnectionGUID: 65gmfk3ZQFu+l9s4qE2vXw==
X-CSE-MsgGUID: KJP421C4RpKPpiAmSE9B+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778342"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:15 -0700
X-CSE-ConnectionGUID: 9mx/vetfRXK9+N4L/3kUIw==
X-CSE-MsgGUID: aFK8giJ/RBuj7/RM4WTLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784462"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:14 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] i3c: mipi-i3c-hci: DMA abort, recovery and related improvements
Date: Thu, 16 Apr 2026 20:56:48 +0300
Message-ID: <20260416175704.41217-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105719_437039_35F3C2E2 
X-CRM114-Status: UNSURE (   9.88  )
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

Patches 9-10 add Intel-specific quirks for DMA ring abort: a PIO queue
reset after abort, and an HC_CONTROL ABORT before the ring-level abort.

Patch 11 factors out a reset-and-restore helper from the suspend path
for reuse.

Patch 12 adds a full DMA recovery path for internal controller errors.
When the hardware reports a TID mismatch or the ring becomes stuck, the
driver now resets and restores the controller, terminating all in-flight
transfers with an error status.

Patch 13 makes NoOp command handling observable: instead of discarding
NoOp responses, the driver now waits for them to complete and triggers
recovery if they fail.

Patch 14 adjusts transfer timeout accounting to start from when a
transfer actually begins execution rather than when it was queued,
preventing premature timeouts behind slow predecessors.

Patches 15-16 are minor optimizations: consolidating the DMA command and
response ring into a single coherent allocation, and increasing the ring
size to the maximum 255 entries to avoid ring-space exhaustion.

Adrian Hunter (16):
  i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
  i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
  i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
  i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
  i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
  i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
  i3c: mipi-i3c-hci: Complete transfer lists immediately on error
  i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
  i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
  i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
  i3c: mipi-i3c-hci: Factor out reset-and-restore helper
  i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
  i3c: mipi-i3c-hci: Wait for NoOp commands to complete
  i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
  i3c: mipi-i3c-hci: Consolidate DMA ring allocation
  i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum

 drivers/i3c/master/mipi-i3c-hci/cmd.h  |   6 +
 drivers/i3c/master/mipi-i3c-hci/core.c |  83 +++++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 332 +++++++++++++++++++++++++--------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  22 +++
 drivers/i3c/master/mipi-i3c-hci/pio.c  |   3 +
 5 files changed, 358 insertions(+), 88 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
