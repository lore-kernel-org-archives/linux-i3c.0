Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D643EEC875F
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Sep 2023 23:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTyzbJZ9jVWctdNPNCdTVkhlrdSdpukjeiqLplhNUPw=; b=xZpbE2r1mukH8D
	qJhXkiYqVk7oa1eua9SvuKybElcYad535sqFNeLiJ1n1d3p/d6j3mY1Tl+eiA0djAIB1n7q9JrO8K
	hlZ6+QSNFLK+JU+ERZvGnx4ysDcRkgz0Eq8BAXUdFj5B3OkgAZXT32A59GBGRQHoNI1oD31mKYJy0
	Q2biEdAvyDE3AxIHIdYDt+Wd7ZVgQldVOBKOOawAhar4x5TPXEHvFqvJF/OH3woOAnFyHp1ehY/AO
	UJgTy1ZTZDwx4Bai2UzeRT1jXfu2muc4i38EhYVvpac1cUX+RLhU7sHSLins8mTBxMiVHrPv6OY7e
	3QfNLjeRfrU+9FI1viGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeO9C-00Cn0A-0c;
	Thu, 07 Sep 2023 23:10:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeO99-00CmyX-2H
	for linux-i3c@lists.infradead.org;
	Thu, 07 Sep 2023 23:10:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 922A6B81FDD;
	Thu,  7 Sep 2023 23:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36810C433C7;
	Thu,  7 Sep 2023 23:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694128244;
	bh=6gWp2LzWin1oNp74f1oWXGDjZIu3aUVYay4jiJw+Pas=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Sdy0QlZx9F7DFfWW1TG0Ct7xAzGMBo93ZdTQNLuzkZqRDprHof+ef0n37uhNiLtNW
	 7vCm7FvlDvCuJk1C+6DdWGmPHjBQJFsKRlCejJB6ddKaM7T7wkLwus+vvcwyDx0MnL
	 JsgNLacFhGRkZdpVcMQYe+Ty0QfigEcZ/etOb/LaRZE8jSm2Ka/6adK4dMmjDWa4IR
	 XpFHV1ufxaYfhLLTyuCI71SqTgx+niulbC4Bw5MB7qK8s5LMuKgr1Mtt8uxw9QA5ag
	 nv70J1DOIT/IK6cEFebj0cQEnz2+J30rXDl24HgG3Mqr3qlplvVyarD84StNYLaDOI
	 M1U2r0FKqil9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25666C4166F;
	Thu,  7 Sep 2023 23:10:44 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230906220710e64b2b71@mail.local>
References: <20230906220710e64b2b71@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230906220710e64b2b71@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.6
X-PR-Tracked-Commit-Id: 6e13d6528be2f7e801af63c8153b87293f25d736
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e59a698b2d89b95471769c901d12392134c56eab
Message-Id: <169412824414.8351.10637565613849854944.pr-tracker-bot@kernel.org>
Date: Thu, 07 Sep 2023 23:10:44 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_161047_904500_EF1BD42B 
X-CRM114-Status: UNSURE (   4.24  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Thu, 7 Sep 2023 00:07:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e59a698b2d89b95471769c901d12392134c56eab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
