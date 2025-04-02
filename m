Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ECFC36010
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Apr 2025 01:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sKBC+QCHIkXIMS3nZ3zHAxtCDNPpoS2VoEhqx0DGbo=; b=FNpBC71y1k6zuc
	5+7iATC//xN5N/7+tmpExvB1Yg2p5HBYqcnaw+9tDmBQIWCaFaa1JeJ4x2uvCk/wSuWIGCFHCt01y
	GnCX1i8SmsKTl6409ZYCFqlyZVAPhu0fS5wTaAjX94FeW+OTX+oEaqTr0qNVfDKQ2QD1fNh/FN0zx
	7gbBUsuCOfzZ5awWfaLc6sFgotxIXnSkvnOt4IfLIM366M1mVrRBye8rXkzUbQXvCqw4iDzXLrVLQ
	dLcLTCr+O0U2kKBB6cMmUCs3FurtnpV3bo059UH5VBdC/JXiRN+WQ/0AmgWsr6zuYE1oXRBu6vQpy
	NW3iyt/d9bi3NsIx6MNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmUO-00000004nCq-023I;
	Wed, 02 Apr 2025 01:01:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmUL-00000004nC4-3pHH
	for linux-i3c@lists.infradead.org;
	Wed, 02 Apr 2025 01:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E5DEA43589;
	Wed,  2 Apr 2025 00:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C55C4CEED;
	Wed,  2 Apr 2025 01:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743555712;
	bh=uEj403VsMafiAqrX4LjB/XUJUb87tBGkIqbaSQ77DsM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BZBGQH2+mncXRSLYzFe2T87rqaQChMhmSWAebP1sIfub0XuwFWdA2M3XfptKIzb8t
	 ZLCjbzwJDEAoYe7+9qVEI7JYJnMHmKNofhpg99U2Zfk2noeHQadUMt3ebTZt35TZO8
	 6udAvSU5qkfAVLAej1t5oic+CfLgg6d7OYiTr3dBDYhtXnBHVK31/cK5RDy0DOTy9A
	 zIZgkPor+rzho85O6IVOfykeG/jgXOckGH8opPJPCxkTzlL1wV+T/ZjyWCKBqOVTZI
	 cb7OCFvJXzBGSGpQjdZ4VJ3vSxyHUGWPUQ6ERFTbs9S9p4ywmxEf5pImeRAfk2HNSw
	 hXQ9LEhguPzgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DE5380AAFA;
	Wed,  2 Apr 2025 01:02:30 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <2025040122275143b58a41@mail.local>
References: <2025040122275143b58a41@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2025040122275143b58a41@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.15
X-PR-Tracked-Commit-Id: bd496a44f041da9ef3afe14d1d6193d460424e91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1df7752800b41de14dd268bf53d854bc81017973
Message-Id: <174355574883.978371.823968678918188057.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 01:02:28 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_180154_115719_970143AC 
X-CRM114-Status: UNSURE (   3.63  )
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

The pull request you sent on Wed, 2 Apr 2025 00:27:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1df7752800b41de14dd268bf53d854bc81017973

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
