Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13733C433EF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Jan 2022 06:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzm1FRIVsy+RTHzJ/+xt7yV+CNSusQEHKtB7KSfJWr4=; b=iNaoIMfSmH75cs
	z0KOjshLr0Mv6OtAG5E8x7SecpBMFJmd02WPyQx+Swrn7/oz8yGQqxxCYuSEe4pZLg3v12tgglBw/
	PAlQXFZsuQoGBPy81wbb/sIBwx9i0su3ec+aZaiRLLvTdJKQFH/5pQxhaTxtSvasfIEjcOxQANUqI
	dfdumw5auoQ7s2b1zRLD+2LrIj0Hg1MIumGqxLB5oaS7QqANhwwBFduUiN2Zwv6UgEbt0croMK15h
	NmkFiIDwJcITR/XmbGyjQZZOmljso02f6bxSxDH94cv1tX2vPk78afOpbCNDDLxRCPH0q9EYIWcgZ
	1AlEu7TO6JvlFPYmqIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Luw-00Divb-Sw; Mon, 17 Jan 2022 06:55:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Luu-00Ditp-Dc
 for linux-i3c@lists.infradead.org; Mon, 17 Jan 2022 06:55:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72583B80DEF;
 Mon, 17 Jan 2022 06:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4504DC36AE3;
 Mon, 17 Jan 2022 06:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642402497;
 bh=Z9FC3Og25bQuzjGgkjTpc1dbdgHJpSSjhoXKuNr/2zE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jy4LKi9hUsrU/pyclDKQRltMAVMy/qO6Tu6Zn6E/MGzPgweCWLhEClikcSUddXijf
 EiTLoZO2km8PuXf9Id+okpTpXCzQyx4W9w71zeI7RcnA7zP+xv9WNVA1ZVXbTijigq
 zLxt8DXdY7gzUou8TJRbEG3krFTBA8ugfby+EXlx8GJefSA8Mq03CIMSyTUXHjLXuI
 eWLCIhDrozJns/N6CaWuTbVffxNs1DMSWpcIqP2CGRcpwW+Hv5OqYIWaoiJPc8EWcL
 rKwmUmw5uZaFID6fRp4jEQl9yYFZKRhAGxTxIXoampYwn6jbxOCQ+ZDkzgu9jYVP32
 DS//++z8zcdeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 34A80F60798; Mon, 17 Jan 2022 06:54:57 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 5.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <YeSIwUuZHPeBcAKR@piout.net>
References: <YeSIwUuZHPeBcAKR@piout.net>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <YeSIwUuZHPeBcAKR@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.17
X-PR-Tracked-Commit-Id: 13462ba1815db5a96891293a9cfaa2451f7bd623
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b3789512f018819e0c4b0776731dc4ce694c484
Message-Id: <164240249721.26213.4168214220727839345.pr-tracker-bot@kernel.org>
Date: Mon, 17 Jan 2022 06:54:57 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_225500_641614_7F591DF9 
X-CRM114-Status: UNSURE (   4.55  )
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

The pull request you sent on Sun, 16 Jan 2022 22:06:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b3789512f018819e0c4b0776731dc4ce694c484

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
