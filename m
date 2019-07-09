Return-Path: <SRS0=vjb3=VG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2177C73C46
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jul 2019 18:05:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C97D2173C
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jul 2019 18:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QtqZwnzl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbhZHPWH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C97D2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hCAyrFpBUtMt/iMF8EAvZfMp4NPLx95T0H0+f7mETQ=; b=QtqZwnzlmanDP2
	aoeH2hvRkQ9O2g76/uaJZGvWmGH4LX12ZaYFrsO1FoENnxIxZwGs1y2GMw5KfbDrIzrnKqUG7AXd/
	kYlHUIqD6YfWGaZz63/79ZBqZ7PFT/83qgZ0KdakNP3HAjUOphd20x1jkzYYi8W3P6zwHyuCX83nZ
	qWNruj4m3Xa94kqTSBZXS+fH/8rVOANIuJeRHLTA6nlpYTxtYjP09IJVmPdeeefEXX+RJS1pOhoQe
	Liij9ZKInW9Z5jXN57qluBgnbNhrfAZ4D6BTLdaoN/sRJXWeCZ4GGSORZ9cL6MoPdAH+9aCTFhsSj
	6uE9k4vIH4Ap94lrPdSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkuUJ-00019B-B1; Tue, 09 Jul 2019 18:05:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkuUG-0000x5-GD
 for linux-i3c@lists.infradead.org; Tue, 09 Jul 2019 18:05:09 +0000
Subject: Re: [GIT PULL] i3c: Changes for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562695507;
 bh=YOQIGj8196mFVtXj3Kiaq7v6ACBv31XOD/iowZB9rFA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=hbhZHPWH8b6XB6rgc3Dt2FAhPd4rgcaAW3vctZp2m/NpkF5j2NrHywmmcukeJIidy
 IDftRyblefiWeGzsYWeYsx7dSzLNwL+PXqo8+QsD+S52z8EZ1cPrOxIwPc3MzyBkag
 m27T2aWLiFgL4IgmwofBeS62u72RTpWDjOSqyI6Y=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190706092755.1e0e8275@collabora.com>
References: <20190706092755.1e0e8275@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190706092755.1e0e8275@collabora.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.3
X-PR-Tracked-Commit-Id: ede2001569c32e5bafd2203c7272bbd3249e942e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 96407298ff6ef59c4554833d47d29c775d1e7652
Message-Id: <156269550794.14383.5695856165136336391.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jul 2019 18:05:07 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_110508_582820_CAE3BC2C 
X-CRM114-Status: UNSURE (   0.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 6 Jul 2019 09:27:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/96407298ff6ef59c4554833d47d29c775d1e7652

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
