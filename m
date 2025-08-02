Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFA5C87FC9
	for <linux-i3c@archiver.kernel.org>; Sat,  2 Aug 2025 23:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=reFMtR9z16EloWCRRM136zPQjn37L3t1U2pRuxX/ASQ=; b=TMccR/HtT8C/VK
	GLNlaZ4ch4lQdKBxtq4PQG7QzfKp5Y17b5BS5LS+uueV01vLboE4gfNw3mI1jgipe0gwV9GkoHrXi
	PRM1gZJol0vnMUHQPEC6lNKHpqQfnbDZGu3Ykxa4uyCMSz9FFP1uGBN4VtwW4Kg/Cqw9vQRdvwdMb
	2nXAQhpQbi30Ow2uKMZErZIeVy9AGENTS8/i5YZnIVilnYqSH4KTwvZjqsYLtYlhX10sNq8Lht12C
	MKkKXl2229uj6GtY71et5Brjb6bsjCz4Kw9xpzyYPU9LtAClbGM5UJ4tw2lL9cNqbwjdZKxNZSiut
	ADgIiI1e/hiLQwwBu2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiLd2-00000007yha-1HsL;
	Sat, 02 Aug 2025 23:27:04 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiLcy-00000007yhF-2pX6
	for linux-i3c@lists.infradead.org;
	Sat, 02 Aug 2025 23:27:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C08331F68D;
	Sat,  2 Aug 2025 23:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754177215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=jYVXXKBsIzJHgP3r/GynpoEXRvPIuovCsUvYjh/Xw3s=;
	b=lnRTrcz4xln+EzV6jw7K5cKuy3O4Zx6daw+QWRCkDRzXNKJ/ZYixWcMLRqWlhFvRx8nxoS
	X5xgkbGEgStW/OL3GoxsYiyNY7+v90GCCh6xii3jJubBbATGKcDPZ89uBVcVGo4Umq/IYd
	kw2Apub4gWXdon0w5EKenT91CoVJLTK94iaNA1srNM1vqfiF4rn3H8DYcvDSY3g8EQThYW
	S02om6WlBEjeveC6LXBI2wIRXI2/8Y63tLr5DOcEjGFZdSCKVbm00y3RfdBqaumAqlXW9A
	znuoPUbK0zqUzvhQA8eyc8DsFbbb4X+Lf+h60kklOLbZ1aRiBB3pBjfip90RHw==
Date: Sun, 3 Aug 2025 01:26:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.17
Message-ID: <20250802232654918f2886@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdejkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfegfefhtdehgffgkedtfeelkedugefgtdeugeegffdvkeefjefhkefhffetvdeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfr
 hgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_162701_385601_1F2834BE 
X-CRM114-Status: GOOD (  12.80  )
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

Here is the i3c subsystem pull request for 6.17. Most of the changes are
preparation for the driver for a new controller and the driver itself.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.17

for you to fetch changes up to 3b661ca549b9e5bb11d0bc97ada6110aac3282d2:

  i3c: add missing include to internal header (2025-07-31 02:25:17 +0200)

----------------------------------------------------------------
I3C for 6.17

New driver:
 - Renesas I3C controller

Subsystem:
 - use adapter timeout value for I2C transfers
 - don't fail if GETHDRCAP is unsupported
 - replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP

Drivers:
 - svc: Fix npcm845 FIFO_EMPTY quirk

----------------------------------------------------------------
Arnd Bergmann (1):
      i3c: fix module_i3c_i2c_driver() with I3C=n

Bagas Sanjaya (1):
      i3c: Fix i3c_device_do_priv_xfers() kernel-doc indentation

Jorge Marques (4):
      i3c: master: Initialize ret in i3c_i2c_notifier_call()
      i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()
      i3c: master: cdns: Use i3c_writel_fifo() and i3c_readl_fifo()
      i3c: master: dw: Use i3c_writel_fifo() and i3c_readl_fifo()

Krzysztof Kozlowski (1):
      i3c: master: cdns: Simplify handling clocks in probe()

Sakari Ailus (2):
      i3c: master: svc: Remove redundant pm_runtime_mark_last_busy() calls
      i3c: dw: Remove redundant pm_runtime_mark_last_busy() calls

Stanley Chu (1):
      i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk

Tommaso Merciai (1):
      dt-bindings: i3c: Add Renesas I3C controller

Wolfram Sang (14):
      i3c: dw: use adapter timeout value for I2C transfers
      i3c: master: cdns: use adapter timeout value for I2C transfers
      i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers
      i3c: master: svc: use adapter timeout value for I2C transfers
      i3c: add patchwork entry to MAINTAINERS
      i3c: don't fail if GETHDRCAP is unsupported
      i3c: master: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      i3c: prefix hexadecimal entries in sysfs
      i3c: Standardize defines for specification parameters
      i3c: Add more parameters for controllers to the header
      i3c: master: Add basic driver for the Renesas I3C controller
      i3c: add missing include to internal header

 .../devicetree/bindings/i3c/renesas,i3c.yaml       |  179 +++
 MAINTAINERS                                        |    8 +
 drivers/i3c/device.c                               |   11 +-
 drivers/i3c/internals.h                            |   38 +
 drivers/i3c/master.c                               |   38 +-
 drivers/i3c/master/Kconfig                         |   10 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/dw-i3c-master.c                 |   47 +-
 drivers/i3c/master/i3c-master-cdns.c               |   90 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |    2 +-
 drivers/i3c/master/renesas-i3c.c                   | 1404 ++++++++++++++++++++
 drivers/i3c/master/svc-i3c-master.c                |   30 +-
 include/linux/i3c/device.h                         |    4 +-
 include/linux/i3c/master.h                         |   13 +-
 14 files changed, 1727 insertions(+), 148 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
