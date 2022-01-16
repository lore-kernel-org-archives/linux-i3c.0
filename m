Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2E8C433FE
	for <linux-i3c@archiver.kernel.org>; Sun, 16 Jan 2022 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qMX3HZO5RPT/kQC00N8T34t/o0HrQLEl1OfaLpnM6c4=; b=BCwArtYr6UsAxK
	xsYp/cHRizXmHceR48DWB20HOrw1j4t+ocwTl7Op2i7qKFWRnV02r7MQLojDPO1Q5+P8XwNSerNNL
	mo3iwj85xinpkL3mKwK6LBqt2RWccfkqJ/JC18MD3lBvpy2hzFUJ2TH2EersP0ImUOo8VxNbZXEgp
	t9Ebn6DOmYkAAOcvJ0LrpXsi67cMKvfJS+pfDC5/tOJ6WoZOrxtWRSF/chIaxnm4jjVh8T5X4WKhU
	C9Snxi2l6zzLYQUgmZENrCFFzC9BYAxKQlJuClxKsNHs9IhsT1um7fM/B50vfYK7P2P2Fdr4go/S6
	j+m8qBSppNASiEeS7L2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9CjE-00Czie-J4; Sun, 16 Jan 2022 21:06:20 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9CjA-00CzhP-GL
 for linux-i3c@lists.infradead.org; Sun, 16 Jan 2022 21:06:18 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E0321BF207;
 Sun, 16 Jan 2022 21:06:10 +0000 (UTC)
Date: Sun, 16 Jan 2022 22:06:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 5.17
Message-ID: <YeSIwUuZHPeBcAKR@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_130616_732614_38BB0CC7 
X-CRM114-Status: UNSURE (   9.52  )
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

Here is the i3c subsystem pull request for 5.17. Those are mostly non
urgent fixes and a few improvement of the Silvaco driver.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.17

for you to fetch changes up to 13462ba1815db5a96891293a9cfaa2451f7bd623:

  i3c: master: dw: check return of dw_i3c_master_get_free_pos() (2022-01-13 02:05:50 +0100)

----------------------------------------------------------------
I3C for 5.17

Drivers:
 - svc: runtime pm suport

----------------------------------------------------------------
Christophe JAILLET (1):
      i3c/master/mipi-i3c-hci: Fix a potentially infinite loop in 'hci_dat_v1_get_index()'

Clark Wang (8):
      i3c: master: svc: move module reset behind clk enable
      i3c: master: svc: fix atomic issue
      i3c: master: svc: separate err, fifo and disable interrupt of reset function
      i3c: master: svc: add support for slave to stop returning data
      i3c: master: svc: set ODSTOP to let I2C device see the STOP signal
      i3c: master: svc: add runtime pm support
      i3c: master: svc: add the missing module device table
      i3c: master: svc: enable the interrupt in the enable ibi function

Jamie Iles (1):
      i3c: fix incorrect address slot lookup on 64-bit

Len Baker (2):
      i3c/master/mipi-i3c-hci: Prefer struct_size over open coded arithmetic
      i3c/master/mipi-i3c-hci: Prefer kcalloc over open coded arithmetic

Lukas Bulwahn (1):
      i3c: master: mipi-i3c-hci: correct the config reference for endianness

Tom Rix (1):
      i3c: master: dw: check return of dw_i3c_master_get_free_pos()

 drivers/i3c/master.c                     |   3 +-
 drivers/i3c/master/dw-i3c-master.c       |   4 +
 drivers/i3c/master/mipi-i3c-hci/core.c   |   2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c |   4 +-
 drivers/i3c/master/mipi-i3c-hci/dma.c    |   2 +-
 drivers/i3c/master/mipi-i3c-hci/hci.h    |   2 +-
 drivers/i3c/master/svc-i3c-master.c      | 341 ++++++++++++++++++++++---------
 7 files changed, 260 insertions(+), 98 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
