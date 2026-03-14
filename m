Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA3910854B2
	for <linux-i3c@archiver.kernel.org>; Sat, 14 Mar 2026 22:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eHyQxWCqtmvdfX5jghhWRWfBhMBNNPE7tQgGtlONzO0=; b=B2698ExrhYYBw1
	0rmoT3Dg/KjIq46yRWTa51V/ABb+DKzMMYMbo4Kg0zjvHHos5zVZTOUy76tkeBUwkqF9lG7cWUK2R
	fXgUBDxY4kOPQ/N2kQdwMnxkZVSc4u/s4eYategEfDD4l8FW2cEVxwLGBAFLBvpP0BcQxZwSyzeCm
	srfMvwHKxWyAj+gKKf17ilAipTxGfPk7ZK8ZJISLT5StqlTokqVp+YdkI5W9f8ULCUq+s+g6YNcFh
	vUiSAmCh1y7UKazgfpzSldCnUcKEMXjY0JVI5QBVGvjDOsBGjyejiIyLV4IIXBPF9weAAewo8P5jJ
	xCwEwiO6nXYB3fro7A3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XJF-00000002CnO-1Fp6;
	Sat, 14 Mar 2026 22:18:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XJC-00000002Cn2-0DvS
	for linux-i3c@lists.infradead.org;
	Sat, 14 Mar 2026 22:18:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 036EE1A2E45
	for <linux-i3c@lists.infradead.org>; Sat, 14 Mar 2026 22:18:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6C946003C;
	Sat, 14 Mar 2026 22:18:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4FD21036883E;
	Sat, 14 Mar 2026 23:18:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773526682; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=T4/PmVjp/2ta/HEUAXLbxXIhirZ5oZitWVV/P3lHaLU=;
	b=YssjJW5s2Glb/oP3Cljg+Jzsrqui20pqTfqMkL47RBpIjMngig5FoUh2rwM9CuLwN38Rh2
	vhm09losbtZQcd4xqIvK2ZAaWeqJHtq7zg1ikIbpkSqKctTbGUi2PcIyfdpjsF/dC9IG07
	+f0xHsqoefVeGN7WCZQrfAEZGLChaxB2kQsC955go2Ff6pkjLN1S45ldPFfTuY0eetAh9t
	z0t/lPDAvgrd8uTJCJVsPZTojFMHYNYbWawT7aJTJs/QiHU1zhwjq+rLHTHRGlKL6AkEXX
	N3Zt5myXFV78eQJxo14/RFrSnR1F4TlLa4S8cPbvFl38zj4qX3nCQytCgKrQ0g==
Date: Sat, 14 Mar 2026 23:17:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C fixes for 7.0
Message-ID: <202603142217597dfc0bf3@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_151810_584735_04635658 
X-CRM114-Status: GOOD (  10.60  )
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

Here are a few fixes for the i3c subsystem. We have the introduction of
the I3C_OR_I2C symbol which is not a fix per se but is affecting
multiple subsystems so it is included to ease synchronization. Apart
from this, Adrian is mostly fixing the mipi-i3c-hci driver around DMA
and wanted the fixes for 7.0. Finally, I took the opportunity to add two
fixes for the dw-i3c driver.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-7.0

for you to fetch changes up to f311a05784634febd299f03476b80f3f18489767:

  i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach (2026-03-11 22:50:29 +0100)

----------------------------------------------------------------
I3C fixes for 7.0

Subsystem:
 - simplify combined i3c/i2c dependencies

Drivers:
 - dw: handle 2C properly, fix possible race condition
 - mipi-i3c-hci: many DMA related fixes

----------------------------------------------------------------
Adrian Hunter (14):
      i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
      i3c: mipi-i3c-hci: Fix Hot-Join NACK
      i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
      i3c: mipi-i3c-hci: Consolidate spinlocks
      i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers
      i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
      i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and interrupt handler
      i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
      i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
      i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
      i3c: mipi-i3c-hci: Consolidate common xfer processing logic
      i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
      i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
      i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails

Adrian Ng Ho Yin (1):
      i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach

Arnd Bergmann (1):
      i3c: simplify combined i3c/i2c dependencies

Peter Yin (1):
      i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter

 drivers/hwmon/Kconfig                    |   6 +-
 drivers/i3c/Kconfig                      |  12 +++
 drivers/i3c/master/dw-i3c-master.c       |   6 +-
 drivers/i3c/master/mipi-i3c-hci/cmd.h    |   1 +
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |   8 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |   8 +-
 drivers/i3c/master/mipi-i3c-hci/core.c   | 143 +++++++++++++++++-----------
 drivers/i3c/master/mipi-i3c-hci/dma.c    | 156 ++++++++++++++++---------------
 drivers/i3c/master/mipi-i3c-hci/hci.h    |   5 +
 drivers/i3c/master/mipi-i3c-hci/pio.c    |  16 +---
 drivers/iio/magnetometer/Kconfig         |   3 +-
 drivers/misc/amd-sbi/Kconfig             |   3 +-
 12 files changed, 210 insertions(+), 157 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
