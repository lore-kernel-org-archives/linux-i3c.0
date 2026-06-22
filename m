Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C09CD98F2
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Jun 2026 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdO9UJ1jkERyM4kzCdiKGdEm+jv2mvEK6uuZ4Rf+8Gs=; b=4NV1ocm2kAJhCY
	+ITxb2hbR+tPLdyGPjqzW52UWz+WQ6D3QkKtXuhhARxvC8GaMUBM/z3A/1K4UjPbt/nktKk3mN43c
	dkDhde6iB4MYXc5qCRwobSUrz1SWraq4bYA3gwMO8GwB8KSGRAqz8mxVamysNSQ2GDmNGhlBZIwkt
	opn1hksrPx0YUt7H7NEtuporzLfWFlz7DXUYSf7SXfvGKN2XS++VFNLroEmVQOcvzOYnflnv/vO0p
	uw+1CKXbprSCZzMID2zT0kWq4Gw4HeQMZOsXxVqrEE1mHUFBkok3aUTA9wt14GgA4B3foQ5/+pfwk
	0Jj8mwxVeOVlqumm1sFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhdZ-00000005By5-3lVl;
	Mon, 22 Jun 2026 16:36:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhdY-00000005Bxt-2OL0
	for linux-i3c@lists.infradead.org;
	Mon, 22 Jun 2026 16:36:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 907E2601F3;
	Mon, 22 Jun 2026 16:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A751F000E9;
	Mon, 22 Jun 2026 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146199;
	bh=tBJtzb6VJQFZhPn6/WxoyfjIDUV2rSIEKj+UKnMeUo0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fo6x0cZo/OjvlRi5/CM8kLlbvKN7yjBU2XI6Wr1mgUwep4hH2oaP8ZQJuhBS11oD1
	 0ZX7AaE8KyjloJhb2W0CVv69Ap+muQsgtcw9a2+W4D5CkEIY/HdkT7o+o7vTVmBC8i
	 67R8Bn/ZZM2kaKkkPoblmmnM6RXTIfyZDcJNG926N27xT4z5VMVEczElbibkV98bj8
	 poVAV76sCor5+pA3eVMOgvoi5TL0Mn9HdTlZXKXMURvNBjij9GNIZaN4QW1fP/iqBo
	 E0J9qAu1wp4HjA5hhfYND0SmJBzg23K2L5eYmeoG/RvqcFe08spl8mMEgcAgHasgP8
	 Tx6MkHn+CslaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1AFD23930907;
	Mon, 22 Jun 2026 16:36:31 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <202606212103298c8aac5e@mail.local>
References: <202606212103298c8aac5e@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <202606212103298c8aac5e@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.2
X-PR-Tracked-Commit-Id: 678e9409dd78d5c080607df15c6f346c7edb03d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f333cb6b57c3f72073bf058f984b180cc00bf7b
Message-Id: <178214618981.1310507.1028603713483011242.pr-tracker-bot@kernel.org>
Date: Mon, 22 Jun 2026 16:36:29 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Sun, 21 Jun 2026 23:03:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f333cb6b57c3f72073bf058f984b180cc00bf7b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
