Return-Path: <SRS0=ouzu=FX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B39FC4361B
	for <linux-i3c@archiver.kernel.org>; Sat, 19 Dec 2020 21:06:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0712D23B86
	for <linux-i3c@archiver.kernel.org>; Sat, 19 Dec 2020 21:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0712D23B86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+szrPuEi+cJ9ByqM8BehbcnBLrAmmfJMeX8lzTtJ6o=; b=ZwvWcSyPEBYhCHbGE4vYw4Vkhi
	s67JhMmpANdjOSYnR95GGk9ZJyTnL4HpMWUkg1G4FJ0QCMS+t4UIKOud06MewwMiHOOPtVcNzeDV1
	XBI/S2YJ82+72UulU/QNYrvAYqWOMnYOiCDnfSsHjsvwA1q3dtUdnwgy+va09PsgRg54GHjhOkB5m
	+ixMs/AB2Bi0cvi/U6m8+oNqmoQRoZ+KO68mObQQD/tm08taZ4ogvWakiPHv6Eo0DG81CE4W0BDC6
	DESNr+e6Y04MsUIyrOg7hEsm4MXw/OoYd569Dlba373Tm6/St58JJr62A6QNMyVXEnSbbGNsmfBdK
	DZWsLrBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqjR2-00033I-Te; Sat, 19 Dec 2020 21:06:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqjR0-00032o-Ms
 for linux-i3c@lists.infradead.org; Sat, 19 Dec 2020 21:06:39 +0000
Subject: Re: [GIT PULL] i3c: Changes for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608411997;
 bh=Rp4INsEa+tD59YcZW7lCoK0qiFbUmetfZAEHqooOlsA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=fKSGup2zkVjPXtRhrmvUbMNH8dWElZvK1icoskDzuzoU+k8kQB30LBVsrB9SZACAo
 ZDvvQG1ZWkG3XnRNmt2wMqbxaywVbA5UIgXNIm+GSD7kjjngEmFztFzBWrFfj2xF0M
 P8darrPMXkVTFDlnn/amvIU9ksIoym2j3QzIU8ePupZ1qTV1yJDWhPIUZFhNEn+tSb
 N6eXAfedvvScem/FzfGxT1/Y+IsW+tyvOC3OgztiJgIZth1Bj2wYInIPK+jD6R+1lz
 sibnNl+KwUWdy9pDPyqBOK3uji8e9MzQRAI/ptjn9eVRSRhyrGxq299nQtXIevy+2T
 hxcGuUVHARaxA==
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201219080632.686b92bc@collabora.com>
References: <20201219080632.686b92bc@collabora.com>
X-PR-Tracked-List-Id: <linux-i3c.lists.infradead.org>
X-PR-Tracked-Message-Id: <20201219080632.686b92bc@collabora.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.11
X-PR-Tracked-Commit-Id: 95393f3e07ab53855b91881692a4a5b52dcdc03c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 190daf19206783bb16655db14e604a0d724c4bbf
Message-Id: <160841199713.20285.16202306581510604938.pr-tracker-bot@kernel.org>
Date: Sat, 19 Dec 2020 21:06:37 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_160638_847195_CD4D7BCD 
X-CRM114-Status: UNSURE (   3.79  )
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
Cc: linux-i3c <linux-i3c@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <abelloni@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 19 Dec 2020 08:06:32 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/190daf19206783bb16655db14e604a0d724c4bbf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
