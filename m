Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF340E94625
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Feb 2026 00:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQB2tQf1F6VnMUnHfz9i9MQ6dCvrN1r5Oc1P68AFcUw=; b=f/2eA20ufd3G87
	kWKnKdTkuQpM/mC37UqMfEydoPETcWUyIPxi+YPPxeaAxySToniS91re68I7gh2HLzFncBFjaOnuG
	haqytq07snRJUMg0GqVUakTwBYhw6B/WtRYMBtsn1ssyt8LviJwkwalPzmcXmFkbJsnIkefupYFxk
	X9LlaJz5gnZDUQTOlfEL2lJkJX39LPQsgGdIS5aKGp9sp35pC7haDFDVcgMYOD7kR3sC1swLh+KcW
	LtLRf059mkQVE5M1GBd3axuUH8FCu0jdrzEk5Bta4V3FGnmd9fMr/hQy9EJeOirl9B/DXJhSPituY
	g6wwbdj1qyUOWBPpsHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpbxR-0000000GFke-18Fl;
	Tue, 10 Feb 2026 00:50:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpbxO-0000000GFkH-0QV4
	for linux-i3c@lists.infradead.org;
	Tue, 10 Feb 2026 00:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2009D44557;
	Tue, 10 Feb 2026 00:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3674C2BC87;
	Tue, 10 Feb 2026 00:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770684621;
	bh=3OiY1HGr6p8Y2CPjHhqqFFwqW9IQDRmJRk7trB0CM6o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bow2lxKuWgXhmmE4TVj+y1RVcMLAtqTchFuh/C1LN7DioRtmCInK2eysEBAnTSPad
	 2QsQrkJ3AZAWhkec3t30ZW0os6ZDpfueGo2sD9SkbUuQQv6vWdot+Y3vSa56obrsHD
	 /rYluF5bushLYKAECdu7nU4p9fNKUgyziBEK1YUAn/k8o3kjkAEXEPqOfuukiGdKmE
	 0Nbl01LNSaxd7QkpR5iWCJXZ5CrhVSOvM3a2WhoIDE4N3VSFbx7hGcgU0Ff5f2/eqz
	 obdBdUCw56PwuzdL7e4ufbahyCgx/Rhzz7C/fDsgKbsBVjDaEk9lQh4ZOipmh/H8tW
	 Uz1BZSlvTD+IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EA295380AA49;
	Tue, 10 Feb 2026 00:50:17 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260203233912448420e5@mail.local>
References: <20260203233912448420e5@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260203233912448420e5@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.20
X-PR-Tracked-Commit-Id: ed318b3fb4ab317c533d38d160326fa5d7569497
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f81bdbdb3aa3fccd9b5420df5674730c40af554
Message-Id: <177068461693.3270491.16699652134244929005.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 00:50:16 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_165022_160792_650DEF28 
X-CRM114-Status: UNSURE (   3.56  )
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

The pull request you sent on Wed, 4 Feb 2026 00:39:12 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f81bdbdb3aa3fccd9b5420df5674730c40af554

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
