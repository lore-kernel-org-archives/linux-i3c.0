Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052F5EE14A9
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Sep 2023 22:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GU/8FZBAEdn5P9sq21zuc1CIwC87LXcjIRxWT3iJ2kQ=; b=BPc8TbiJeZCD9e
	PIfynIV19Dsidfu8TthH/BPR/f9GYzALGhilYTj44WBh7MXx/Ffc0S+IGE3LtcpbsigVBz3o0JKe2
	EOlkEbEv+AnidtkO7MHS48JGdj/c6U++BuDJZb8FV7CBznds/NFCsS62vGrHEGaVhTTq7refBSUdH
	XroQsy1ND8UXpGATk2xXyjsZceMo38ZKmIGsPNR2TNJ0PmINb21bXsxcT5DyMS3B+gspVj86Vb9OO
	jnQVeN2zuM+/yejdFMMjLX45pkgz4BikEVnFhsQITp6CMwMyg37KJzw+fraZsaTTmVLJTsbSBKoI5
	NN/QsXtt+Qx8oUeU+M2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe0gI-00AxSN-10;
	Wed, 06 Sep 2023 22:07:26 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe0gE-00AxQj-1n
	for linux-i3c@lists.infradead.org;
	Wed, 06 Sep 2023 22:07:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2AA7C0002;
	Wed,  6 Sep 2023 22:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694038031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mCCueHqxrK4depNZb+Y64oZRKRhws2c6uxnRIrlmxnA=;
	b=hcM/cWkI9+oFzPF0aVuI3YBpfMF2d0yD2QRnZ222uzLSs+M5FBhUw21M4m52PVEyExf5LO
	Kex1zpkrQ/rLaGQhh5ldEM8hzywvjipxcnKWiLuizlrHbW/ZeNSb9SHUOA3a05epS6DPhZ
	+6MNr1FKVpuRsCOMR9nAmUZDuapkNamLplwdlJ7ULsjyiYMhfWfa6u17nzIMhnusM/36S3
	HErsJVmNrLy04R45UNRJnJy80Fp6ha8E6YpSbJliO7E3b3zJxAz4k1fXp77sd8hS1XAo3Y
	07BLth/CUaXfkkrVFDLvx5FA3di9ICOqEGz0FfzqxBMaSORpzmAeZuOWSVfuOw==
Date: Thu, 7 Sep 2023 00:07:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.6
Message-ID: <20230906220710e64b2b71@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_150722_738041_960B3F22 
X-CRM114-Status: UNSURE (   7.68  )
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

Here is the i3c subsytem pull request for 6.6. There are mostly small
fixes as people ar finally starting to have access to actual hardware.

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.6

for you to fetch changes up to 6e13d6528be2f7e801af63c8153b87293f25d736:

  i3c: master: svc: fix probe failure when no i3c device exist (2023-09-06 01:21:47 +0200)

----------------------------------------------------------------
I3C for 6.6

Core:
 - Fix SETDASA when static and dynamic adress are equal
 - Fix cmd_v1 DAA exit criteria

Drivers:
 - svc: allow probing without any device

----------------------------------------------------------------
Aniket (2):
      dt-bindings: i3c: Fix description for assigned-address
      i3c: master: Fix SETDASA process

Billy Tsai (1):
      i3c/master: cmd_v1: Fix the exit criteria for the daa procedure

Frank Li (1):
      i3c: master: svc: fix probe failure when no i3c device exist

Miquel Raynal (1):
      i3c: master: svc: Describe member 'saved_regs'

Rob Herring (1):
      i3c: Explicitly include correct DT includes

Ruan Jinjie (1):
      i3c: master: svc: Do not check for 0 return after calling platform_get_irq()

 Documentation/devicetree/bindings/i3c/i3c.yaml | 15 +++++++++++----
 drivers/i3c/master.c                           |  6 +++++-
 drivers/i3c/master/ast2600-i3c-master.c        |  1 -
 drivers/i3c/master/i3c-master-cdns.c           |  1 -
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c       |  2 +-
 drivers/i3c/master/svc-i3c-master.c            | 19 +++++++++++++++----
 6 files changed, 32 insertions(+), 12 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
