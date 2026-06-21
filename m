Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6152CD98F2
	for <linux-i3c@archiver.kernel.org>; Sun, 21 Jun 2026 21:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GRupefqbnYS0lrw6mbHQnw8IYzMyBV1ZUwfQo8PNpTE=; b=HLSE1HCXoF1Y0I
	COSxIUtvZvwuJl81W5em7QbS7hJe7qexxZ5rKJf8OGUJoqqtXtMH4Ma7/iWU7VV7D2kdHOp/oTlb2
	0gl/PQ4Jc0DhkKiBUeOx2VDL1kvl130AHhd6c7mSEq4mrrjHSlGovJZg4YYJKjRVyXCWx4vgvgQ2k
	+FacuPg+OLD9B0yXYF+njLYmUoIqiYUXrBZR5JbQyvb9eiGVtXej4z7E2zIRnVKHwoSv9ENKlcyCr
	b/GkDpCZ7xQ7lW1l9pEKq94+aObQzYxP+A0a1Jj3I+Im/mmqzj1P4bexDFbWyVT7c3v5byNv2gGiq
	Fy8ONgG6m6SV1SOqmUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPKO-00000004A43-18Yg;
	Sun, 21 Jun 2026 21:03:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPKL-00000004A3h-0G3O
	for linux-i3c@lists.infradead.org;
	Sun, 21 Jun 2026 21:03:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3492EC6345A;
	Sun, 21 Jun 2026 21:03:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01E9B601BB;
	Sun, 21 Jun 2026 21:03:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E741106C8938;
	Sun, 21 Jun 2026 23:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782075811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=pVIizgPn+02D4qiHJnLi/p86irarRY3r/3nKED0u4yc=;
	b=z2pLtzh9neXM8ueXQ/AoxJHAn9KxmIBdwvJmN5IfdqJpfwX2+nhRkM979WIFtP7q0/O8f9
	OXBG18hpQLaD64eYO3NEZf7+oniVYof9XH/jcI232c7/DoljCxNZ67fyjfgVGKB5vkVLw8
	l6N4sPwZc7XHp0ITsrzPSAKnsPI6AvpasRAHvYMPPB7EuYOOmMNj2wuk6iyDmBWlF4gBEz
	DFOu4H1QsRjgXd0XdLVSrj7h1NBHMd/uNvi/8fIa1I97gLCts02+1qZ8TdqjXRynGjO5Ew
	Mx8JvhK7Bzl+1OQTYpEnFQZEM7tOf0gYyPYfLSMqqhf5fi5aIQVPk1z0cKDCjg==
Date: Sun, 21 Jun 2026 23:03:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 7.2
Message-ID: <202606212103298c8aac5e@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_140337_484792_E7D3A20F 
X-CRM114-Status: GOOD (  11.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the i3c subsystem pull request for 7.2. This cycle, there was a
lot of work around the mipi-i3c-hci driver that also lead to
improvements of the core. We also have support for a new SoC, the
Microchip SAMA7D65. And of course, there are small fixes for the other
controller drivers.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-=
7.2

for you to fetch changes up to 678e9409dd78d5c080607df15c6f346c7edb03d0:

  i3c: mipi-i3c-hci: Use named initializers for platform_device_id's .drive=
r_data (2026-06-16 23:19:45 +0200)

----------------------------------------------------------------
I3C for 7.2

Subsystem:
 - introduce dynamic address reconciliation after DAA
 - add preliminary API for hub support
 - fixes for dev_nack_retry_count handling
 - move hot-join support in the core instead of open coding in different dr=
ivers

Drivers:
 - mipi-i3c-hci-pci: DMA abort, recovery and related improvements, hot-join
   support, Microchip SAMA7D65 support, fix possible race in IBI handling
 - dw-i3c-master: fix IBI count register selection for versalnet
 - svc: interrupt handling fixes for NPCM845

----------------------------------------------------------------
Adrian Hunter (35):
      i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back t=
o software reset
      i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
      i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in e=
rror
      i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
      i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
      i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
      i3c: mipi-i3c-hci: Complete transfer lists immediately on error
      i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong tra=
nsfer
      i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controlle=
rs
      i3c: mipi-i3c-hci: Factor out hci_dma_abort()
      i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
      i3c: mipi-i3c-hci: Factor out reset-and-restore helper
      i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller erro=
rs
      i3c: mipi-i3c-hci: Wait for NoOp commands to complete
      i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
      i3c: mipi-i3c-hci: Consolidate DMA ring allocation
      i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
      i3c: master: Make hot-join workqueue freezable to block hot-join duri=
ng suspend
      i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
      i3c: master: Consolidate Hot-Join DAA work in the core
      i3c: master: Ensure Hot-Join operations are stopped on shutdown
      i3c: dw: Drop redundant Hot-Join cancel_work_sync() in shutdown
      i3c: master: Defer new-device registration out of DAA caller context
      i3c: master: Export i3c_master_enec_disec_locked()
      i3c: mipi-i3c-hci: Add Hot-Join support
      i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
      i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
      i3c: master: Prevent reuse of dynamic address on device add failure
      i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures =
in DAA
      i3c: master: Make i3c_master_add_i3c_dev_locked() return void
      i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_lock=
ed()
      i3c: master: Reconcile dynamic addresses after DAA
      i3c: master: Update dev_nack_retry_count under maintenance lock
      i3c: master: Add missing runtime PM get in dev_nack_retry_count_store=
()
      i3c: master: Use unsigned int for dev_nack_retry_count consistently

Aman Kumar Pandey (1):
      i3c: master: Expose the APIs to support I3C hub

Lakshay Piplani (1):
      i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked

Manikandan Muralidharan (2):
      dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
      i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the req=
uired quirk

Maxwell Doose (1):
      i3c: master: Replace sprintf() with sysfs_emit() family

Shubhrajyoti Datta (1):
      i3c: dw-i3c-master: Fix IBI count register selection for versalnet

Stanley Chu (2):
      i3c: master: svc: Fix missed IBI after false SLVSTART on NPCM845
      i3c: master: svc: Prevent IRQ storm from false SLVSTART on NPCM845

Uwe Kleine-K=F6nig (The Capable Hub) (2):
      i3c: Consistently define pci_device_ids using named initializers
      i3c: mipi-i3c-hci: Use named initializers for platform_device_id's .d=
river_data

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml      |  27 +-
 drivers/i3c/master.c                               | 504 ++++++++++++++++-=
----
 drivers/i3c/master/dw-i3c-master.c                 |  40 +-
 drivers/i3c/master/dw-i3c-master.h                 |   3 +-
 drivers/i3c/master/i3c-master-cdns.c               |  14 +-
 drivers/i3c/master/mipi-i3c-hci/cmd.h              |   6 +
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             | 196 +++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 345 ++++++++++----
 drivers/i3c/master/mipi-i3c-hci/hci.h              |  24 +
 drivers/i3c/master/mipi-i3c-hci/ibi.h              |  13 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  22 +-
 drivers/i3c/master/mipi-i3c-hci/pio.c              |  13 +-
 drivers/i3c/master/svc-i3c-master.c                |  39 +-
 include/linux/i3c/master.h                         |  23 +-
 16 files changed, 970 insertions(+), 307 deletions(-)

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
