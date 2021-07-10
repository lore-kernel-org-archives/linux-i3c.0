Return-Path: <SRS0=TOlQ=MC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E96C07E95
	for <linux-i3c@archiver.kernel.org>; Sat, 10 Jul 2021 19:08:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2740661356
	for <linux-i3c@archiver.kernel.org>; Sat, 10 Jul 2021 19:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2740661356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrFOlUi2Vp2yhBTMvzRxFin7aMcN5ljGEGTsN2anaQc=; b=Z6UPjNpJ6tTOPb
	HzM96BTm0CfM8b3lz5N/wDNuKYPWNi0/0woRwU89IlQohTL9YELKehjwQ18SHh7gcsAJPG1BwfyRA
	v4ztN7otKaDAOFmkFai1szdPDwN9bV7/R9fNyRUtH53B2O2/Vns/tUEGLZ2lpqTLuEEWKJpwvvNUC
	8bMBFpqCQZ7cH/BBQj+uiWtydlUol22MYk3g4jMJISztrfXeC0Ql4VJ2dimryVvMYT+fPHsGBfZSJ
	TBKjbyjVe6d+bUByhPJX4ah4qj2EQ/ixF7KnxfgKaxCb1MeB+h2wyEfLvmSn5wxhWJkRhxx2Um9MC
	eSMYo69pOYLOeJWEnQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2ILJ-0044Z5-9t; Sat, 10 Jul 2021 19:08:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2ILG-0044YP-Is
 for linux-i3c@lists.infradead.org; Sat, 10 Jul 2021 19:08:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4562D61353;
 Sat, 10 Jul 2021 19:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625944125;
 bh=S3Zj5ganitsBkFOYVNt2gniu0QT9rVtBrKblLCIOQw0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pQJ2qPkCkUoMx+8lzMTSdEOMZuNnv/TK3s40ZIBOyEhlDEfDTzwquPJawmymmBjmv
 PrgRsna2TB8DaHlfMO9xX6/FYEOpnVIbwoHD7Gx7AfoqkOnBcqvyIQ11F9/ZJICa0t
 cDwb0CLanjIh2sTRy6OL/6shQV+XesFgHh039HAbwIe55rguBTkIfmlOPV2jMXbTgh
 pUDVeYk/Kh1VquNAYq3ncLfnq5QthpXPyGLl1mIHjIdyorfrLuBEm4MEfjlQnhRm0c
 goUR93gJklMYLJDcC9ChFrLi75C/fRLgASDaXMW9Hw3YeEvOUYVhV6aIgsjn0oHQ0y
 K89TuumhEYsOA==
Subject: Re: [GIT PULL] I3C changes for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <YOjdDda7QIQOmR74@piout.net>
References: <YOjdDda7QIQOmR74@piout.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YOjdDda7QIQOmR74@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.14
X-PR-Tracked-Commit-Id: 3e5feb11a82945c88a1518fd2682ca8de66c37d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88bbd8a031b83d4a91f1f8f4c1ce8caa16dc0886
Message-Id: <162594412525.8052.14895591945637971336.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 19:08:45 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_120846_674064_4560748C 
X-CRM114-Status: UNSURE (   2.40  )
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

The pull request you sent on Sat, 10 Jul 2021 01:34:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88bbd8a031b83d4a91f1f8f4c1ce8caa16dc0886

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
