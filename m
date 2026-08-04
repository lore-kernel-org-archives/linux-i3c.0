Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1063DC55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yURYicDnMyny6zOwSwzgu91ds14V9MUw7qZGzyYJOcE=; b=RdUeHCvDQzPH+W
	KKOub+i9P+s4y4KTEBm97eQgsL3SGKPCVOsXh3DRM3mI6Apdy3XzEok5DobBiKiMz+0x2cI5J/z0u
	5AP2eRfsg1Vivw6Nu2glJwLJHvEg98Tf8LlM8RtAYHGms3tNZrHdFlw3k3pMhHCxCYG281KdLjrpm
	qeHKLo8L+FSDcnV4+xgS2uG+tkuYYuz9JnRGTuYkiXA+8bH9dYoZLIUghPXUkx1AmLVmumiic2oLj
	HHuA2vRhA/1DPTPlHynu5Ulq7+c3V34B/RWJoqRcMl6nGSOdtH/FGBR1hwy+3gfeuReTU0nmEAr3X
	gFEjDthnQRXMjcJotMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLc-00000001wPj-1ZLZ;
	Tue, 04 Aug 2026 13:38:24 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLZ-00000001wP5-43oO
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785850702; x=1817386702;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pVljT0jLCyGb2kBPGUTd7yl2MbPvOv6Y5IWyas+K8+g=;
  b=C2WPv2PiU7CxVEQ/UFM1RwTDmi9ReIHELRhCQNIkvdc+5vckldN0EVpr
   WfEVN/bbwy6yNKyHF/GV1PRhN9H16l0qZOctl4rYh8m/Ik5avdobsQwad
   WUQlG8AYxL4zcPPeR7ofr01C+NuNMqlwswQ7iZVsCfpWDzOKGQZh5ZQmp
   QIrU+t8E7KK5HHRNm2ClqzCrpvEcobbMYAJdJ5gk3XY/dJlgwTkxLXJOg
   q6qUx5ka4beo5Js0ynfaJb7f9roGvh4K/GjMSxDb7vpSvkqAPYa9LnYs1
   tL9AGearbsn2IBks6ZYbFkQMYKhGpZO1k5ertXmXGTjV38v9tUdZjPkFe
   w==;
X-CSE-ConnectionGUID: 93qsY+0kQjKbP1Vjd5tgPw==
X-CSE-MsgGUID: KxoczmWZRYyPFfJWXQdGbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86410084"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86410084"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:21 -0700
X-CSE-ConnectionGUID: 9zoJFC4DSwuuBTTeSu2JyA==
X-CSE-MsgGUID: 0f5b06qbSLeAJv+Q567URQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263500995"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:19 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 00/14] i3c: Support IBI-based system wakeup
Date: Tue,  4 Aug 2026 16:37:56 +0300
Message-ID: <20260804133810.184905-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063822_074147_19908994 
X-CRM114-Status: GOOD (  16.87  )
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

Intel LPSS I3C controllers support up to two I3C busses and can wake the
system from an In-Band Interrupt (IBI) via a PCI PME.  Today that wakeup
capability lives only at the PCI function, with no way to express which
I3C device is actually responsible for waking the system, and no way for
user space to enable or disable wakeup on a per-device basis.

This series pushes the wakeup capability down to the individual I3C
devices and then aggregates the resulting wakeup state back up to the PCI
device.

An IBI-capable I3C device on a bus whose controller can wake the system
is marked as wakeup capable, so it can be managed through the standard
device wakeup framework (e.g. via power/wakeup in sysfs).  When such a
device is enabled for wakeup, a wakeup event is reported each time it
queues an IBI.

At suspend time, the mipi-i3c-hci PCI driver aggregates the wakeup
configuration of the I3C devices across its HCI instances (up to two I3C
busses) and enables PCI wakeup (PME) only when at least one attached I3C
device is enabled as a wakeup source and has IBI enabled.  This keeps
the PCI wakeup state in sync with the actual requirements of the devices
on the busses.

The series is organised as follows:

 - Patch 1 fixes a pre-existing recursive acquisition of the bus rwsem
   in i3c_master_register_new_i3c_devs().  The remaining patches add
   work to that same function, so the locking is corrected first.

 - Patches 2-7 fix use-after-free and unlocked accesses of the i3c_device
   desc pointer.  Moving device registration out from under the bus lock
   in patch 1 is what makes it possible to take the bus lock in the
   helpers that run during registration.

 - Patches 8-11 add the generic I3C core support: an ibi_wakeup flag for
   controllers, marking IBI-capable devices as wakeup capable, reporting
   wakeup events on IBIs, a helper to query whether any device on a bus
   has both wakeup and IBI enabled, and a fix to reject IBI requests
   from devices that do not advertise IBI capability.

 - Patches 12-14 wire this up for the mipi-i3c-hci driver: propagate the
   aggregated I3C wakeup requirements to the PCI function, factor out
   i3c_hci_sysdev() for the shared device lookup, and advertise IBI
   wakeup capability when the underlying system device can wake the
   system.

Note, since the PCI wakeup state is now derived from the wakeup
configuration of the attached I3C devices, the PCI device's
power/wakeup sysfs attribute no longer provides independent wakeup
control.


Changes in V3:

    Added 6 patches (2-7) that fix use-after-free and unlocked accesses
    of the i3c_device desc pointer.  Moving device registration out from
    under the bus lock in patch 1 is what allows that pointer to be
    protected in the helpers that run during registration.

    i3c: master: Fix recursive locking during device registration
	Added Cc: stable@vger.kernel.org

    i3c: master: Add helper to query bus wakeup requirements
	Skip the master device explicitly.  Noted in the kernel-doc that
	wakeup enablement is user space policy, so the helper is meant to
	be called from a system suspend callback.

    Added Frank Li's Reviewed-by tags.

    Rebased onto i3c/next.


Changes in V2:

    Dropped the RFC tag.

    i3c: master: Fix recursive locking during device registration
	New patch

    i3c: master: Support IBI-based wakeup capability
	Dropped the redundant #include <linux/pm_wakeup.h>.  That header
	must not be included directly, and linux/device.h, which is
	already included, provides device_set_wakeup_capable().

    i3c: master: Add helper to query bus wakeup requirements
	i3c_master_any_wakeup_enabled() now also requires the device to
	have IBI enabled, not just system wakeup enabled, so that a
	device with no active IBI request does not keep PCI PME enabled.
	desc->ibi_lock is taken while checking.  The commit message and
	kernel-doc are updated to match.

    Rebased onto i3c/next.


Adrian Hunter (14):
      i3c: master: Fix recursive locking during device registration
      i3c: Fix unlocked dereference of dev->desc in i3c_device_get_supported_xfer_mode()
      i3c: master: Do not treat master device as a duplicate target
      i3c: master: Fix use-after-free of master->this
      i3c: Make dev->desc locking assumptions explicit
      i3c: master: Fix potential UAF in i3c_device_uevent()
      i3c: master: Fix potential UAF in i3c_device_match()
      i3c: master: Support IBI-based wakeup capability
      i3c: master: Report wakeup events for IBIs
      i3c: master: Add helper to query bus wakeup requirements
      i3c: master: Reject IBI requests from non-IBI-capable devices
      i3c: mipi-i3c-hci-pci: Propagate I3C wakeup requirements to PCI
      i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
      i3c: mipi-i3c-hci: Advertise IBI wakeup capability

 drivers/i3c/device.c                               |  13 +--
 drivers/i3c/internals.h                            |   5 +
 drivers/i3c/master.c                               | 120 ++++++++++++++++-----
 drivers/i3c/master/mipi-i3c-hci/core.c             |  15 +++
 drivers/i3c/master/mipi-i3c-hci/dma.c              |  15 +--
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   2 +
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  23 +++-
 include/linux/i3c/master.h                         |   5 +
 8 files changed, 150 insertions(+), 48 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
