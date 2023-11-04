Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0379BC4332F
	for <linux-i3c@archiver.kernel.org>; Sat,  4 Nov 2023 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vZoSIjQKeuYgWzWzWTBh1phvTQVGvrt0WojcFKztkh4=; b=UBzpWLqlvGjfvX
	tuiMd9JOXwCpp1wan1N0B5IfOoq6AAp+6RoQ8aJKTFkachaP9q3gQiT+2Au/AA9RbnS499GA15bWp
	R7idps6ToCb40tMfCUbt/O9CTT8cLBvaVmJlqdbRVTrylI54vJ7F1lAXYl+bDtuasEgfv7wNwV2DQ
	ICzcWAfmjyTucXcv0UZqvdRa5ZgVFD7TP8mLB5Mpjb3TFs7M9uSFHngcckxeh2gXKVtllx9Ad79BL
	rWvRv/uJvV1BuHWsSDVKlb8D+vf9vJ2vo9A9qwr/FLOVVV0FFImNrQCVZmpssUZD/pnrhtJn2xqbe
	0ZeqQc8oondbvbTdGlEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzPrj-00E8Iz-0p;
	Sat, 04 Nov 2023 23:15:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzPre-00E8Gv-1o
	for linux-i3c@lists.infradead.org;
	Sat, 04 Nov 2023 23:15:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 539CFFF805;
	Sat,  4 Nov 2023 23:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699139728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=xLB49XCT9UcobRhWosbEP65dkPvczyn1raATHvaoT30=;
	b=aOpNhOe0i7PzzwapPBZILHkSTywT1N6thWUopC5pHani+GI39WtiZQENmW2t4shwXhsx7r
	C3pRFe5boYOr0q2G2kEl1RhDb9I/MTIYAnBlDHvLArWHdT6OaMECQ/mmXhVN32Mcae9Tzt
	MStYHkqdvncw4ltbHydezIqsG8G0YIofQ8M1LsSTqzdnCju4gjav5Oszr3P9IY5QYbuiey
	xJ77JEHbSvwKSVzxNp7xkavUipBIXP3c0OBX0bdkzNuIXkLh+saBw8MkWLvGEOH5DbDVIM
	7+hpj3BwEslfFi25TieggBZHo+Zc1S7tLYUJ5meANAyNAClUXVGCMosDg0VTnQ==
Date: Sun, 5 Nov 2023 00:15:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.7
Message-ID: <202311042315286247d3ae@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_161539_049005_E4D7DEA6 
X-CRM114-Status: GOOD (  10.28  )
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

Here is the i3c subsytem pull request for 6.7. There are now more fixes
because as stated in my previous pull request, people now have access to
actual hardware.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.7

for you to fetch changes up to 9fd00df05e81a2e1080ce6e9abc35533dca99d74:

  i3c: master: handle IBIs in order they came (2023-11-04 00:44:32 +0100)

----------------------------------------------------------------
I3C for 6.7

Core:
 - handle IBI in the proper order

Drivers:
 - cdns: fix status register access
 - mipi-i3c-hci: many fixes now that the driver has been actually tested
 - svc: many IBI fixes, correct compatible string, fix hot join corner cases

----------------------------------------------------------------
Billy Tsai (1):
      i3c: master: mipi-i3c-hci: Fix a kernel panic for accessing DAT_data.

Dinghao Liu (1):
      i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs

Frank Li (7):
      i3c: master: svc: fix race condition in ibi work thread
      i3c: master: svc: fix wrong data return when IBI happen during start frame
      i3c: master: svc: fix ibi may not return mandatory data byte
      i3c: master: svc: fix check wrong status register in irq handler
      i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen
      i3c: master: svc: fix random hot join failure since timeout error
      i3c: master: svc: fix compatibility string mismatch with binding doc

Jarkko Nikula (12):
      i3c: master: Inherit DMA masks and parameters from parent device
      i3c: mipi-i3c-hci: Add MODULE_ALIAS
      i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes
      i3c: mipi-i3c-hci: Fix out of bounds access in hci_dma_irq_handler
      i3c: mipi-i3c-hci: Remove BUG() when Ring Abort request times out
      i3c: mipi-i3c-hci: Set ring start request together with enable
      i3c: mipi-i3c-hci: Fix race between bus cleanup and interrupt
      i3c: mipi-i3c-hci: Set number of SW enabled Ring Bundles earlier
      i3c: mipi-i3c-hci: Do not unmap region not mapped for transfer
      i3c: mipi-i3c-hci: Fix missing xfer->completion in hci_cmd_v1_daa()
      i3c: mipi-i3c-hci: Resume controller explicitly
      i3c: mipi-i3c-hci: Resume controller after aborted transfer

Joshua Yeong (1):
      i3c: master: cdns: Fix reading status register

Justin Stitt (1):
      i3c: replace deprecated strncpy

Kees Cook (4):
      i3c: dw: Annotate struct dw_i3c_xfer with __counted_by
      i3c: master: cdns: Annotate struct cdns_i3c_xfer with __counted_by
      i3c/master/mipi-i3c-hci: Annotate struct hci_rings_data with __counted_by
      i3c: svc: Annotate struct svc_i3c_xfer with __counted_by

Matt Johnston (1):
      i3c: Fix typo "Provisional ID" to "Provisioned ID"

Zbigniew Lukwinski (1):
      i3c: master: handle IBIs in order they came

 Documentation/ABI/testing/sysfs-bus-i3c        |  4 +-
 Documentation/devicetree/bindings/i3c/i3c.yaml |  4 +-
 Documentation/driver-api/i3c/protocol.rst      |  4 +-
 drivers/i3c/master.c                           | 24 +++++++++--
 drivers/i3c/master/dw-i3c-master.c             |  2 +-
 drivers/i3c/master/i3c-master-cdns.c           |  8 ++--
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c       |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c         | 14 +++---
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c       | 27 ++++++++----
 drivers/i3c/master/mipi-i3c-hci/dma.c          | 21 +++++----
 drivers/i3c/master/svc-i3c-master.c            | 60 ++++++++++++++++++++++++--
 include/linux/i3c/device.h                     |  2 +-
 include/linux/i3c/master.h                     |  6 ++-
 13 files changed, 133 insertions(+), 44 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
