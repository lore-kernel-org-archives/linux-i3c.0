Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1791C7EE30
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Mar 2023 00:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/3dvKLBNQ1obxS8pSVGOXzt84jAEFOuXH+kaot73ms=; b=fg7kYBH94JrRAH
	sbKNniPEB9GBm94Lsky7HUyMfTYEqcRIlAnvi9WmGopKfcuyiQtd2gvpgg/74jaRoRZpn/ERFfNP2
	HJ65KINXeMZP3mY6jJGzvHPTJbKG4UXAODIC6aDOkynSqjpgu7Xw+Vk0G/jW/Gu/2+IyVOnQ2TJf4
	EkVQBetGcJvoWjtzUsF3QEvjyAlzoMvV2XvWK0R9M4jhwyiqoMBk8/tcHSaZtb2PonoWG5Ans4aWC
	2CzcDNK8R26elXA8ZmWLFqJ2aJmD2prLgD+qSUl0iYvMPNcSOHms3ozvRKpvb3zmU7uFDEeM2gwqm
	FXi52/y5dekSDJbGLYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXA6H-00Ecwc-1L; Wed, 01 Mar 2023 00:13:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXA6D-00Ecvi-Te
	for linux-i3c@lists.infradead.org; Wed, 01 Mar 2023 00:13:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83E1761213;
	Wed,  1 Mar 2023 00:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4B02C433EF;
	Wed,  1 Mar 2023 00:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677629615;
	bh=MJh5PKsdcP4hnUw82O9EukuUPqZp4RRy7+s8heOUysw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=C4hg/vbeSyuUotVloQCRCnLqcPRNV1R4l1H7HmguUiZPRp08bQ/sMyQjgeMTBQWKm
	 +TaRHW8J/h8MU07Z7xjy3Phq+olP7CkjRYtzv2ardjSryFMX6M5C20P2awuh16idYB
	 roGSXBR1HuNUt1+e2kxNCEYokI2LXFV7WOeMWoYCTYRDKBOM/IGCWYaaVWvojjUlzs
	 hFmKz67nFJqhBOBhtX+ib7Lny3AA3vpAv3KZvUXvWEmMorwfKEA2y9EhbRZBfOzXhA
	 HmBiWmsy57rgl1N2USSSyNqI4g0PGvgNSfvBSnzkrzAxruWrL8tAV3JUYMRVo3/bjc
	 oiUik64Svro5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D40C2C59A4C;
	Wed,  1 Mar 2023 00:13:35 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y/6KWc1az70PQB+/@mail.local>
References: <Y/6KWc1az70PQB+/@mail.local>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <Y/6KWc1az70PQB+/@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.3
X-PR-Tracked-Commit-Id: 510d2358c466bf6588034f0d3b2266eed2bc0a51
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1899946aaf2566c577683ebe510a83c930cd3751
Message-Id: <167762961585.26350.17098698339265205379.pr-tracker-bot@kernel.org>
Date: Wed, 01 Mar 2023 00:13:35 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_161338_028838_9EF8AC91 
X-CRM114-Status: UNSURE (   5.13  )
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

The pull request you sent on Wed, 1 Mar 2023 00:12:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1899946aaf2566c577683ebe510a83c930cd3751

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
