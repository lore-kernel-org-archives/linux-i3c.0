Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC771C02181
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Jan 2025 00:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6ae284GCaMRo6KLf3eHDPPbEUkCNccm+8+5v1J+o7M=; b=V2ZhF9BM/6edcT
	88J3a7dw5kQ09GQsIoUeM1HGu/0esG7EmaW0QjKHFJ+VHRBdeu3JnL2KhlZ7Mrsme3LjEPqbhTqUx
	4B13HUNzk0YI4W4odiTqW2PDLFV30HyKV2MO0QGlvqzlInejDQg5ATWKw39s/egUtG9csOrwxDXAa
	oYodOpzOPkqwfsPyB4P2kDPJGesZ1jPsj6y/jJ1t66+SCTSOJQMWOd+/NEecYB4mWPC961d/NNMMB
	7zwK/m2QOmAuQmIJlvRRfIUeI2OFaTBq/aT9w9LoKS4+adS8iaBze63HNBW88MsmcS/LIxpKaJ0l7
	2PGR/kVAE/c/Ar9Rq4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbToz-0000000FmJg-1Wki;
	Sat, 25 Jan 2025 00:14:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbTow-0000000FmIk-3zaI
	for linux-i3c@lists.infradead.org;
	Sat, 25 Jan 2025 00:14:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19B065C5966;
	Sat, 25 Jan 2025 00:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1F2C4CED2;
	Sat, 25 Jan 2025 00:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737764082;
	bh=7N9SOW2ORRLHzPmNTNGQtlc9WvHsKT044ngsDLNn2kM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lVcqbGdPDkv7EriOOhwXRveMZS1CgN08zIT0UoZOSkT2lS5nmM4wA3EHbt0Bk0jJb
	 TbfZGjvQPAzHdqqmgTr3O267wRHZsnKZrENFj9OI5ePLGTa74d491pwOwjKRKENToX
	 bO+KTA3of8nMZCUisMMng1NWuQwJE3COGOfSsYllYMUyQ8jOeuVbqG9ikrEwLz05+w
	 rCZWSdInuYrMo0oI9eIWnmPY55VbWP6rcx1h6f7U0DK3OtufDAKxJFcMCjRP1C9Ic0
	 E9mYhBUiAImQcnrDsVdxpFNOVD9CzEZ5uhSpcg5OauvWaPZ6DwV8SBWfkb4cKxMNIU
	 gCjxi8Xk05nng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34260380AA79;
	Sat, 25 Jan 2025 00:15:08 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <2025012322385618081415@mail.local>
References: <2025012322385618081415@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2025012322385618081415@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.14
X-PR-Tracked-Commit-Id: 5eb6d3561f6cb6d59887be6da764417e437f6afa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d5db4e3fcb10900d828826418a83dfba9318277
Message-Id: <173776410681.2216626.13848430035052369876.pr-tracker-bot@kernel.org>
Date: Sat, 25 Jan 2025 00:15:06 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_161443_031735_8CA5ED55 
X-CRM114-Status: UNSURE (   3.30  )
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

The pull request you sent on Thu, 23 Jan 2025 23:38:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d5db4e3fcb10900d828826418a83dfba9318277

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
