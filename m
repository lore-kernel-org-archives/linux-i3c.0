Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6370CD78783
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VQCy7HnPs/ZZt+JvV20I5vr7Zca8inS3AO85kllItvY=; b=iCYwnzmidZjHAT
	FYyY0PR8/atg6aKDnYq0kaRDkEerzXo0FORYkIEh+ko9uRNWcJiyxgm/1lBknMN5dymxIO4YWYo9E
	CHgYAiYIKyt5T2qC219LehXVbi56tk2FBdwfNnBvwbJi+C/s3+xn/GOMA00y8KdB52Bk5zOEJXrt0
	lCWhw1jkp40NKNLKY52NVWGWgyPfF3cZOutFu96P+UOetDh7NgQ+iW37LmMAZwWLw1V1hM8ttjLaZ
	YUw7NKG4xuY4kRB5VhRSCSfX3OtOemESZjkajfkeriD330ZchIn00jA3XQMMn1uQoE/2ga86gV/aE
	AKYda3Ee3kaHIx05Vf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbjs-0000000ARN4-4ACw;
	Fri, 19 Dec 2025 14:45:52 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbjq-0000000ARLM-0Lqg
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155550; x=1797691550;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g7rMcMKDuPUlvq4LSmi3wxrDIEAbHs/pCYjwXGSc9yk=;
  b=KlxuiOICddt9YqfNTxFH7LJCNoz0jTdC5ha0Al80bfXmfQxG605IGfIS
   AQjUBgqdoBcFS+xEaY8fIlECrxjMVcBAMaoRU/1oA1p+F3/YkS3UrK4VU
   Tkxhhgny0nkgrEWpQRBNRX5R3QB8hhomElVdCYqY5rXoyJhqm4Sdk4RQB
   05yY4SCmAHbzUbDJgWOauhY645tcVECzNpJIgeVd+SBGDtde1IBctGsJi
   nKwnf0Z7zWIVqaUO3aYSU0yx9eBaZnL4rYpwPXQeBgOclbniS0gEzjZxH
   mUFfaN3qOISBy7L4gSn0q6SZ32IZwEym49s/nX4XDHn+4EdFcTzPnV3y2
   A==;
X-CSE-ConnectionGUID: VVkIyOcmRfCj6gsyYAq0bg==
X-CSE-MsgGUID: ErvDpIEYT3ek22+NDw0Gww==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588886"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588886"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:49 -0800
X-CSE-ConnectionGUID: kvtcUQiWQVC3wr8r+jE8oA==
X-CSE-MsgGUID: MJQYula+QMaoU1/mxOQaog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229563903"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:47 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 00/17] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Date: Fri, 19 Dec 2025 16:45:17 +0200
Message-ID: <20251219144534.84391-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064550_164465_B3C254C3 
X-CRM114-Status: UNSURE (   9.90  )
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

This patch set adds Runtime PM support to mipi-i3c-hci and
mipi-i3c-hci-pci.

Notably, the master core is enhanced to optionally support
doing the RPM gets/puts needed to ensure a device is runtime
resumed for all bus operations.  That alleviates mipi-i3c-hci
from having to do it, and if the approach is accepted, would
allow other master drivers to drop their RPM gets/puts.

There are a number of small patches making various improvements
for things hit during development.  Plus a bunch of patches
preparing for the main changes which are covered in the last 3
patches.


Adrian Hunter (17):
      i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
      i3c: mipi-i3c-hci: Ensure proper bus clean-up
      i3c: master: Update hot-join flag only on success
      i3c: master: Replace WARN_ON() with dev_err() in i3c_dev_free_ibi_locked()
      i3c: mipi-i3c-hci: Switch DAT bitmap allocation to devm_bitmap_zalloc()
      i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
      i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
      i3c: mipi-i3c-hci: Cache DAT in memory for Runtime PM restore
      i3c: mipi-i3c-hci: Introduce helper to restore DAT
      i3c: mipi-i3c-hci: Extract ring initialization from hci_dma_init()
      i3c: mipi-i3c-hci: Add DMA suspend and resume support
      i3c: mipi-i3c-hci: Refactor PIO register initialization
      i3c: mipi-i3c-hci: Add PIO suspend and resume support
      i3c: mipi-i3c-hci: Factor out software reset into helper
      i3c: master: Introduce optional Runtime PM support
      i3c: mipi-i3c-hci: Add optional Runtime PM support
      i3c: mipi-i3c-hci-pci: Add Runtime PM support

 drivers/i3c/device.c                               |  46 +++++-
 drivers/i3c/internals.h                            |   4 +
 drivers/i3c/master.c                               | 101 +++++++++++-
 drivers/i3c/master/mipi-i3c-hci/core.c             | 171 +++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  45 ++++--
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 179 +++++++++++++++------
 drivers/i3c/master/mipi-i3c-hci/hci.h              |  11 ++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  17 ++
 drivers/i3c/master/mipi-i3c-hci/pio.c              |  63 +++++---
 include/linux/i3c/master.h                         |   4 +
 11 files changed, 530 insertions(+), 113 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
