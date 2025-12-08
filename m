Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83053D1CDC6
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 02:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxjDM4zhjE7GqnX5N4pRi4jHJE5JLqxpT9bwbJ7QeD8=; b=4B46kLVHifTcq8
	KXa1ZZB8SRaHgGV1nJKpMTjK7pxkdYxUotLn3lF5phpWB3yLlfd/PDnUTBfMlFjvvAwQ7k4noVL3d
	aePRXM1m5ngXe1lvCI7L3euk9VOIOs0JTy6NxIg8O4B2ToKsKYuQtzpszJcvAP68Bs0w4ayb2i65S
	/nAy+zsKu5Oyh4iL5el9LtoO5J3Nbdqr11g9T6XZPJpPBw1NudMzKEdp50F8P5gcqsRjbScUgEUYK
	5CLuOe7kstCnMZX8rlf74HPHP6efs9wuP9oAyeDA7z1wMGJmmxrkgl0EbUXsxEmoT0SV52AruFIvu
	E1zin4yHY4kczf7SoNBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR0S-0000000CU6H-0FVm;
	Mon, 08 Dec 2025 02:29:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR0N-0000000CU5X-1y2f
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 02:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35BCA4438B;
	Mon,  8 Dec 2025 02:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15297C4CEFB;
	Mon,  8 Dec 2025 02:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765160978;
	bh=zLZnuorIP4zjiQizFKpFaJMdXtOoht0Tkl2+b0Xf51A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CfINEHhE8/jWQ+sWf5jvplXxNfjUNufUfbSDEKwe1z9KbG5m8K4M08BPssDAXtQ2f
	 tYRZXnjhPls/32QZLadSHs0zwUKgz9U+SqJr9jMIvtBMaHrmlRtG9169z2OxIZIYN7
	 FXHJp8XxDDH14y6EhEoFluX6bQXa00NwBpMJB5g56Vspb5WjLx9n1Ks/cENYnIw6N8
	 RUSulkpE7mUbSvAd3P3q8r9qAV+kv8zcnKKx9duqTAo8om+pnTQitJpr2o5buYgrno
	 WXN7G7AUozw9EgJndYliqZ2izVG3kkyQ2pcwbw3xb1yhmFT764AnrlwXg6TDDw+Y78
	 pBcTkWQ7C++vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 69D173808200;
	Mon,  8 Dec 2025 02:26:35 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <2025120802064664421bcd@mail.local>
References: <2025120802064664421bcd@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <2025120802064664421bcd@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.19
X-PR-Tracked-Commit-Id: 79c3ae7ada0548d5097bdb65dde5d24a7d660fae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c2f2b01b74be8b40a2173372bcd770723f87e7b2
Message-Id: <176516079410.2983180.18171989040891311072.pr-tracker-bot@kernel.org>
Date: Mon, 08 Dec 2025 02:26:34 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_182939_535582_6D06EA8F 
X-CRM114-Status: UNSURE (   2.95  )
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

The pull request you sent on Mon, 8 Dec 2025 03:06:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c2f2b01b74be8b40a2173372bcd770723f87e7b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
