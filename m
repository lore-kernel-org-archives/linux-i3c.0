Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA876E8B37E
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Feb 2026 23:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2byMswqUd8j2VuHGaz6QsE4B0F09WCNis+bq9+rk0PI=; b=IeD9Cojiautjvj
	avxFkeaAwaFvkEieMRHLFJrhmQh28VVv00Nyew6h/1lOTV0KNT0PxVuRiD/iavSDUTXJ/+ahh+WNo
	B2UBmMPjcen8+HNgXScQisFXHxBFn0Nx8uGY+0UVCVzA4eXTpll/2NYb92B05lETsuYV60TgvM517
	mQjH99uwXisouSn8Cl1Yo/fb53TOqnFeFJ34HXb1NeAUn5vocS4kxRYgXt2NIlA5ccTJ85bfNfAEX
	PPaQGD53BgNaZnyrxbQOcjSEojqIUGUaHko+Q3eD5RrbSlcUD5HKZGZYKDZ13jblsVjLB6KaBdr50
	R9PrUgURRkem2y4Y7L5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPzP-00000007ZoO-2Toz;
	Tue, 03 Feb 2026 23:39:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPzM-00000007ZnW-2q95
	for linux-i3c@lists.infradead.org;
	Tue, 03 Feb 2026 23:39:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C7B61A2BD0;
	Tue,  3 Feb 2026 23:39:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C107D60728;
	Tue,  3 Feb 2026 23:39:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1B04119A8888;
	Wed,  4 Feb 2026 00:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770161955; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=ucYbgMTXu9O2nhpJq8hjASjMhl+lmyesfJEs8TT0QqI=;
	b=wGcDwXjVNrapnZkeIvMlPeftHCxADa4Zse17UBW8mJzoZiBetVvR3cGLEdXMA4v+ODFDMW
	C2eWdk/h1sMkW9n4IhyWKqn4M1RLv2CUzti3H5M8LGdpcPXgTjxFIpEhHLoQvLTAB9LuTe
	xaxofF0MPG4iaTUqdfWKF9XCd1oxVJfQc5MqReSvy5vGtC8cPwvHPXkDRzS8pOSOA9rnSR
	v9S+HEKBD499mwOtwQupaqkQUcebQQTqVMoA03DIDp8O7cHrBKFjAm5TNdz9gRI9mTYtBm
	RZB1mvS4ubovEyOZ20fpkavPjdsKSwPciXmUkhpyQz8Sis2oeC8p1P2s9ibn7A==
Date: Wed, 4 Feb 2026 00:39:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.20
Message-ID: <20260203233912448420e5@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_153920_867842_9E8EF4C0 
X-CRM114-Status: GOOD (  12.58  )
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

Hello Linus,

Here is the i3c subsystem pull request for 6.19. Most of the work has
been concentrated on mipi-i3c-hci and in particular its pci variant. The
renesas and dw drivers have also seen a few improvements.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.20

for you to fetch changes up to ed318b3fb4ab317c533d38d160326fa5d7569497:

  i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses (2026-01-31 00:05:22 +0100)

----------------------------------------------------------------
I3C for 6.20

Subsystem:
 - add sysfs entry and attribute for Device NACK Retry count

Drivers:
 - dw: Device NACK Retry configuration knob
 - mipi-i3c-hci: support for Multi-Bus Instances, Runtime PM support, System
   Suspend support
 - renesas: suspend/resume support

----------------------------------------------------------------
Adrian Hunter (35):
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
      i3c: mipi-i3c-hci: Factor out IO mode setting into helper
      i3c: mipi-i3c-hci: Factor out core initialization into helper
      i3c: mipi-i3c-hci: Allow core re-initialization for Runtime PM support
      i3c: mipi-i3c-hci: Factor out master dynamic address setting into helper
      i3c: master: Introduce optional Runtime PM support
      i3c: mipi-i3c-hci: Add optional Runtime PM support
      i3c: mipi-i3c-hci-pci: Add Runtime PM support
      i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
      i3c: mipi-i3c-hci: Add optional System Suspend support
      i3c: mipi-i3c-hci-pci: Add System Suspend support

Adrian Ng Ho Yin (6):
      i3c: add sysfs entry and attribute for Device NACK Retry count
      i3c: dw: Add support for Device NACK Retry configuration
      i3c: dw: use FIELD_PREP for device address table macros
      i3c: dw: Preserve DAT entry bits when restoring addresses
      i3c: dw-i3c-master: convert spinlock usage to scoped guards
      i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses

Billy Tsai (1):
      i3c: Move device name assignment after i3c_bus_init

Frank Li (3):
      i3c: drop i3c_priv_xfer and i3c_device_do_priv_xfers()
      i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
      i3c: Add stub functions when I3C support is disabled

Fredrik Markstrom (1):
      i3c: dw: Initialize spinlock to avoid upsetting lockdep

Krzysztof Kozlowski (1):
      i3c: master: Simplify with scoped for each OF child loop

Tommaso Merciai (4):
      i3c: renesas: Switch to clk_bulk API and store clocks in private data
      i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
      i3c: renesas: Factor out hardware initialization to separate function
      i3c: renesas: Add suspend/resume support

Zilin Guan (1):
      i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()

 Documentation/ABI/testing/sysfs-bus-i3c            |  11 +
 drivers/i3c/device.c                               |  46 +-
 drivers/i3c/internals.h                            |   4 +
 drivers/i3c/master.c                               | 213 ++++++++--
 drivers/i3c/master/Kconfig                         |   1 +
 drivers/i3c/master/dw-i3c-master.c                 | 121 ++++--
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |   2 -
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   2 -
 drivers/i3c/master/mipi-i3c-hci/core.c             | 465 +++++++++++++++------
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  46 +-
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 171 +++++---
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c         |  58 ++-
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h         |   1 -
 drivers/i3c/master/mipi-i3c-hci/hci.h              |  17 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 186 ++++++---
 drivers/i3c/master/mipi-i3c-hci/pio.c              |  64 ++-
 drivers/i3c/master/renesas-i3c.c                   | 319 ++++++++------
 drivers/i3c/master/svc-i3c-master.c                |   4 +-
 include/linux/i3c/device.h                         |  24 +-
 include/linux/i3c/master.h                         |  11 +
 include/linux/platform_data/mipi-i3c-hci.h         |  15 +
 22 files changed, 1269 insertions(+), 514 deletions(-)
 create mode 100644 include/linux/platform_data/mipi-i3c-hci.h

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
