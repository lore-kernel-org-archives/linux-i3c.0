Return-Path: <SRS0=nbq2=HY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1161AC433E0
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Feb 2021 18:12:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D11764F4A
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Feb 2021 18:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D11764F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/IYjhX/oEzjnbfWSaDnqLHdmnFoKLHHqLNrkk3C3ss=; b=me6aICvZ9mWAMqb73WF1cfxly3
	fHXtu94yBQM2gPt5vdA0xJPlCoRHqBMQt2Fnrc6vdJfbOQhr8oIU4GG/6dxadVsF0T8qgT8ubrBZb
	lojLsjcsUbybeqs3h8Rn07EAxxHOPD+I/eW5Tla6YJ9tuhIcYbWVdBILWAOk1Pd0tRtNPwavOCcX+
	sGtKkYrWy+I2wvHQJs0XBP9wTypFkpJwIMD/VFOZB/IDJqfkG5Mm6tyQJHYiI9ECdafMrQ9Ed8xKh
	SAOTsOs38Wnb0HSPbsUBggo8df977vBONn7Pss9+WXCuPjKi5R4N4joDR9YWbWOGSy+jqF20PfhgH
	s+c9x5zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEFhA-0000LK-St; Mon, 22 Feb 2021 18:12:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEFh8-0000Fw-Dl
 for linux-i3c@merlin.infradead.org; Mon, 22 Feb 2021 18:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wflQh4P9QrCQnNZ4xEelQWOxnV14rJNulOwjtpo1QuE=; b=v8uFog8IXLt+VWrkGptWxdQ7vd
 EGPr6xEXpj4DKT8Iq2MCNFveThB9x47FKUcs6125wfaMe7w8lmk3brJ4/oH03ad9SVV9b7Bc/F0fn
 C68u3x4jMhssyorMXsKODeknEaKgR+a1CPao0yt5m00aReKiqdUAveU4D4EQZdw9rC3cipyloSUQE
 wAxAqeBrNlR3Gh5KR4WsCDFfh2i1N6LQhFpAo+6QE00sOQHn2Di5MugreEmfK1gisPGUF52nTqbIm
 O/d1h5D3DLOq0fVKDDH9P5S9eWE0u9L3xZDlQWq/DROhdXmiplhnvkPUJn3rWJT9e/u/RDmNkCACB
 L9D2KR9A==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lEFgo-006uDl-JR
 for linux-i3c@lists.infradead.org; Mon, 22 Feb 2021 18:12:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 6DAE164E77;
 Mon, 22 Feb 2021 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614017520;
 bh=TWlDqxdjAPXK7Y0HwZjmvPBdNDFxLJ5zbrktq7vyzpE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=OS6Cn+sZRkm5Du4WWBK56VbJkCxjitO3M0TMSVVwlWaHyuCP9jmmhXE31LXysyTiN
 Ef19H8u+p8UVhxhAtLGjQOTMipEexNVYcP6xpEEy+bQZn6f3qDCj/c19RyopoumQFC
 bSkJDJQS4fzie/3KsT41eVyPNv9PAwZdedL6nFRgPv3aqBCTeqq/zI1pk9Pa9Ancmw
 9in/UGggcMiq0KXvZL1y7Zu+6vrZlPnZSxcWDVxCnerYR3m+AJpr0m+5FEb4/trdHq
 /cdklajdaKmFQ0IS50DiA1aLVm0KF6Z4io5kTZJ1E++GIUNkPrgzBHxrv9bSgfJmC4
 dp7fA/Xb9l5QQ==
Subject: Re: [GIT PULL] I3C changes for 5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <YDL9slBuOqU83/RK@piout.net>
References: <YDL9slBuOqU83/RK@piout.net>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <YDL9slBuOqU83/RK@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.12
X-PR-Tracked-Commit-Id: 5c34b8e7e8bb605925b33e1aa7dc17966811219a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 36c1b20d15703662aa0f14a32a8bd19ab3a33076
Message-Id: <161401752042.943.3286519972663636563.pr-tracker-bot@kernel.org>
Date: Mon, 22 Feb 2021 18:12:00 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_181212_519285_765F6FA4 
X-CRM114-Status: UNSURE (   2.08  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-i3c@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 22 Feb 2021 01:41:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/36c1b20d15703662aa0f14a32a8bd19ab3a33076

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
