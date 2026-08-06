Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733B0C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tbANcl9e45gaUhnM60LxSAIf1bOobN2lagketjI3ZYI=; b=Klm12iA0HaIpqH
	qRJGm8Xrk3p8YHsE6sljVz3RsQtxcqLIhH/xoYr+3SjQo9nT8PlSAfSSZAuDY7++WnuRVFM9d4TSf
	BT06qSflnL+ZKr1gDN3DEisB70nKcEkCfN9zXIeewZd/5mlY79+8KJYww27UZTxy22lTDYl9PoBk2
	QLso6TXQmySdrFn8vmrRghVpn2p3j9473T47/nH+7OrN+5hCibbCEN78vTqaeWZkMSYS1H/4LkwBb
	PbJEeB1MQ+6erptJcYXFKY0zzi5/R9ZOFgSvAD/1EDaASeqEeDe500J8hkeTQmMtGh/wSx9DBbC4A
	ohf8fmnS5HoAKR5IZtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0B-00000005rw4-0d1w;
	Thu, 06 Aug 2026 13:19:15 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry08-00000005ruv-1dc0
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022352; x=1817558352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X9wiHcdZyT6uK9JZ6cIuCTNvjFx8pyMLXoGwDHwq1NE=;
  b=AeWvJjRi6QjFbEwikEQRQM5pH70/Lvn3sxOtkE4Fk7qId194+pmqLBYu
   Xg3sKWikO+hqZMRq7FaFvCE3mwQSJiQMgFxK+DvnmSARRdtLItMMplrvG
   iAHyP9HizBZG/2WqOMeEUT0ApzRR+ES5dCf4vjGWckZU6NO1+Ufo0bvn3
   tcac2gb/l24/DqOk6K0dsg7FWGHHJh3h1iOQH98iNBTTpJqE0iFfSFEf3
   NsNWnjONJIIz+sltj00QjJ3Qab4rfWYCe/xye7lVyP0YU1axSehR+H7wL
   RiBfhJvVXltHlhmv/t7zWX65nAhYBnyvlFdi8kUM+f4aN/EUU2BQSdsY2
   g==;
X-CSE-ConnectionGUID: jyxcskRpTH2dcRxEDcgxwg==
X-CSE-MsgGUID: 9W658XM5TJWZd6FXryQUmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149499"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:08 -0700
X-CSE-ConnectionGUID: WgxdP/45QyOmO3RBmkg5dQ==
X-CSE-MsgGUID: BN0SnQSaSJS6K7UB7Y7vfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338028"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:05 -0700
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
Subject: [PATCH V4 00/14] i3c: Support IBI-based system wakeup
Date: Thu,  6 Aug 2026 16:18:43 +0300
Message-ID: <20260806131857.119830-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061912_470253_1590400D 
X-CRM114-Status: GOOD (  19.51  )
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
