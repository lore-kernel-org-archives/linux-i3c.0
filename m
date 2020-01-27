Return-Path: <SRS0=vaz3=3Q=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589FFC33CB1
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Jan 2020 19:15:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2E022527
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Jan 2020 19:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="THdmZ/1a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oosBFCBJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2E022527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znFnWwKP0+g9IYSDGuahF047eRzer3wvGunVkKagRUw=; b=THdmZ/1ab9m1Q0
	oIFZ1NULjltjDsc2rm6RsTVq1UyvswFaI86CrqUPPMDSSQXUC4wQCysphQLMFyvLXijNN3l2jp/Si
	NH8QTxlsxoRWnxJt182uGBUiwpNlnY4rScCKrGyvFFzbgsj1pCew7ib2TsOOvnPprQtLZ3XYeoWZw
	UF2Xospmlg09GccJjibeLnI7QiEawLDL/taRqTIR31aqUFjM2ZgpVjZWHib+g36ANw3S8o7vPr84j
	G+WJT1NKqfVdo2XpG/OO6ZjM3LcgMkHk2dh3y+JlAVMonO3Vpykthyh4NEooK/otI/wq9AuI2EBvV
	w1Fq8P9xs0nxGD2/mLlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw9qk-00057y-VG; Mon, 27 Jan 2020 19:15:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw9qi-0004jd-S8
 for linux-i3c@lists.infradead.org; Mon, 27 Jan 2020 19:15:06 +0000
Subject: Re: [GIT PULL] i3c: Changes for 5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580152504;
 bh=5PJ1QmOz7vqKCGA8OAbZfdhW0dpAIj0rV2gNmSaB8q4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=oosBFCBJvs84VjFQU8lZl92Q41FR48HxVKpfL9tzwMBQaquJJMt3V9BU/dIWZBhzO
 +jfKCYtHkWG1ZfJvhhhDNR6f9aGfryIUVYsiHqpC0TOAefPrAT06l1a9ek24Wn1YPN
 ZxF9QE0xRVykGmhTDx/ey8LE62XGHskf7e2pThvM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200127093443.0f52c6b3@collabora.com>
References: <20200127093443.0f52c6b3@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200127093443.0f52c6b3@collabora.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/for-5.6
X-PR-Tracked-Commit-Id: 3952cf8ff2f7751ee2f9d6cc6140df4667853250
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b9b627a449889e9dacfe9e7ac3cdf829a0004845
Message-Id: <158015250427.1024.3046247350246362257.pr-tracker-bot@kernel.org>
Date: Mon, 27 Jan 2020 19:15:04 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_111504_949334_06289EC7 
X-CRM114-Status: UNSURE (   0.71  )
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

The pull request you sent on Mon, 27 Jan 2020 09:34:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/for-5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b9b627a449889e9dacfe9e7ac3cdf829a0004845

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
