Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33502CD5BD5
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vifHPJKQKopsqvX8Xuyedal89PTLnl6uSxDriCaX3w0=; b=Gn/XYaizRUPB50
	w3WfG5gurH16lRsXHW3E5rykeUKGY0TltSRt0NkemRtrp+wJCYDG6xDFHgvF4/bTVIPSkn+FMQIlA
	24jEr74ZrdzYmD4ga1SG2j2FnVq5RrCuZtyNBE7OfmNBdoBTvVo0BQGzjICBhws1moxIWvIGMvqSQ
	LGM4V/MJL2/CUX5JF1k9vp5OiaNN0JFNhCgvtJvOBRdAv7crSr4cZcJIp1chIXH7HGJQvaph/nkEo
	sYfhbqHIMiF3v0TP/VVIoHCvb0c7GQisi0XlzPS8U+YX70U+Ozl2RvQHW+Kmd/DYMHjbBX4rPVtVc
	br7aluZ/nPvW7jVNEcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQp-0000000407y-3GT4;
	Wed, 27 May 2026 11:28:15 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQm-0000000405q-0BXm
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 11:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779881292; x=1811417292;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dzzu7FShNiJj22rvjDqqW9GR1djV+A4osNPY2Bx+qa8=;
  b=JEa/4TVGXZHhtyI8WnGXkiy3b7o6jwwb7tTCkAk00tKdVsog5eLlys1m
   KPhZ3WWLfg2BWFVy5eGVRLPRQmWzPhxO8NTFLirK/dLfDXrbwY6wmXUMw
   Zpk2FdSNeN1rjGTr4PLKk21GOBGD8DXFZ0VOhMshgeii9rrS7AzK/9GLr
   M1RvKdHHEEnE+qNEhO+fIQDlZufSzx2NMLxtM1GUpzNHste1M83C6zcev
   feL40JSxAu4hXHQv5OeqJrpd0zo2JlLPk4uN14M9ebGhQZFIOAuTJRRrD
   mo+UbJyAE5H8jJc96sNe3ZprEvfpoIACs1jI9qQpwlb4dCOOeXFQ7qcAn
   w==;
X-CSE-ConnectionGUID: qJiloSznSUmIWkGM0/AkuA==
X-CSE-MsgGUID: T42WZDvrT/284rNc2pJL9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103381702"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="103381702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:09 -0700
X-CSE-ConnectionGUID: Uf59pBOwRk+hHBuJegiW6Q==
X-CSE-MsgGUID: D7RpiZTaRFWhM9q2XuFMtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246238567"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.228])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:08 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] i3c: Fix IBI race, address handling, and reconcile DAA
Date: Wed, 27 May 2026 14:27:51 +0300
Message-ID: <20260527112758.38530-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_042812_155851_62C69A94 
X-CRM114-Status: UNSURE (   6.88  )
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

Patches 1-2 fix a use-after-free race in the MIPI I3C HCI driver's IBI
handling and make IBI teardown resilient to DISEC failures.

Patches 3-7 fix address management issues in the I3C core and HCI
driver that arise when Dynamic Address Assignment (DAA) does not complete
cleanly, culminating in a reconciliation step that detects and resolves
inconsistencies between assigned address slots and registered devices.

Patches are based on top of:

      [PATCH V2 0/8] i3c: Hot-Join improvements and MIPI HCI Hot-Join support
      https://lore.kernel.org/linux-i3c/20260518115520.98335-1-adrian.hunter@intel.com/T

which, in turn, applies on top of:

      [PATCH V4 00/17] i3c: mipi-i3c-hci: DMA abort, recovery and related improvements
      https://lore.kernel.org/linux-i3c/20260515162621.57719-1-adrian.hunter@intel.com/


Adrian Hunter (7):
      i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
      i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
      i3c: master: Prevent reuse of dynamic address on device add failure
      i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures in DAA
      i3c: master: Make i3c_master_add_i3c_dev_locked() return void
      i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_locked()
      i3c: master: Reconcile dynamic addresses after DAA

 drivers/i3c/master.c                     | 268 +++++++++++++++++++++----------
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c   |  33 +++-
 drivers/i3c/master/mipi-i3c-hci/hci.h    |   1 +
 drivers/i3c/master/mipi-i3c-hci/ibi.h    |  13 +-
 include/linux/i3c/master.h               |   3 +-
 7 files changed, 224 insertions(+), 102 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
