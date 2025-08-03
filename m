Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61712C87FCA
	for <linux-i3c@archiver.kernel.org>; Sun,  3 Aug 2025 22:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKn99DDEwVfFyML8CY4Pq4qaXz3dp+A7yciI9APoueQ=; b=BrniceSut56UUo
	EHGvIigukDRVURtPo8Hmi4JksauC7Bipwf8ERHcalSXze+FaDnpwaOCTR6FqhQP5TrgLYFWAyKWOC
	71VaMxmmIef1TKmP1+GvyDbZFDJOep+azlpSDr6gcmgJie97BJsO8fgeqHF76blXok1C9wVkSKsKp
	8Yjy5lIQfgehp4m2WlxnLBEj0HOJg/n8tkxe0AjkygMsTt5VZ6M3cnC0zm4keHJ+5HZiZ1GKEZnas
	alK1wvjggvEr6OkKYeY2rHI0lBsJuXlY36+bioeQZ2Wz2r4a3bPvzwyKnG4OXTOly5TwrHNQnORir
	X+8ApO06tA8n9ER6Y4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uihG2-00000009FXg-492G;
	Sun, 03 Aug 2025 22:32:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uihG0-00000009FWb-01l1
	for linux-i3c@lists.infradead.org;
	Sun, 03 Aug 2025 22:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45CF543E09;
	Sun,  3 Aug 2025 22:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD47C4CEEB;
	Sun,  3 Aug 2025 22:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754260360;
	bh=f95Xi2YW6xYYBZA5ZINGymvkhUgWfbZtaaDPtbledTs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WVXNDXB8QsVT2EnRM1dlW6AFMn1eTQnC1jyt7KSvWB4XMfzbM2J3hF7WTqbUsTlP8
	 Mm9jw7GIUVeMWIedsmFoqTgWaFdtimIEgcqj6wg2OwT234v5/cq3apr3KvZC3BTvUt
	 F8pVF/9pjee49ATSmJQ21hIz2N0dbBex9zAUq6eXrHiEa1hME3VajordyQF93ntuWp
	 NCwxc7sn6YFMnfom5w+TjoiSXNSyJ9PVAAXvEkFmWAG3qPiabA/lzfTgtnjSkzgHlR
	 hL6Y01PtOrpKd32AIGVaWzT0hw580qUVslqnn+RdCreoI0coDwcU6WUWeaXx4DPiDQ
	 tGF48mFkNKjtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFF5383BF56;
	Sun,  3 Aug 2025 22:32:55 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250802232654918f2886@mail.local>
References: <20250802232654918f2886@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250802232654918f2886@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.17
X-PR-Tracked-Commit-Id: 3b661ca549b9e5bb11d0bc97ada6110aac3282d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 546b0ad6a87297a4268bc336aea57173008428e8
Message-Id: <175426037442.556955.13177622747467554544.pr-tracker-bot@kernel.org>
Date: Sun, 03 Aug 2025 22:32:54 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_153244_062824_84379B9E 
X-CRM114-Status: UNSURE (   3.52  )
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

The pull request you sent on Sun, 3 Aug 2025 01:26:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/546b0ad6a87297a4268bc336aea57173008428e8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
