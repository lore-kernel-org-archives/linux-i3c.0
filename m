Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE0DD3B7EA
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 11:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YVBvrxslWyarNkveaE1nTb9vDnZ6iNzH+3jIKTI7wrY=; b=OQjSeuMXoolEPo
	ATYXgau+liGMlCNx9y5MSFspxNXyRJ9xUHrd7CbW0Q748EWy6EIRfR4yHLdZ8KWiT5TKkD3zJ4WxF
	/fgwC7CX6ofcax6TecDZ9OLF5jPJt8tIOcH7I6y7cdhBobHfUK/x+z5o8dR1P3Rmbaag/uAcOVIAk
	iVxyRfBidsL9uXvyDRrXbwAVLXjK9jE1UsviZqYxqIl7sWxoxkkpLaFujJX5unIpbc67PzBXvicbu
	wJotvEbelNcu0XnsUQRdj0FnQrIO7o/PcO4MknJ27Hf6s9keF69hDpiIZKSY7P+MG+QWOTGQDugOX
	SjlnM9uCh75SLP84bmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFR-0000000EDJj-2Nmx;
	Tue, 09 Dec 2025 11:51:17 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFO-0000000EDIC-3ayj
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 11:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765281075; x=1796817075;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vXjE51WUHTvCNPprvvFi+TTGP6s1yYqUTrCBRuf1ksI=;
  b=eeBW+tzOay39j+RZObBVQpeYlaBExpCkzWWOh/Z5TlYVoiVQhFP9t+hv
   FOAM80hNfo4IWt08BlxJf7mNdz/9p6j0n1ROB37qFWjcFGgEhj2NF8Iy+
   M3/7mCQl49kDNGO+9GwAjFOCAXAwqL2XHPm2IjWBi94riTgZnqJvZZ3BW
   u3ixYH+i9L2Zn8YD+OVgeJ62Q5ggQ08+VszCZnkj/QB+Psge5mqhtXENj
   ylDYPTBzTSelwIra97deMSO19xZ8cvxVLpvi9rR/ezzzhiae9KWAKyg28
   yMb9efDsu1IeNvjOBJIFkUFD0uiJIYBu5xmL+5Hvu4w20kIzwofK+Pw1w
   g==;
X-CSE-ConnectionGUID: ifpIxIxNQn+f1dlwX7ikjQ==
X-CSE-MsgGUID: CEcmTy6/Tkqxu+DgLVHaYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67271155"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67271155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:14 -0800
X-CSE-ConnectionGUID: 47J8/B6xR6u0/vXV5AQHuA==
X-CSE-MsgGUID: /H747jPfRr+lAIkHHhNmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200644419"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:12 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 0/7] i3c: mipi-i3c-hci-pci: Define Multi-Bus Instances for Intel controllers
Date: Tue,  9 Dec 2025 13:50:57 +0200
Message-ID: <20251209115104.124156-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_035114_944893_8D59A4AD 
X-CRM114-Status: UNSURE (   6.25  )
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

A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
multiple I3C Buses (up to 15), with one instance of the HCI Register Set
and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
hardware function (e.g. PCIe B/D/F).

Add support for that to mipi-i3c-hci-pci and mipi-i3c-hci and define
Multi-Bus Instances for Intel controllers.

There are also 3 minor tidy-up patches to start with.


Adrian Hunter (7):
      i3c: mipi-i3c-hci: Remove duplicate blank lines
      i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
      i3c: mipi-i3c-hci: Quieten initialization messages
      i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
      i3c: mipi-i3c-hci-pci: Define default driver data
      i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
      i3c: mipi-i3c-hci-pci: Define Multi-Bus Instances for Intel controllers

 drivers/i3c/master/Kconfig                         |   1 +
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |   2 -
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   2 -
 drivers/i3c/master/mipi-i3c-hci/core.c             |  41 +++--
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |   1 -
 drivers/i3c/master/mipi-i3c-hci/dma.c              |   6 +-
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c         |  42 ++---
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h         |   1 -
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   5 -
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 204 +++++++++++++++------
 drivers/i3c/master/mipi-i3c-hci/pio.c              |   9 +-
 include/linux/platform_data/mipi-i3c-hci.h         |  15 ++
 12 files changed, 215 insertions(+), 114 deletions(-)
 create mode 100644 include/linux/platform_data/mipi-i3c-hci.h


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
