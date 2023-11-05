Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBB9C4332F
	for <linux-i3c@archiver.kernel.org>; Sun,  5 Nov 2023 03:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gK1SBgtzT2lX8rqSO1in87ijzEo+HCiFuk8LiImcHn0=; b=sJyKJ4QeCJezw0
	81PWigCRfuYsn7hOIYcTetZeV6TNw2G9/CEcEkbyhyLuZadgvG8gmEwksel+K3AVt9cXo0enftMJy
	B3Ik3Eto+5gpBtRCaFK6kzyNjTvpGA7Pl1V9qk0h8RoXmgzDI3GABAVxevctZV6a1eP/ZTxn5JH0h
	zwQtvWfJoHELXOeNCje+vARiioWXH5E/mqaqvyOFTic0Q2WWYIWgtMudhBokQk+F2fc+pypvxvymx
	LVoDQunee9HnyQ9bnh/tZGlUaa3MHUEOBN4zR0zPuIJTFTmFtMMHQwBYS16699le8cdQY/zrLvvod
	09d3VWfLo8ara3K+2G1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzTP1-00EIva-3D;
	Sun, 05 Nov 2023 03:02:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzTOz-00EIu6-0C
	for linux-i3c@lists.infradead.org;
	Sun, 05 Nov 2023 03:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2AC1FCE092E;
	Sun,  5 Nov 2023 03:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 685FDC433C9;
	Sun,  5 Nov 2023 03:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699153333;
	bh=FkOQSxtcywcBdscFQ07lgqhNdeUR3J/FlzQWSFZUYD4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=l4SlJfWRkCtrMsEeW//JDjBlDHP5eGAzQeBkY4CFTiQCt1cxjHFju/Er5J08ii+uN
	 iK46/ZsttWySu7KLC37Dsq1u78C9MCX1nevrDHX+NJFRU4y2K8ZCmXmpCAwSuL7R2R
	 vR12goGkKlYREtSAdwwLMv6o1HCTRrAIsOFXqspm46X4F0YchPfT2WNzl6ciw5TjN7
	 +jGrJCrkZ9FlVDW5VrHHf3k74obTQINjnPVXrMY8U2i72Bb4kxgWgYGx++TdIkVm0y
	 YoOY0l7uRhvMGlx2Tk9pyc0FylHL8ArtI4IfsMn9xJKgNHNYa8GLkMayUfk7EkY5d/
	 Z01x2t18kKZrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5723CC4316B;
	Sun,  5 Nov 2023 03:02:13 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <202311042315286247d3ae@mail.local>
References: <202311042315286247d3ae@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <202311042315286247d3ae@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.7
X-PR-Tracked-Commit-Id: 9fd00df05e81a2e1080ce6e9abc35533dca99d74
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c41041124bd14dd6610da256a3da4e5b74ce6b1
Message-Id: <169915333335.2133.3914857078039091532.pr-tracker-bot@kernel.org>
Date: Sun, 05 Nov 2023 03:02:13 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_200217_266600_C518FCFD 
X-CRM114-Status: UNSURE (   3.00  )
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

The pull request you sent on Sun, 5 Nov 2023 00:15:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c41041124bd14dd6610da256a3da4e5b74ce6b1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
