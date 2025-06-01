Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18213C5B549
	for <linux-i3c@archiver.kernel.org>; Sun,  1 Jun 2025 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXip/DOQIcg+JHZP0kZKxxujj14Pz1QtrF6DfnEA09A=; b=Z/A7BAtVKYgvbe
	vUCrOheR4owldjZd9/NYyZnaORHUEviIM6k6cnEZbGrb2hY54GfhtLFlNTiluFR1cen2HYQdphNk0
	pEWgJfTvTTE3hq9G8+CwapxId82uAWz4G8a41XpFhJ9mIA1shM+Xb7BELYqn61cSDP3BZoIdnv54f
	9/9IVW/8bXk6UeDGUq9SzROmTayA95gy+PcaWkV0FPhPvxT1Mp9qXNN3BdNQBtcYVas3uDOAmFl+D
	ujLZfYhHJYihDAJJoDG3T5Z6W4hvNjL9IjC6TZvWbnirR91X2f9L4CDAkcQXWdGJ6s/ZHxL/2sVk+
	rRmF6PFv08OinIQCvbBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLlBV-00000005f1z-37gR;
	Sun, 01 Jun 2025 16:05:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLlBU-00000005f1g-2HNh
	for linux-i3c@lists.infradead.org;
	Sun, 01 Jun 2025 16:05:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 902E7629D6;
	Sun,  1 Jun 2025 16:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CFDC4CEE7;
	Sun,  1 Jun 2025 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748793915;
	bh=lVajFAdCI1KPJxrQZROS4ycsSzNRhfdxSgvxED1eXCk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XfZuKzeYuf54dkpSqRh+KfF1HHO46vGMQS3P8nMN5OJbDFu/WOdT9AkyNGpIFoJmb
	 ZER3r1uK1xYR5i1A/fV5BiksqwIGI3aQvRr9eN7HPLiXSIxEKpwsIgShinXGkuINm7
	 Rm4rOFJGM5+P/zVbUeNN1b02eCa0tJb1joYAYpV2PQ7hhHhFKiRhDHuvhbUASpm+56
	 nbcWGMKErUxmQg9TGezETNjhC0lRbzdkKZ3OmMs9kalae9MDAn0n5Mkfac1Fnl5tjz
	 VMUewi3H1F5aGxVgZuICWQaDesqtzQi0o/TVI4G8s0WGiJPVo1cgUUNnPEHqc9/6G5
	 mAXxSJkszM9gA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CB5380AA7C;
	Sun,  1 Jun 2025 16:05:49 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250601092038f33de29e@mail.local>
References: <20250601092038f33de29e@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250601092038f33de29e@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.16
X-PR-Tracked-Commit-Id: 00286d7d643d3c98e48d9cc3a9f471b37154f462
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2604f8d43bf414db54c42ca6ea52803ce1c0b2f
Message-Id: <174879394805.436212.5089571301362760312.pr-tracker-bot@kernel.org>
Date: Sun, 01 Jun 2025 16:05:48 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Sun, 1 Jun 2025 11:20:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2604f8d43bf414db54c42ca6ea52803ce1c0b2f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
