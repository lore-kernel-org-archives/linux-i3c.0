Return-Path: <SRS0=3Gzj=EC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99B1C388F9
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2020 08:23:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C00621556
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2020 08:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wuN8rRpS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQ8PqnN6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C00621556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aYk/7fXDXCB5NI1NbgwwHfgSGfOOqkEv1NY71eWpSs=; b=wuN8rRpSPCsqhRFKHzejuU2udA
	dBOhelryRRanGVRhfwOqWgRziqKSuma+avFJIEQx+5aymfcn/As5r1lOTmRCscBLGosyhAs9LIlEh
	cuHmaMFD8fn5ZxsFjakSZxjwJ9A1LueD2ke5/E0D33im8rkNgpqaSqTDEI43Nve37k5nckSNg0rHA
	HIMvID5yPXle9wImLKE1J+2yvDlGJ57jtJ5LC0cDD9j9GDg3FQYV8MwB+aJ+zwmFkd1cYMS5ngMSA
	AnUzcRPXu3VQDscTz+R/ghtXMbLSGKSGq6lriCEY7R+Xh4JFew6h+NJZ1jplNcimoLRv2ba0fov9F
	W0JRWiEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXKGO-0001Pt-Eh; Tue, 27 Oct 2020 08:23:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTqqp-0002b4-Kr
 for linux-i3c@lists.infradead.org; Sat, 17 Oct 2020 18:22:44 +0000
Subject: Re: [GIT PULL] i3c: Changes for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602958963;
 bh=Gv/bkIYAhOGl1ujTnQXPN0P4o3jZrQsS2S6rGbjH6l8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bQ8PqnN6tgNBmGWgbMR6S7YC1IcP9G1N0Uxd6CpPtZC9Ik+5MAuq6p9J1v+r/NP9j
 BxtCYyffE8kIJOHWvvE7q73uLHQD3mlvkyixzjRZiXJyvkhESLyEbqhemdcJ/59F12
 m9gLYKukYC2sbtAICOqo7ONxtNPdLuQMUXK7yNnI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201017100247.475552a8@collabora.com>
References: <20201017100247.475552a8@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201017100247.475552a8@collabora.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.10
X-PR-Tracked-Commit-Id: abea14bfdebbe9bd02f2ad24a1f3a878ed21c8f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a934b38c066ff221b08a9c703314a2a1c885dbd
Message-Id: <160295896308.15185.7603097111391328499.pr-tracker-bot@kernel.org>
Date: Sat, 17 Oct 2020 18:22:43 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_142243_763676_8C4D49E7 
X-CRM114-Status: UNSURE (   3.33  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 27 Oct 2020 04:23:27 -0400
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
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

The pull request you sent on Sat, 17 Oct 2020 10:02:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a934b38c066ff221b08a9c703314a2a1c885dbd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
