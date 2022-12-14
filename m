Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8656C4332F
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Dec 2022 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNv87Li+Mhv156yyV38cKY0y3w04ZoI+j/OivrwSiSI=; b=G/4tIlc9d53myR
	gPerv1GlTPtqv89r4f785D7hJljPOkY67bc3YxK3M3a1u4O/V/CyqZrFTxn6Rz6tPMIWbJTCGfKVz
	pqcvG5u2g2hk3uTXQ4rXo9+k6AfwbhgGHJXOl2WVSSJqdrlC04NSHhOTZamVVz7Sa2co2nvCkg/aI
	FKG30w7KYvLcPo0+rK5QPkHXmU1c9N8e0sWfHlHepRj0fzO6lkX2y+UwOL6K7+mwIOZLDSGGCq9Rc
	uuqds8DSU0+wUnDG1pO7Xpr5kvb5rWuCbd0jr/JWwBVZ8M7pSKt4ccuu9XVuhcecOTLhHbpsQPy/s
	a/hEhXxckOcCuGXFGhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5W7W-001Q2P-R2; Wed, 14 Dec 2022 18:04:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5W7U-001PzK-FU
	for linux-i3c@lists.infradead.org; Wed, 14 Dec 2022 18:04:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7ED8961998;
	Wed, 14 Dec 2022 18:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3F92C433F0;
	Wed, 14 Dec 2022 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671041076;
	bh=Dlun+MRuHE9BKA7bYbc7kq5P/Kzbp1cR+/G+XwunarY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ECFNi2jKLrI8Kx/xD3a82zuEUiHG6gSNrTRLgNKngf9jQlYIsYwZVUXelLCcjMWdG
	 aiTlAME23D6m8QZlBZCk/ExP3EH3G1dIEip0/49xyf7Z6wJZOQJ8PayYYA8Pg2X7qv
	 l5GO4qlgoV5/x5+Czh3GsWlf3ThckjtjDvxJnij9IcPCYoRQ5D+d2sZOSgvu3eZN3w
	 ec+/63OHp2oKLPG20B7zOZf2RyZ6FcKX1a3vwMJ8GU9laNPc3KZEJb3PRfN+lFyRrA
	 rX4tU7Nt8fesq3m6vEteZgom9Ek9GG+psL+UOL8wIw6DaCm8Zrd5wfVfE+Ftwl7pii
	 6w5fJ18HnJUEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D273AE29F4D;
	Wed, 14 Dec 2022 18:04:36 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y5kHHAOgXCz3zQzi@mail.local>
References: <Y5kHHAOgXCz3zQzi@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <Y5kHHAOgXCz3zQzi@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.2
X-PR-Tracked-Commit-Id: 08dcf0732cb4d97b85493d9f60470e48eebf87fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a0a6c76cf2a506c061072db6c187f8a641dc85de
Message-Id: <167104107685.17244.18259461213478551552.pr-tracker-bot@kernel.org>
Date: Wed, 14 Dec 2022 18:04:36 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_100440_599548_922580C6 
X-CRM114-Status: UNSURE (   3.96  )
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

The pull request you sent on Wed, 14 Dec 2022 00:13:32 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a0a6c76cf2a506c061072db6c187f8a641dc85de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
