Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2C9EB64D9
	for <linux-i3c@archiver.kernel.org>; Sun,  2 Jul 2023 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ngrOZwwbnthqxomOLnYLmS5rf/SpIswS8yILU6sNQ/w=; b=oWI+FFXINMH+eG
	j1JxiUriF0HmsZDOzqiXqdBZHyoDADaBabXYeh/h9NwWjDa2rua0yzcikxaf66mWxNmJ1uvfLVuu9
	ekOvnkHd7HdfKm9JEieCqlxnwPoj8uOj1PIQlEDGdgC4X7e4XHDuFojPgcljvqJYuemHnRGv+Dtjv
	XagTO5oTQ8DxhIDJkC48mNKnk57MrXv/GLepPFKthgqitSGlQ7gqo4v8vRPdsih4UywWXKCgafGly
	KP0Td+MGwCgiIysTH07Z8kxnYqjaXXX/JwCrkvQpIwocHLzJcP9fP3RTKPEOEMXr8kVsXr0GzndbP
	KKl4GnCcTCmwxdOVeEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG5Bp-008j1B-2T;
	Sun, 02 Jul 2023 22:05:05 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG5Bm-008izv-0h
	for linux-i3c@lists.infradead.org;
	Sun, 02 Jul 2023 22:05:04 +0000
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688335495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mCmHPHG1J3nq8ze0eYLgFLp9DhOovj9KVVg4dWBDahQ=;
	b=aG4MAU5ULXZFoaoBIQQuB9f9ST7XDJe2fICB6YcNOdvNfDk9waw77dmxibZwNB7jIUYIay
	LfPlf7dP0kquujRayPg92PIG+xRFeC07KiL1bCPr6WOFkbFrjJkYjKFSnq94rXU1ZuoMJe
	s05DfOYNcI892A4hF4OdOmai+SFnsrSIBg0+tXYcRKEbPs5pq+5fVckCZG2OhC4HNE2orX
	BbtXmtVZIXZw2rTi1KJFndljVwDZoUzqxayeGhN6Dvhyo5sKuw30+PXutds3cQeD5wLH5B
	Matl3YDcSbWYcVHBX9/lQUheVXZZR/Q+VntIt6637sdG0+F5kUjkVN2kUV5BpA==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6A491BF203;
	Sun,  2 Jul 2023 22:04:54 +0000 (UTC)
Date: Mon, 3 Jul 2023 00:04:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.5
Message-ID: <202307022204546baff5fd@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_150502_396254_162C87D1 
X-CRM114-Status: UNSURE (   6.19  )
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

Here is the i3c subsytem pull request for 6.5. These are non-urgent
fixes for the svc driver.

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.5

for you to fetch changes up to 49b472ebc61de3d4aa7cc57539246bb39f6c5128:

  i3c: master: svc: add NACK check after start byte sent (2023-06-05 00:50:51 +0200)

----------------------------------------------------------------
I3C for 6.5

Drivers:
 - svc: fix suspend/resume on some platforms, fix locking issues

----------------------------------------------------------------
Clark Wang (3):
      i3c: master: svc: fix i3c suspend/resume issue
      i3c: master: svc: fix cpu schedule in spin lock
      i3c: master: svc: add NACK check after start byte sent

 drivers/i3c/master/svc-i3c-master.c | 51 ++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 9 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
