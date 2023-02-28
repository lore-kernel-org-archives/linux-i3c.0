Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B1C64EC4
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Feb 2023 23:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gs86bbFB/Z2e6g3dbjkKxErqjINmRW8vebRXYv4ZHGo=; b=YjoBLRk9CuqVG8
	mr2PGAPMQFHhHl4msPZVGsaM9lAIt+chxqQID+V9cBAfhVqbQBUX2azdWA5x0NY8+dWkQuZZcYXGq
	T5B2b8KqWukoG4qgQD5kBab59NPszQ+WfKbfsPr9lVfzxyXP31xMz1ce0Jtwdus5lsVwqIt3XoyE9
	SGKE7P4W483sv2jbCGqPuBDmSM7ml+1zqwN1mmtg90v9pbM3Wre9Ci8IQYTXsAp2lYrl1HkzcTppZ
	I7PQFQvAJHQHUi/VfAeVYBY2Xt7B9+dah7FeaEcTdTlOke2oOlfFVEfobJRgiSRj9/oyREncJs+Ve
	M7sz1ZY7lRtHc3G+rhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX998-00EYcr-Ke; Tue, 28 Feb 2023 23:12:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX995-00EYb4-9s
	for linux-i3c@lists.infradead.org; Tue, 28 Feb 2023 23:12:33 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 595C8240004;
	Tue, 28 Feb 2023 23:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677625945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=dOwfZ7Wusa6c4c2KZROuzohmibC4NdJ1VuXK4VA0VU8=;
	b=G6X9QqO9X5LsTM6A5hAzu6E1NfBT2TQ830DcxZ80a5RVw7H6V0APr0my5DyDFMMCFpYqf2
	xLXdpL67qs7nDVsl3t1cidqt+eNlrJKTv/+xg+zsKRbREbnweXJ+Wd5HFySHL12vROcJ2m
	wLAWWVH9xRRmv/T4ItfKe76Ok5KReugGiOlGzjQ1vmuq05pb6FPKBAoKs4700SJsJvwl5Y
	lEXAnBe3fmXyWdxOs4L7y4EofbnW8rtBHGfMzKjMwoIZPxeDoJnyUqBjdIl6w+XCsK2fN1
	W7xo5RV3wcDotjGIUrRLNAjXL5KyTx3EfVFZ9dvS//h5kM9lJUsNYDpqTzKipw==
Date: Wed, 1 Mar 2023 00:12:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.3
Message-ID: <Y/6KWc1az70PQB+/@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_151231_646371_4C4F648C 
X-CRM114-Status: UNSURE (   7.21  )
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

Here is the i3c subsytem pull request for 6.3. There are two small
improvements for this cycle.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.3

for you to fetch changes up to 510d2358c466bf6588034f0d3b2266eed2bc0a51:

  i3c: master: dw: stop hardcoding initial speed (2023-02-28 23:54:49 +0100)

----------------------------------------------------------------
I3C for 6.3

Subsystem:
 - transfer pid from boardinfo to device info

Drivers:
 - dw-i3c-master: stop hardcoding initial speed

----------------------------------------------------------------
Jack Chen (2):
      i3c: transfer pid from boardinfo to device info
      i3c: master: dw: stop hardcoding initial speed

 drivers/i3c/master.c               | 1 +
 drivers/i3c/master/dw-i3c-master.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
