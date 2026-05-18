Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5B5CD4F52
	for <linux-i3c@archiver.kernel.org>; Mon, 18 May 2026 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IkXnRYo7uabl3gayobFkGLz8q5yDBxQxX4ELqegN098=; b=aW7jE3CykIt48z
	ANO+UisGtGbb/SmEtIheSVocwK6IO9gzJJBUKb2W+eRAOgIuhvwyVejUVSw2eGXyzSSjaYC3DK3I4
	3QFWjWekrkiJtISbqW+eGvvm4Z60+xagOzYESqfGynz8JJEPfuvoFnn9OQzuszmTvHy+PHuUd/zde
	yD6zsmNqDSDIQBVMaqr9vnnTTq/D+6MeF2DNs4eYcqq2taPuDqN27jMurLnc8otYd/djWLQahCq85
	VjnLps3aq31w4mQIVJIC7BXBA6IQp6+B3rzowVW7uBWHewfLvdFoA50rIYPsuMcpC9PS1i2cKWmG4
	ITgiYiwEAEBM4QakWQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZR-0000000FW4Y-1bDg;
	Mon, 18 May 2026 11:55:41 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZP-0000000FW3B-1toj
	for linux-i3c@lists.infradead.org;
	Mon, 18 May 2026 11:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779105339; x=1810641339;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N1BVI4vCHN0idk5Tct9ApRQPRZ+noGVXctLqf2EgNI4=;
  b=SXR06YcQDAOhGgkMYTNrMTWZRUK+i/CuP7ImyowIVrOHk0p0oLvBo1dH
   6VUnrDVkeWKUmFTvja7M3LV4MpzRcOrCgnpzwdl1kc54VIX9rL/v7je5x
   OJFRTvX8zElMg6bUk9ea0W50MwKp3K5T+dq3YrSGWwpmF5MPLnWdggQqZ
   PgaMuCYuaFaV8aZ1GeLLCTYUEGx1dDKp7y5y+3yarnYSJl88C/zT+t0ng
   9AIjcdQJ3mecga1OVRuYyKJrZJGh6TN7Biq8mjEmLIoUyCqRnoM711OO7
   LpuiNZVP6IXi6y5T2q4yWkHbNKCSBLa3U9yHbiJvuXqMU/pN8zwIfjipR
   g==;
X-CSE-ConnectionGUID: FSmPNY9uQeq8qzBkTfBMsg==
X-CSE-MsgGUID: tvxhvhcmTqqduzcIUrFj7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91347031"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91347031"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:37 -0700
X-CSE-ConnectionGUID: oEsSGbmPTRqlGFNEOegzJA==
X-CSE-MsgGUID: h8hl3YPURGOEjd1HjokW4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239663391"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.220])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:34 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/8] i3c: Hot-Join improvements and MIPI HCI Hot-Join support
Date: Mon, 18 May 2026 14:55:11 +0300
Message-ID: <20260518115520.98335-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_045539_513748_C54D4F8A 
X-CRM114-Status: UNSURE (   7.59  )
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


Changes in V2:

    i3c: master: Make hot-join workqueue freezable to block hot-join during suspend
	Add Fixes tag
	Add Frank's Rev'd by

    i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
	Add Fixes tag

    i3c: master: Consolidate Hot-Join DAA work in the core
	Add Frank's Rev'd by

    i3c: master: Ensure Hot-Join operations are stopped on shutdown
	Add dependency note to commit message
	Add Fixes tag
	Add Frank's Rev'd by

    i3c: dw: Drop redundant Hot-Join cancel_work_sync() in shutdown
	Add Frank's Rev'd by

    i3c: master: Defer new-device registration out of DAA caller context
	Add comment about reg_work use
	Add Fixes tag

    i3c: master: Export i3c_master_enec_disec_locked()
	Add Frank's Rev'd by

    i3c: mipi-i3c-hci: Add Hot-Join support
	Add Frank's Rev'd by


Adrian Hunter (8):
      i3c: master: Make hot-join workqueue freezable to block hot-join during suspend
      i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
      i3c: master: Consolidate Hot-Join DAA work in the core
      i3c: master: Ensure Hot-Join operations are stopped on shutdown
      i3c: dw: Drop redundant Hot-Join cancel_work_sync() in shutdown
      i3c: master: Defer new-device registration out of DAA caller context
      i3c: master: Export i3c_master_enec_disec_locked()
      i3c: mipi-i3c-hci: Add Hot-Join support

 drivers/i3c/master.c                   | 129 ++++++++++++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.c     |  15 +---
 drivers/i3c/master/dw-i3c-master.h     |   2 -
 drivers/i3c/master/i3c-master-cdns.c   |  14 +---
 drivers/i3c/master/mipi-i3c-hci/core.c |  50 ++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c  |   5 ++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |   1 +
 drivers/i3c/master/mipi-i3c-hci/pio.c  |   5 ++
 drivers/i3c/master/svc-i3c-master.c    |  14 +---
 include/linux/i3c/master.h             |  16 +++-
 10 files changed, 179 insertions(+), 72 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
