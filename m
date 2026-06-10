Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713DACD8CB9
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jun 2026 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R3d86d1CwmfjGAXw9bVCSOGrlnedBOp80WAdsnDh2G0=; b=LZCmwMzDQX/Wfw
	XfZ6VpqIGcdjwJBKcSYW3KAPcHtB33SyR+1k++mxyx2h+sRcIcGQ2F3CvoVE8KUyrY1iDVzEBETSm
	nLDz2S+TURAfQFGoimY25sECbO1nS/8DneeT87D8FC2DJkuD7qm9K3mjPNj5Uf3agZLn8odDRG9Wx
	rW/dFtbZZPj0ykYBJbKrAkIIit4+p+Or9OOqxg6DEwTVU6O4ny6s4QPepTKE9Er1R1o4O8MezsDfu
	MwEl1Guiijd75zrkxAxHN5C9m8vwhdSqbsgyMoDh1xH+ZFWgZvv95lO7UQSY0aI/UDzYt0dTghBuF
	Bm4iXqw3Jt/4uSvOiZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOC-00000006xRG-39BN;
	Wed, 10 Jun 2026 07:30:16 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDO9-00000006xQn-1eGI
	for linux-i3c@lists.infradead.org;
	Wed, 10 Jun 2026 07:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781076613; x=1812612613;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nhYaNIDVR/9L2JokfiCSj09BFC6wC8LBW890q34vOu8=;
  b=Hc66fCsExF51U61bCMyZ7Rml3BvpWa9YJ9eRdMk6syPrmiP0FPpbwaFk
   0LXCICh3D6xRLYp7pc8DAw5i1DySUaXe0YM+mvZLn6+GBk11eG9ue6Bty
   gq4RFrSGGRPcj0q+bczcYHNAsIb7VWPGIYLFVeDiJ5soGzBg0yxlnFrd6
   NmaYyhEyUBYRdLkQwqp9qypduYElhLDTqGDb53jwZK3BK7Vh7j+MWs4ln
   c4HvBZhiRCqIuHpRTgBHWF795tqLpwFXpVbdW12pZgnQFNNC6SR24lnqq
   5pnXmLAoOzjr7Mn7wJ0VJa9GZxzOelGlgwB22vSh4nOvnS4SkzeOJKJMu
   g==;
X-CSE-ConnectionGUID: t1nEW0tHTQyczQEgm0pQMQ==
X-CSE-MsgGUID: jQ9XY4tjRNa4insmo97KJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80878397"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80878397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:07 -0700
X-CSE-ConnectionGUID: U4Z0HwXEQz+D9GIOGO+vsg==
X-CSE-MsgGUID: 5mgS0wZ9RKiMzs42EehYEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270103430"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:05 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/7] i3c: Fix IBI race, address handling, and reconcile DAA
Date: Wed, 10 Jun 2026 10:28:45 +0300
Message-ID: <20260610072852.36934-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_003013_453320_7706289F 
X-CRM114-Status: GOOD (  10.55  )
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

      [PATCH V3 0/8] i3c: Hot-Join improvements and MIPI HCI Hot-Join support
      https://lore.kernel.org/linux-i3c/20260608054312.10604-1-adrian.hunter@intel.com

which, in turn, applies on top of:

      [PATCH V5 00/17] i3c: mipi-i3c-hci: DMA abort, recovery and related improvements
      https://lore.kernel.org/linux-i3c/20260603090754.16252-1-adrian.hunter@intel.com


Changes in V3:
    i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
    i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
	Add Frank's Rev'd-by

    i3c: master: Prevent reuse of dynamic address on device add failure
	Add note to commit message about Direct RSTDAA deprecation

    i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures in DAA
    i3c: master: Make i3c_master_add_i3c_dev_locked() return void
    i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_locked()
	Add Frank's Rev'd-by

    i3c: master: Reconcile dynamic addresses after DAA
	Add comment about the source of I3C_DEV_PROBE_* macro values.
	Also account for static_addr in i3c_master_reconcile_dyn_addrs()

Changes in V2:
    i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
	Factor out __i3c_hci_disable_ibi() to facilitate also clearing
	ibi_devs[dat_idx] upon IBI free, and update commit message
	accordingly.
	Demote a message in PIO and DMA IBI handling, and update commit
	message accordingly.

    i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
	Re-base due to changes in previous patch.

    i3c: master: Prevent reuse of dynamic address on device add failure
	Fix 'if (IS_ERR(newdev)' error path.
	Be defensive and do not change the addr_slot_status if it is not
	free, and update commit message accordingly.
	Amend commit message to note removal of unnecesary 'if (!master)'
	check.
	Add Fixes tag.

    i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures in DAA
	None

    i3c: master: Make i3c_master_add_i3c_dev_locked() return void
	Re-base due to changes in previous patches.

    i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_locked()
	None

    i3c: master: Reconcile dynamic addresses after DAA
	Add bitmap.h include for bitmap_zero() etc.
	Re-base due to changes in previous patches.


Adrian Hunter (7):
      i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
      i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
      i3c: master: Prevent reuse of dynamic address on device add failure
      i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures in DAA
      i3c: master: Make i3c_master_add_i3c_dev_locked() return void
      i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_locked()
      i3c: master: Reconcile dynamic addresses after DAA

 drivers/i3c/master.c                     | 279 ++++++++++++++++++++++---------
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c   |  45 ++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c    |   7 +-
 drivers/i3c/master/mipi-i3c-hci/hci.h    |   1 +
 drivers/i3c/master/mipi-i3c-hci/ibi.h    |  13 +-
 drivers/i3c/master/mipi-i3c-hci/pio.c    |   7 +-
 include/linux/i3c/master.h               |   3 +-
 9 files changed, 254 insertions(+), 109 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
