Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521D3C25B78
	for <linux-i3c@archiver.kernel.org>; Sat, 25 May 2024 21:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5GA0rj1lOQ85VMjgwKAr+w49i8RAikl3g5k8zWwl9A=; b=z64NXD2wOz9YmR
	G8L2+z2fxf6/SgX8tfphYdpuVwMrNoOHAOgbyaCf1zurx6LFvMLF98pxNZ5ScACqpSGes51hMAccc
	sUAodnr6JvBsvN8VodQ339O034yJ+zhj4P7t/ykVAt94pLKkFsWZcZckj08YOPpxmZet9EAjxit0B
	ExYCCI6BYcin3KV2mHs3ooLYCpLmGxk45iS0b/5NUr8Y8Y+jeYXZCj00L6Ag8kfQxhKmeaX4gViVq
	j3vYgXX2XbdBAnbngM/6v6klOzl+3li2ED2Y+3YNjNC56o3vL4CypS4uECsVwF9RJ90zXZtvMWWTJ
	tEmDc7IYxc91GMKLAULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAyd7-0000000BhD3-2cTq;
	Sat, 25 May 2024 21:08:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAyd3-0000000BhBW-3HDe
	for linux-i3c@lists.infradead.org;
	Sat, 25 May 2024 21:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A40B7CE0AB7;
	Sat, 25 May 2024 21:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E315AC2BD11;
	Sat, 25 May 2024 21:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716671314;
	bh=JDCFZ8HEb0NTJwxJbkUKLE+BhXBP8waLZLT+EsxImRQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k9mKDJ4m5dNvrftAkU8WUPDzrvesUCnxQXwzjfUv9SSXT/CyevinobIPQmzFFQjxU
	 bVhEbkTLb2n4ZRXwB8cKoCl4LJb8ekvh0QRnvfQMFkd4yxdeaTvNUstFa7FEqhFV5T
	 0214zqUX09aj0W3Zhd3zaDH9cRX4Zbu5Gs9jL5wUDgbAZMQY6nc8B3ygEyRI5GhP28
	 8IHQJzV63aGjtLoVf0eNmnJ4FTaSVMpooabiiNOnUS93/zimG0ABuvZ/c+s+2s3lJn
	 6po1o2EXVOEsp9FtaKdhTF2XczvrXzPZStsuYPp58exfM4OF59zjysFdC2CVyk9onr
	 rDrEN9XQ+SvxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC46DC43617;
	Sat, 25 May 2024 21:08:34 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240525075217d90cc066@mail.local>
References: <20240525075217d90cc066@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240525075217d90cc066@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.10
X-PR-Tracked-Commit-Id: 1d08326020fba690cbb7b8f1b38ab4eab6745969
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4286e1fceb8c99f25332dc7e85f9879408caa45a
Message-Id: <171667131489.10959.15105780706399557618.pr-tracker-bot@kernel.org>
Date: Sat, 25 May 2024 21:08:34 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_140838_020489_689DAC8A 
X-CRM114-Status: UNSURE (   2.77  )
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

The pull request you sent on Sat, 25 May 2024 09:52:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4286e1fceb8c99f25332dc7e85f9879408caa45a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
