Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346AAC54E60
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Mar 2024 00:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZm9KDtwjLV9lA5Vax+Itgq6GbJPzMxATVTD6z2dESE=; b=px5TxC3Wd0KEPy
	z7OBOxGyX3StkxAd+tmuOLbFvQvmwKYqjH/JZFEzZjasgWtMBXfQrMg99sq6SkWgVlsvNnFZjigdV
	nfaNVKMk/Pjru90G19EBffTBdbisrFrBTcaPdMZA6Ve7DtmWHniSA0YfNlNxmr4kyYJsN8IMIunHm
	c3BZaodeQyaHLKh1VsiS5xAA8BHNguq41WDvAbTCgWLtOuS+5aOJ3fH0/XcadqjRtouDsDFNp2gzc
	BA6incOpo2+SjaSbDa/Ct2LxoWoviR6KEB6ZlEJks1uI7KtStTNK0GCjfMi0AJkhVUk45XNmWBA1Q
	d+NvD7rMzXgs5XoPngGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm0Uj-00000006nVH-1MUA;
	Mon, 18 Mar 2024 00:04:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm0Uf-00000006nUc-3rHR
	for linux-i3c@lists.infradead.org;
	Mon, 18 Mar 2024 00:04:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D918E60B72;
	Mon, 18 Mar 2024 00:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63765C433F1;
	Mon, 18 Mar 2024 00:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710720284;
	bh=G5kuk0pFj1tJi262LSPqfIVOmYjuE9gk/QXorHUmjQc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hzdTXkdobYG0GRizybrIY7fWf354Hw0u6gr8Ser3Yl6VdvlUi7inXgDqHRJmJzGpP
	 +TZckJkaDtTQhO3zvbGqKElrNRbSZNuXwX7HKAmcWXXlT/tk5T7uPnDEBbcoeFZg65
	 TMHEMHkC8jX26DgGc5fQmvAPSSOKQLLQNR9f2aJajDqdgdDRm0bgd14Gi4leqqQqbR
	 cm5G3/lui/7+FhLTlvNWp9TPM9rNdbRdZXM91NrV+8itKcW+c4JdhuzabVnutNCej+
	 bDHyk0FR1OUi0+jUUuEU6Keqg9m/S4893EwpraZueoCkx/ePJWi7Ht8n+yh54F0ZSJ
	 w3sdFJBr4poOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5B2CBC39562;
	Mon, 18 Mar 2024 00:04:44 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240317233017c4c35cab@mail.local>
References: <20240317233017c4c35cab@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <20240317233017c4c35cab@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.9
X-PR-Tracked-Commit-Id: 8f06fb45853900b4deaa52e2a9e16f3d9550b011
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f6cef5f8c37f58a3bc95b3754c3ae98e086631ca
Message-Id: <171072028436.28729.788751177236233811.pr-tracker-bot@kernel.org>
Date: Mon, 18 Mar 2024 00:04:44 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_170446_027671_55F87EA2 
X-CRM114-Status: UNSURE (   3.05  )
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

The pull request you sent on Mon, 18 Mar 2024 00:30:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f6cef5f8c37f58a3bc95b3754c3ae98e086631ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
