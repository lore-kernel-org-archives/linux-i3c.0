Return-Path: <SRS0=8pL7=PE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E956C43387
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Dec 2018 11:40:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9F3208E4
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Dec 2018 11:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjn3Vvuv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPz/6Tqn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B9F3208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sA3qiQxwbCAso4hu8oQER3UiKHoL/K27VkaIoawgBk4=; b=jjn3VvuvbreyuM
	cI8X+38W89NCx3IE8znWR0Hdj40MSfT5263zuba3+ZOldYPufq0NTgzklubJ9KWlhwGrpRptWW4ks
	5RyljwCMWCXiopoLzi0I2ToiD1Tp5aM0iakIVbb9pS3LnuBp+NE1fk73aHxH5rhpXX0MF8MhLakzr
	mj9E/RZ5oRXzBULrnDdK68RRCdrbfabjUql7iM6sK5AOmE/GB+bj6Nrmc09rWR8IcG2w1zkM9lLUq
	pZjepkPHh98baDkMg++2AaLJb0wmtztpkvxPV8mWMjrIoMhBUB1FsTRxsObP1v5EYdQj084bn84BM
	3JogXzIuSo7jLnP/vTyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcU20-0001Y9-Tn; Thu, 27 Dec 2018 11:40:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gbvzi-00064A-CI
 for linux-i3c@lists.infradead.org; Tue, 25 Dec 2018 23:20:16 +0000
Subject: Re: [GIT PULL] i3c: Initial pull request
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1545780003;
 bh=4Bf0tFi+yqRTHPneajSSWAw5w6A5KqzTcOz0OHwKQWU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=GPz/6TqnlULhb6Nmw4zYtG6wmKXGWADD5KY+nMxM+cSBYhjvpF2h2bipjGThrd8YS
 +hx8Vzlld22/fZ3WsuB1TymooanCv5NjyZpFSt3eCHrBvROjqdkzXEtn/cJgTS2pj3
 P8agx07us3vlesZbFKS/nEHbSfFM2ebRHH+ZOykM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20181219165447.2db6a689@bbrezillon>
References: <20181219165447.2db6a689@bbrezillon>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20181219165447.2db6a689@bbrezillon>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-4.21
X-PR-Tracked-Commit-Id: 25ac3da61ba144f8dbfe377eeec6b1da7ad0854a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3cc2bfe7244e848f5e8caa77bbdc72c04abd17c
Message-Id: <20181225232003.23808.40308.pr-tracker-bot@pdx-korg-gitolite-1.ci.codeaurora.org>
Date: Tue, 25 Dec 2018 23:20:03 +0000
To: Boris Brezillon <boris.brezillon@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181225_152014_641703_D5E502CB 
X-CRM114-Status: UNSURE (   1.78  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 27 Dec 2018 03:40:51 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Rafal Ciepiela <rafalc@cadence.com>, Arnd Bergmann <arnd@arndb.de>,
 Wolfram Sang <wsa@the-dreams.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <Vitor.Soares@synopsys.com>, Przemyslaw Gaj <pgaj@cadence.com>,
 linux-i3c <linux-i3c@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Wed, 19 Dec 2018 16:54:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-4.21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3cc2bfe7244e848f5e8caa77bbdc72c04abd17c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
