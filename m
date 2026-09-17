Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1F9C88E72
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wRIt2MACXy1F3e3rDmCsCsAdEWUCa90WOpBKt1Rsu+k=; b=muq8OPZLWndrPP
	Sd+1/L0nmy/iG1iO0oquuoM72nRJsATtEJSOeLS0lwhvpX1dGgQPEvaVUogSa1oOBPPjtz2Klqm76
	IQmXk5uG5/A+fByt8cFbbD5UM9TiB5S0W2o40A5IsDSrvMB2TE0TEm6I6bzwpDAEE0MLfDy2rvM2c
	QDUoBYVpuVQ+4Gw0Rku7ObhXNc2uEgNmy7V2j9+8ymtNLxnJvnPtZdt5DOG7/DoRIjG7X04XfCRyz
	gQ5eeybryDiyFVxycAzTBRgM1Ar3hGNzqIaznyiVVsNV/BvaQIeDIFeH9Tt5FE6mhPSZSsULvUuHM
	wyPs79TeXP45AMam18dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYe-0000000CJGl-38ii;
	Thu, 17 Sep 2026 19:14:08 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYc-0000000CJFz-3QlD
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672446; x=1821208446;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lqelfgkCRSP8Ob/gz3hVCtDRf4p7B0byBLkq1kIgObI=;
  b=Jw1qaOl+XNZfyVLMqLF1aBiWkalV/JMcqKFZ0BUOiCGUpdiss+TT5pyW
   pckFgYLGdPHjR5ITR3KrwwL/QhCrHHXO75MJcBBq7IXbaigL/upgm8cay
   ORuwBc/ncIcalUuJ4Jh6nOTn+qVi+PGXOOnKhuFz9iXmtta3nRDZX+HBX
   q/n1Ovb5gbVJJGJxtxvXUs/jhBsoaGKLHHqKEuVr76o7YuBrS4pRfxiSw
   qoBQU4b/NJC2SONKl9hjVwvE6zEmbHrpS5umPlkVoHZ83R1js6CxM3yKj
   uvBmDrrkcjsB0D0DoSI3r+xyZFiZi4PSR7VRrgKmmHciboTZGhpPzfePz
   Q==;
X-CSE-ConnectionGUID: 9OPzuLQTTvuQfOKaCeTuiw==
X-CSE-MsgGUID: bX3vKjJ5RPGQcMFADOFPmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639847"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639847"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:06 -0700
X-CSE-ConnectionGUID: lM4GkBNHRFu2mqp4onk/cg==
X-CSE-MsgGUID: MEWdbLNPS4yUZ6mnkTCuYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271913"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:04 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 00/17] i3c: Fixes, cleanups and HDR-DDR support
Date: Thu, 17 Sep 2026 22:13:39 +0300
Message-ID: <20260917191356.133242-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121406_873028_F5BA884C 
X-CRM114-Status: GOOD (  17.16  )
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

This series brings a collection of fixes, specification-conformance
cleanups and feature additions to the I3C core and MIPI I3C HCI driver.

The first three patches are independent fixes tagged for stable. The
remaining patches address a mixture of correctness issues in the core
and HCI driver, improve conformance with the I3C and HCI
specifications, add support for configurable device NACK retries, and
finally add HDR-DDR support.

The series is organised as follows:

  Stable fixes (patches 1-3)
  --------------------------

  - Fix an out-of-bounds read in the core DMA bounce-buffer helper.

  - Fix a destination buffer overrun in the HCI DMA path for reads whose
    length is not a multiple of four bytes. The issue is independent of
    IOMMU usage, although the existing workaround was only applied when
    an IOMMU was present.

  - Close a probe-time race in the HCI PCI driver where the LTR sysfs
    attribute becomes visible before drvdata has been initialized.

  Core fixes (patches 4-5)
  ------------------------

  - Fix ACPI target enumeration on multi-instance controllers by
    extracting the bus-controller instance number and PID from the
    correct _ADR fields.

  - Remove a stale GETSTATUS response-length check that became obsolete
    when actual_len-based validation was introduced.

  HCI IBI and suspend fixes (patches 6-11)
  ----------------------------------------

  - Restore controller state when enabling IBIs fails, so that a failed
    ENEC does not leave controller-side setup in place.

  - Send DISEC before disabling IBIs in hardware so that an IBI racing
    with teardown is not silently dropped.

  - Avoid accessing controller hardware from ->free_ibi(), where runtime
    PM does not guarantee the device is resumed.

  - Drain all pending IBIs whenever INTR_IBI_READY is received instead
    of processing only the first queued entry.

  - Reorganize the DMA suspend/resume callbacks in preparation for the
    following change.

  - Rework DMA suspend handling to stop Ring Bundles according to the
    HCI specification, synchronize with the interrupt handler, and flush
    any pending IBI before disabling the rings.

  HCI specification cleanups (patches 12-14)
  -------------------------------------------

  - Correct the Response Descriptor DATA_LENGTH field definition.

  - Remove an invalid maximum-transfer-size capability derived from
    reserved HC_CAPABILITIES bits.

  - Remove HDR-BT and Fm/Fm+ definitions that are not defined by any
    released version of the HCI specification.

  Feature additions (patches 15-17)
  ---------------------------------

  - Implement the .set_dev_nack_retry() master operation using DAT
    support provided by HCI v1 controllers.

  - Restrict advertised and permitted HDR modes to the intersection of:
      * controller capabilities,
      * bus-configuration constraints, and
      * target capabilities.

  - Add HDR-DDR private-transfer support to the HCI driver, including
    descriptor generation and capability advertisement when supported by
    both the controller and the active command-descriptor format.


Changes in V2:

    i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
	Added the slub_debug report to the commit message.

    i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix i3c_hci_enable_ibi() error path", to say what the patch does
	rather than that it fixes something.

    i3c: mipi-i3c-hci: Stop rings gracefully when suspending
	Added comments explaining the choice of the RING_STOP_TIMEOUT_US
	and RING_STOP_SLEEP_US values.

    i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix Response Descriptor DATA_LENGTH mask", to name the macro and
	the corrected bit range.

    Added Frank Li's Reviewed-by tags.


Adrian Hunter (17):
      i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
      i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
      i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
      i3c: master: Match ACPI targets to the correct bus controller instance
      i3c: master: Remove stale GETSTATUS length check
      i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
      i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
      i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
      i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
      i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
      i3c: mipi-i3c-hci: Stop rings gracefully when suspending
      i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
      i3c: mipi-i3c-hci: Remove invalid transfer size limit
      i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
      i3c: mipi-i3c-hci: Support configurable device NACK retries
      i3c: Restrict HDR modes to those supported by the bus and target
      i3c: mipi-i3c-hci: Add HDR-DDR support

 drivers/i3c/device.c                               |  15 ++-
 drivers/i3c/internals.h                            |   2 +
 drivers/i3c/master.c                               |  88 +++++++++++--
 drivers/i3c/master/mipi-i3c-hci/cmd.h              |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |  28 ++++-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |  99 ++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   2 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  25 ++++
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 136 +++++++++++++++------
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   9 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |   5 +-
 include/linux/i3c/device.h                         |   4 +
 include/linux/i3c/master.h                         |   3 +
 include/linux/platform_data/mipi-i3c-hci.h         |   4 +
 15 files changed, 341 insertions(+), 87 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
