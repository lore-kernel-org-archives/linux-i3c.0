Return-Path: <SRS0=8Cox=KC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94890C433ED
	for <linux-i3c@archiver.kernel.org>; Fri,  7 May 2021 20:08:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C20613ED
	for <linux-i3c@archiver.kernel.org>; Fri,  7 May 2021 20:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C20613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovz2zAKBYmi/mlMrq5MpcMRgxoMQa0Q+ML6dczsTM3U=; b=FU6hKcwrVsjan5/doOV5YMD3Zb
	l27podevBtfLMf1MqqoqHWYQ4Bm6/iaxoz4tvbajLLz8zY1aUc7IcY6dFGexp847WWJxcIQeyHv1+
	o6W/Q4+WflACgCtHEVDoINLWNTb17I961XP+a/Tit7lfF5cjtfgMY/tS0oULmLgoOZjhaswZdCHTr
	Cjw58nSWUnlIm3MsZIOvjqnxkn/JmI7Ebuj3Ma13LJJRb5KcXgyhBzQKQ3O3P0rYuq5xbJTSrqDB5
	6JdQ2I+KnS7pEJNvF8aMm/ESOpnMXR+/ilLF2OJng2WXcSuZAaQy5bTkZpb8+mu1uCPTZqv/prLnn
	RBmfpK9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf6mF-007wCy-G3; Fri, 07 May 2021 20:08:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf6mD-007wCm-BQ
 for linux-i3c@desiato.infradead.org; Fri, 07 May 2021 20:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NCZIsMnyr9FHy3TgIuhJFhrl9uv9/aeGgx6sR8VYm1k=; b=Js8jEfsfW7kw2AN7PDdLnSs8yp
 N1n+Ia7OttgmfoBFjJQqH4rUbhPjTOtNZnOzFwFuFVTVbFGJMI5359iApENWZjq+5FIpCFUy1yZ5y
 TymsR+ftsRP1VALAajZuOqEiGdkwbWf/1isfDiTBP5eQ+UD5+G9EC7+zZ6kVYVmLFN3MxukUTrHHS
 itks+iZQqZZq3EwxHUobDgo1gpvBratdDlVNnFy1icwa0pQi6Kx/+K/c0e1uttYTMZPfgYtNpeFge
 DOK6aWRhBXp4ePESjmylSyu3/sixOiy4zrzg6N1vG36mMFMlMaKuy5ZpPTe5FmFEelpHOr7S6RXgq
 HFiO2+cQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf6mA-0079lR-MB
 for linux-i3c@lists.infradead.org; Fri, 07 May 2021 20:08:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1CBD96143B;
 Fri,  7 May 2021 20:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620418122;
 bh=FO9qXiEJfP4OE5WTW3CHa/aD+VZcZGnbkgNdogcHlEU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=OOja2fb3CBclu29EE3A2yxYWBX8DhoGvhFzO11MU62/VBUVNNY724ApFU9J8bgXTz
 f44sLgB7xeCFpjLghVL4S6kS04P1W6b9Wnqy6oOz3FrNJZ/LJJqJ7J12E9RsM5kLK0
 nQ4PRBLWwogUMzMxKGHi5iPncMse1r/eMWILI1X9UC532Ir4d8pMGD6BBQ7vjpjx0q
 Dh4y/zxZDZ0dnbko4yk5gu9Ua6UhwuKsMFugA0QufEj/b4ORM7LwoqN3/jT4gMmCHQ
 07Qvqg+kjEq9g66Fn1MUfHsjEOLZ6edE8/PNDRidFXDYDRvVUstqQY3Xy+QrcnJx+J
 51o3+qZReTFAA==
Subject: Re: [GIT PULL] I3C changes for 5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <YJWVRyqnPVlz5vY5@piout.net>
References: <YJWVRyqnPVlz5vY5@piout.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YJWVRyqnPVlz5vY5@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.13
X-PR-Tracked-Commit-Id: 0d95f41ebde40d552bb4fea64b1d618607915fd6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1ad77a05cfaed42cba301368350817333ac69b6a
Message-Id: <162041812193.8450.7884020637384781054.pr-tracker-bot@kernel.org>
Date: Fri, 07 May 2021 20:08:41 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_130842_811028_71F3F0FA 
X-CRM114-Status: UNSURE (   1.82  )
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

The pull request you sent on Fri, 7 May 2021 21:30:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1ad77a05cfaed42cba301368350817333ac69b6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
