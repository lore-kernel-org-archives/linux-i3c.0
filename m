Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179CFD29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=reh4tKl5JbSKEC+ZI4U+Vn7VoogukofWjd/pRqoOBdA=; b=pYY7RDF+WJ9KXR
	Gf+EQ37RuD3cIeACXnkstSW844qXg5RsN8PEw4Xe2n7JZXa/WMEWHSj6Sos7/1/9HYtZkESWRBB3X
	Y+Uchg8Ng/LhXyvTNDoAId5DoExFzPJlNoJwIhkojJB1TpmYCx3qF6XPyHkM9rYBK8d2GFATDpYHG
	Ug+Nz6mN2TicawSXPp1K600+ZOTDZCpHV3xxWc7qMU4zn8paP8h5syefNTjCxeZBNaBxOqPGVLzZJ
	85t+Hutyc03Lacy8Ln+oIBzaQcDvPb8W2cYxrDhZHctmz/Z0WJBuUE0U9K7vYrdcGCaZ2ul/NjjJn
	4DiUM/ic83nwu6Mcp39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoE-00000006ePM-3OTl;
	Tue, 13 Jan 2026 07:27:22 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoB-00000006eOJ-1Nd8
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289240; x=1799825240;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ducLHwZS5JmXJY7HjUG2k3ZyXjacC2uQ4bWO5IWXpm0=;
  b=DUouteCPXOK5pyKvK6qd6SwMVbMvpql1/aj2a9LntLu4oZ+lCWLYJ6Re
   s8y7vX6j8UNs4juoQzpzM7MIyTx28UccXeJPa30bMvJ6I1ydkj5o6k7nw
   8gV+AgH/Twm0bbuaQuSqZMolOfLCFIgTCxKgivdZMofocssnqiQC4e5u/
   GcXQ5NuvHZFlhFXLfBH8rTkg9XeMcAnCyaRsGrcs6c12Ls7IAEYtEPUEL
   MX7VF/jIbFvBjtvkB2ZFFZCQE/rTTgJynLBIiEffiP3AlAu1SoZoSnlSR
   GGQvG5TYN5UpcFl3H8YUKDNDtqe52Q5343i59CewrlL2cmAQX5uvhnjfI
   A==;
X-CSE-ConnectionGUID: tqkpJ+hzTTyHNkZcuMWXXg==
X-CSE-MsgGUID: kcC/XIlTSqu/SY4hrXAFfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625409"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:19 -0800
X-CSE-ConnectionGUID: sA/8vOBuTUOXP67Nompy4w==
X-CSE-MsgGUID: Dqy0cRhCSC+4F3FY87PgIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021052"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:17 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 00/21] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Date: Tue, 13 Jan 2026 09:26:41 +0200
Message-ID: <20260113072702.16268-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232719_439721_04149F72 
X-CRM114-Status: GOOD (  14.89  )
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

Changes in V3:

    i3c: master: Update hot-join flag only on success
    i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
    i3c: mipi-i3c-hci: Factor out software reset into helper
    i3c: mipi-i3c-hci: Factor out IO mode setting into helper
    i3c: mipi-i3c-hci: Factor out master dynamic address setting into helper
    i3c: master: Introduce optional Runtime PM support
    i3c: mipi-i3c-hci: Add optional Runtime PM support
    i3c: mipi-i3c-hci-pci: Add Runtime PM support
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci: Factor out core initialization into helper
	Move I/O mode setting if I/O mode already selected, to a
	separate patch

      i3c: mipi-i3c-hci: Allow core re-initialization for Runtime PM support
	New patch

Changes in V2:
    Notably 3 new patches to factor out more common code.  Otherwise:

    i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
    i3c: mipi-i3c-hci: Ensure proper bus clean-up
	Add Frank's Rev'd-by

    i3c: master: Update hot-join flag only on success
	Add Fixes tag

    i3c: master: Replace WARN_ON() with dev_err() in i3c_dev_free_ibi_locked()
    i3c: mipi-i3c-hci: Switch DAT bitmap allocation to devm_bitmap_zalloc()
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
	Remove 'use' from commit message
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
	Move hci_dma_free() below hci_dma_cleanup() to make patch look
	better to review.
	Frank suggested using devm_add_action_and_reset() but it doesn't
	work because the error path needs to call hci_dma_cleanup() before
	hci_dma_free.

    i3c: mipi-i3c-hci: Cache DAT in memory for Runtime PM restore
    i3c: mipi-i3c-hci: Introduce helper to restore DAT
    i3c: mipi-i3c-hci: Extract ring initialization from hci_dma_init()
    i3c: mipi-i3c-hci: Add DMA suspend and resume support
    i3c: mipi-i3c-hci: Refactor PIO register initialization
    i3c: mipi-i3c-hci: Add PIO suspend and resume support
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci: Factor out software reset into helper
	Add to the commit message a sentence about additional error message
	when a timeout happens

    i3c: mipi-i3c-hci: Factor out IO mode setting into helper
    i3c: mipi-i3c-hci: Factor out core initialization into helper
    i3c: mipi-i3c-hci: Factor out master dynamic address setting into helper
	New patches

    i3c: master: Introduce optional Runtime PM support
	None
	Frank suggested dispensing with rpm_allowed.  That would be OK for
	drivers that do not enable runtime PM, but the drivers that do
	enable runtime PM (i.e. dw-i3c-master.c	and svc-i3c-master.c) might
	be affected.  rpm_allowed can be removed when they are converted to
	the new approach.

    i3c: mipi-i3c-hci: Add optional Runtime PM support
	Use new i3c_hci_reset_and_init() and i3c_hci_set_master_dyn_addr()
	Use devm_pm_runtime_set_active_enabled() which allows
	i3c_hci_rpm_disable() to be dropped.
	SET_RUNTIME_PM_OPS -> RUNTIME_PM_OPS

    i3c: mipi-i3c-hci-pci: Add Runtime PM support
	None


This patch set adds Runtime PM support to mipi-i3c-hci and
mipi-i3c-hci-pci.

Notably, the master core is enhanced to optionally support
doing the RPM gets/puts needed to ensure a device is runtime
resumed for all bus operations.  That alleviates mipi-i3c-hci
from having to do it, and if the approach is accepted, would
allow other master drivers to drop their RPM gets/puts.

There are a number of small patches making various improvements
for things hit during development.  Plus a bunch of patches
preparing for the main changes which are covered in the last 3
patches.


Adrian Hunter (21):
      i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
      i3c: mipi-i3c-hci: Ensure proper bus clean-up
      i3c: master: Update hot-join flag only on success
      i3c: master: Replace WARN_ON() with dev_err() in i3c_dev_free_ibi_locked()
      i3c: mipi-i3c-hci: Switch DAT bitmap allocation to devm_bitmap_zalloc()
      i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
      i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
      i3c: mipi-i3c-hci: Cache DAT in memory for Runtime PM restore
      i3c: mipi-i3c-hci: Introduce helper to restore DAT
      i3c: mipi-i3c-hci: Extract ring initialization from hci_dma_init()
      i3c: mipi-i3c-hci: Add DMA suspend and resume support
      i3c: mipi-i3c-hci: Refactor PIO register initialization
      i3c: mipi-i3c-hci: Add PIO suspend and resume support
      i3c: mipi-i3c-hci: Factor out software reset into helper
      i3c: mipi-i3c-hci: Factor out IO mode setting into helper
      i3c: mipi-i3c-hci: Factor out core initialization into helper
      i3c: mipi-i3c-hci: Allow core re-initialization for Runtime PM support
      i3c: mipi-i3c-hci: Factor out master dynamic address setting into helper
      i3c: master: Introduce optional Runtime PM support
      i3c: mipi-i3c-hci: Add optional Runtime PM support
      i3c: mipi-i3c-hci-pci: Add Runtime PM support

 drivers/i3c/device.c                               |  46 ++-
 drivers/i3c/internals.h                            |   4 +
 drivers/i3c/master.c                               | 101 +++++-
 drivers/i3c/master/mipi-i3c-hci/core.c             | 344 +++++++++++++++------
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  45 ++-
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 163 +++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h              |  12 +
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  17 +
 drivers/i3c/master/mipi-i3c-hci/pio.c              |  63 ++--
 include/linux/i3c/master.h                         |   4 +
 11 files changed, 613 insertions(+), 188 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
