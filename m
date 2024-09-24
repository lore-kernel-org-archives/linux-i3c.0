Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA51CF9C69
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Sep 2024 20:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2jrab+I312GkkmD3b8FLLr99jMKPaBAbBdPuhh8DJQ=; b=SR2BKL5WktMRMS
	IqgcfSdy1HACbFC9Xx+6ktiUNfjXHWgnPD9Q4JzQNHqBR0LxDb3XXc+hQT+UpUahtSIHgc2wvHWvn
	K166mNESUnQeNCdFzRI+cLlQp5gLCa5sxr7FBmdjd3G2Dwal2hNrsGSwUoSvj3Xj5oZ2g3j1dYv4b
	ozbmJLjuZ+RWX3x2O20itomL4v+jPpcUMczzZQHa2V6iLWIByjYBGee2VWUXv0GXipcepxneStm9r
	hrZhLFkk10b6l4o7qstxKDiVZMNeP0FAb9WGraaEo4mSbvF5PVGKzgKtc5O17lzxPrAM7XMPr0PeG
	JQkFWD1TVwMgac2nkqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stC28-00000003Dxj-1xKc;
	Tue, 24 Sep 2024 20:21:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stC24-00000003DxO-3EtY
	for linux-i3c@lists.infradead.org;
	Tue, 24 Sep 2024 20:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D61E2A43852;
	Tue, 24 Sep 2024 20:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B0FC4CEC4;
	Tue, 24 Sep 2024 20:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727209271;
	bh=dx2OaxEwyXOKZvIvFclE6PPQvUlh2LPCEHyq9Kra94c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lqXCstgLtRQlat+wWrR6KNuD5gVE9c2UDYvBMPTbWfpVjKe8Eg0cbIQDknJGSIbmZ
	 p6mlDP9s99s1pJY7jq4pdSyTQXM/RbHX/Z2DqTKA557rlLbr5J8tbm8WYer2/ann2o
	 EUqAADAIIdtiaR0vt4fl9Zd9ljlYbsBvYjmjzBziRmakuO5rM6DPzpnuJiny6N8M97
	 wl8VBIAfmnxCWwRXg0slggGWEE2ZPgohvNMrJHpx//VGYqvNfBEbPNEoCFny4NYR+B
	 U6HrL85raSLm6UWUxVGkVqnxZBBI64PiOsqO58OYzhK4uaeWvH0Ts0z+uuKCIA9Afx
	 9Jx4r+3kWTJGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 343073806656;
	Tue, 24 Sep 2024 20:21:15 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240923222839975a95a9@mail.local>
References: <20240923222839975a95a9@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <20240923222839975a95a9@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.12
X-PR-Tracked-Commit-Id: 61850725779709369c7e907ae8c7c75dc7cec4f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd3d6477298155482b772eae481ce01c9e764129
Message-Id: <172720927387.4186044.6677655873054229688.pr-tracker-bot@kernel.org>
Date: Tue, 24 Sep 2024 20:21:13 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_132112_897377_AB1B381A 
X-CRM114-Status: UNSURE (   3.75  )
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

The pull request you sent on Tue, 24 Sep 2024 00:28:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd3d6477298155482b772eae481ce01c9e764129

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
