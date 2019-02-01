Return-Path: <SRS0=3Anw=QI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B4EC282D8
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Feb 2019 18:35:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A22218A6
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Feb 2019 18:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NRIXoAII";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gENWpO4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A22218A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqUYQg+EpN2cffoK+Y2gl/s6XTe+mFd6S1KmXuLzDTg=; b=NRIXoAIIIJCmsl
	hi9fU8SBTnrcZEfcCxe1kb7JwwZ2vqg8G5QRk5oLjw6axcm4MWPw1jRpu65kpwVwrMupR0di+thVu
	md8D81Fw9tRlDf3/Vs8x/joPTDyFViz5S9SgVf0EjAP81tHfWwnHKOpkX6TxDrk8gZdVd/C0nkunQ
	AbLLSOq/H/sIUz9wAVCZ6XaxoxDpMQSbGRqwC+NhB4KoKFDxCqr0IaJVp66/NRfkyBShEzwmtUcFF
	JgltJFZ/jxmJQ7OhuKdeNLc4tKM6aGNqn02XBe3PIRxaxAVsbBSn7h4m2OnaRxwEpnrh6TbowuILS
	u83WJ77ihhI2ljIOiAQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpdee-0003xR-2G; Fri, 01 Feb 2019 18:35:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpdeb-0003FT-CQ
 for linux-i3c@lists.infradead.org; Fri, 01 Feb 2019 18:35:06 +0000
Subject: Re: [GIT PULL] i3c: Fixes for 5.0-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549046103;
 bh=4UfUeXvoHD1tvthOqIMbThqgry4q+5Rii9qBPFrYe4s=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=gENWpO4+8/agfVqrCjhUf6rbjnSLma4aZ4l6WumHkFrQASpCpT2mUM6UJeSqDXT7E
 +f446mbSlzEne1ozVwQizwpr3JEVO9WhlFMgU0PmAIUn2fFRBrETfvHSDDlLQU7sCM
 pNqPc9EOCCcQlrfIgo6vbnsHVxnICvMr1/gNsE9k=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190201094058.74f3cb6a@bbrezillon>
References: <20190201094058.74f3cb6a@bbrezillon>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190201094058.74f3cb6a@bbrezillon>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 tags/i3c/fixes-for-5.0-rc5
X-PR-Tracked-Commit-Id: f36c1f9a8dfd6a78e6c3fe7aff5e722b84307597
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 520fac05b65106f0f3a488776f759baccc600f2a
Message-Id: <154904610329.32661.14766825386214617909.pr-tracker-bot@kernel.org>
Date: Fri, 01 Feb 2019 18:35:03 +0000
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_103505_475332_00C47F96 
X-CRM114-Status: UNSURE (   1.13  )
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
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 1 Feb 2019 09:40:58 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-5.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/520fac05b65106f0f3a488776f759baccc600f2a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
