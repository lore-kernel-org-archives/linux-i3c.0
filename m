Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0118FCA0EEB
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Aug 2025 16:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5B0XVECYoP8sDWzCyE3W4meEI8x/fQmGMNNHPnAbv4Y=; b=veyNgWclM7UQMn
	vhWvN1oplr2h7046Yrewga9J7G/mvEbS7F65SFMb/yTgLauZhLq/41B+H6lyecbiwQajAi24vAkhd
	2kMyrj5OmtZMY62MJdDA0vOWtlx5t27w9+mZfUAzOkRBBPTuyajY3Y5OlghIBnGjUEQ60YMxIOYA3
	yEMR/AXkgQg4kUj1eiCSQhwO8cpXxXUzPrUptc9AkGDHxA0lLVV/jZymdHlGWeHE7gmQ9+4pEz5RT
	/yDy/q0qbBDffbrK3WNzy+RUu8+DvBVzYqnwNOYqhanBtu37l1KICS/Bh4dGpkkCiZYlCIyTNa20+
	PlGJjjmshD1QrucFrJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx44-00000002wTT-34Tz;
	Fri, 15 Aug 2025 16:14:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvAy-00000002gfF-0Rqn
	for linux-i3c@bombadil.infradead.org;
	Fri, 15 Aug 2025 14:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=w6n04Dths0jkXASZfydadJccfttoqtMlQVMnuqzZzTk=; b=qz0GvL1hmgMEpm13lZRemII+Cy
	uJHXR8Kyv3CuOsZHV7cWp2dkgM6zGujyQrHiS/w4fkvq8BMVRsh2bDBLs6OecYo8fiirkYdzrTcyr
	M4yZBws0h4pPfeA3FL2IYDzHbUhPJArJmExZj264sk3DXsEHzePwtkHByRC+em1FoUiMWk3KgfDcK
	uAerwTAGfMSoFnt2tSE/zT8tQFh8fkfdBERRX6qxWAUeLFMfCp5D2Go34r70L3y2lCfpjwNXPyIQp
	3VmJJdSCF4pN2QmLgBmOJ6uggMcDFaPpPR2XWHzCZPCtfvRU1WjXtD2xzl0Bw9A+3vVPBF7VW16zL
	QiBtqLkg==;
Received: from mgamail.intel.com ([192.198.163.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvAt-0000000GjbU-2kui
	for linux-i3c@lists.infradead.org;
	Fri, 15 Aug 2025 14:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755267175; x=1786803175;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mv1BXT58QpSo3b5k/tm40irMNLPlO8DduysonfB0alw=;
  b=iV4pryeabbPl8EhjOIsLfCeYrLk44C+chwui1XCFt00rc/fjBQUCMwyk
   3xbsvhHSbtGFh4j7bhFMmgRGUZt7ngyujsrrc/iPYHD7X05dp3gL4kX/J
   fa1KWsdPZCf1T4Pn/bBdURaqbHGfjhLtVh6M5tmrUAJA+pTaPBaROVlcn
   VrZklaghu+aepF27ceE+fpkX2AoF8DywPay9StwLyOXzp6hbjUuxS14+A
   mhZ8XNHXrv4QrHSDjI2kVnolStVBZoA85I4qK0irKi4bQ3fwQ2UvEBKwL
   /47rn8kEIqu0qAtrHM7+Fsh1OqTqbJGsQO3baAwgCMASVIfEB25wDCzfV
   A==;
X-CSE-ConnectionGUID: Kx4Of07JTmeNop2tFr++zQ==
X-CSE-MsgGUID: 4iF/k6IWQOKfLbn3lYTgYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68292231"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68292231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 07:12:46 -0700
X-CSE-ConnectionGUID: 5QRkuSNjSca2S9cDUPfdkA==
X-CSE-MsgGUID: 9JTeYx+eQ2CV5uA3RLQBJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171474963"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.50])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2025 07:12:44 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 0/4] i3c: mipi-i3c-hci: Make able to work with IOMMU enabled
Date: Fri, 15 Aug 2025 17:12:38 +0300
Message-ID: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_151256_241573_01198870 
X-CRM114-Status: UNSURE (   7.49  )
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

Here's the 2nd version of common I3C core DMA mapping and bounce buffering
handling and making the MIPI I3C HCI able to work with IOMMU enabled.

Changes to the v1:
- DMA mapping length is also cache_line_size() aligned in order to avoid
  possible double bouncing from the SWIOTLB.
- Using DEFINE_FREE and __free infra for cleanup and changes to the other
  patches accordingly.
- Added more description to the patch 1/4 commit log and slight corrections
  to others.

---
v1: http://lists.infradead.org/pipermail/linux-i3c/2025-July/002721.html

Jarkko Nikula (4):
  i3c: master: Add helpers for DMA mapping and bounce buffer handling
  i3c: mipi-i3c-hci: Use core helpers for DMA mapping and bounce
    buffering
  i3c: mipi-i3c-hci: Use physical device pointer with DMA API
  i3c: mipi-i3c-hci: Use own DMA bounce buffer management for I2C
    transfers

 drivers/i3c/master.c                   | 69 ++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/core.c | 40 +-------------
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 74 +++++++++++++++-----------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +-
 include/linux/i3c/master.h             | 26 +++++++++
 5 files changed, 140 insertions(+), 72 deletions(-)

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
