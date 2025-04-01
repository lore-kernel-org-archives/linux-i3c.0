Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A301C36010
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Apr 2025 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SAxK6YjZj3wniDylxJAknLi8HuTtmoEIPLKhnoBZR4s=; b=Pjip/mqN/4Um1a
	muHaJ3/h8MCUmuLz1dkxaRbcBuXKZYVT3iUzMQ58bzEecr4IoptSxmLF7nHVkPiGPfkZFLoVserSe
	nLYXM0t2XeCM4lmLatfOcoPLG/So69fA61hLJ8BMNt+qvQnu+r1AOt0J1WC0m+nJFqxL7HRpqqOm5
	+LZO0HK9EabfrzLBYOkjkOY4f7d8sTNSRe/36fzXazXKiRQZV0At6Yv9nUMV64qOrFWU0uSm1hSoq
	nhVOIfDSeu/5H7XUgYtYTACsBr117n8nNe977dc/OJQ9KLL4NqfAO4dhDQveodAWI/zpEbDmi9dYS
	LxGXv6NMDuGuvo8S/8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzk5Q-00000004XNf-1cZn;
	Tue, 01 Apr 2025 22:28:00 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzk5N-00000004XN7-1t1q
	for linux-i3c@lists.infradead.org;
	Tue, 01 Apr 2025 22:27:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 595C043280;
	Tue,  1 Apr 2025 22:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743546471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LAQY608XfP5NAZc5MUlDIbKeurURn1qFgrDB951n4qs=;
	b=N852wd/ikTPwprK1sR2+nDbo6RhOlVSQZzYfs/cUFxpuG/FaDU+4RvYI6pv5c/h38B1A0Z
	Aeta2n25Jlto0gGvVaUf9KzZ+8bwHLBh8wGC6v/LjGjvnFMNvcv8a6QO2MIRRvkWJmuCSZ
	yoo30yMCRBfNGdyF9MOZiT7vCh44E6Xfk+1BojFCMzjiWHEg7t9ckFhnVK4/XSb46j81Z6
	IqdEB1GaVGa6nQSm//z+B6+WIJ6o1n1B8Sh88Ej1pJDuED6ATGqy7B5myb1/ux+5lQRTtm
	ezS/sW9Ek49Y52To9zQKws9U2vVS7J3aIpTBAtVXHmG1acAan7K67kks2pAtsg==
Date: Wed, 2 Apr 2025 00:27:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.15
Message-ID: <2025040122275143b58a41@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeefleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfegfefhtdehgffgkedtfeelkedugefgtdeugeegffdvkeefjefhkefhffetvdeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfr
 hgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_152758_137229_F6F9D789 
X-CRM114-Status: GOOD (  11.08  )
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

Here is the i3c subsystem pull request for 6.15. The silvaco driver gets
support for the integration of the IP in the Nuvoton npcm845 SoC. There
is also a fix for a possible NULL pointer dereference that can happen
with early IBIs.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.15

for you to fetch changes up to bd496a44f041da9ef3afe14d1d6193d460424e91:

  i3c: Add NULL pointer check in i3c_master_queue_ibi() (2025-03-31 11:44:00 +0200)

----------------------------------------------------------------
I3C for 6.15

Core:
 - Fix a possible NULL pointer dereference due to IBI coming when the target
   driver is not yet probed.

Drivers:
 - mipi-i3c-hci: Use I2C DMA-safe api
 - svc: add Nuvoton npcm845 support

----------------------------------------------------------------
Andy Shevchenko (1):
      i3c: master: Drop duplicate check before calling OF APIs

Billy Tsai (2):
      i3c: Remove the const qualifier from i2c_msg pointer in i2c_xfers API
      i3c: mipi-i3c-hci: Use I2C DMA-safe api

Frank Li (3):
      MAINTAINERS: Remove Conor Culhane from Silvaco I3C
      MAINTAINERS: Add Frank Li to Silvaco I3C
      i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)

Manjunatha Venkatesh (1):
      i3c: Add NULL pointer check in i3c_master_queue_ibi()

Michal Simek (1):
      dt-bindings: i3c: dw: Add power-domains

Nathan Chancellor (1):
      i3c: master: svc: Fix implicit fallthrough in svc_i3c_master_ibi_work()

Stanley Chu (9):
      dt-bindings: i3c: silvaco: Add npcm845 compatible string
      i3c: master: svc: Add support for Nuvoton npcm845 i3c
      i3c: master: svc: Fix npcm845 FIFO empty issue
      i3c: master: svc: Fix npcm845 invalid slvstart event
      i3c: master: svc: Fix npcm845 DAA process corruption
      i3c: master: svc: Fix i3c_master_get_free_addr return check
      i3c: master: svc: Fix missing the IBI rules
      i3c: master: svc: Use readsb helper for reading MDB
      i3c: master: svc: Fix missing STOP for master request

 CREDITS                                            |   4 +
 .../bindings/i3c/silvaco,i3c-master.yaml           |   4 +-
 .../bindings/i3c/snps,dw-i3c-master.yaml           |   3 +
 MAINTAINERS                                        |   4 +-
 drivers/i3c/master.c                               |  21 ++--
 drivers/i3c/master/dw-i3c-master.c                 |   2 +-
 drivers/i3c/master/i3c-master-cdns.c               |   2 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |  10 +-
 drivers/i3c/master/svc-i3c-master.c                | 138 +++++++++++++++++++--
 include/linux/i3c/master.h                         |   2 +-
 10 files changed, 154 insertions(+), 36 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
