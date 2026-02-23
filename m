Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C984E98DFF
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Feb 2026 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7CbeV1eClEG5EWxNOj7/2lkfQLkmTnEm1r0BDo+qQoQ=; b=1hokMWQzCofP25
	VTwtTxO6D78uu1IS552kEzjV5gJ1Q92fZ4XwMSSVlz9wPSj5uYLlFZk1iMDoIFcTB9tQcNtNh3Lji
	yYJhrfRXeSHeHvjqB000xXmrapquujq5+iauH8yVqrA81+sVk8Hu1196PvOnATkQFeLdW7A/tY7oa
	G/SoxnQYwsefRir0tbPgE/8uk9+v/iX/v8gaO5gV55U/IwW2jbqVWSCPQZGzF1MQKvdXR/zK86NNF
	nDhoWhqIUv7BZrw1CjbTlyym9PQpTaLrVkxOhjVC6FMTn6mV9HBl/FRBq4IyFUSjNMXFGkbfKDCeo
	t8ZCNIv60mI2gKJkrNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS7i-0000000HWmJ-3jTL;
	Mon, 23 Feb 2026 09:21:02 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS7d-0000000HWjW-2B8z
	for linux-i3c@lists.infradead.org;
	Mon, 23 Feb 2026 09:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771838457; x=1803374457;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oibbH2O3elq6kKizouY+eGoZSYy6Gkck+b6m4nXirkk=;
  b=HF2xOB5A+vShxDyiRODSb+SXr+7U57yddVqCOVnstL0O925T3Au7fzKN
   i66YIVcgVweicn73tIQeiE1dRAQ9SIXA5Ik2052liwxqakaSNKHQOBVNA
   Sihfq0cnbIdbxYPUsVjzvJnWhPbZlGTKU9FxG49SRVreAW27gVsR7oJ6t
   6vSWE3MzM+Y5ikKK19PNo/tvkcUzTjQKYg2+D8uO72SlenylLXensrF3g
   3BS8U+GC1C6iGe2s8Q6WdQkxdihqhdgnZNhyUmiea4D/Cmwni7NNzIqEf
   1tytOTAT7jURSm3mQQtvUp9OMv2HtClyIv7DVWfcxcdRNGTe6rq0M+XJk
   Q==;
X-CSE-ConnectionGUID: xhCxFjNbT4CQlEtH3xfA5Q==
X-CSE-MsgGUID: RV+FQHrWRfSIbMwTgqkDag==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72928676"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72928676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:20:53 -0800
X-CSE-ConnectionGUID: 60x7wAOlSumMBo5mmQEbVQ==
X-CSE-MsgGUID: AKFJ40pBT16sXvi5+KLPkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215346045"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.206])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:20:51 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V4 0/5] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
Date: Mon, 23 Feb 2026 11:20:36 +0200
Message-ID: <20260223092041.104689-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_012057_622330_7AF0629A 
X-CRM114-Status: UNSURE (   7.60  )
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

Note all patches now have Frank's Rev'd-by.


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
