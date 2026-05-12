Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23609CD4F21
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 12:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7pKvYm/FjpBtL5psA5L71ybaxIdaACqwPcMyV/7Ci/4=; b=G2zl9ZOgJnlvPx
	rjXrZi3EaSjkzfg7Yf53Q0bEcWG3LGv1keKR2MjInfGHeRzgaofTQDb2KtYHBfwsAyf8urzi2AsC+
	eE4hIJjE2UqWrgrE/gyZJylEEck9y+eSwG1WnrovJfW2MHAWSxfkgz/cI2vYNuxb9txWsm9dzc5J2
	Be/SdzYkob3XvXiTVXynBINNi6c3hoWTgw2uSMXomdQNxyRvSA6w4GHLODsWJCUe70LjMDAF0G1ak
	M3Ob4CYOxIWJrUYkqR+bAMgk5zJdcnl9ptTYibofW4JZ3qcCoUavH67ahOqfzVbB9toF7P12TPIGo
	93/Bn1B22+6CmwaGzCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3a-0000000GeC8-39Zr;
	Tue, 12 May 2026 12:17:50 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3X-0000000GeAf-3xgN
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 12:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778588268; x=1810124268;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qBhB8vCjk7YqqUpkaqCninKnkkW67DKDLw8CTOVe/9I=;
  b=WFGJqe8MptymnQpGweS/Fdp2UVu0yGcxwRZ9ukCvJu+UuCGVXK7Tq1rN
   LsFrT8r2NdWZeVVNcsO+vrf+g5pHiq/d1N/NOu2IhCa8R7GUlD3gLSee6
   q+snsgx5ZxayrOmogK7x3wXhzUjkAgHHVECqG195HABaHIEzYsWBT09XT
   VNuYImcNvl6cz9FGRpfSs9aHWUNFW3NxBPKLil9QBI7hcAA8cuxinILEB
   FvYGWLK+FBGUL6v78ramS33KtT8P3FwK6df9fg57AZ1bFemPDwuQSiJsW
   BMHN9sRoG0ZCxWkYkSrc7AgHxZuhtg/j8bBFF1wXjIhNebS3eAA7tYV+y
   w==;
X-CSE-ConnectionGUID: Cfz0Crl5R6WIhNcNm7Xc6Q==
X-CSE-MsgGUID: LSGbbnKlR4yg5s6Y3JGX8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79389476"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79389476"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:46 -0700
X-CSE-ConnectionGUID: gpy7RxJcTay2GCEox6lm1A==
X-CSE-MsgGUID: a02qa4dHQYefHpE6zp/QfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241756118"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.121])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:44 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] i3c: Hot-Join improvements and MIPI HCI Hot-Join support
Date: Tue, 12 May 2026 15:17:24 +0300
Message-ID: <20260512121732.406009-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_051748_031130_465DA4F9 
X-CRM114-Status: UNSURE (   7.01  )
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

This series tightens the I3C core's handling of Hot-Join across system
suspend, shutdown and unregister, consolidates the per-driver Hot-Join
worker into the core, and finally wires the MIPI I3C HCI driver into the
new Hot-Join framework.

It applies on top of:

  https://lore.kernel.org/linux-i3c/20260504113352.38490-1-adrian.hunter@intel.com/

Patches 1-2 fix latent races in the existing Hot-Join machinery
(suspend vs. Hot-Join work, and concurrent sysfs writers).

Patches 3-5 consolidate the per-driver Hot-Join worker into the core
and add proper teardown via an i3c_bus_type shutdown callback.

Patch 6 defers driver-model registration of newly discovered devices
out of the DAA caller's context, so resume-time DAA does not push
device probing into the controller's resume sequence.

Patches 7-8 add Hot-Join support to MIPI I3C HCI.


Adrian Hunter (8):
      i3c: master: Make hot-join workqueue freezable to block hot-join during suspend
      i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
      i3c: master: Consolidate Hot-Join DAA work in the core
      i3c: master: Ensure Hot-Join operations are stopped on shutdown
      i3c: dw: Drop redundant Hot-Join cancel_work_sync() in shutdown
      i3c: master: Defer new-device registration out of DAA caller context
      i3c: master: Export i3c_master_enec_disec_locked()
      i3c: mipi-i3c-hci: Add Hot-Join support

 drivers/i3c/master.c                   | 123 ++++++++++++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.c     |  15 +---
 drivers/i3c/master/dw-i3c-master.h     |   2 -
 drivers/i3c/master/i3c-master-cdns.c   |  14 +---
 drivers/i3c/master/mipi-i3c-hci/core.c |  50 +++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c  |   5 ++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |   1 +
 drivers/i3c/master/mipi-i3c-hci/pio.c  |   5 ++
 drivers/i3c/master/svc-i3c-master.c    |  14 +---
 include/linux/i3c/master.h             |  16 ++++-
 10 files changed, 174 insertions(+), 71 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
