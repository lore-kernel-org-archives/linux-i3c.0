Return-Path: <SRS0=jbqv=RI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55874C00319
	for <linux-i3c@archiver.kernel.org>; Tue,  5 Mar 2019 03:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2632E20842
	for <linux-i3c@archiver.kernel.org>; Tue,  5 Mar 2019 03:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qElT/UKz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rksw/BpT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2632E20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4p6k6gYo8m+H+hbMdSftWFtkMv4iX4eEJYo+iZVyUYA=; b=qElT/UKzCVx+c+
	Jj7lMPIcoSYMCfmOxBvZzL2D9zZIpc6VeQR9VVNFcooLP2HtkBj9GHFvbENSi1y87/z82K8Y8Xffw
	QPcGLS7fRQZdheCvy4aovCvJnume1xvGP4SineLzk/gN/us1lAiP99yj+tFuwTvD68xzufC7ufqHJ
	xv3DHh+EciBjB57rp9eUMR4KttaI4DphEXqFKo5t/OTlbDiC7MPc2RC+hfbsdfc0a4NL6liPIsED3
	J/hWeuJew/QB5VCQLRoN9AUkdq6AZwCjD5w0njCIiQmPUn9CQWynDxqFT4ZtikRbHOYEfP7lQcsNP
	0ndAOSQBvcW89uSq69jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h10wD-000514-Pq; Tue, 05 Mar 2019 03:40:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h10w1-0003vK-5Q
 for linux-i3c@lists.infradead.org; Tue, 05 Mar 2019 03:40:06 +0000
Subject: Re: [GIT PULL] i3c: Changes for 5.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551757204;
 bh=6EDaaOoOkIWJ1ZJEpxCzU5lRQiTYAU422k23nSea7eA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Rksw/BpTm15D18LH9Fpd8/AMSE3DOhC4uPrdkSFvS7gHsj6LC1glNTjHbAgG3Z1Os
 1ojgnSvG4IFypTNK8HhiTDs7aDlz0HUFq7UJ7yNgdN338z2jdKqvvxZFOhBbqW2C07
 wo8q173TLRDqXHmb7Inoj+6giIS/+8oQ13h2vNcQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190301103215.4ee6e758@collabora.com>
References: <20190301103215.4ee6e758@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190301103215.4ee6e758@collabora.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.1
X-PR-Tracked-Commit-Id: 988bb4a1937bd083267444dda21b901dc6a959b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8d950ab24987cad4fb4de60c554ac12c2658991
Message-Id: <155175720459.14960.18271051620848903433.pr-tracker-bot@kernel.org>
Date: Tue, 05 Mar 2019 03:40:04 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_194005_316976_069B6FDA 
X-CRM114-Status: UNSURE (   1.00  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c <linux-i3c@lists.infradead.org>,
 Przemyslaw Gaj <pgaj@cadence.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 1 Mar 2019 10:32:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8d950ab24987cad4fb4de60c554ac12c2658991

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
