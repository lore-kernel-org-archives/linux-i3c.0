Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32697C4332F
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Dec 2022 23:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BOkQUldzgqtWmaVChIPPr7RPGmWxfvdusoqWUWBxQL8=; b=TNx2YzvFeRo2to
	xP5vNUL/p32uHtcYtMw4U1nVmHAnXhtgmEHuSbMXU1JdU/hbwP1oRBUtaTWe6UtRZ7rSz9kEJL84Z
	3nqPbiefHa7PiRCShTTxqHibOn6Ry/wDd7MMinZA/TTUCVL39fDGIi7w8nzCVTd+KW6LOucsfwxh0
	lfhk1p92Y7hmRiDZNSx+YG7AFLAtRH9S1myaLRy9iGhwAWP84vkJe8axyyPH/cQWUba/gsHOMDki3
	8LcFUXTv7/X9J7ATnoHxsXCUPtpLXQlTbmUMeqexsjlEXpbGuJvToZ6MI9Atvd7x44nkN1u34m6WK
	84HPL1ngqaq5mNztv7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ET2-00867u-Vk; Tue, 13 Dec 2022 23:13:44 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ESz-008664-Ql
	for linux-i3c@lists.infradead.org; Tue, 13 Dec 2022 23:13:43 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2777940008;
	Tue, 13 Dec 2022 23:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670973213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Yzl88HJxHY2bEmr3PLutFWx2niCMU+kN3n1YfPEotFs=;
	b=EnpAdq012TQNFFcYnJZb6SEuol82N0i2fj1ujk7afvtkpnuaiIjB9nt8RS1oBESAbbUelZ
	qy6eChfUDp8nuXseVs9fsk6E6FWDmS65X//QEBh0V1o1EEw+v8btg1/sAhi6y+0WqJGGXO
	UX1uJwa6qXQQBPgYFcbRzqOHUGE3xQqpYpIErtjJU1orIX5URXpKgnCMBRerHj3i/Kye2/
	3gEOMxRJuZqi9e5QrhAeP1zaoinYtlEfOzxeoE1v8g3jsYnLvmNGjv8A3VXNRXz+fRbIX6
	To2z+tT+i4+1Eqcgh8lk3HH6b38MWijqTSzZOT6Is3+0/pcI0tiJOjjQWY+OMA==
Date: Wed, 14 Dec 2022 00:13:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.2
Message-ID: <Y5kHHAOgXCz3zQzi@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_151342_048275_E6B3747E 
X-CRM114-Status: UNSURE (   7.11  )
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

Here is the i3c subsytem pull request for 6.2. There is a non urgent fix
and SETDASA is now exported to drivers.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.2

for you to fetch changes up to 08dcf0732cb4d97b85493d9f60470e48eebf87fe:

  MAINTAINERS: mark I3C DRIVER FOR SYNOPSYS DESIGNWARE orphan (2022-12-11 22:04:58 +0100)

----------------------------------------------------------------
I3C for 6.2

Subsystem:
 - API changes

----------------------------------------------------------------
Alexandre Belloni (1):
      MAINTAINERS: mark I3C DRIVER FOR SYNOPSYS DESIGNWARE orphan

Jack Chen (1):
      i3c: export SETDASA method

Naveen Krishna Chatradhi (1):
      i3c: Correct the macro module_i3c_i2c_driver

 MAINTAINERS                |  3 +--
 drivers/i3c/device.c       | 20 ++++++++++++++++++++
 drivers/i3c/internals.h    |  1 +
 drivers/i3c/master.c       | 19 +++++++++++++++++++
 include/linux/i3c/device.h |  5 ++++-
 5 files changed, 45 insertions(+), 3 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
