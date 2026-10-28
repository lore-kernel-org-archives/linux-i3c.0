Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F360A381A
	for <linux-i3c@archiver.kernel.org>; Wed, 28 Oct 2026 18:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mAoU+3Sp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKG3QB+J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=otaYYil1j+8Rlm/T9k4xppGH6egkLzEaBV08czcsEQU=; b=mAoU+3SpTnM6ovbbTTwX5e/unI
	IA8AtL8qGY3djAsQ9H3j7c4gXlJ8JpSdi57IcowxIdPS7D8yHv0rkEhAs3wbuayR5ky0StIxqs89S
	2SqJ6xONiX/3XdGxQk/meOzr2mU6DIXcjKDL1smdAbl8Bw4F1pqYMRPCG7Lgv7uRXgPAqGYQTQSzD
	dTo4tZu8sun51XVmgFN96b0HIhZbPqGhpIfl8+vCl2/4Lxg6vPoNdjti0S1woZkBjc5gQMXX2IEw0
	F5XE42SBxgE5gmPTq3lnJpq91BYF4hSKi7R6mdALXJ/9yi7a3N7CeYaN8/04EaAxum0Dvyxo0cYRU
	lm1GbWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM86g-00000007jRj-3OG8;
	Wed, 28 Oct 2026 18:10:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM86g-00000007jRP-0iGJ
	for linux-i3c@lists.infradead.org;
	Wed, 28 Oct 2026 18:10:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68AE640929;
	Wed, 28 Oct 2026 18:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF631F01828;
	Wed, 28 Oct 2026 18:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211037;
	bh=so4c5Zqo0n5wHwIZX6DlbfK2cojFIxrOO7C50mF94SE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NKG3QB+JuCyBa2QRBm4jS2r4SmY2EIm4hQvf37PGXLBVyhqfHRobrmw9kDvBjQ06O
	 zICBYHJrAXZMOcipy/eFhkARtoYFZZ9Bj6C27fVt3YVpukRkwXk2LYMbT/dx9YZYYp
	 yThZNN90m7/ymY2jc9vkKianOp1uwHynf/dYBFDYSofhxAlKZudgOUsyAJehblNeLd
	 pVz+YlvRsmQ5+TC346CfaRCxDoGF4MPlj+/6KFExdIhkdJ0RqeoCCtI3obq5N3kieU
	 onvKmMzVitKj76HCORiJjmh2yG0xAdT00l25gvbxxEadoO3IantTHfFPpvw0Q2iQkF
	 VkBx8c6SMok3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4455A3AA9F6C;
	Wed, 28 Oct 2026 18:10:37 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261028101259ce32989d@mail.local>
References: <20261028101259ce32989d@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261028101259ce32989d@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.4
X-PR-Tracked-Commit-Id: fc5eb1b0631aa3b34c530ae962d01699ed22a0ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3ad1536d831a104b4134924d418b072b3f175e81
Message-Id: <179321103602.1342141.16862667773691083133.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:36 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pull request you sent on Wed, 28 Oct 2026 11:12:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3ad1536d831a104b4134924d418b072b3f175e81

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
