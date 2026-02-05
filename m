Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD3EC1E91
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Feb 2026 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2G7p6fUNnE3dBo7AMitS0EYRkKyKG+Kknz9TnpNkT4o=; b=hhm06t72t/cXck
	iSzli0Lm0xoDdu0QYMVN2sD5mQLRur+sZ0HjSTPAnXC19ZXtUAy38A0uv+WPoVcSfSgyXAxRG5SL9
	oqcRCSFQUzLioXRcP+YrwBf7gR5n84FZ2LPXQAVjwt4RUZPcz3T1RSeq9QyEKrkAFWe2hrpt1e9Z7
	2XO41r0I90vgsvPXEjFAMMORwxPnVOTtPnssjV6UHTz01IFAkApi+59qlZx3wfmzs0RoGbuE1MJ4i
	BPKpKLPeqneH32v0uG73JrILpKGQWkWZeT61KCN33+Q680i5R8CXewyKvBZ3ekZNFiQhhQLVe2a50
	rIqNDq6pyFrz8e6Ae8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwIk-00000009l68-3CHv;
	Thu, 05 Feb 2026 10:09:30 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwIg-00000009l5W-38GY
	for linux-i3c@lists.infradead.org;
	Thu, 05 Feb 2026 10:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770286167; x=1801822167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XfWKoqjkA9uI4Mdp8SJQYUFk/IKkOiHu9o0rYwwYGdY=;
  b=YO+yHU/9dPDJo0pmIdCVD9zEV1xLUHikq5+Ln6gKnr4W2F1kPM2sH++R
   gRIGSk2tW+IAjDJd+LZ6GtrHVoNsKEvcnG/oU1FH4im7i2SZ4jGe3tTbo
   pYukqMEE8VRtOGrl+d1EzZeoo34cFMJq+XbtfOIR2Yae4vP32Uexqe37w
   Op2CFvOGwYDWO4SbxIjDjGDVyunWS/brLz2fbqUtzQBT46RbrTScZ57EK
   +/IDRAKxg5atBvfpjMP+w4DJkrrGbpmm+cmVh7bq7gjFAnH/qDDNBZFhN
   UiEOt++hDiGpJh+mzdiVY8YyDim0mVF2FxsEPkZQGM9mxKiJlMh+kif/p
   g==;
X-CSE-ConnectionGUID: X/OqtoxzT82DoD4By6Ktkg==
X-CSE-MsgGUID: KlKR10Y3TJCD5nnW3HgwpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71471701"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71471701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:09:26 -0800
X-CSE-ConnectionGUID: i+dFWLDXSrqBpr+9/Xu0sw==
X-CSE-MsgGUID: 2P0HLyCFRgO4auRlhad9ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="214631167"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.58])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:09:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 0/5] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
Date: Thu,  5 Feb 2026 12:09:10 +0200
Message-ID: <20260205100915.19792-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_020926_862484_A30A1749 
X-CRM114-Status: UNSURE (   7.23  )
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
