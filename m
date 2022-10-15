Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B72EC4332F
	for <linux-i3c@archiver.kernel.org>; Sat, 15 Oct 2022 01:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AseBCn35W8m7bMAS+XEzlBFywujxRd12kGQRsvninPI=; b=C7Bddp9bzGE6Mn
	x4K10BbumBSk56hulMD/NXzjYYnQA/Yw9cqVqidvuOQRdvPzcBQFqhd8Rr9rKjs5V2HRkj4OhB7YE
	ihuwfSqi4qkEQARt0FnWRTqeOC+9V22RpcvvhABsoS0B8xsG4AFDj5dYqq+IlcyS/FFIl6aP8H8cb
	A9uRqdWz9zqAGloXHVfyi2/r0fxG5pk2FgTkiPb/WtWiPlT0aveSPIR8C77eii8qNjNN+8ur0davF
	72XSzq+TAhCfoFspqSgccsonUy5j6s1pmJ3pCulroDe02NqnOFV4jbyO+14j0cleZ4R5BSLFxR0mo
	30yzNj64rubwQqn2A+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojWEM-00GHUh-N9; Sat, 15 Oct 2022 01:44:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojWEJ-00GHTw-91
	for linux-i3c@lists.infradead.org; Sat, 15 Oct 2022 01:44:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 20F58B8244B;
	Sat, 15 Oct 2022 01:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9FFC4347C;
	Sat, 15 Oct 2022 01:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665798281;
	bh=fgzdQIDPiFvTuau5qI9wDAqdA/uq4AEb5GhK7Mkx0rY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MEDxATz/SEAUaZlTwMzj4xsN7WE5I0iGXmiI7hp7pM2nWD//HleMYVd6/964LDuUf
	 /dcWcJjB0MV0pgQXYRpOA3L0Oxvl5ySyZjpGdrB/QOHRmiaGsaczeacNWya3oJQA9r
	 cuOFORcrUd7gqIqpZqKS1KMmEa82Z0mh+MpTfayPfUXZ6Nwd1iM3U34KeZPAAmuqj4
	 C74zFAVeCnInXpiK3bj9M+UbdTcaPtpOLbJotGlVaFd8yvCG/hCyk94YVpeASiQ9Xd
	 FYDpn04jTQfB/p2/K9fGVvVVG64GlWhITkKqtbYPGsnuq330nSxnAJFDmL3IEuEZF2
	 hAmn1XzLd0NqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8450E4D00A;
	Sat, 15 Oct 2022 01:44:41 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y0nRNcKLvFzqVZeP@mail.local>
References: <Y0nRNcKLvFzqVZeP@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y0nRNcKLvFzqVZeP@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.1
X-PR-Tracked-Commit-Id: 90f4a09a15239f4a819b2e90a7a0b92a75060655
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ce1b97949cbf46e847722461386170e0f709c59
Message-Id: <166579828181.8004.3952722302215133008.pr-tracker-bot@kernel.org>
Date: Sat, 15 Oct 2022 01:44:41 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_184447_482703_D78591F8 
X-CRM114-Status: UNSURE (   4.02  )
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

The pull request you sent on Fri, 14 Oct 2022 23:14:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ce1b97949cbf46e847722461386170e0f709c59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
