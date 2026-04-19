Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B137F99C95
	for <linux-i3c@archiver.kernel.org>; Sun, 19 Apr 2026 00:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFGOA3VDbbqIhGyXXL5t5oWHcMZ5fxg0eQdAB3uB6Yw=; b=RYgOjDE+zifbIa
	B74vQpzDKwBIAlfztrhSzhViRpMkrUTisCmkvp/oMxgS7pG1+sZbJtQF1x0G8cfQTIxDqOzx03mfb
	QV6r9EQVjMuLlAMRbpKSe5f9r6c8DR9nM1wTHx4pouQpFPxAokqrfaJDbSGxrb2lUlWBom+sOkcTy
	SyzFSH3+tqgLH76I7C4Zy7Akf+tw9IAskRP4c7g5nRHKChH0Gu22wVZqjWs/VguwuVK7qjvibNtDC
	bORq26HnB+PK4t1PD8G6i/JSIw6bmrzj3YStH0aXSBzl7k6tXH4qbR084NuW4SRpzicLy9MT/iYth
	yPUeVr8HOB8Nm2jjHlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEFys-00000005NO6-0smj;
	Sun, 19 Apr 2026 00:25:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEFyo-00000005NNB-2glr
	for linux-i3c@lists.infradead.org;
	Sun, 19 Apr 2026 00:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22705433EB;
	Sun, 19 Apr 2026 00:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A71C19424;
	Sun, 19 Apr 2026 00:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776558341;
	bh=qE0TSsSGGm5ap+qNIEyo6WrzfVt5wXpQWOeT5LZJxZI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dP7LGHjKEHtz8nPFJiVYP7GUThuellEvaXdQ2jqDCCrli9n4fmrVS10/c3siqBtNd
	 BAvuE9HMWJZMPpsxoZfqBA8CXVAKZtldmjO4gSxM8yFRKp93DgbQ/Ur59wmkv3B98c
	 jRKMNuw6o7++hgXFsEwIwjwFryv3wBg8UTeBCInpPFlQFFCq9ypwsaT6yNHxwbII5n
	 e/OZLiBwC8DHNNjZln9kNWQJUe69RW6q48BIT9YF2dHhu2luNT9nIQLcWkX+vEhUze
	 s2XG+KpRLuKLvTPgmh+R9muQ07EC7yFjiS6pYoHhP3QbDc434vMVz/uGxX1bfY58M4
	 qRc0EnsGbE+6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CFE7380CEF4;
	Sun, 19 Apr 2026 00:25:08 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <2026041822194034ab56dc@mail.local>
References: <2026041822194034ab56dc@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <2026041822194034ab56dc@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.1
X-PR-Tracked-Commit-Id: d35a6db887eeae7c57b719521e39d64f929c6dc3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 401b0e0bc96543881924d623388a9472b3331b3f
Message-Id: <177655830705.601756.8340485824047097322.pr-tracker-bot@kernel.org>
Date: Sun, 19 Apr 2026 00:25:07 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_172542_702942_2562120A 
X-CRM114-Status: UNSURE (   3.31  )
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

The pull request you sent on Sun, 19 Apr 2026 00:19:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/401b0e0bc96543881924d623388a9472b3331b3f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
