Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48069F3027F
	for <linux-i3c@archiver.kernel.org>; Sun, 15 Mar 2026 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYptg4he8ib+CWTg1GgAoAQdh9F8af0KO+gwppGAJg8=; b=o/TSb3ze069Ega
	7NSXBA0UhsQ7H7rcaCmRfUmlBqt4fnDuz4ZOS34yPVuGB8Fdr15UCOaOcJIM0Vqqieb3w90jJe1A5
	ohvI4bPKmlOXN9J+vEPgrQs3PIHePD0gtbpqaw3hS8YFRdX8tB6qy075jZoRkdo3kc3da1aJPQD19
	0B35N6Xvq91zKBYaMsjHVe8SP3jaUM8P8Xbm2/KpINYa2PIr22AqBrRomtlEPl2TpFGKa/ID8d41A
	oKo/X26HvCZKZiEFwnL356IsGPo/BXUObPiREHwPpQjPV4HhzCShp7FxiPlb4QnNAEpPINLUn0gQv
	hWSYx8YzXLdjJJ3bpNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qUm-00000002owZ-3p7H;
	Sun, 15 Mar 2026 18:47:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qUl-00000002owI-05pP
	for linux-i3c@lists.infradead.org;
	Sun, 15 Mar 2026 18:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE32160008;
	Sun, 15 Mar 2026 18:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73208C4CEF7;
	Sun, 15 Mar 2026 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600440;
	bh=qD1DTU/UvlAC4sHFzQxN3orBngod3s/qJgMUGyTYmk0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Tj8zgPGznmnBFzp2I7VzqWgzZawubRo/WiawLdjd3JNi1r7wh+hq3dCwhACwrYsOQ
	 bJ6G1w01fvgkIMDImplmd9ggyi8edPa8Q7YKJUo6rf9PZhgVBzF5HCoIbKo/oAIDNk
	 JPaJiBUi+59oU6vBqIURDkAlF5Gs1ZTPYEE2tHzdxCqUwhSjkvtEI9VxJSGrqCEfzS
	 UOUCV2EC0iKH1/NVI/ZEqzTnexWR3WH5ca62KkkCK/lNX7jqRjtuP/5KkESW6J073W
	 I+RPq9qSBKGvWETsdy/uimmrGbQfdxBsRyK9tYNZxbXV55LcCJDFlxRAjKap3Uo4TW
	 OzRw8e3NrFpuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3CDB63808200;
	Sun, 15 Mar 2026 18:47:15 +0000 (UTC)
Subject: Re: [GIT PULL] I3C fixes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <202603142217597dfc0bf3@mail.local>
References: <202603142217597dfc0bf3@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202603142217597dfc0bf3@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-7.0
X-PR-Tracked-Commit-Id: f311a05784634febd299f03476b80f3f18489767
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9a48d4a130871bea7a7ae2d83cda0326b1922d3e
Message-Id: <177360043380.1970460.14137943447842364686.pr-tracker-bot@kernel.org>
Date: Sun, 15 Mar 2026 18:47:13 +0000
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

The pull request you sent on Sat, 14 Mar 2026 23:17:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9a48d4a130871bea7a7ae2d83cda0326b1922d3e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
