Return-Path: <SRS0=oBq4=SW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DE2C282E2
	for <linux-i3c@archiver.kernel.org>; Sat, 20 Apr 2019 19:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4579A218AC
	for <linux-i3c@archiver.kernel.org>; Sat, 20 Apr 2019 19:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="meEMS3Um";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cq/fYQDm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4579A218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcMX+4HKsACNHJ9SXDacfmnIs3Pr9nIKVgWf8cXd+yw=; b=meEMS3UmqQNBI/
	1FZfQe9x6o8W0NyaEQGzLFFIqrclHIpfBpGNfmhCg2FJChYKQjCC73iqokSvq5z5jOLwp9bc/EIZF
	CDy2/mmptLirWhC/XjoZmX5fHkg1zVdbGsJgv5/b9bZ6dTyyhxECaLpBD8rFcGS6bF6yfLIxWpskX
	B1BLLUJtJATDkPV0TQaf3rPtaNoDt/I36dyC4pDaL/X7eRkP0d8CDMIvqQlq2W7R0oLRQVbS2ztD5
	w5fGTU26MwdWAPivU8qNgO9TbcZ1fsokRKKwUeXBA+a6teJzmgoi9jENf2kV64lnpcnne4z1iISRP
	xBVe6Dj9J8hLj7t782xA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHvbt-0007HM-34; Sat, 20 Apr 2019 19:25:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHvbq-00072y-7t
 for linux-i3c@lists.infradead.org; Sat, 20 Apr 2019 19:25:11 +0000
Subject: Re: [GIT PULL] i3c: Fixes for 5.1-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555788307;
 bh=fe+DshOEL7bok0OG58X7QSj/We9GwiTZy0aLiKQRnjk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=cq/fYQDmLlAnJV1vD1gnR0zr1L7H6sB/UbL37cA8EDs/YUkf96L8jl2D8cpZlaJgL
 SxbCIrOwiyghf5EVo7H7jpmodGUvNL/v/2ss3hQx4JwIC9ozjF3LWu+eJYa3ZlbOf8
 N6OiNPfuGu+9K7a5GvAsOITab+2lPmofuY9MkCVo=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190420112340.24be3932@collabora.com>
References: <20190420112340.24be3932@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190420112340.24be3932@collabora.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 tags/i3c/fixes-for-5.1-rc6
X-PR-Tracked-Commit-Id: 709a53e1948494cc4f6c4636c6f84a4d36a8117e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 34396bdfd2b7b41b9dcd2126eb1a57e43fe13368
Message-Id: <155578830696.28386.5913538916509943220.pr-tracker-bot@kernel.org>
Date: Sat, 20 Apr 2019 19:25:06 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190420_122510_448876_50C77EB5 
X-CRM114-Status: UNSURE (   0.75  )
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

The pull request you sent on Sat, 20 Apr 2019 11:23:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-5.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/34396bdfd2b7b41b9dcd2126eb1a57e43fe13368

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
