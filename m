Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D73CEDDA4
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nz1QM3MDB2iGGK8S2zyMawaBGA3lLBXtAgknfWnNZs8=; b=nYbvGDVVi26iez
	Xbo/SRTOA4rxXAR5b0Hs+02+v5lGSIWCCZqn2mRz6xOv++pCXDUYixp+dzoq/vbxj/TTHXSEI1M9T
	1WjQHv/UjrqeCA1Lb35W20WWcdFOp515qQ5GcRvItaeMXEWmzFyxCph+xgZbb4zFGMu3UVcpxlOZs
	wE9cMYXPVsS9jIyxWo2I0NQxUSnAvWEzqNgAdL5kIarJa6HLDG4X3hkOqpAVHODHlxNMih5iZYAyy
	X6c/FcISGVRwm12taeN/P/ILVkKrqaBdf6gfLmCxUWEG5hzCQNYUceJZigqqSgOX+DesHAUcPypmJ
	KEcErsg958erd2Y/qsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpN-00000000lsh-1wAm;
	Tue, 18 Nov 2025 16:45:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpL-00000000lrU-0UV0
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484311; x=1795020311;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SdKHV2+Tw7xuQRRHJX+7G73ZrNcCMCAL23JTPuAS/68=;
  b=Hm33pNRZ5wo4RN6IVhxAeanm99W8PNIMCYSQp8lMtnzdlRgloi4EehkG
   1xEtNOANdmidZXCFiJRppB7BG7fnFbBG0Ywb0PM7HF2uTwt5Rr/hZlegE
   zNXQjg71avzFAkN4qdBbw6WE30rpF2POvjyHu4fKBiAT4tOBykAOlFK1f
   YqxULyn+O5bW5yPZ2P3t9eBTG7+BesWevk4OZ4pk80CnXNb8eczzLlDgG
   nNJWNLHNKHPKNDj6D2LsZb2vZ+jAB1zDxzvNEKX7CbhPfX51aYR72hvDg
   Ru6xmnILHQlAkCtxANYXrvuI2tCbFyOHUm6MjwUT1vlZIv8I+6PlmAn1Q
   w==;
X-CSE-ConnectionGUID: xAXhdAV7Q1Cii6pmVYrGpw==
X-CSE-MsgGUID: L5bYVIyDRDqSBZ5HISfnkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510668"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:10 -0800
X-CSE-ConnectionGUID: TOmi1y/oTZy193ZGhmb3bA==
X-CSE-MsgGUID: l4pDw/DqReeKgk+QtnbfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221462858"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:08 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 00/12] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
Date: Tue, 18 Nov 2025 18:44:41 +0200
Message-ID: <20251118164453.55532-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084511_199436_9F04F3CA 
X-CRM114-Status: UNSURE (   8.41  )
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

Here are V4 patches primarily to add support for Latency Tolerance
Reporting (LTR) for Intel controllers.  Most patches are small tidy-ups or
preparation for the main change.


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

 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 215 +++++++++++++++++----
 1 file changed, 177 insertions(+), 38 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
