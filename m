Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282D1CD8C92
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 07:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4pP3/BG4+QCDsclE71ApnaTGgT56v9sT+tkkC6TVVsE=; b=NR+wGJCYcqNjk1
	4Nk2QLYa45WEWPpVoHUXgpuzdDunyEaKVMfgYSBXvPcBT6Jid3xYJKo9uBlTNSUq9NLEAsprVnJAj
	F9S4qTLCvUoPreTKFEHCQuRMa3ueMehQX/3jVmtvbebBEVN52mQ3/G0P1Yo7bJe2G2DsCtecu1T+h
	B8+CnQoNGhYysiE9U3qT9blD5RPnmQeTSnUxyxgVaZIOBSkbY4/rmYJPMgUaoZel+lCTbcIcsQ6h4
	AKpzdoMGI+2vZI+ckEIMD5PKth5NVIzm2avqW0nhfINarN/OqKPMYI2gFrEA35Mfr5odEgFo63+Wu
	Fv2Zm6b2XyVmJvonpmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUsU-000000031V8-3qK0;
	Mon, 08 Jun 2026 07:58:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUsT-000000031Tz-3l7p
	for linux-i3c@bombadil.infradead.org;
	Mon, 08 Jun 2026 07:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=nqogFi02uPOvXuO6nXRtX3RUr5du+zVQfcKel8Knhhg=; b=VvB+3TIFIPW+1AKUpPUvSPS2sL
	n731x7H8PJEao7KR8BYMHxi16xVZJsthwl+A1EaYegwafjaHfeLO6dLMJwrIkZbBZ/E+jqNs9kAgM
	3cBBem+buKbdhBrArz6THhh9thsGFqh/NtCyhSGhARqtrxWDirsT3xoKDR/zSJCct5XUgaEEZwfaB
	AfNzSC85U5cWhl+LOdlRVT1M1EHlfIhS79UODsdb6objuKxQUYwrNfYhxC1Mqmd/lR4wLQPE9pJEH
	kAav7hOra1f2V7RBP+wJZaXA8S7P2QET6F3ql77bGk34vMa0AZqvLfV4n1a5w70kUCANUh8mMOBwE
	aUPm4LDg==;
Received: from mgamail.intel.com ([198.175.65.14])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWUsP-00000000g5Y-3iIQ
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 07:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780905510; x=1812441510;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UzuDYZPqFX5BPQjO4p3IKnSU0VRRMQU16gwWHZnT7q4=;
  b=cUFz4b0ioPWTJYFt+U3qiSwhYqfJJh7NRSRyeIg6+yfeUqe0R14NQaNE
   jWBJhHPhLDIZAS7IfX+vPSzD96zgi4I9jm1+Hyc5j/oC0Bb7+vbthluYF
   9/fmpX1Tc3yRs6BWxDFEp/5yZaPX1RFnY9TblkE67azUbS5+pp1lqTlPH
   U/0MdgNDdlTH4zE4zN+SKMwchol6kwWndEU0NpLRgqrc4EaBHd4EIm+rs
   MPyfA+vtpZ7d+z+QJ1WQq3haqOH3FHOvr1KDM2iqY0PGPqJ0lFfeJheMQ
   C0Lqy2Zp1j+WDqWg2o0Djm6W8ANKeCX+GryEp1WrsW4zQ9vsP5Y1n3fNL
   A==;
X-CSE-ConnectionGUID: 27CDlaGyTYGPpn6oO5NRPA==
X-CSE-MsgGUID: y8KVx8HaQpG/OC5gIsz2zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85520137"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="85520137"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:24 -0700
X-CSE-ConnectionGUID: Q6bhdM6KSr6llxs42kgvbA==
X-CSE-MsgGUID: kCnnKn2rQparrvik99QAtg==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:22 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/7] i3c: Fix IBI race, address handling, and reconcile DAA
Date: Mon,  8 Jun 2026 10:57:53 +0300
Message-ID: <20260608075801.16111-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_085830_696326_653FB8B3 
X-CRM114-Status: UNSURE (   8.78  )
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

      [PATCH V3 0/8] i3c: Hot-Join improvements and MIPI HCI Hot-Join support
      https://lore.kernel.org/linux-i3c/20260608054312.10604-1-adrian.hunter@intel.com

which, in turn, applies on top of:

      [PATCH V5 00/17] i3c: mipi-i3c-hci: DMA abort, recovery and related improvements
      https://lore.kernel.org/linux-i3c/20260603090754.16252-1-adrian.hunter@intel.com


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

 drivers/i3c/master.c                     | 275 ++++++++++++++++++++++---------
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c   |  45 ++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c    |   7 +-
 drivers/i3c/master/mipi-i3c-hci/hci.h    |   1 +
 drivers/i3c/master/mipi-i3c-hci/ibi.h    |  13 +-
 drivers/i3c/master/mipi-i3c-hci/pio.c    |   7 +-
 include/linux/i3c/master.h               |   3 +-
 9 files changed, 250 insertions(+), 109 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
