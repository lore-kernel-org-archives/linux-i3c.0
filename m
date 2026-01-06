Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332FACE9D7D
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YGuQSzgqLIcHy/2vYLH8nWcXHw5TXEUoaCojGtb+UnA=; b=uR7TBeZX7GS6X+
	s0Gu3maazaPVfTuC0mEhH4gaRCblrZ/Sk7BKgaLEDPvu+S5ybe3U95Teqi7Repf7sUToNdCNNxFgL
	5i26JHiXIqi7cbbuQUbnuiWSytqZg8RSDh0HkoZ+emGwqrQ9ZwJjALs//9NRzcqavOZhZRmEhzezI
	Xb10XOkJQA0ybMMwDZyE7+Oqta5YXTzsOlMXE+gP4sMgLoqJfSM96lUSPFygDQIFXbvyhzGqHaGoT
	uIJRHwkaumM1QvBGQeSvVxvHI7LK0TEojN+gEF9QzFTe1J8EscQtIK+w2GV+pQeJ5iXkbr6m9spZE
	1J8jaFeow666HK4qBfRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAm-0000000DWNa-41oQ;
	Tue, 06 Jan 2026 16:44:44 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAk-0000000DWMs-2Bl3
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717883; x=1799253883;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CUgMBXKmA/cTdaiZOzvKxTBaRgMHDVfFEumemaa/XKc=;
  b=bk3GRxVlVGELcPlFJMFm18/5ZrF9ch58DloqKZT3IduS8D9ugbVGsyvJ
   5B1xgc/gQTP3I3hanIBFQE0Gpzuj+SQIdSAdox2gRst0bFcXeokMonqYx
   T6l4OBqjA/3npCXj55MOpGTWwr8pGK5rblwbVjpTRgYK5dZ1CWv0Th3ZQ
   yqEBAZa89LCkVfxgpiRh9t+GuL6djWyAG++5K0JLYYmJIZOxEnQbBQmZW
   drsvwTvpp/w9NoFQD3aySUHam5ikHu9S/5PIpQ2adCDWIq5H+V6xUJ5nC
   KdpcY7FjwFUt8sP/Akmn5Dju73yHiyU/SVold3hI7gXs5Uga6wVR3c827
   Q==;
X-CSE-ConnectionGUID: eoreclc3QzGZrNFFl6Bqww==
X-CSE-MsgGUID: Gxecy2jvS7uBy3nxjj0DvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741808"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741808"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:41 -0800
X-CSE-ConnectionGUID: yQjjVpR3SIq1L8bJbJXAMg==
X-CSE-MsgGUID: vK4b1o50RlSf/siixVN/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838010"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:39 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 00/11] i3c: mipi-i3c-hci-pci: Define Multi-Bus Instances for Intel controllers
Date: Tue,  6 Jan 2026 18:44:05 +0200
Message-ID: <20260106164416.67074-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084442_607677_C38F7944 
X-CRM114-Status: GOOD (  10.07  )
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

All patches now have Frank's Rev'd-by


Changes in V4:
	Add Frank's Rev'd-by for patches 5 - 8, 10 - 11


Changes in V3:

  A notable change in V3 is the introduction of patch 6 "Assign unique
  device names and IDs for Intel LPSS I3C" which does away with dynamic
  devid allocaion.

    i3c: mipi-i3c-hci: Quieten initialization messages
	Minor white space tweaks to fix alignment

    i3c: mipi-i3c-hci-pci: Enable MSI support
	Enhance commit message

    i3c: mipi-i3c-hci-pci: Assign unique device names and IDs for Intel LPSS I3C
	New patch

    i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
	Enhance commit message

    i3c: mipi-i3c-hci-pci: Pass base regs as platform data to i3c core device
	Enhance commit message

    i3c: mipi-i3c-hci-pci: Convert to MFD driver
	Add Frank's Rev'd-by
	Adjust for doing away with dynamic devid allocation

    i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
	Make hci a parameter of mipi_i3c_hci_pci_alloc()
	Adjust for doing away with dynamic devid allocation
	Enhance commit message

    i3c: mipi-i3c-hci-pci: Define Multi-Bus instances for supported controllers
	Adjust for doing away with dynamic devid allocation


Changes in V2:
	Add Frank's Rev'd-by for patches 1 - 3
	Drop default driver data
	New patches split from "i3c: mipi-i3c-hci-pci: Add support for
	Multi-Bus Instances"
	Conversion to MFD split into separate patch
	Simplify ID allocation / free
	Correct use of __free()
	Also define instance 0 in driver_data


Add support for MIPI I3C Host Controllers with the Multi-Bus Instance
capability.  These controllers can host multiple I3C buses (up to 15)
within a single hardware function (e.g., PCIe B/D/F), providing one
indepedent HCI register set and corresponding I3C bus controller logic
per bus.

Add support for that to mipi-i3c-hci-pci and mipi-i3c-hci and define
Multi-Bus Instances for Intel controllers.

There are also some tidy-up patches to start with.


Adrian Hunter (11):
      i3c: mipi-i3c-hci: Remove duplicate blank lines
      i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
      i3c: mipi-i3c-hci: Quieten initialization messages
      i3c: mipi-i3c-hci-pci: Do not repeatedly check for NULL driver_data
      i3c: mipi-i3c-hci-pci: Enable MSI support
      i3c: mipi-i3c-hci-pci: Assign unique device names and IDs for Intel LPSS I3C
      i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
      i3c: mipi-i3c-hci-pci: Pass base regs as platform data to i3c core device
      i3c: mipi-i3c-hci-pci: Convert to MFD driver
      i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
      i3c: mipi-i3c-hci-pci: Define Multi-Bus instances for supported controllers

 drivers/i3c/master/Kconfig                         |   1 +
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |   2 -
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   2 -
 drivers/i3c/master/mipi-i3c-hci/core.c             |  48 +++++--
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |   1 -
 drivers/i3c/master/mipi-i3c-hci/dma.c              |   6 +-
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c         |  58 ++++----
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h         |   1 -
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   5 -
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 160 +++++++++++++--------
 drivers/i3c/master/mipi-i3c-hci/pio.c              |  17 ++-
 include/linux/platform_data/mipi-i3c-hci.h         |  15 ++
 12 files changed, 185 insertions(+), 131 deletions(-)
 create mode 100644 include/linux/platform_data/mipi-i3c-hci.h


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
