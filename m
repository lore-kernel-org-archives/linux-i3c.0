Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBD4D59F51
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 23:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1M2XyJM0d7qCWMSbPlJXzr7CVW5K6YT1g6xcFwoM5kg=; b=ffCoN8RVjCeeRl
	LG6ECSjOlU+SDLIUs3WLOpeaFIhqdoUHrOle8OqjxPWX8T6ExHVNEZoEZBtCDBiAxgPsDxmDgjl3n
	WpV6SB6SSKpe5SuQEQL1ahWFQvZxq5VxNVuiSiEtwgdj4OPb5DIXmalxg3dlWCkPBGy5D9qFFK2H2
	EjTBcDOyP7tp+JAvVE3drQ+uORCSZDMNGs3gRkzerCgMKteAky75XiFVfbtsFfgFhd6ra9cBlMPIG
	Dyrlld3RSJTSHd1PmPwFOPJBqTsYDj2zffp2tws9xJSLCZv0Anml+lhzZ9NOpKsy+cpMXRLdBCnrA
	ANbMjICNUf7BdLhtZsYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCDd-00000001CVS-1Y2B;
	Fri, 12 Dec 2025 23:06:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCDa-00000001CUd-1YvZ
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 23:06:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB2EF1A2149;
	Fri, 12 Dec 2025 23:06:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ACAF2606DF;
	Fri, 12 Dec 2025 23:06:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D7C2103C8D89;
	Sat, 13 Dec 2025 00:06:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765580790; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=Qhm2EJ0O9NO+flteD9ko907BfVypYh2PObEgLRGyCHI=;
	b=vGxHQqgTYPquoPdqxybZVAC8YMwdBf+gIhAS0MKL0qU9BlA7UfsrpN7yJ7+RSG6VX+ulZ9
	p73InNtuTS7CKio1Mspy7Y116SSGPiZFz/B9lKNhLd5IVKbdDWrsXP8Eo1G+VUPGjML+Dd
	fg3fLjfYwYzAp/ibnD5KC2xyvuWrdnZdtKSplwyIl7Qa9eWxxqeFFIW0uapBF6CJhdY2VV
	e9ZuMLUFCp3AxulaHbKeqyIcGZfuOzvcb6VwoQb22utbde5ysmy23gWUxAnPD04yf9CUX2
	RJjJI/QsNG+H/k0FLdK4TXh9WMOvZJMigPuAnrIQwTrpe8eoFDto4SLdPTze3A==
Date: Sat, 13 Dec 2025 00:06:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.19 #2
Message-ID: <20251212230628a6dfdd16@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_150634_545570_A9813465 
X-CRM114-Status: UNSURE (   8.38  )
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

Here is a second pull request for the i3c subsystem. We are removing an
API and having this sooner rather than later will help ensuring no one
introduces a new driver using it. I've also added patches removing the
"__free(...) = NULL" pattern because I'm sure we won't avoid people
sending those following the mailing list discussion...

The following changes since commit 79c3ae7ada0548d5097bdb65dde5d24a7d660fae:

  regmap: i3c: switch to use i3c_xfer from i3c_priv_xfer (2025-12-02 17:33:02 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.19-2

for you to fetch changes up to 136209e6bd981e60db6c0e78f2919ff2f92312d4:

  i3c: adi: Fix confusing cleanup.h syntax (2025-12-12 23:59:39 +0100)

----------------------------------------------------------------
I3C for 6.19 #2

Subsystem:
 - remove .priv_xfers

----------------------------------------------------------------
Frank Li (2):
      i3c: master: switch to use new callback .i3c_xfers() from .priv_xfers()
      i3c: master: cleanup callback .priv_xfers()

Krzysztof Kozlowski (2):
      i3c: master: Fix confusing cleanup.h syntax
      i3c: adi: Fix confusing cleanup.h syntax

 drivers/i3c/master.c                   | 17 +++--------------
 drivers/i3c/master/adi-i3c-master.c    | 18 ++++++++----------
 drivers/i3c/master/dw-i3c-master.c     |  8 ++++----
 drivers/i3c/master/i3c-master-cdns.c   |  8 ++++----
 drivers/i3c/master/mipi-i3c-hci/core.c |  8 ++++----
 drivers/i3c/master/renesas-i3c.c       |  6 +++---
 include/linux/i3c/master.h             | 12 ++----------
 7 files changed, 28 insertions(+), 49 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
