Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1131CC3063F
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r7MjRWmDg0HyqRReDaCoouWmjT+BqZ7tgWgb2+HUzk=; b=1atAuJB2BWQjud
	FKjnA0YSq2NC8ABJHsorxwR+n6zLEm5lkCexpO5dUWaKJPbhN+J/WNf/2BoI/XcuHuyNEpGuU9m9t
	+GwZ+p0toFhoWLfCb29H+wJgzMkljkjGGEIiMqb0jw94Qcn5WCjOJbGHMuX9TlbM3+mPam1ccsrCK
	KdmxH+EzyWzC+7ZUYXvkkA8PxXeneYcuFC8DBZBxP82yWmFoCEzb+hQJd20lGD+xymu6LrFOK0tyd
	h5BoiREqV+jIR75p71duJqHeO+E5HdYRWYz4Q1dOwPtN1KS8+uJ7POxuDTAzSQA2BI6pKTJM/DwMb
	RM/XeeqcnxkZ0P8BWGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGNfe-00B8Ma-0m;
	Mon, 03 Jul 2023 17:49:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGNfb-00B8Ll-2w
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 17:49:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E84F60FF1;
	Mon,  3 Jul 2023 17:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2090C433C8;
	Mon,  3 Jul 2023 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688406541;
	bh=kEmXmNRqiuyl+OHW9SiQzS+SCe3tejjJmfF9+4natVA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OxLp6FJNcZEk+AEu5+D9GN4ZAsbHKYNAgnBrRqxnnhY1Xnev29YAVW1RSe5ljiwzR
	 4enb5qDDk7hA9kVkuRD6r7oihQvofcmChTsW4CUj5JZTMYi9Q4kiECdx1HExloFbd1
	 p7rxwkkaannhT+XIstqwwa3Xy1JpFWkCw+NyOziMRgV1nBk24qE5aDZhTJfYDQ7AJP
	 v7rXE+CySY+0GIb7wCEwB6B2mkq6MffXkoBB5OZtplS/adWtTiRmqOlk35JdwtiEK9
	 vAHr/2+d0RXIjK0z1BDgnRSUC1ux3bIpx5/D56jJPxer0ViibqHkNk+BpFYj/2nYez
	 Sxmc831RFO2og==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF964C04E32;
	Mon,  3 Jul 2023 17:49:01 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <202307022204546baff5fd@mail.local>
References: <202307022204546baff5fd@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <202307022204546baff5fd@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.5
X-PR-Tracked-Commit-Id: 49b472ebc61de3d4aa7cc57539246bb39f6c5128
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a74195876b95fce5f1c5b051b8c3b01e1b18a83b
Message-Id: <168840654184.7534.16257030229241907500.pr-tracker-bot@kernel.org>
Date: Mon, 03 Jul 2023 17:49:01 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_104904_018124_DE96D0D6 
X-CRM114-Status: UNSURE (   3.92  )
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

The pull request you sent on Mon, 3 Jul 2023 00:04:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a74195876b95fce5f1c5b051b8c3b01e1b18a83b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
