Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36230C433FE
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Oct 2022 21:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zqc8l1hySk0wYM+y+fcvL2cFUQ5oOGNUCshaRN9EZzY=; b=lEH2IjTXlcWIfO
	UpF33fXih0zqI0iI3ZjgQzHyCL8ng18DtSBRVkk6VlVgif9qfij8kuv2okMR1e2EOlAb3CzU3JGZ9
	PAUbD4Gg76hHUTiZ8D3bVIS9nhg0uuEAvqPIjXp4bbTce+Bs3zjfLAyMOrC9tVo3p55kMPwtVIfNr
	PvcraT4F2Cn7wlxrNp0r/S6tJaoueJPdfcWQj91XHDfdiJoqsfNwdO7Ce9jyecqkOIuOGLkslk1jy
	f+os1U/WV+12rEElEqhVshQeFwwoHrUmVuYQMMQKz2Y7s142HuQQEOJManegiwmye9EEiOyMUs1Kl
	9Lfk7xN8sqJd+BZ3SANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojS0u-00FxVh-1x; Fri, 14 Oct 2022 21:14:40 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojS0q-00FxRA-Ex
	for linux-i3c@lists.infradead.org; Fri, 14 Oct 2022 21:14:38 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B709320003;
	Fri, 14 Oct 2022 21:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665782070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=/00/5EjmbZweflj6nvJbu5mVDoLduCn7sIQC2QPJABE=;
	b=V8+JLwa2ex5Lm/zpNdzFLveVoxTpm8D4oVrH1FnFbEEvj3iGjm87aF+dLuJCIfPhG6OU1H
	KlavFWLjIBhq+NY7M7pOTi5F2+8qpH1gVgqs3+NAhjh4KgIy5nzHoewE+acN+UblzpCeMr
	zi0+AH6zyahNXAqWgxktLTS1ACcGIhjYGx3mkxl0R7COlYhGHhRAmgXU1/wtzXGL4hHe/Y
	kcf5NM0L5Fz1qNsmN0aeSAudYeQUWaGWLzY2UDcNjNxwMulUfunUNrqt34O4JotEDVYk6o
	EyQdiOyXRIfkP0lR/nSQDwlHLpIPDaA/Wn8mep3caoALdZQ2iU8irFNDAfe7kQ==
Date: Fri, 14 Oct 2022 23:14:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.1
Message-ID: <Y0nRNcKLvFzqVZeP@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_141436_692452_FE52871A 
X-CRM114-Status: UNSURE (   5.55  )
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

Here is the i3c subsystem pull request. Not much this cycle, only two
fixes for a rare event.

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.1

for you to fetch changes up to 90f4a09a15239f4a819b2e90a7a0b92a75060655:

  i3c: master: Remove the wrong place of reattach. (2022-10-12 23:45:29 +0200)

----------------------------------------------------------------
I3C for 6.1

Subsystem:
 - fix device reattach issues

----------------------------------------------------------------
Billy Tsai (2):
      i3c: master: Free the old_dyn_addr when reattach.
      i3c: master: Remove the wrong place of reattach.

 drivers/i3c/master.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
