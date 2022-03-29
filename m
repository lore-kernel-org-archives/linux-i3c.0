Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5BEC433EF
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Mar 2022 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p/RLZDu0vXWGzpga90JjtU8q3W8WPgzN6MqtWtXtX+M=; b=0sJccigrrZD+op
	itu1yBP+O627t3fr4f00MeyUIFmMJJaGGgpG/CPpdFFjKWXGK7f5/SAzm8g5/vAwzxo19rLCkhtp/
	Jd8qfMbdGsEt7dRiOIph91QpnrH3Xipk9MQ7macdQDJvezEWrBC1LIUOnjCXi7HP8whwa70fK6uFw
	Rvz71mMR46maQGF6Q5xY+ABkz1+V71XS2h7maXbbUWQdDAHuGs19u83IpW14Qnm9LY7tDR4OUjpz/
	fYFKCffcfQyKnH3QAwRLCD/KAttana7aqEBkERuDq0aPdMf3kisKx6UqafzPiCwfNPoXUGABGgpnS
	pf289eb30e2AcHjBLj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZKJT-00Ddov-E3; Tue, 29 Mar 2022 22:27:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZKJP-00DdoR-Uy
 for linux-i3c@lists.infradead.org; Tue, 29 Mar 2022 22:27:42 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C7E9620002;
 Tue, 29 Mar 2022 22:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648592857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ojg5F1DXCe3Y/aV3OPsS7r+oEs3m50ZmfW/vq63NdB8=;
 b=CGXO0obM94xvnCMJeNES8DMcbrm4pADGk/QsroloKCfHamZL9Vp3E6OMEqLq6LMdqljZ8t
 MtXEVp046HV2pssKiEwR8BAT+j3oOvDhdWkuBj7WZ1SbMj/vSvfzDiz92w1LnZXVrIdlSp
 0AyJYYcY7LSpWaQZeYD+pqDb2jsUL+6YUI5MJWxtGVInsDLOZDy4u66mutXAeEqdnZxFJj
 RHZwBMiLiYiMltatn1dhusseK9ik8VHFQKZgv6ARF08Dqns3E+QztvY3AlyVSoZ+r5YY9h
 6BN4p3CkCy1jseonPus6FV+4Zo24gx5hc+8shwsiGxjEEw3JwSoRpDv4XIG1OA==
Date: Wed, 30 Mar 2022 00:27:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 5.18
Message-ID: <YkOH2Jd9soaAFoog@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_152740_348709_A04F249B 
X-CRM114-Status: UNSURE (   6.46  )
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

Hello Linux,

Here is the pull request for the i3c subsystem, adding support to
dynamically add i2c devices on a bus.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.18

for you to fetch changes up to 6cbf8b38dfe3aabe330f2c356949bc4d6a1f034f:

  i3c: fix uninitialized variable use in i2c setup (2022-03-08 22:33:52 +0100)

----------------------------------------------------------------
I3C for 5.18

Subsystem:
 - support dynamic addition of i2c devices

----------------------------------------------------------------
Jamie Iles (3):
      i3c: remove i2c board info from i2c_dev_desc
      i3c: support dynamically added i2c devices
      i3c: fix uninitialized variable use in i2c setup

 drivers/i3c/master.c       | 151 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/i3c/master.h |   1 -
 2 files changed, 142 insertions(+), 10 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
