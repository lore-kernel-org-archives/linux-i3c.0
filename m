Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E5BD59F6F
	for <linux-i3c@archiver.kernel.org>; Sat, 13 Dec 2025 05:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YVb4Op9UUlmdjpMaxrJtl+6MQvsejbe4bV3igEnVKs=; b=Op/OocvmXXXiHT
	CjV6KeEiy1rPTy9GJmGAJkj/NfbVIkgJDTsrlUi8kvMAWa7I5/8jXuOFNJyOk57J1bpbLNswZt9C7
	YhH1wi/SkltLjMXn7PZijainAEcO0AsN9ZfpXaEoLFN8KrvsiPFbPr52zlmQYmnPm03lgUYiG8GIu
	qYZqZBnX+wXe3U6n240ZjOFTai7FbDn0dk6XladYEznNr5tdscLmdCAKhwxooB276EhEuS1/X11GL
	Ud/sP07BSs9cgAqRi9R69Txc5oiMo3tD7yfFB4/MnMMIpV5PevU5TOvv3/+km9UzB2T3A3kg5hUv0
	1/GmMcspJFKKSGWZEi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUIZw-00000001R7F-4Bkm;
	Sat, 13 Dec 2025 05:54:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUIZu-00000001R6n-0xvu
	for linux-i3c@lists.infradead.org;
	Sat, 13 Dec 2025 05:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91E4A44250;
	Sat, 13 Dec 2025 05:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DACFC4CEF7;
	Sat, 13 Dec 2025 05:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765605240;
	bh=xIwFA1vAecHcAt/brpmqy+/R+l5XrEeBke5ZlWA3Lr8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ix5VHIxyJFfSMuHhW/wlnBsjDVCKwl7QM32vyRS+JFxG5aV1sspGjAq5zJn3V7o2D
	 PZkrG4cAVDI8A4doagtd9K9MqUti7xVKKDi9bL314pUxNwqXdlC1cv3l/FBsEoYDKV
	 ITLOpUL7iWy2D3isAklojs+nDx9F83uZ+EYX830bcXrV2i5LySM+RS01kW7q/4cS/i
	 Q83fwrnjEgDfzARkpqRCwI+EXDtaIrKYCVwIIV/or6jxozsLytWFOK+R7buFAC4jVQ
	 a7OHgm2ktEtHiiAMs6ogFyDonkUU3NUUWVUnxn0H0cVC8YQDNCOOTl96zMeIT0NBTn
	 ZSlfGP315qIpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7892C380A954;
	Sat, 13 Dec 2025 05:50:54 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.19 #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251212230628a6dfdd16@mail.local>
References: <20251212230628a6dfdd16@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251212230628a6dfdd16@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.19-2
X-PR-Tracked-Commit-Id: 136209e6bd981e60db6c0e78f2919ff2f92312d4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d8cc0b917ba619c8f03d597f1a6612777f1096ed
Message-Id: <176560505310.2419555.7042918008611678250.pr-tracker-bot@kernel.org>
Date: Sat, 13 Dec 2025 05:50:53 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_215402_330390_C6029D21 
X-CRM114-Status: UNSURE (   2.75  )
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

The pull request you sent on Sat, 13 Dec 2025 00:06:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d8cc0b917ba619c8f03d597f1a6612777f1096ed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
