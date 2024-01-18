Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A85EC47258
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jan 2024 00:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1uTn7B6sGALJpbneBxmuhmN/QM6aDCYM5H+VizZ/7Y=; b=EWOgktT40bqRUJ
	roLD/NalHUzvDsGj7Q3ZFAfcDDJOm245UiLCB5U80SLNJ2tBt2ntetZ2nC+4aL9WhUPda0plXI+e4
	OZATru/sAF1MAr3iibHJKR7WomFAacYDVJRFDLi5fC9B8FGBdpv9o7pLj/bHy8eHRhpfjQKCTyf17
	WtY5zmPr5A+GjaW2BuTW1TMW90LgyIllvdoS6MyN4LdOqo/PYCVU7fTRUMqs0E1U09Qo7j45RS2/D
	v1VAMcDPpHWt3uvFSzzzrxMCv92XQkJB1RmtIAdYzJ2aKU605/NHTi2Ugp9Y8ti7Iiu0GdsLoDkye
	wstVCdnT9tFlIAuwByJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQG11-0019xv-2G;
	Thu, 18 Jan 2024 00:12:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQG0y-0019vZ-14
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jan 2024 00:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43789CE1D78;
	Thu, 18 Jan 2024 00:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E1E4C433C7;
	Thu, 18 Jan 2024 00:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705536729;
	bh=EQYR/ZXGXNTAe7ZD/nRHH1cGXBQDzRK6GTkmsvjo33s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=C627EkzlkkdVepwj3kM33R4MGTXe8rekl7NeD/C2DF0hvxqCqwzFX2WpROkJvN6JW
	 UvVPnPL2HaSEAZXkYCZr6NTwpza1oEtmFh5TjQ2gvQGu2bPAAUI4vleWT45SOP0poT
	 BTrWrWcq1IubDddvqLPo1tB3yEpH2Z9ApIssJDVpa8y87lKecoxzLKx7w1N3i87qp7
	 fPnznJ7EpzRkIGHWedRygOzVdODUaPF7QFkz0eXOTWaLxCFV/PkJ66JwPywu52nGjY
	 fq0nLvIylZYZ6kAdpxcuw3WfGsMP3R4pd+hU8Le+b6vCVM72dH12aSQZS9/5k3PkKf
	 3dKFeQ+PVwmfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B9A3D8C96C;
	Thu, 18 Jan 2024 00:12:09 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.8
From: pr-tracker-bot@kernel.org
In-Reply-To: <2024011423285495e8345d@mail.local>
References: <2024011423285495e8345d@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2024011423285495e8345d@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.8
X-PR-Tracked-Commit-Id: 4fa0888f6f3e6a67cac5afafb23e33f8222cfdd0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3f4a07b5027e88209a7f47f572d8eed126ca870
Message-Id: <170553672942.17342.15541822461868026567.pr-tracker-bot@kernel.org>
Date: Thu, 18 Jan 2024 00:12:09 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_161212_558550_4FEA2417 
X-CRM114-Status: UNSURE (   3.08  )
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

The pull request you sent on Mon, 15 Jan 2024 00:28:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a3f4a07b5027e88209a7f47f572d8eed126ca870

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
