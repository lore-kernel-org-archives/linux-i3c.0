Return-Path: <SRS0=FHoi=P2=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70396C07EBF
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Jan 2019 19:40:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA6720883
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Jan 2019 19:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AM3FTrMq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EslJwjJX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA6720883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/3Whz0luOKDBlCcE21zancsQ+HCgVBp6Gx/a+CVcu0=; b=AM3FTrMqwVtgzG
	LXFJDExryMXP1NwVcW5QsA398q8UOcJnP9QQu38lxZDsg4GHBEhGPPWWM0Wz0n6g8sbhoe0Yz6v0q
	ExWPSKuSxHaNAJJHsu+zB53Q8DFkrjAYMGyLtcR8znsTbeu7KmiFFZhsLeJ0RqyPQ3VIz+SpVhhT0
	wCEcEcQtrsP7dwgiG/2NDXEP9vmJMZwuc+zkT4jmczfMa0cuib4fzMWvaVRlks/J436ps3ixZ39Jr
	EHTeNK4h0GlXOhoVj6pG6bKymT+leYEjw+t3UJ4jMybSGcvEGOHltutlNILcbO23aRJuK2NQ06+xS
	P4EzVCATUubfBwaZAMWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkZzq-0007Ht-Ku; Fri, 18 Jan 2019 19:40:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkZzn-0006jH-EM
 for linux-i3c@lists.infradead.org; Fri, 18 Jan 2019 19:40:04 +0000
Subject: Re: [GIT PULL] i3c: Fixes for 5.0-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547840402;
 bh=CrtGl7HHSqAfAcfySHBzmXeGqHNtlyWOmRoVwd8brKo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EslJwjJX5drb1+s++zMy4hX7ldie4s12SjL3WXvzAKsqpGss9sOv8s1VrsXJ4zjg2
 9pUU9LlkIJOD5cEEjurZHDuDEVf2jtuyD5WfQkL5yGviyZYy0AnKpqYQ7qtfGgsBWc
 gXZ88sXa5HchGYxm03CYOtnxegO3qLVzSL1YZiHY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190118135716.5cb2cc64@bbrezillon>
References: <20190118135716.5cb2cc64@bbrezillon>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190118135716.5cb2cc64@bbrezillon>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 tags/i3c/fixes-for-5.0-rc3
X-PR-Tracked-Commit-Id: f29fd331aa055fbeb5a496b4af937b7952111b6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b4fe58db67947b0c7195405ecb041a991580693
Message-Id: <154784040247.4383.17402044016165110690.pr-tracker-bot@kernel.org>
Date: Fri, 18 Jan 2019 19:40:02 +0000
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_114003_555917_45F3C66B 
X-CRM114-Status: UNSURE (   0.90  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-i3c <linux-i3c@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 18 Jan 2019 13:57:37 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-5.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b4fe58db67947b0c7195405ecb041a991580693

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
