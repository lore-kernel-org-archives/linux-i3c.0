Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0677C5DF8C
	for <linux-i3c@archiver.kernel.org>; Sun, 23 Aug 2026 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1yRu6F4SmqJvUzDAczOxXr13wxerfnPF9DBpjHLOMQ=; b=Ms7M6KomMh+RgP
	39CzfVnwvNWUGzOQOyMX4BdxYd4q1Zq3HqS1mZ3xQQRJYbveDmHOkvQZnbCFLHPNW3pLaTAV2lV01
	yonGPlSBpKAeQlQp1PAEWWP4GkMjz7kfNGYoznAYWZY2pydCoRMA192lGF/kF6K4DhStjc1onfWIN
	4ouAgQSdWtOkcory8F8T4Yp9F7MFk4/4u/qLgjqmhPnetuLePBcEKtKbyjgqmP19KXCJFoyH8+43G
	DCt75vFOPapLVFYvYG0FDSBVV7H3Xh40GzOW8/OV5QnKScHJTE+O2ZYniKciAoWFlSW6EWFn88ww4
	xxrFZoVr3evej5ug1INQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyFA3-0000000FbfI-2Eny;
	Sun, 23 Aug 2026 20:51:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyFA1-0000000Fbf7-32oM
	for linux-i3c@lists.infradead.org;
	Sun, 23 Aug 2026 20:51:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2342343D01;
	Sun, 23 Aug 2026 20:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AB81F00A3A;
	Sun, 23 Aug 2026 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787518281;
	bh=hIp9vlWkfhAxsnjVpaciMgnuHKcVkcmphOncxyKUJ44=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=WUCpkgLSfZDrn7f/lUIDMS71HwY6ZeF7wRdTfZkqfCqgMOlMychWtA7uI1wWiLM2/
	 2Z7qoJ3NoE6jMoQQ1Qjx7eBtvF5BDklghWnb6dCGUVexr/pMYKKwAtY18F5prgzQqr
	 4/lkKYWg+lXIDtLvJf88GSUPKcbsFYlfmFaJhpBE6hbp5G8QRvXp4wnYjbbIuPsnIG
	 ZD6avd4B4a3pCQWf8onwwEoAEo+jIUNCnjaxveTf3TX93J4AMD4CkId38u/gJeKFp2
	 sPq15cQJ/Y/Y7h8rM7ngDwwJ9/DXE1At291C24c0e/Xva0wUqZZjOQUfYmuEvXfJz/
	 eDxXJCawkiS6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 57873380AA7D;
	Sun, 23 Aug 2026 20:50:30 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260823202021b159cfe8@mail.local>
References: <20260823202021b159cfe8@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260823202021b159cfe8@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.3
X-PR-Tracked-Commit-Id: cab40cfc9e116acd4d60f95b4b1264cab78f3803
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4352b8aee98005853aa63f57d6377282de17a33f
Message-Id: <178751823015.2148131.12577645259976653945.pr-tracker-bot@kernel.org>
Date: Sun, 23 Aug 2026 20:50:30 +0000
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

The pull request you sent on Sun, 23 Aug 2026 22:20:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4352b8aee98005853aa63f57d6377282de17a33f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
