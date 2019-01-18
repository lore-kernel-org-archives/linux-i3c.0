Return-Path: <SRS0=FHoi=P2=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD30C43612
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Jan 2019 12:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A9420823
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Jan 2019 12:57:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yukxp8l9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mwp+BdrR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A9420823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KJAt/+dQfldqjsIva+HezvR+yPXYCH6Zyqei8P4XKNU=; b=Yukxp8l9sUK+B7
	zc2nq2e/LTYDNMF9UEx7y1YJf51Z2A+R3/mNfxtOTzEH8QJ+6eFwGPQzSZn9JvUVo/twI0J40elrr
	iGcGaZKH09JwGZ/4Lr3DqfPbqJAsFkBGe3U1Lji+nOLwiq82CrX9lDiXdPdqnHxHaiyGHG7KWNi3i
	358ktzFPOqkdCSxJB0kiRxWBzFswerHQ61QeCJGWhP8on51WclQYvm3Z9UYoQu4b5RamEK8WfoCal
	53hEY8CwNj30Gz+5uwGi8plY5493pQCHT8Rf2JIstIoQKEUML9raW7pC7bIUeCGxBSkA27oD6oXin
	ugy7f5jl5jF4ZHIFZ07A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkTiW-00069k-H0; Fri, 18 Jan 2019 12:57:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkTiU-00069P-1s
 for linux-i3c@lists.infradead.org; Fri, 18 Jan 2019 12:57:47 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35D9820823;
 Fri, 18 Jan 2019 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547816265;
 bh=/PHdplVUqH8gRGxUccG820izvR+E/zeqIzOESWDnPF4=;
 h=Date:From:To:Cc:Subject:From;
 b=Mwp+BdrRQNqpY2JWaoZ41DWVlW9XMZol+5BzhxJiC/DPMO4C2xGKHkiEDcbruQ2J9
 sUVMlHzt0Bej/9ekwqvh21DJ7rOfP9f0HfXmVdgMYS6e0s72nM+S+/Rgwd0VIYQelN
 FRBsGYoJc0xKFL7iNJLm5vP2eULPsbtzcGMngqQM=
Date: Fri, 18 Jan 2019 13:57:37 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Fixes for 5.0-rc3
Message-ID: <20190118135716.5cb2cc64@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_045746_116877_19BC86C4 
X-CRM114-Status: GOOD (  10.31  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the I3C fixes PR for 5.0-rc3.

Regards,

Boris

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-5.0-rc3

for you to fetch changes up to f29fd331aa055fbeb5a496b4af937b7952111b6b:

  i3c: master: dw-i3c-master: fix i3c_attach/reattach (2019-01-15 11:15:11 +0100)

----------------------------------------------------------------
- Fix the error check on master->sysclk val in the Cadence driver
- Fix reattach implementation in the Designware driver

----------------------------------------------------------------
Christophe JAILLET (1):
      i3c: master: Fix an error checking typo in 'cdns_i3c_master_probe()'

Vitor Soares (1):
      i3c: master: dw-i3c-master: fix i3c_attach/reattach

 drivers/i3c/master/dw-i3c-master.c   | 7 ++-----
 drivers/i3c/master/i3c-master-cdns.c | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
