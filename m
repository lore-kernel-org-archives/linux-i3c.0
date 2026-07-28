Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F14C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hloOPTfYupBE0sFVYFooJpuMCdTZjPgOpdwB9052BxI=; b=VEY5p9Ad++Z4UT
	g+R8/zeZO3IBcoQSsq92PFVJrgopfVo65oKhjLknIUTrIREE5eJtlxW0zTXpmALkpX53XZfkZq0oU
	UD+OmJtRv2z9Kc2heCms7AQgYHovZcI+9mEc+AHp3Up66Xq4+s0JIspQcGUjzghWocQX33z+zp0sv
	OOAiNhImKQQjxAAslP6Mrvw9DhazZit8lKTh15Xat2QjaFdFPCIUoAe3LkGufmMQx7LwvKTa7u8Bh
	4E2yxdmxrTEruIIe2bMSxkYbu4+53z/PpRt4WI+FT/51Ab0iFxCu529qZX9XyfkH52Jtw0MoSu9ps
	UxPTGOkMI+bXNZQ9kOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7P-00000005jCZ-0egY;
	Tue, 28 Jul 2026 15:53:23 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7M-00000005jBg-3gvH
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 15:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785254000; x=1816790000;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bdDTFgwVaJPzXbDXJHAYIe4NI0tDIzc2e4q5zy9J0l0=;
  b=IZ+rbe9O7si+f7xieQxlAalGQDutwNK1oeolmupRFKwMBqffJgQmP+nz
   22iOLtKJGk/wb3xc9xp+q08eBnMNjFxW8TsrLCeKKNQbQkNnmAPTIRAs5
   Jk20487Whc2vqwn34piV1WAlwtZYUqfa7o5UhgirjwkLx6oGXJzlH8z6N
   f4yMLumArSy/lD6RBAsy4s5saFqLeqiVQ8mQlmAmVhTy2qS6LiSG8NDsC
   TqOstfx4+HrIO5kb0QNBra4xW8N9xIrm5eQ46JYCoSu0Kf538jfYOg5C/
   sNPciSz4ROg1jtsqvUY8377pxL/QoEQXZT1GydGE1QfIOgHA/yvFz6by9
   w==;
X-CSE-ConnectionGUID: rx9wKPVYSmGbuUF+74hkIA==
X-CSE-MsgGUID: jqw0cXlRTIWhmTDTq0c6uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85696414"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85696414"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:19 -0700
X-CSE-ConnectionGUID: cIMVD2ezQdeCpH+ToN2W+A==
X-CSE-MsgGUID: fZlV2llzQ3GoGR7sjyRd9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255817355"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.126])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:16 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 0/8] i3c: Support IBI-based system wakeup
Date: Tue, 28 Jul 2026 18:53:00 +0300
Message-ID: <20260728155308.142713-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085321_012508_CFC919F8 
X-CRM114-Status: GOOD (  14.07  )
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

 - Patches 2-5 add the generic I3C core support: an ibi_wakeup flag for
   controllers, marking IBI-capable devices as wakeup capable, reporting
   wakeup events on IBIs, a helper to query whether any device on a bus
   has both wakeup and IBI enabled, and a fix to reject IBI requests
   from devices that do not advertise IBI capability.

 - Patches 6-8 wire this up for the mipi-i3c-hci driver: propagate the
   aggregated I3C wakeup requirements to the PCI function, factor out
   i3c_hci_sysdev() for the shared device lookup, and advertise IBI
   wakeup capability when the underlying system device can wake the
   system.

Note, since the PCI wakeup state is now derived from the wakeup
configuration of the attached I3C devices, the PCI device's
power/wakeup sysfs attribute no longer provides independent wakeup
control.


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


Adrian Hunter (8):
      i3c: master: Fix recursive locking during device registration
      i3c: master: Support IBI-based wakeup capability
      i3c: master: Report wakeup events for IBIs
      i3c: master: Add helper to query bus wakeup requirements
      i3c: master: Reject IBI requests from non-IBI-capable devices
      i3c: mipi-i3c-hci-pci: Propagate I3C wakeup requirements to PCI
      i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
      i3c: mipi-i3c-hci: Advertise IBI wakeup capability

 drivers/i3c/device.c                               |  8 ++-
 drivers/i3c/master.c                               | 84 +++++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/core.c             | 15 ++++
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 15 +---
 drivers/i3c/master/mipi-i3c-hci/hci.h              |  2 +
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 23 +++++-
 include/linux/i3c/master.h                         |  5 ++
 7 files changed, 123 insertions(+), 29 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
