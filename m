Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48F9CD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eTNnsu525QFvDL7Ex3oLNXtWxvvOmLZGhxw01st9B0U=; b=IdI6VSfRYEagtU
	PkieQ8wR1sK812cRlQMbHR0p72P13huwlJUIW/6bmlsDhTxkCKm74/h+taGR8lOG6zi9GWrXxr3yT
	AQFUngYaKj7sE3DuKNeKXiEE+IW6q9x/7e88zSHxFcsnT9r4fT+HMibOC2vr/nZGDfxM5CVYzZO0W
	FjHp8KzMeXxKraIeD+0gZuT1EV6xZtgktpbaHLqOmZp7Ed02IqxBbOH+rYJPCgiVyvZ5snE9Yrr/t
	tRby/YD8HqRyjGkZ4rCB0WhHGYWVArAYp2qlyA35E2vq87IRwBVr+0VbguGGR0orUAv7GpSR/S72z
	gKBy5/hmO/c3pnFIi2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlk-00000002qrL-27Cc;
	Mon, 08 Jun 2026 05:43:28 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSli-00000002qqO-0FV7
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897406; x=1812433406;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VwUizN8TyqgxzPB10sCnLjXm38KpHEK7Ds9P8/PIOac=;
  b=U+1EIsnrS93IM570BObm9RoEtwfSTIWjg92Jgag+ZQRt5vwneLpSC0RN
   IJb4dUXJctyuRlOjicai0B097S7soP+zgfLAC0PkYI880pGCMWTV0KeFF
   iDqFI70HWtRV0rSuEqRVeJC20+OzF7daPakp0qc7vm3Cuj6p6DZDEi1BW
   nEnSnF+1CYNfG+8U767ccC1P8R1YpiWommNUqE8jJM2PTVhfaDbJF9+2K
   5zOWyOTLOWUlBVD8zcpzYRHdsUQ7NxREXFywlj4gxiNawYttt7q0HACWs
   othUZZkiMEcbcREfcHhBmulFgOzNCyVYsypXeGPNhY/YLuCxrcUHAFqtP
   Q==;
X-CSE-ConnectionGUID: XtDMdt2MTeOSrLdKHJeI1A==
X-CSE-MsgGUID: 4rflYTeyQfGOC2Yc0zPZew==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284008"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284008"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:23 -0700
X-CSE-ConnectionGUID: zNpIMTRuQOyJnaQZ129WHQ==
X-CSE-MsgGUID: JxMSitg/RXqXGeVwe8qUnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505648"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:20 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/8] i3c: Hot-Join improvements and MIPI HCI Hot-Join support
Date: Mon,  8 Jun 2026 08:43:04 +0300
Message-ID: <20260608054312.10604-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224326_172610_DD09A44D 
X-CRM114-Status: UNSURE (   7.48  )
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


	Note all patches have now been reviewed by Frank.


It applies on top of:

  https://lore.kernel.org/linux-i3c/20260603090754.16252-1-adrian.hunter@intel.com/

which is also fully reviewed by Frank.

Patches 1-2 fix latent races in the existing Hot-Join machinery
(suspend vs. Hot-Join work, and concurrent sysfs writers).

Patches 3-5 consolidate the per-driver Hot-Join worker into the core
and add proper teardown via an i3c_bus_type shutdown callback.

Patch 6 defers driver-model registration of newly discovered devices
out of the DAA caller's context, so resume-time DAA does not push
device probing into the controller's resume sequence.

Patches 7-8 add Hot-Join support to MIPI I3C HCI.


Changes in V3:

    i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
	Add Frank's Rev'd by

    i3c: master: Defer new-device registration out of DAA caller context
	Add Frank's Rev'd by

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
