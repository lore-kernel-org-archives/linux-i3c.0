Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBBAD609D2
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4yZnV0qFNWVjz1F2Bv6ueUDs+YwnkEU3deQxHOZraik=; b=pOh5/YPu5+a6hR
	OwSK7ePgbjtMlrXGSCBWpTbmLvjCaiZKEYWoJHYdjZFbH4IIq7cftax8cWAAzzd5E0uBG4aDZTIpE
	krP0O9eGiQO7aeDkotXbXXBkSPpbI/blsay6wnUfObXbUbT21WsT1xKGTza3Owh5SmlfI6gPoMaQt
	0taDBwXoVmcuqU3BYXOZb+U0ge5InsRHSMb3SxaUR64uAV7+mCrMF6C26p4DSdGaWaMGBRG+3IAgF
	6ha2Nzpjee1uPM0Sr9uoWENKbml9XEgx2DBuDqeTYBvTBnxRSOYOajkclK+Zw54n1gHpMuBGd7aEq
	O7GWNgrU3p2FQtAQKbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYM7-00000005ZLM-2BDI;
	Tue, 16 Dec 2025 16:56:59 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYM2-00000005ZJq-3MD0
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904215; x=1797440215;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Za7kWnIJIsbHhhVJpB+3dqT8exC2uEwE06rfZoYeN3c=;
  b=KyDKCLau5Rb1f32qwtpCUzHFdGhisGc9Y/1EWQO5o8Cq6wW7q7WYtDC8
   EP/s+M79/SvZJDmV421OV9ID9C3HhIlbFHsQ7OvtYWSjJQkT5ngSNhBcc
   5BrXSjVWCEqEjSnyRAz7SO3UKMYf3wNv6s1Ua5AHXxLXknOMcayXV6mhs
   HSNPJGuG+ihGbiNP/GRYI8D6oTfV6VKwf5yk3mQXWqbrF/7dgZpKd6KST
   6DqYXG7Jyzt2/yBeG95bJyE9nagHsI4fe9fpi+i55K5ZM0sATsq6E+8KT
   u7VJskxApjnkm4KxFzo/CPEvi0mbjOQSnFfzVinTSDu06u8Aq0lS9/sxM
   g==;
X-CSE-ConnectionGUID: 0Vct8Jy7RryVOZ2sOIoGaQ==
X-CSE-MsgGUID: DHQSX9QjSvu8+ny6Cp001g==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466713"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:56:52 -0800
X-CSE-ConnectionGUID: 9xgzLY9HTBijyE6Cl65B/Q==
X-CSE-MsgGUID: 6be29gTTQgaOMgE8ffiMfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817574"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:56:51 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 00/11] i3c: mipi-i3c-hci-pci: Define Multi-Bus Instances for Intel controllers
Date: Tue, 16 Dec 2025 18:56:31 +0200
Message-ID: <20251216165642.164583-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085654_847402_302D4F0F 
X-CRM114-Status: UNSURE (   8.84  )
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
