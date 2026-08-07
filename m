Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E09C5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tZKUGm+Jv10TWhLNxCKsiJCV67wBBInNl5AAWxZvORI=; b=gFJMWiT+lNjz3/
	wYf0X6a1qH2qprhRchZIEFEPWxtMDoT/4Wu1oW8JOtJ2LdNuhHODUxM7WL3WTx0d7qdTDoBIQOzIE
	aG0P9+2Yv4xrE+frrxJKew2IQiNja9YQo82GmCNbCiI8jQNmmMcoxLo5zDhqmniBu9veGelGxNs1T
	XnBtrY2xmRQHk/wyYLOm7fZ1NsadEc0KUmyRUwi0HVOTEBIxLAvyKmVEQjOzHw4GCt77bPu6c/+ZY
	DLztP9fmK8Fip4Tlsdxprc4PC5Ez+BpJfc0qAIrEyVQbG/AyxfSTn1CA9Qw13vgpd+c6np3hQ43SM
	jm8VOPY2sUKw0O37egEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0o-00000008Igi-0Y27;
	Fri, 07 Aug 2026 14:57:30 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0l-00000008Ifs-2pB2
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114647; x=1817650647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2WaCSZxGgKegINJiKaWcVoLXmsHSne+ig0soIFKdlOc=;
  b=XayTku/rLNgOQi/roR27UuvfHcaG6xCzHpjRfUc2F2FSt3c0Lr5tTt5h
   Czl5CMwh5p4JCis/tZ4pYOzqSg6dDpAvViD5F1td7Ty6aLOOsAQ2bSH7V
   y4ssar8MHalkN2AwitDw7Qs+INKojqwl+/e7IF2h1wrpZaNf3I3wHjLqp
   6fKC0yZ+7JCAgV5uDAElXEOqERfy50bPtdq7v8J8szy5+KbWoUHD5K+Cs
   tT4Yho6LITIPDLBxTrnRBFmPGZFuM8xVAeXLRQJjoU+IUfRCS0KavS7Oe
   FT+AJqyp8fxjJmHS/We3WL/HdYmwVDGv9sw4qEkVaqOkOeWL5FVaxuJbY
   g==;
X-CSE-ConnectionGUID: RIdTjxWzQM+2/NIy+pdHUg==
X-CSE-MsgGUID: XTzhtFD/SF6EOv5mx3dxgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485173"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:24 -0700
X-CSE-ConnectionGUID: LTUT01a3QiGxeOn43IKJ6A==
X-CSE-MsgGUID: AysX7V1uQ/OddxOyWtxgVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809873"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:56:46 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	mukesh.savaliya@oss.qualcomm.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V5 00/14] i3c: Support IBI-based system wakeup
Date: Fri,  7 Aug 2026 17:56:24 +0300
Message-ID: <20260807145638.168865-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075727_784622_9DA1E7F6 
X-CRM114-Status: GOOD (  19.29  )
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


	Note: all patches except patch 7 now have Frank's Rev'd-by


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


Changes in V5:

    Added Frank Li's Reviewed-by and Mukesh Savaliya's Acked-by tags.


Changes in V4:

    i3c: master: Fix recursive locking during device registration
	Expanded the kernel-doc for the new struct i3c_device @node
	member to note that it is only for use by
	i3c_master_register_new_i3c_devs() and is not protected by a
	lock.

    i3c: master: Fix use-after-free of master->this
	Also reset master->this and bus.cur_master to NULL on the
	i3c_master_set_info() error path before freeing the allocated
	device.  Tidied up the commit message wording.

    i3c: master: Support IBI-based wakeup capability
	Shortened the comment about IBI-capable devices being wakeup
	capable.

    i3c: master: Add helper to query bus wakeup requirements
	Renamed i3c_master_any_wakeup_enabled() to
	i3c_master_has_wakeup_enabled_devs().

    i3c: mipi-i3c-hci-pci: Propagate I3C wakeup requirements to PCI
	Updated for the rename of i3c_master_any_wakeup_enabled() to
	i3c_master_has_wakeup_enabled_devs().

    i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
	Reworked the comment that moves with the code into kernel-doc,
	and mentioned that in the commit message.

    i3c: mipi-i3c-hci: Advertise IBI wakeup capability
	Updated the i3c_hci_sysdev() kernel-doc to mention system PM and
	wakeup, in place of the old comment tweak.

    Added Frank Li's Reviewed-by and Mukesh Savaliya's Acked-by tags.


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
 drivers/i3c/master.c                               | 119 ++++++++++++++++-----
 drivers/i3c/master/mipi-i3c-hci/core.c             |  20 ++++
 drivers/i3c/master/mipi-i3c-hci/dma.c              |  15 +--
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   2 +
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  23 +++-
 include/linux/i3c/master.h                         |   6 ++
 8 files changed, 155 insertions(+), 48 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
