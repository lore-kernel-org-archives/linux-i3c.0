Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB58E95385
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I6/rfX6RxS3Z/V+M8vtXrkuHZiI2OJL6lW3Mj8w2kiU=; b=lmQezoka3SXpqM
	fCPc+xekYQWUHa2TPu9W7PITg6ec+csq2S/i1VILC9e5wyuQrK7YL9txGKty3PU4+f6oeLEUkNj5h
	zSdf1JEs62uSlxMJIoC7pfpFPlm46+Na24oOVr1XXMb/Xqlmdlp8YGJOsalqJ2wQpsOq5rVPnv0ZW
	BlJU49TrW2VDOoLe0mofd+n87TVmcE9IlQ0yL7n+hAXwKscZzUmBQSyOcKesp5q+NUMcSQxWrf5NB
	VTB8Wazvt5eEkbG8DQkCogTyWnio3GSRcLwWUWo32BNCgCfjCVGwzy55Ky51tlh07Tssb/SAjB53/
	yPDRlmcurCpuGQPP0gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar0-00000008LHa-1wZt;
	Wed, 04 Feb 2026 11:15:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaqx-00000008LGo-0Czf
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 11:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203723; x=1801739723;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JiZ/8/1B53sXpMXRHgNEYOv16nTOw7GQIOE1NQHCNxs=;
  b=ZqKBvUv7EYbgrXoO/fckN3B3mEOOjL7KvzRVAEAZ/MjmSDiNn9fpoFH8
   rxQVVUqGSR0ZOpVRo2LjyvFoTINDG2kWrM8N4N471DMYoPhudmGuSS0D7
   B2IqpRAvBleLQE+vp4iqDOMh7tqNmz76cIZthKYd6j0FaC2Dxg9DN3x3n
   03d8pg1MKuNXA8lOsMfElPFfXVSZXoQuYU5NMNjdObLuG2NQFbuWtUdht
   KskektMKvALMm7uU0mdmRQPUsPDythRjlGBsIt5VFE/TjRUAvBPPZrVaM
   yPU87k8iM009vKUuRTUTZnopXQsm4BPYYxro22yUyogf39ntHWt9xw64a
   A==;
X-CSE-ConnectionGUID: 6aIuldsWStKLuyUk1kVpeA==
X-CSE-MsgGUID: ODewVbNpSNSbNM5cYUsb+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70406039"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70406039"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:22 -0800
X-CSE-ConnectionGUID: Mf7uEao5Q8ORbfZbTiJlsQ==
X-CSE-MsgGUID: EllE/dtDTBCmTJoTe5fotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209739270"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.181])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:20 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 0/6] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
Date: Wed,  4 Feb 2026 13:15:05 +0200
Message-ID: <20260204111511.78626-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_031523_126851_475037DE 
X-CRM114-Status: UNSURE (   7.71  )
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


Adrian Hunter (6):
      i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
      i3c: master: Mark last_busy on IBI when runtime PM is allowed
      i3c: mipi-i3c-hci: Add quirk to allow IBI while runtime suspended
      i3c: mipi-i3c-hci: Allow parent to manage runtime PM
      i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
      i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers

 drivers/i3c/master.c                               |   5 +
 drivers/i3c/master/mipi-i3c-hci/core.c             |  35 +++++-
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   7 ++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 138 +++++++++++++++++++++
 4 files changed, 180 insertions(+), 5 deletions(-)

Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
