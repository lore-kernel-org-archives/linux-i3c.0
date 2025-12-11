Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2178D41C35
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oJio+hjHnNdwRfnLvK0pVaRPxBvZO8CngjjbHvbPD2M=; b=c0/2vyRj1xSXwZ
	KyLJcBKHUiP+YmBBsFU6DgEjozO/k9HHJNM/9a/vWo0xgS6q2qxypUYk82iDwN4FXClRQgLP2oSCL
	KXPk7ejKFfjfFTm1eQbE3CrSe0I5qeL/IdrawXd5rf8gA7h1ZPxDD5aKutlvS2Yl8ZB7+e/Xhib/B
	3HZUK85i8t3XQukk9MuwD6y/s8xRKnVPR6PP8GJtAVQXlVNRP2US9AJOIydw1ebOXtyAP8Xvrp8/O
	Qoegr7VUR8tY42KMR7eOlctgmBeAs0EjBldtfkKvFhF1UYiazGdbqbMnolxecPGWiNOWjQumCkBxP
	tHOnlGCa47q+GdorZ6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh20-0000000Gfck-2HRe;
	Thu, 11 Dec 2025 13:48:32 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh1x-0000000GfbI-3POW
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460910; x=1796996910;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ha4DRXYvsNqTDPJH/GOkH4gQrzYY3IuWSYD+bIYS4PM=;
  b=j4JFWjZMsqKltJ3k38I2Tzz9Tx994OjhOIAfxtq4Eg817siSUV4AeTIT
   dIk9DQ5t4AQcM/aHQq4Xu8EDQf1ubQdyDZE9UXIMCKnz+ds28dHwzQs34
   LBtZ9zWTQFJGs9jZ7EApv2k29cunNJdkq+95vgnU4OfFv1Y8xMGWqAMGN
   c4EIOhnEsk2Erjkqqf4k+dECGs46ydJ7NQQ3DGzU8ULOAQPK0fRTm7hmS
   bkU2ndnBjmV/wty+eupXU62GrO+6xcViUwj4fwVh1OsJvCW3xsMznbO5I
   ZCInfq5FWh0Xl+G2bgOoaA4rOkwUcVeR+A89054qANWJur/WMWLUBhmVk
   Q==;
X-CSE-ConnectionGUID: XIQNWtkhQziecg0tOq6ang==
X-CSE-MsgGUID: 80BUAih9QKOIykNjcLtSNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481840"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:28 -0800
X-CSE-ConnectionGUID: LZkZjTi5Sjm0+FX3i0plcQ==
X-CSE-MsgGUID: LAztz8peQUePcSsLvXFXhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171643"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:26 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 00/10] i3c: mipi-i3c-hci-pci: Define Multi-Bus Instances for Intel controllers
Date: Thu, 11 Dec 2025 15:47:59 +0200
Message-ID: <20251211134809.75872-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054829_866641_B794C422 
X-CRM114-Status: UNSURE (   7.41  )
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
	Add Frank's Rev'd-by for patches 1 - 3
	Drop default driver data
	New patches split from "i3c: mipi-i3c-hci-pci: Add support for
	Multi-Bus Instances"
	Conversion to MFD split into separate patch
	Simplify ID allocation / free
	Correct use of __free()
	Also define instance 0 in driver_data


A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
multiple I3C Buses (up to 15), with one instance of the HCI Register Set
and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
hardware function (e.g. PCIe B/D/F).

Add support for that to mipi-i3c-hci-pci and mipi-i3c-hci and define
Multi-Bus Instances for Intel controllers.

There are also 3 minor tidy-up patches to start with.


Adrian Hunter (10):
      i3c: mipi-i3c-hci: Remove duplicate blank lines
      i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
      i3c: mipi-i3c-hci: Quieten initialization messages
      i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
      i3c: mipi-i3c-hci-pci: Do not repeatedly check for NULL driver_data
      i3c: mipi-i3c-hci-pci: Enable MSI support
      i3c: mipi-i3c-hci-pci: Use parent MMIO mapping
      i3c: mipi-i3c-hci-pci: Convert to MFD driver
      i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
      i3c: mipi-i3c-hci-pci: Define Multi-Bus Instances for Intel controllers

 drivers/i3c/master/Kconfig                         |   1 +
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |   2 -
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   2 -
 drivers/i3c/master/mipi-i3c-hci/core.c             |  41 +++--
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |   1 -
 drivers/i3c/master/mipi-i3c-hci/dma.c              |   6 +-
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c         |  42 +++--
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h         |   1 -
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   5 -
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 173 ++++++++++++++-------
 drivers/i3c/master/mipi-i3c-hci/pio.c              |   9 +-
 include/linux/platform_data/mipi-i3c-hci.h         |  15 ++
 12 files changed, 186 insertions(+), 112 deletions(-)
 create mode 100644 include/linux/platform_data/mipi-i3c-hci.h


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
