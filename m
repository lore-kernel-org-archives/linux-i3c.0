Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E8CCA470
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Oct 2025 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PI5MEFfHyjWWhAS0mT+Er3WwOf9GF6K1yO/ZqWLxtvo=; b=f/Rfuw0nH4P3p4
	p+4xs8ULIXF3+m5YSD6/tFq17oalwPcBnstahdGKQYoWvp229EB3NwqUhFXmu3gUowKNGm3KfF9MZ
	VTqNKBRKSEgWl6W3toqlQZnamOqREttWZaYfPcFQlr8aiABJpnHhrVASn/zs1tYFwNvCpZzJ4+kd6
	AF/pfTR9u9u349IgVYqrxgLDidFP8HSfYQOnkno0sdC4kx5W6VByj+CWYtJSH+KNZ9XjF9VKfm1IW
	z9CHM8MMGaHBGUfzUCBvIPRN5mv4KuOTgBhzs9pjy9Psn2qxl7t7PuBIxyKE1NxVQ1rqN4yqjOGb9
	/KCy/Qj+hUfm7pwr9tlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v45oC-00000009D8V-1mj3;
	Wed, 01 Oct 2025 23:00:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v45oB-00000009D8N-07ck
	for linux-i3c@lists.infradead.org;
	Wed, 01 Oct 2025 23:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F9D261F8C;
	Wed,  1 Oct 2025 23:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A0DC4CEF1;
	Wed,  1 Oct 2025 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759359626;
	bh=i90knxaXnEPVb578K729UTeo7FrmYq8EJoHVfsHfHic=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Owm3cWIClHgdwvrB82cq+yXkS9rIZ3yyAt2ojJ8F2qAXFRfNgialTwQsATbga7i7C
	 XKLxIZFbjBdOAo4udsKu+uf1Yk6FuB8ZPIq0XocQVFVsiCkCaxrCf2maf0uI64Y7QM
	 kM21O5AB16DDodJGZkdgufQrPemc//1+7c5EjN2Bcfy9hC7S5IqtfoExLfKkxEoojm
	 r/bM72J0di4XL6yeQVVfZS1gUA6fRGY0vyTU8Njgpc4NzHlQYxCDELLr+Tj56lAwr6
	 xzqiFUB3nJBLJ1YEZ9kXgXdJfAs5bdxuD8jLVKiVnWRmr+SRbGGEgIynHfivWv5wvw
	 vBlWmJHu9kXwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF2939EF947;
	Wed,  1 Oct 2025 23:00:19 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <2025100121394906389990@mail.local>
References: <2025100121394906389990@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <2025100121394906389990@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.18
X-PR-Tracked-Commit-Id: d6ddd9beb1a5c32acb9b80f5c2cd8b17f41371d1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 080ffb4bec4d49cdedca11810395f8cad812471e
Message-Id: <175935961826.2651312.93069349055499467.pr-tracker-bot@kernel.org>
Date: Wed, 01 Oct 2025 23:00:18 +0000
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

The pull request you sent on Wed, 1 Oct 2025 23:39:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/080ffb4bec4d49cdedca11810395f8cad812471e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
