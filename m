Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B6C77B73
	for <linux-i3c@archiver.kernel.org>; Mon,  1 May 2023 19:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72rPSiMJSn7DMA5m6rmm4hCDxs7B0domIqhYYsIbn6w=; b=WupUE7crClhZ6J
	y17RaE9N9YV/ADxa2FyKraHIk6kiOtDun8HYISzkOYrDiebkvVWHC/f11Jfh3jRTmhsvFEspkYzLG
	JdDFXHZELfhV6Ar+Yvh/WGCLOfGpxI2sMM3ZqugxJmCqgQ2/HiI0ZxA+gr6Vhsrne2DHImV/VsBXv
	+HvUv/IWKl/7r/SE8ma6Vhi+PaEP+nQzQZ/68+iXqdorMLTInNob8pYjt8UR9SvW03l75fEh+Ad12
	kLTMX4tQn+3K+OryUpM7U40qpM0bGVpEkcs6HbEr2W0K1o7eO331+AQibNo42NtumCokrHY0mgdk+
	9ibu81r47M/mwoSvEClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZA3-00Ggeb-0F;
	Mon, 01 May 2023 19:26:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZA0-00Ggdr-02
	for linux-i3c@lists.infradead.org;
	Mon, 01 May 2023 19:26:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2D5461EE4;
	Mon,  1 May 2023 19:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52D0AC4339C;
	Mon,  1 May 2023 19:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682969166;
	bh=JG4ccKb79I620GdDA/8RZxzeYAe5IGlRqROONyxWxLw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=a2a7RqkEZRSYTJMv9WXTu86VBJiC68CRw+y3NWbAoV0TwKgzoFSfzRN/06C/cu4Tg
	 +Rezwd0eYHA/3KJakLZCyCgN8MgAGvPgNQfxy+8YZdh3RGnX3+YXHXmu7mQe+WAuWY
	 x4psZe9z7Wx6eODkClfn5vb57ob46SxBbvLCJTpxupcxqcte4eNmUcs7D2R+Zd4Hyg
	 vJAUfwiG9TPgFFk5+k5qLmooyqYlKt0N9qMVS9NOvEuyHH67sB0XgZ+yS20uvWK84V
	 cEAqoHx2FwaVkPaqxpDg2kqvdiJ2exbBuYXiE5bQ9OFXMjwdcwzQunUEYUUdTeFMci
	 rA8QCioGU/IPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 409DEC40C5E;
	Mon,  1 May 2023 19:26:06 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230430221151c27da7d9@mail.local>
References: <20230430221151c27da7d9@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230430221151c27da7d9@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.4
X-PR-Tracked-Commit-Id: 6b496a94c5905fca7879bc0dc438a47de40b7d4f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e0906f1feb7caf5098e7f831f4889feecfb0c68b
Message-Id: <168296916626.17937.10288951538423900232.pr-tracker-bot@kernel.org>
Date: Mon, 01 May 2023 19:26:06 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_122608_093493_ED49E1DB 
X-CRM114-Status: UNSURE (   4.76  )
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

The pull request you sent on Mon, 1 May 2023 00:11:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e0906f1feb7caf5098e7f831f4889feecfb0c68b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
