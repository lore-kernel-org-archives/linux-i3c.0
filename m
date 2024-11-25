Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B81D59D7E
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2024 22:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I/XWL9yWWk+esuruoHKQcxFitJigCjJuCL3iTnlc8w8=; b=q0+T0O+ywREQ+z
	LHzxQHiyzMDNlqKJENZwKjJ4XecpNH7QIsS7Vie1CtqOnV/7gJTKMhh0GGAOeu1LPo3f98d2+FrE/
	IOdQI+/Kyl+1UhUxvylZaYyHA3B2mN4rfBbgwjCXrJLp8xG9GKPuHeHknFcAyGmtSzSo6Hj1p221a
	o1/1u6p9SBXhH94oJoKMvhLFlvdU2fdZIVL/Mc5pLnXUa1bm6dk4lTDdD4XWWOqMfxKJul/0jFdTg
	qY8ehQhRXNBr+w6qXdIyF3Pzmthnp606bPfW0a/KzD2yzBs3h4UH7f/Fw5SmyjFng1L2pX4Tq6SFc
	ATFKLeUJWdTLWmacrnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhRL-00000009CG8-2CeB;
	Mon, 25 Nov 2024 22:20:19 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhRH-00000009CFY-2tXP
	for linux-i3c@lists.infradead.org;
	Mon, 25 Nov 2024 22:20:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95107240004;
	Mon, 25 Nov 2024 22:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732573209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=z/T6JIcs6kCMugL/OWzdZUfqiERU3nioemsHcX00saU=;
	b=dEygpnwjG6+IXZroahb25YZY8xFPBLauGRYEnGg9JjQj0Nh3QXkWtolZW2xObFXzQq65Ca
	yiRkj4EEfbZd1ABft4RCGPnJDtc+1aRzenoikOEzM5vauJKOlHfIii4Yn5sg1gAXAFrwh2
	+8AaGWg2Eb/RDhW+VmwxT2sq6GafNeJEQ0Gfr05aV8lLih/4xoA09w4pIA07omUbg3DaC4
	yFBVfsf5ikySLItVUTeHpIAS7JenlIScaqTNtO3x77BpygCRDO+R8xyyMdEMBjjPPoO/8o
	UGfuiZVA+xh0phPdOfLKcEEtXPH0kI9h7laAD2M5n9Y19IFn0l/WIPepm1zJSw==
Date: Mon, 25 Nov 2024 23:20:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.13
Message-ID: <20241125222007aae382d8@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_142016_029557_B87BB82F 
X-CRM114-Status: UNSURE (   9.69  )
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

Hello Linus,

Here is the i3c subsystem pull request for 6.13. We get support for
another I3C HCI controller used on AMD chips. We get more fixes for the
MIPI HCI and Silvaco drivers are they get more widespread testing.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.13

for you to fetch changes up to 6cf7b65f7029914dc0cd7db86fac9ee5159008c6:

  i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock (2024-11-18 14:29:13 +0100)

----------------------------------------------------------------
I3C for 6.13

Core:
 - avoid possible deadlock on probe
 - ensured preferred address is used on hot-join

Drivers:
 - dw: add AMD I3C controller support
 - mipi-i3c-hci: fix SETDASA, DMA interrupts fixes
 - svc: many fixes for IBI and hotjoin

----------------------------------------------------------------
Alexandre Belloni (1):
      i3c: Document I3C_ADDR_SLOT_EXT_STATUS_MASK

Billy Tsai (1):
      i3c: mipi-i3c-hci: Support SETDASA CCC

Defa Li (1):
      i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock

Frank Li (12):
      i3c: master: Replace hard code 2 with macro I3C_ADDR_SLOT_STATUS_BITS
      i3c: master: Extend address status bit to 4 and add I3C_ADDR_SLOT_EXT_DESIRED
      i3c: master: Fix dynamic address leak when 'assigned-address' is present
      i3c: master: svc: use repeat start when IBI WIN happens
      i3c: master: svc: manually emit NACK/ACK for hotjoin
      i3c: master: svc: need check IBIWON for dynamic address assignment
      i3c: master: svc: use spin_lock_irqsave at svc_i3c_master_ibi_work()
      i3c: master: svc: wait for Manual ACK/NACK Done before next step
      i3c: master: svc: fix possible assignment of the same address to two devices
      i3c: master: Remove i3c_dev_disable_ibi_locked(olddev) on device hotjoin
      i3c: master: Fix miss free init_dyn_addr at i3c_master_put_i3c_addrs()
      i3c: master: svc: Modify enabled_events bit 7:0 to act as IBI enable counter

Jarkko Nikula (2):
      i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
      i3c: mipi-i3c-hci: Handle interrupts according to current specifications

Jinjie Ruan (1):
      i3c: master: svc: Fix pm_runtime_set_suspended() with runtime pm enabled

Shyam Sundar S K (2):
      i3c: dw: Add support for AMDI0015 ACPI ID
      i3c: dw: Add quirk to address OD/PP timing issue on AMD platform

 drivers/i3c/master.c                   | 100 +++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.c     |  34 +++++++++
 drivers/i3c/master/dw-i3c-master.h     |   1 +
 drivers/i3c/master/mipi-i3c-hci/core.c |  19 ++---
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  10 +--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |   2 +-
 drivers/i3c/master/mipi-i3c-hci/pio.c  |   2 +-
 drivers/i3c/master/svc-i3c-master.c    | 136 ++++++++++++++++++++++++---------
 include/linux/i3c/master.h             |  10 ++-
 9 files changed, 225 insertions(+), 89 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
