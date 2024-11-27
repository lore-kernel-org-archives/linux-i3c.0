Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6529DD66BAA
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Nov 2024 02:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/YrnihsKzHPThOtqtLsOcBcQJROaz80ngSgOLElVVM=; b=4RVW1g0A7pvQJC
	NQPv0xZWD5pRTHg7xC28jKZ35p/yGBs+9N3aR5MN9tNwv3i2zyMGXUSSFuh6kEAIGWiDm7R7MS200
	tIf2Sery0bSgYkcmyuYOemoOCyMIdKrAGJtuZj8LEbgF68vEWcZWzobR2yifZtyZgUXlUhwN8Hj0N
	Uv8XrouPHDLOpl9VWdG+8os2rlPJooDETx8NiWplYWkg/If8SyygLltjlbPQU0taDsvxQK9nxHY4X
	2VoFsbYYwc4xB75rgKfEdgH8uWiE252uZbwfzVXO4J8VGcm6jNs48Qof0ZGzAVRo1jsfSW5eDVoJV
	68ia3LpCiI+3tc8OkVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7zT-0000000C5W9-0CwG;
	Wed, 27 Nov 2024 02:41:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7zQ-0000000C5Vf-2i51
	for linux-i3c@lists.infradead.org;
	Wed, 27 Nov 2024 02:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76AD1A4372E;
	Wed, 27 Nov 2024 02:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094E5C4CECF;
	Wed, 27 Nov 2024 02:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732675275;
	bh=sGDXrdkKsA4QYkMI9B33r7r5wmx1Iolb1chqpojlP3A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XKhvJ40Ok6UlYkENIOM/t950s/uceSUR7qoRXzyUpDWtLTDnZ+gPYeZLp3RLO0U9O
	 xCYZF/LtH7/XZlWKP5POcBoe9QzO5/McyYLohQy4lvMD9774Y3Yi5Ox/UJ9LxlXLvw
	 c3TERN+pNE1hT5V4iQWuhHjiwa23tlggC8Bbc5fZ13VvZwTSTXNW/DmBKVyAy6dZTc
	 X14B5bUAELtgpUheIiG0ncHLH+Z3YyRxEPpbQx/rFrTin857x85M0lcZUqDxx6liBJ
	 DYk2Ds4t2UpDd/K8/DP9wNnCjLMqZZoUFMuBXR/IrLTaCDpJyydYVIJWqwnr++lmbm
	 ug41Cnqcmo9Fw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ED93809A00;
	Wed, 27 Nov 2024 02:41:29 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241125222007aae382d8@mail.local>
References: <20241125222007aae382d8@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <20241125222007aae382d8@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.13
X-PR-Tracked-Commit-Id: 6cf7b65f7029914dc0cd7db86fac9ee5159008c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 750909d55a9dd555e28148739d3e8ef17a0b8ee5
Message-Id: <173267528778.617991.13066537461235051032.pr-tracker-bot@kernel.org>
Date: Wed, 27 Nov 2024 02:41:27 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_184116_746279_C29912E1 
X-CRM114-Status: UNSURE (   3.47  )
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

The pull request you sent on Mon, 25 Nov 2024 23:20:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/750909d55a9dd555e28148739d3e8ef17a0b8ee5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
