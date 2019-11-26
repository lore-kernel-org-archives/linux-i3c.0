Return-Path: <SRS0=MKnx=ZS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192E8C43215
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Nov 2019 05:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E313C20865
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Nov 2019 05:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jnpBOp07";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnH//R5p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E313C20865
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6CJfHQQWS6am2OE7690kC88OEECDB8PQxICKG7+PvQ=; b=jnpBOp07OVaO3i
	7t72bvdHjE15TnAXhftcMxaNOkDI+DbVfoq9/FZgeck7V3Pvz79qipA12PEVcCymc2KNREisTVxfI
	roudjuqTIsxjet2u23mxDCCgW2mUN/O+cEuxNZ2yrUcr8HRavo29+ldWYAuExl82OOi3xRq4/w4/E
	7GUZ4jzke1+u1VecnhQ+Cvp4irRAKquHG0wf7w7XdH7s/pAhjmVYSlx93O7ABqVkwDK3OalefIO4x
	M+/njAUDs/vUHVvXgwESon/vDjnxOg4JknDkPwpRdklIedDXlenFNQ8aBZMnAqzASSazED3naANmC
	MOp4aRsvaSwrgGNI2Jhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZTex-0008VP-Gm; Tue, 26 Nov 2019 05:45:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZTeu-0008H8-1B
 for linux-i3c@lists.infradead.org; Tue, 26 Nov 2019 05:45:09 +0000
Subject: Re: [GIT PULL] i3c: Changes for 5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574747107;
 bh=nuDyXm+mp6cFNyhAwjYz0fl1RN/MHYSardDiSk6vYNk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=YnH//R5p90+mvOPrdlu8nZO0Z9/yDlBWRX0TIfhwg306nGnPxb9B1dmjVN9e90miI
 hTfNwollKUBEX0ymnTSueRhDrsQzpgBiQoqWWbXhzKv9Go7XTlIQHu3FzOZkfmMgPL
 CSlLMvcYbj39oGDVzqun22POxRRenAkVgodPIlMw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191125090244.1ccd14cb@collabora.com>
References: <20191125090244.1ccd14cb@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191125090244.1ccd14cb@collabora.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.5
X-PR-Tracked-Commit-Id: ae24f2b6f828f4ae37d0f0fd3be4e7744b6aab13
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a11b696975f257ad2410cbb26f288cc52724f81a
Message-Id: <157474710740.9386.2938572312614587508.pr-tracker-bot@kernel.org>
Date: Tue, 26 Nov 2019 05:45:07 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_214508_115670_5D46F79C 
X-CRM114-Status: UNSURE (   1.25  )
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
 Przemyslaw Gaj <pgaj@cadence.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 25 Nov 2019 09:02:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a11b696975f257ad2410cbb26f288cc52724f81a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
