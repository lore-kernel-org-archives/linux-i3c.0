Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EC3C43327
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y9O+RG/UJmjtiIiMhijn49DNS+ANy6nUbU2d4buBWfQ=; b=AiEnlNADgEqS2H
	mbNR3u3H5ZpJrx/l3Mt/S8pqAhboPA2SOnGfvdEUCS/pJBdpOPeaSv2f0s3jSil8TO4VPPMwP7J4O
	i+KcYicEJz5UJdskI/F5eYvZwWLOQBfj4klah0mdXBiM3WZ9S4xuWerhFRiVhvQmIINImUUAeff/O
	IcLkoaUhKMQOP6w1+UKDlhtGaeMzAPjXgSPYPG5bpPc5Lv+2xHe9cYCkrXZQ0VSz0xhrMmUwkihFR
	vEB1OCoMaDGcGZHeGTPeGCYh/gHaEqP1YPz2UGcpuQ2CpaCcSlpnbp6X3P47UXXGbtrOGr92eiEc0
	opBSS5MUAV+h+YsXdiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1LV-00000002x6a-1TfX;
	Wed, 01 Jul 2026 20:15:45 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1LT-00000002x67-2SKc
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936944; x=1814472944;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5IxV5XbO4AnpYPehtaq3aUnzZA7FZgIQgSUmkIeGleQ=;
  b=aID1ZVIoFwZ9rnQGw56e6sFc+YMgtqkbkYFocvtYYE/tHG1Swzt8Gjuu
   dqPFrRdRd5j5oLC8qqhZvDHI9kVZzzizumC1lE7Kr2RdRK94N2Wv1Id09
   8P12nIjWhV2l1Ys47yZzTvmMdPFgycQWiJ5FOKGDF+gX3DOvtMfma7mzq
   LteWa36RJNwn7Pe8FgFxOIc+HyvH25FMXV1QTroW77OavOKSzBecotUSu
   Z9BRJRRx/fheOD5hhhiwWdDc86L+e5ySoIvyGiuk2vVfvqltTivVE52pf
   8MXvD9caXHaS6ZsfTCG0ZKZIskTXC9bvWpEOoVERGr2qCzMj2a0DAG635
   w==;
X-CSE-ConnectionGUID: tkYvqti2RFKLbn6TKoFrHA==
X-CSE-MsgGUID: gtLsAe+KTdeWaqZ4suXiAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82671779"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82671779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:43 -0700
X-CSE-ConnectionGUID: ctUYThKLQ8+DNvkr4dPZVA==
X-CSE-MsgGUID: NW1iyglNR36nO3JfkyzlMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282737042"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:41 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH RFC RESEND 0/7] i3c: Support IBI-based system wakeup
Date: Wed,  1 Jul 2026 23:15:26 +0300
Message-ID: <20260701201533.220818-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131543_637317_E3487814 
X-CRM114-Status: GOOD (  12.60  )
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

[ Re-sent to correct email addresses of linux-pci and linux-pm mailing lists ]

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
device is enabled as a wakeup source.  This keeps the PCI wakeup state in
sync with the actual requirements of the devices on the busses.

The series is organised as follows:

 - Patches 1-4 add the generic I3C core support: an ibi_wakeup flag for
   controllers, marking IBI-capable devices as wakeup capable, reporting
   wakeup events on IBIs, a helper to query whether any device on a bus
   has wakeup enabled, and a fix to reject IBI requests from devices that
   do not advertise IBI capability.

 - Patches 5-7 wire this up for the mipi-i3c-hci driver: propagate the
   aggregated I3C wakeup requirements to the PCI function, factor out
   i3c_hci_sysdev() for the shared device lookup, and advertise IBI
   wakeup capability when the underlying system device can wake the
   system.

Note, since the PCI wakeup state is now derived from the wakeup
configuration of the attached I3C devices, the PCI device's
power/wakeup sysfs attribute no longer provides independent wakeup
control.


Adrian Hunter (7):
      i3c: master: Support IBI-based wakeup capability
      i3c: master: Report wakeup events for IBIs
      i3c: master: Add helper to query bus wakeup requirements
      i3c: master: Reject IBI requests from non-IBI-capable devices
      i3c: mipi-i3c-hci-pci: Propagate I3C wakeup requirements to PCI
      i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
      i3c: mipi-i3c-hci: Advertise IBI wakeup capability

 drivers/i3c/device.c                               |  8 +++--
 drivers/i3c/master.c                               | 41 ++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/core.c             | 15 ++++++++
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 15 +-------
 drivers/i3c/master/mipi-i3c-hci/hci.h              |  2 ++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 23 ++++++++++--
 include/linux/i3c/master.h                         |  3 ++
 7 files changed, 88 insertions(+), 19 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
