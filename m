Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC4FD148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H6AVzGP2UHhaQHTj3odryEDUehIB3SIcZvVIweASA0o=; b=I7JNVy3aFMc+Yb
	q5+kb4qwHuFadVVqjN7WhHRDwQIopX5ZOW/DLSSuLqYhNvQyosImO22sY3N5TSmZWQvdjtWU96MGU
	vN6Ouu5qwre3CXtAEnx/fE4bG5iKbvtd1it9zzG6YNqu7ttwaKYTohva5qz5ArgOZrGhMSbQzk7k9
	+Suu6UfR1ejahEvaGy7FplVVhhEPGccuAEXhg+4Npd6dvRaBnDiF49fmu2a9u/hJgc6B7KtHY8vuI
	Fte2PhvaH31dDQVRm+c54ZT1HnK26pa/HR/0b+ALygje0cp7gwSwNO3yCGf6wrmb6LWp2RIScojBf
	GKK0YvnvaaaDeQXhPzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl25-0000000GD11-2nNS;
	Thu, 08 Jan 2026 08:06:13 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl23-0000000GCzw-0xY3
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859571; x=1799395571;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=scF1w8NG+Fst78Eus2A4PvYXUn8HsHKtyVvHgfTypXg=;
  b=ghXPYk+7nBBKOx6X9khhUAhHw0A29SlfI8fCHNFRmuS6mHN4USN1lpfI
   E+UhOmRPEPnYauz2GcdRIvLDaSLnw+2L/VEPWDAiMuMq4alETsdfUAMRb
   ZVwnK6pDECj5r8HWXFLUwiRavAFeZLxYAZSPFo1J5pMHxN1BaVLjQXOIl
   oyQ52+DpNWeS/UmuMYTMYlN+mCoCLqIy4hCrxUtA2EN6GDCGEz2ExFsMA
   nfxdzwso6pYGexu0mBVW/z6QZfgQVeuX2+f1yXtUESm/4nkD5CYCGJTAE
   A5SR82rDBvvsRc3fqndomGwjncAhXK3l5rxjOQ/lgLwo79byfn74sqn3s
   Q==;
X-CSE-ConnectionGUID: l9NGsHo9QPiALVCb33eanA==
X-CSE-MsgGUID: Rdx0EWOGSb2Egw3a4EJz0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792232"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792232"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:11 -0800
X-CSE-ConnectionGUID: 960bxHm1R3iOTBnu+Yd8Ow==
X-CSE-MsgGUID: i9u/dtesQCmlbaL9XNKX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413554"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:09 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 00/20] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Date: Thu,  8 Jan 2026 10:05:38 +0200
Message-ID: <20260108080558.21767-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000611_278442_6F47E207 
X-CRM114-Status: GOOD (  13.39  )
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


Adrian Hunter (20):
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
