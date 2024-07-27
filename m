Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907A1C3DA4A
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jul 2024 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6Q2gYbWFG3obmztbHiK6f+H1u8YAm8BdxpaSEgGrEw=; b=yN3vjP+SCxSeBW
	44NYydXrBAowJXxGJkykGRv+YNfqTcf3V6oAEzSVTJC5ZxUvvhKo9Vk/cNG/NIe1JqnC0EPtdeb+t
	4MucpZyPaxIZpzIIz9/VAxswnnvjknnt0jl2nwpS202qSjPQfB/B2V3zdw1WNxtijkF9d8FBad8hq
	l+1xqH0w3iV8WpsC47XUq0XgCrjI6VTrYaQXGw7q6fJ4U7FIAXdkw7uaKVDJXBPkS9yK8Gn22sLH4
	oELz4OvQ8Hqk9DmETF9h/BwwhwjHtnwxqm72js3OZTzt8729bhJRtM45phNIgFWDFQYn15LejK1p1
	VyCp/cuo/Gq3s2OsqGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXnhR-00000007DOK-01Lb;
	Sat, 27 Jul 2024 20:07:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXnhN-00000007DLv-2rbs
	for linux-i3c@lists.infradead.org;
	Sat, 27 Jul 2024 20:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94A9DCE03F2;
	Sat, 27 Jul 2024 20:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45571C4AF0A;
	Sat, 27 Jul 2024 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722110843;
	bh=HfDokw1KeliRJ+D0UChjNqu3r8C12KMGHI/KXSmySw4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=T7WtVr2bZjHY7lwd9MpzpEo1UY3C46cRiAg77mFy0pu0yp0DjU2QybUtSqhgKW7F6
	 RL1pwEqsdogAjDAC3gswCqICEp4szih7qL9lK3aqmz1s3FIH9G92D2ajl6hCJsKBuG
	 VQ4sC/tNwvT4dbLWL049IWtRBhvtFctgr15/L9JNBJdzWJoOc6zJVlkf3jO75p6xQa
	 gaC19wwe0jaLKdmWVKcrA8rxl4ir+nBsHIVvYXyJeOFWRPDBZLFe7br1e7j/mWDCLC
	 5SbmpytPJSV/lHkQuFfkcCQqoA1/3naAUcNCARY7nTwmDstvb6eeH4//aBEE5qmy/S
	 CD3qxMwmJlMRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D058C4333D;
	Sat, 27 Jul 2024 20:07:23 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240726123924fec081e4@mail.local>
References: <20240726123924fec081e4@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240726123924fec081e4@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.11
X-PR-Tracked-Commit-Id: 24168c5e6dfbdd5b414f048f47f75d64533296ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c85e1497dd10879f447d6a12f97762c581093e9b
Message-Id: <172211084324.16614.3773917655928475321.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jul 2024 20:07:23 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_130725_942858_A7CB048B 
X-CRM114-Status: UNSURE (   2.66  )
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

The pull request you sent on Fri, 26 Jul 2024 14:39:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c85e1497dd10879f447d6a12f97762c581093e9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
