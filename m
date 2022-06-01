Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D171ACCA473
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jun 2022 21:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Isx5w0MALqcIyq1JI2fX06917BBVXgysopBRnjfTGQE=; b=xio9N+ESpfvrfR
	dL3v5RBaY7HnDqPHh+Is8Kw5djBQENA+ytBvkrKk0uLyqBqeQYc3ORRQslOhNUNyA7xS4U9Eh7ugl
	XPzOSsCvF3+k2/i/3oBGRLGOLmVazYgu1ryNfat7ZH/ohj84/QedpNp6MqaB8ja/exsEAz2tSQDST
	SfiPUElm3Qd30tyBHyr8yDt6TNHFQlP46TxYIl9IpEGAcyzb/3nnqiNAfwLBjJCVqquIYx89xLA6h
	vysC2j62BygxHAnpFbfyZl74ZQAdMkxVShXmkGNaJsqoe13ME0UFA9wx7P9rN8jb4x6RMagCVH7n9
	GziVEIoM/WmB2We2qYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwWH8-000ZHi-Fa; Wed, 01 Jun 2022 21:53:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwWH5-000ZFn-Nx
	for linux-i3c@lists.infradead.org; Wed, 01 Jun 2022 21:53:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5A203B8175B;
	Wed,  1 Jun 2022 21:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01C3DC34119;
	Wed,  1 Jun 2022 21:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654120384;
	bh=A3Y/hhUIu9rwXN92/CQd7PyYC9u6dgXtTgA+FUAIEeE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hq34C+22to9uUSz1dgZgysCia0AvkocB1xdFtqsvWXOpwUf0xI8ofCGRuLRDsnxfD
	 bS54mc/1FeZY11RS+FhJxU70066LoFKTVDdgHvNqIZppBiEofImh3UU25qTwCi0KuE
	 hr4oD+3ZEtnVh4zwf/F9a2VKUSwUjiPn1DoNQvKq5Wl/dfcpp7f8Ziq14tb3U0W6/y
	 qCAgUxoiTWFv5f8tMz1+evOG3tDzdlEIQj0MAnqXrYjrRLazgeF2s/6A/qcmc9JxFi
	 OiTHRBqqwfu8BapgAQmdgh0WA3OxmFoPMPrstjyvj99mfiIUg73y74MoQxjpGZ5nd8
	 Ad7w+SG1PAV/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0CE7F03950;
	Wed,  1 Jun 2022 21:53:03 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <YpfXf/unhrWZkE3j@mail.local>
References: <YpfXf/unhrWZkE3j@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YpfXf/unhrWZkE3j@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.19
X-PR-Tracked-Commit-Id: 66ed42caf286a7aaeb6f1db4b2995dd9416226c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55fe92179058406fe00bff2167c94443a7b2e07a
Message-Id: <165412038391.5556.7245944693656757925.pr-tracker-bot@kernel.org>
Date: Wed, 01 Jun 2022 21:53:03 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_145307_945880_234C0A72 
X-CRM114-Status: UNSURE (   5.04  )
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

The pull request you sent on Wed, 1 Jun 2022 23:17:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55fe92179058406fe00bff2167c94443a7b2e07a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
