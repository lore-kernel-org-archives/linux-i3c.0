Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AB0C433F5
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Mar 2022 18:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwrOl0qW9IRVJFPPYjjW+WJJNk6Q149Sh29CKKOVo7Y=; b=WjoxBQaG0a5GS3
	/eLkV9sKuoSvgZg2e4D16S9DSsXq9ABDAhnOF90Im2XyKdry6RYJw3E3Ck0PYBB0cnQLlZ7KEFXVf
	pdff+jYwBgzryUFdPmlHtSGWYFsk2geG4+0eMKfjaRrwt4suOq9nPD+K+W5T8c8dqCwIuP+FBgM8J
	pRi4gc0rGxx10pxx2qvDGsSL6JyZFdLrYJdsBNTk0FIGhAT4hI2v1/Gld87vi4GR29/I4WWVq+MVC
	cbdwI0sC/cqWFr91HNEC9f5E4r3s8ulCxImGqtt8YOVWb+IID6+5ik8atwdTelHgQUKBTlkOJknZ+
	YOhf/lxmdDmCGfpVWH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZcvd-00H6Tj-Kz; Wed, 30 Mar 2022 18:20:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZcvb-00H6Re-7g
 for linux-i3c@lists.infradead.org; Wed, 30 Mar 2022 18:20:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06CD4B81E0F;
 Wed, 30 Mar 2022 18:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1DB2C34114;
 Wed, 30 Mar 2022 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648664413;
 bh=m7Tydcoj1nTyhByX7K4Z5epjQ0nc8bkVxkgOVZwHO6k=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=TeXSRFpPQA/o2/EAcNjCBh8X2lpfovKfm6cIEFKpnlrzBFULxpqZwKgBJOCvmbbOn
 /LjhRs+2b2t8H1mQLn+Wq3IcRH9JnqGM9FpRL0DTlWb8qlYAuBFVvDRfOyuckBGlYD
 pb83t+Uz7qdg9gLO0JZhsuBOm+KPFEjd8IYmnuZ21tw9FnWqMfPaCDxBuP5C9lEoe+
 H+zQ39dEVuM7Cv9AUNFL7liAR8nUeopHruXdc3YAZIO5UhmuZZPu1MoXpDPwx63IWf
 xmM/l++eDrznZskezW5hHb/KKA9UK7pz6ZroyH/QdQB6oNnMVYzyWl2KJn+xa74Idy
 WDLj2jjvjzpMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AC6AEEAC081; Wed, 30 Mar 2022 18:20:13 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <YkOH2Jd9soaAFoog@piout.net>
References: <YkOH2Jd9soaAFoog@piout.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YkOH2Jd9soaAFoog@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.18
X-PR-Tracked-Commit-Id: 6cbf8b38dfe3aabe330f2c356949bc4d6a1f034f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f18e345dd156cc0fcf4a4911af2f959120613871
Message-Id: <164866441370.5472.4647208292700829377.pr-tracker-bot@kernel.org>
Date: Wed, 30 Mar 2022 18:20:13 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_112019_474264_EB36EF54 
X-CRM114-Status: UNSURE (   4.30  )
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

The pull request you sent on Wed, 30 Mar 2022 00:27:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f18e345dd156cc0fcf4a4911af2f959120613871

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
