Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E86CA0EF5
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Aug 2025 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hk50AVLGvSOVzozpyU75X3o3I5kRfliU/i1DcHKjIng=; b=ZPttDa8FJi2AwT
	O3EbpXvkF44nAIs2YnS0vv9MrYpma6pxp8Oj8oNJUXtqnQctgiJ8DF4Am1StB4boOvwdghifL/2Dp
	oZ0tVTLizSZrJ7YLA5hEeItI3HwL7pvUm8OUnHUYliESW8XrdOf09GA12VkEYClD3UVDrKi/Gvkgy
	sy6igd3M5A4bxa4rf/n7lidd82CXUEM2dgsxEXOeFGOGDI6emfutXX0Vt+6RWrhLKtDknDYuUrypw
	j6PCi8qfzCG/5qjJJOz9ubrXJFmHdm6e5KHNxVjmBCVQlOGBDn+UljnNKUWOfPRdIp4YNTeaY6/E2
	cp1Lai7Nwab8VSYifY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohUA-0000000DUUu-3sxi;
	Wed, 20 Aug 2025 12:00:10 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh5i-0000000DQkh-2OMt
	for linux-i3c@lists.infradead.org;
	Wed, 20 Aug 2025 11:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755689695; x=1787225695;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/NESwj3c/hk66cu8N0w1l4O3AB3LS+nYueZ0X7k/aDk=;
  b=KaZFJPJ+FyR13dKPDVuy+j84NR0a/YQitDx1T+lcuuv6U7DTJ4cptVoz
   J3GDTHrrVHv0I5PSPJHc9FwKc43x3x3ePzgNcab/Ea4J3rrLGwdNvxCwh
   isTBiVo43/RaqnSyCHMNiZB7DTMczGOVLOO4MDX3xHFXdCLUJEpGfGTy1
   bB0uRPiRumbXnMfC7N5xnToMp9GU8Sxbvtt/nXLjzGlKQMZtpjtfXtPzN
   ou+lNbnzhHNHFE3hrPkYTJ0iQ9bZKDb4ru7L7Rxoti7mDi6I0zlm8M7Ay
   9xUABKVnadWvUTITz2Tixwa6hME8PYGv1a844smojCO9v/v23eMJWjMC3
   g==;
X-CSE-ConnectionGUID: Skt2dL8RQ4eAo7mpEhh7EA==
X-CSE-MsgGUID: SbL3A+PsRLO2Cjrp7YI9Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61590975"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61590975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 04:34:54 -0700
X-CSE-ConnectionGUID: S6Bus/AiQj6wLzhE1yVgTA==
X-CSE-MsgGUID: Gj3Q8iwyQ2CB51hlUxFy/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168016644"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2025 04:34:52 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 0/4] i3c: mipi-i3c-hci: Make able to work with IOMMU enabled
Date: Wed, 20 Aug 2025 14:34:43 +0300
Message-ID: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_043454_647856_4A403E30 
X-CRM114-Status: UNSURE (   8.09  )
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

Here's the 3nd version of common I3C core DMA mapping and bounce buffering
handling and making the MIPI I3C HCI able to work with IOMMU enabled.

Changes to the v2:
- patch 1/4: Use explicit kfree() calls in i3c_master_dma_unmap_single().
  Empty line added to the i3c_master_dma_map_single().
- patch 2/4: Call explicitly i3c_master_dma_unmap_single() in
  hci_dma_unmap_xfer().
- patch 4/4: Added Reviewed-by tag.

Changes to the v1:
- DMA mapping length is also cache_line_size() aligned in order to avoid
  possible double bouncing from the SWIOTLB.
- Using DEFINE_FREE and __free infra for cleanup and changes to the other
  patches accordingly.
- Added more description to the patch 1/4 commit log and slight corrections
  to others.

Jarkko Nikula (4):
  i3c: master: Add helpers for DMA mapping and bounce buffer handling
  i3c: mipi-i3c-hci: Use core helpers for DMA mapping and bounce
    buffering
  i3c: mipi-i3c-hci: Use physical device pointer with DMA API
  i3c: mipi-i3c-hci: Use own DMA bounce buffer management for I2C
    transfers

 drivers/i3c/master.c                   | 73 ++++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/core.c | 40 +-------------
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 69 ++++++++++++++----------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +-
 include/linux/i3c/master.h             | 26 +++++++++
 5 files changed, 143 insertions(+), 68 deletions(-)

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
