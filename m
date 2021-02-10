Return-Path: <SRS0=fXmT=HM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6BCC433E0
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Feb 2021 20:19:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F344A64EE8
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Feb 2021 20:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F344A64EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLWGX8J4EXkv75jo6IDB0XEKolQF56GkYbfr/6b9Oc8=; b=zW2QWIHqyzxsQfJ3bKLcjXae8i
	e/FNKvsQL6KbzgvzrEud5RYwVObq2GgE+sNPES5sZ7UmuSY0Rc/mnqejj8bTnjC5vUK01F2CWUKg6
	xxvS7XNtdUuP+LjUGWrsoJqgq7qjqgce+Rxh0tW/8xmdHtEalqzy6jM7liXnQYHtrPrnDVYb173z2
	R1rfcbzwPwIj9RdS0eOjrfKbqDxOrwVShlQkfx2jCm2Psqlay/t1psoI3dA4A2Tx7QtKAsu/n3ltE
	pC0nAptOcJ/PUxo45pRO0Z/26C+lVoZ637JYkqAj4e9JGqWv+UJUkUx3zLpaYusC+oQWR7i/I7t35
	KWXGh0UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9vxX-0001B7-3F; Wed, 10 Feb 2021 20:19:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9vxU-0001AK-MR
 for linux-i3c@lists.infradead.org; Wed, 10 Feb 2021 20:19:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 692E064EDC;
 Wed, 10 Feb 2021 20:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612988371;
 bh=Q5EoI2uzbHkB7DE0iTiEoeyLlCuQAvw2ZZHm3QWbVhI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nPvoa/k6ef1fsG5da9XGUCYUKp4EInIyg+6XTlTHUb7DFTgMom1kvQHCzOFt67dMz
 duSX0IYPOcMJOw+YKQ8sRAZhs4xrrrsPVRsDtGTOHvZIG8bQ0EWn5u6oBrwZClro8b
 rYD5HO41soLFJSRE9XalMX1KYbmnCwUzu/xOHGlrXOC3KPw9pC0snx4Rz+P8zwW/kX
 oUOsx45lwHpwrBQouSKcb1jQ96PmogSNBJuQpiVWHMUM56xQNJw2X1LzYCl9dNz/Zi
 D36rXPOxIuJZHUuOGb/+193sV34S7nx2T/vjWsHn/aFZ9OfSF8a8BtlJbGj+O2BJtf
 G3NYulfeSoAvg==
Subject: Re: [GIT PULL] I3C fixes for 5.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210209220527.GA498175@piout.net>
References: <20210209220527.GA498175@piout.net>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <20210209220527.GA498175@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 tags/i3c/fixes-for-5.11
X-PR-Tracked-Commit-Id: 291b5c9870fc546376d69cf792b7885cd0c9c1b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef7d0b599938450c54a8dc0aa4b954d73d9a9370
Message-Id: <161298837140.25163.5789660091863634580.pr-tracker-bot@kernel.org>
Date: Wed, 10 Feb 2021 20:19:31 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_151932_803181_3D080A44 
X-CRM114-Status: UNSURE (   3.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 9 Feb 2021 23:05:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef7d0b599938450c54a8dc0aa4b954d73d9a9370

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
