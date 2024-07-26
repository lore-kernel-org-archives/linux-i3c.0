Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA4AC3DA7F
	for <linux-i3c@archiver.kernel.org>; Fri, 26 Jul 2024 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9RNZWzwPrJvfxj0e9rJIRcXRjbx8YgzIGfJNFC9cOiw=; b=affKYYiHTdTN1Y
	Uaaso6GkONTKSWpzqmNu5NSgbmA7WCeORqAqA7uwFlIrNZApGv1hISAFvSs1RwE68/kAJxsX9ux8v
	gdrz/a+DoEdPcTg+p86rv2nLlnxsmDqphXSYJxAS7U1mdSX6EJv0SUs/a4ym6Vi0t3eoBUPHnS9yz
	GzIQMm+CmJnU6t1eNodB8PzVNBj7yaLV+GV/pu6wGTl99sy5oLXTgYcDmlwoqsFdx+96/B/hS2Aze
	737PkZ3E06wk1Mx0tUMNIRA4vLQd6ba44ynsd7bfR1wHjI2P5g9H0TB7Q5g9Lsr8R2G0MS6EWiC0Z
	0wnYGofqPcVoA0nfNGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXKEQ-00000003sjJ-3dyj;
	Fri, 26 Jul 2024 12:39:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXKEL-00000003sf0-3E7x
	for linux-i3c@lists.infradead.org;
	Fri, 26 Jul 2024 12:39:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43D29FF807;
	Fri, 26 Jul 2024 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721997564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=SLfP/QyZ752p6HUH/YkDyZyK8Oli7bXcnIr/09d8Rv8=;
	b=VhkCY6leCvbvNB2v72ZbhCuL76fp6G4yJ8OP6auTQtq4MxlIXezhCvT0IO1nctFkIG52n0
	LBli53/gXIqQDwaczvAeKg8Y/GiB1uK6aRsmmiDDuyQ0m+C2DfmuvJhfmQM5RDBcnkwma5
	5/nxFvwVvQ3Vioq6Cjl9AJkehQRVufHDwZPzLfWm/BYZkGtGo/3ki0kF7faovlAv5555Hi
	S4THXyjJkjJmH8ayiCod0LMurIo5fGg+UtDZ5mwhtDZjcqfMsibLQpG7t4T2zWpNWIFrT4
	A8tFUEzmwrWjV1UbbYgYYFR+ECB1oqDZN1l2s2WWN3n7kn5uUL+W4N/y+TUa/A==
Date: Fri, 26 Jul 2024 14:39:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.11
Message-ID: <20240726123924fec081e4@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_053930_611722_9B250873 
X-CRM114-Status: GOOD (  11.68  )
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

Here is the i3c subsystem pull request for 6.11. This cycle, there are
new features for the Designware controller and fixes for the other IPs.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.11

for you to fetch changes up to 24168c5e6dfbdd5b414f048f47f75d64533296ca:

  dt-bindings: i3c: add header for generic I3C flags (2024-07-26 14:21:30 +0200)

----------------------------------------------------------------
I3C for 6.11

Drivers:
 - dw: optional apb clock and power management support, IBI handling fixes
 - mipi-i3c-hci: IBI handling fixes
 - svc: few fixes

----------------------------------------------------------------
Aniket (9):
      i3c: dw: Fix clearing queue thld
      i3c: dw: Fix IBI intr programming
      i3c: dw: Remove ibi_capable property
      dt-bindings: i3c: dw: Add apb clock binding
      i3c: dw: Use new *_enabled clk API
      i3c: dw: Add optional apb clock
      i3c: dw: Save timing registers and other values
      i3c: dw: Add some functions for reusability
      i3c: dw: Add power management support

Bhoomik Gupta (1):
      i3c: master: Enhance i3c_bus_type visibility for device searching & event monitoring

Carlos Song (1):
      dt-bindings: i3c: add header for generic I3C flags

Chen Ni (1):
      i3c: master: svc: Convert comma to semicolon

Dan Carpenter (1):
      i3c: master: svc: Fix error code in svc_i3c_master_do_daa_locked()

Frank Li (2):
      i3c: master: svc: resend target address when get NACK
      i3c: master: svc: Improve DAA STOP handle code logic

Jarkko Nikula (5):
      i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI versions < 1.1
      i3c: mipi-i3c-hci: Switch to lower_32_bits()/upper_32_bits() helpers
      i3c: mipi-i3c-hci: Set IBI Status and Data Ring base addresses
      i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
      i3c: mipi-i3c-hci: Round IBI data chunk size to HW supported value

 Documentation/devicetree/bindings/i3c/i3c.yaml     |   5 +-
 .../bindings/i3c/snps,dw-i3c-master.yaml           |  11 +-
 MAINTAINERS                                        |   1 +
 drivers/i3c/internals.h                            |   2 -
 drivers/i3c/master.c                               |   1 +
 drivers/i3c/master/ast2600-i3c-master.c            |   1 -
 drivers/i3c/master/dw-i3c-master.c                 | 349 ++++++++++++++++-----
 drivers/i3c/master/dw-i3c-master.h                 |  14 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |   8 +
 drivers/i3c/master/mipi-i3c-hci/dma.c              |  44 +--
 drivers/i3c/master/svc-i3c-master.c                | 121 +++++--
 include/dt-bindings/i3c/i3c.h                      |  16 +
 include/linux/i3c/master.h                         |   1 +
 13 files changed, 431 insertions(+), 143 deletions(-)
 create mode 100644 include/dt-bindings/i3c/i3c.h

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
