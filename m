Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F2BF01816
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9Wtv9PBGbttzEBxX8OArHWvCco6iJ6pi2X/fIqZHc0=; b=Cb+Ap4cEAXF1k3
	3bvMJFcu7A/aAnTWFuXvg5bpMqIOMT7Veobv9Ot5K7gm2AfpUfAX2AnBi2pDxOs0uw1rMJ23f+U2k
	PpxDcNd3hylpCbz6xLTNaPKUkJUvhIKXRNCiFrb6Wqdk/H+58Q7W3C9UwOf7TLTMKN6P4/Qg7dpUu
	A8KwT4Zahbb2K8/M5qGE1nS77B1LA9/+1o1jFSMz9eyHAeSC76/TQP6EbVDE6gS+CcJADFCk6cpa/
	c96X66QIHeAoivyKlCRumONSyNKMHcokh0ruVElKL9QB58To/gJEX4fu/fNdrYWfw14nM0RFsT/ig
	DvR+27ExrvqWCuTMD/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQwb-00000003J53-08ZX;
	Fri, 06 Mar 2026 08:54:01 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQwW-00000003J3e-4B0W
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 08:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772787237; x=1804323237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/i85oLSnCj5qMGi6p222uU20/vuUbnPx0CH1tfyzfPQ=;
  b=cONHY4Mr6OdP1ihFNX3M2gT+LSGQw+ebPSjvZC26hJY/V+4qS2QpO4IM
   2UG+wzF6bFJ7z3eHHjLWthc89djYVXJ5Xz0LwjbyurVjZhpvQq+53wqAb
   FTU+lwqkwK2tY5q/OdkcHKop8HgX/WLoS7y1OUmQzaINd0NXHuMJZri4D
   GbpIOGT/pyuCMkEPWXAuAUhBKT9vPMWTdmTvWRglLIOkv/EdUUvRNbaZe
   B8jVnL3ynHwkDY+2oO4o5ul5KbMb0XiIQT8nZpXVAWz2qptSvG+8CIvI0
   2I92firpPNdDLYnbcx/wg7kxJYKM6LE8lbV+TK2bo7JQDYPL0ym7SyA0B
   w==;
X-CSE-ConnectionGUID: dcaS4i2ES26f8HLOqUwmAA==
X-CSE-MsgGUID: NBOpXuZiSnqpT1TCTSvSgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91467204"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91467204"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:53:52 -0800
X-CSE-ConnectionGUID: /2+tIvBWQWakgOLOGX7Oxg==
X-CSE-MsgGUID: hwsKx16sRymtXFP8XZoAMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223641463"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:53:50 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V5 0/5] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
Date: Fri,  6 Mar 2026 10:53:33 +0200
Message-ID: <20260306085338.62955-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_005357_073691_A22B597A 
X-CRM114-Status: UNSURE (   7.09  )
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


	Please note all patches have Frank's Rev'd-by.


Changes in V5:

	Re-base on top of v7.0 fixes series:
		https://lore.kernel.org/linux-i3c/20260306072451.11131-1-adrian.hunter@intel.com/T

Changes in V4:

    i3c: mipi-i3c-hci: Allow parent to manage runtime PM
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
	Add Frank's Rev'd-by


Changes in V3:

    i3c: master: Mark last_busy on IBI when runtime PM is allowed
	Patch dropped

    i3c: mipi-i3c-hci: Add quirk to allow IBI while runtime suspended
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
	Remove unnecessary pm_runtime_mark_last_busy()

    i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
	Add Frank's Rev'd-by


Changes in V2:

    i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
	Add Frank's Rev'd-by

    i3c: master: Allow controller drivers to select runtime PM device
	Patch dropped

    i3c: master: Mark last_busy on IBI when runtime PM is allowed
	Adjusted slightly for earlier changes

    i3c: mipi-i3c-hci: Allow parent to manage runtime PM
	For HCI_QUIRK_RPM_PARENT_MANAGED case, change from
	disabling runtime PM to instead causing the runtime PM
	callbacks to do nothing

    i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
	Do not enable autosuspend.
	Callbacks for parent-managed invocation were renamed
	from i3c_hci_runtime_suspend to i3c_hci_rpm_suspend and
	from i3c_hci_runtime_resume to i3c_hci_rpm_resume.
	Amend commit message slightly.

    i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
	Retain HCI_QUIRK_RPM_ALLOWED
	Amend commit message accordingly


Here are patches related to enabling IBI while runtime suspended for Intel
controllers.

Intel LPSS I3C controllers can wake from runtime suspend to receive
in-band interrupts (IBIs).

It is non-trivial to implement because the parent PCI device has 2 I3C bus
instances (MIPI I3C HCI Multi-Bus Instance capability) represented by
platform devices with a separate driver, but the IBI-wakeup is shared by
both, which means runtime PM has to be managed by the parent PCI driver.

To make that work, the PCI driver handles runtime PM, but leverages the
mipi-i3c-hci platform driver's functionality for saving and restoring
controller state.


Adrian Hunter (5):
      i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
      i3c: mipi-i3c-hci: Add quirk to allow IBI while runtime suspended
      i3c: mipi-i3c-hci: Allow parent to manage runtime PM
      i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
      i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers

 drivers/i3c/master/mipi-i3c-hci/core.c             |  35 +++++-
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   7 ++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 135 +++++++++++++++++++++
 3 files changed, 172 insertions(+), 5 deletions(-)

Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
