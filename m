Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A9ACFD376
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=deK3tx8jLu+KsA/JJWeqNvtvMFjRiwOIzDzrc0hwznY=; b=0TqkAzb58SWdAv
	TWbltDtGugvWZ5nByEnfV0IyNExmMGEWINE6JgXVmeR2d+YXxlRSAW3Fzrfr7ACqLR0xR9QyRwGVT
	FmtAyVNO6iKjqG4DhxDYpOl8MwRfwfybJoanUEu0QwYAKrmeRbl0bb7xHlhUknbji7LaV90+f4JGq
	VnW1IzlOlfcyNUsoU1jCipiS1Z4Fsj6x5IqdGZCo0P9Mhiy72D3+s2BzLCFI2Du8MrTsGdS8GpyGI
	4+AYb+D3JETQSZan/PIVdUoZX/RvC+rOOBb1hHBI+JCZjOHXsMubQ/lSxnG19YoLKAa972eZl7yqP
	REM7D7vhyYFTKoUnv8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA6-000000003Pp-3e79;
	Fri, 28 Nov 2025 06:40:58 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA0-000000003OT-0ikk
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312052; x=1795848052;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2h3K6imvMHRVWj394xZVrEzkZ55MgsGdc4BR6D2n+6I=;
  b=Vvtm086QwVif0/noFyg3y0sD4w2X2JLTJckkTIBaK45sIl2Xy5ChRob+
   8v2T0KkuQZu7ejO7P/+Dth1bQdhqjoTmkOOL2K6UZrHywwkIAgigYXJtt
   i5D+qE6PaXBGHvxDSigrH+HucMq6Xq36c/dGhgjKiqLgxzK227f/RaxYu
   avdWPInvRPvHP0OowTxrXhBdm3zTm/SVm8O2vmpZz1N41GDWoIrlV2rWI
   G7uuQTPdA/Ru3lI8Zl8oJnRU9FVQhX+eVVD8LhHW/6Dc1QjdxcUs4Epr6
   f3iM3xeUh9ojcSCNXf1aDXE+hXed1PdbTCPjSLX3HFfhTrD5Iylh/qxiW
   g==;
X-CSE-ConnectionGUID: Mqpb2FdAQUSb55EKsIRbTA==
X-CSE-MsgGUID: AJ4/G1AjQ6O6mVsBntkgww==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059923"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059923"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:51 -0800
X-CSE-ConnectionGUID: NbnDp3RbR9qH2WFgcJOvXA==
X-CSE-MsgGUID: qdzgTLBaT/KRYnJs9BnlEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348045"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:49 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 00/12] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
Date: Fri, 28 Nov 2025 08:40:26 +0200
Message-ID: <20251128064038.55158-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224052_257657_6AA84C9F 
X-CRM114-Status: UNSURE (   8.01  )
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

Here are V5 patches primarily to add support for Latency Tolerance
Reporting (LTR) for Intel controllers.  Most patches are small tidy-ups or
preparation for the main change.  All patches have Frank's Rev'd-by.


Changes in V5:

      i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Add exit callback
	Add missing call to ->exit() on error path

      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
	Add Frank's Rev'd-by
	Rename intel_exit to intel_i3c_exit to match intel_i3c_init


Changes in V4:

      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
      i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
      i3c: mipi-i3c-hci-pci: Change callback parameter
      i3c: mipi-i3c-hci-pci: Add exit callback
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
	Drop intel_actualize_debugfs_root() that created 'intel-i3c'
	debugfs directory.


Changes in V3:
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
	Omit mention of IOMMU in commit message.

      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Change callback parameter
	Improve commit message.

      i3c: mipi-i3c-hci-pci: Add exit callback
	Improve commit message.

      i3c: mipi-i3c-hci-pci: Allocate a structure for Intel controller information
	Squash into "Add LTR support for Intel controllers" patch

      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
	Squash "Allocate a structure for Intel controller information" patch
	into this patch

      i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
	Add Frank's Rev'd-by


Changes in V2:
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
	No need to check error from dma_set_mask_and_coherent() with a
	64-bit mask

      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
	Rename 'intel_init' to 'intel_i3c_init'
	More explanation in commit message

      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
	Change 10000 to (10 * USEC_PER_MSEC)

      i3c: mipi-i3c-hci-pci: Constify driver data
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
	Move location of intel_reset() to get a prettier diff

      i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
	Make use of FIELD_PREP()
	Improve handling of values that exceed the maximum


Adrian Hunter (12):
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
      i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
      i3c: mipi-i3c-hci-pci: Constify driver data
      i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
      i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
      i3c: mipi-i3c-hci-pci: Change callback parameter
      i3c: mipi-i3c-hci-pci: Add exit callback
      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
      i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers

 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 220 +++++++++++++++++----
 1 file changed, 181 insertions(+), 39 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
