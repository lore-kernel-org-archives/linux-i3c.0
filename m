Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0652CA0EFA
	for <linux-i3c@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yz98WpZR9xmvUjyhqxmudgzHFH23vdxvJ1xgVn1wf1A=; b=lXB65nWxZzkwAH
	BTJYQ7twNc42wqts5bKTbH1A/b6WJ9Gv+8O9xksmsL45z0g3P6i8LZMvmB1gjdD8lTy4kHdZlUEdm
	7xh3BbOMjC6dff3OPyOI78x1Ow7vF2uxKLMyhbx5woX7Kp1+2ajQ4YUhYJRTOVOW+BavZK4B8Db/7
	TiS9FmChBgQhdAiL2LDQV3Jvq1xxlY9Q2Ldhc7fzaQse6zA9yEGjP4cZwMrvQMJWgD7qRTlJ7fQqn
	0n1fNx3peid6AsmvvXMgRK4o4FnONnAbpkAXQJzEBSSiS8REGv0SvHKwa8Xa0Z+QhKiT8TjksaOeb
	uG+79cBeaYxoBDV4E6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpS-0000000449u-1njj;
	Sat, 23 Aug 2025 06:34:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPRq-00000002Fwy-2DIO
	for linux-i3c@lists.infradead.org;
	Fri, 22 Aug 2025 10:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755860202; x=1787396202;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IGjw+09QaIxGxJRdh1urNOK4peh8Gv+DjDA+VwLF0kE=;
  b=nRmeom3wlIwabxo4+6kVaNtWd9jud4jYy3c4OFhmiI2ggFHeXODlHvQe
   VwqbPCUZ0Q45p7+J97vjSu0vJUBirMbo4Zkk9JH4N05DQDH9s8xvmLOf9
   ZnuMqxURjVPOVdPepAGq4/TM8JhsFeMp5nPFi0W9zlLA9SmY34rsfI/3E
   pyRFh3qf4stH3xtCskBtbJq39IxV6PmZ7s9+F/ETBo/FpYdECxZsTdWsJ
   6wqaBj6TbA+UM3nE3vbmanwqC6WM26gRuDu77Ys6GOL0er1JhivLSEzb1
   sfGahkLh3mqZUbpYEThIo3amUk8L/+REp9AQes7H3hX74QsM/COlqPlND
   A==;
X-CSE-ConnectionGUID: W8DT8ffGTfeDQ6Ht0uoQGA==
X-CSE-MsgGUID: j9FUHTsyQRCZAhTXwWeMEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83581113"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="83581113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 03:56:33 -0700
X-CSE-ConnectionGUID: CMEijKOdScS/lPTjtl3r9w==
X-CSE-MsgGUID: quiEpc3+QhePQK5MoA9DMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169079955"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2025 03:56:32 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v4 0/4] mipi-i3c-hci: Make able to work with IOMMU enabled
Date: Fri, 22 Aug 2025 13:56:26 +0300
Message-ID: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_035642_601503_044A346E 
X-CRM114-Status: UNSURE (   8.27  )
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

Here's the 4th version of common I3C core DMA mapping and bounce buffering
handling and making the MIPI I3C HCI able to work with IOMMU enabled.

Changes to the v3:
- patch 1/4: Renamed variable "need_bounce" to "force_bounce" and document
  both true and false argument values.
- patch 3/4: Added Reviewed-by tag.

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

 drivers/i3c/master.c                   | 74 ++++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/core.c | 40 +-------------
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 69 ++++++++++++++----------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +-
 include/linux/i3c/master.h             | 26 +++++++++
 5 files changed, 144 insertions(+), 68 deletions(-)

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
