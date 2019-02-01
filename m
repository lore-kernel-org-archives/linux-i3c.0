Return-Path: <SRS0=3Anw=QI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534C8C282D8
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Feb 2019 08:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 229B420869
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Feb 2019 08:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AE4IEN/W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uN/kgoHe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 229B420869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mDhdisQqGZgJWcF0hWHtmoLFo9BQPAb76Rg1mnivfn8=; b=AE4IEN/WqWx+lF
	6XBrLgno5p2u4N6K5gZJ1X6X+t/G1yO2pVPipcH6LKBvJc/xAdQzCymx8bYiqH+tbF8HlId2alwdZ
	LjRKOETseLTTHnmtdTSH+An99ePtT6cPrJM2/+ztjEPVQvlOu70a4ftNKSPuOQBQLWniQnd49tKoN
	crkcYUDrmS1+ayT+y1ntYI2MpCTZbHezXGAPTvfqcl8yfvyc2mBz5Fso1lbHoHghTl6LGlzUF8Hpc
	D9JLaOt6HaopJxCcWizWdQlH2dX5tKrhLDMq03Zrfb5myI+393dxQ5d/wFgN8hKFHrWiBUDraqoBT
	M1i8kQks/wLNwVU66u4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpUO0-0006JZ-8S; Fri, 01 Feb 2019 08:41:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpUNm-00063h-NL
 for linux-i3c@lists.infradead.org; Fri, 01 Feb 2019 08:41:13 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9813020869;
 Fri,  1 Feb 2019 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549010465;
 bh=KFjME4w0Cw/dCj63Zy4Xj5zLM5thMat8d36t4esk99Y=;
 h=Date:From:To:Cc:Subject:From;
 b=uN/kgoHeKfKk21L657FbH5iyXCc2nEtydm6WR+coAT2P3Ck4GIC2Akdbc8qClr732
 pkSlzV89K/KjlqcdHh4rrlYm6pWzlpMKiuvz8/NBvL3cXGT3SgqhJUdjVSH/Syt57f
 iC63snak997SK6+REzhxl2vsXFFwBbOMvwVoxXLs=
Date: Fri, 1 Feb 2019 09:40:58 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Fixes for 5.0-rc5
Message-ID: <20190201094058.74f3cb6a@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_004106_924057_92BDBCDF 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: linux-i3c <linux-i3c@lists.infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the I3C fixes PR for 5.0-rc5.

Regards,

Boris

The following changes since commit 49a57857aeea06ca831043acbb0fa5e0f50602fd:

  Linux 5.0-rc3 (2019-01-21 13:14:44 +1300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-5.0-rc5

for you to fetch changes up to f36c1f9a8dfd6a78e6c3fe7aff5e722b84307597:

  i3c: master: dw: fix deadlock (2019-01-26 11:14:25 +0100)

----------------------------------------------------------------
- Fix a deadlock in the designware driver
- Fix the error path in i3c_master_add_i3c_dev_locked()

----------------------------------------------------------------
Jisheng Zhang (2):
      i3c: fix missing detach if failed to retrieve i3c dev
      i3c: master: dw: fix deadlock

 drivers/i3c/master.c               |  2 +-
 drivers/i3c/master/dw-i3c-master.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
