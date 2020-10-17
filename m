Return-Path: <SRS0=lBvt=DY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245DBC433E7
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Oct 2020 08:02:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CDC82072D
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Oct 2020 08:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7NcOIh6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CDC82072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3i3OhkoZqqQgOV2z5leMLjqCWck/xcNO3/KT8JLwNL8=; b=q7NcOIh6uVA9d25V9RHhoKjsVy
	c5SDri707J1S9Qly7gGV6qbWf0YHC2HaPOSf6RO+Wys0CPr7rhGj6QcLyKm/FfX8gJiz0JliVkmgQ
	1wVPkK/L8XI1ZXbr8iGijIvkpN8bAA0nCblfMB7QzNcEOwrS3QEPaZH53Dby6X52U7jLBUmH8mNHF
	nijzjWBxWaR5yT4c02qMlc0DfmpZXBH6KEZ0PUYFgTXHKnPEoDWdoOw9rHG/3RYOqHfR4koGmXGUP
	pVTq4RgogfnYrkQSpng53Iy6sqoptvzrnvVo3V9j+5uhFE+Mb05h7oy5NY+QeQ54mFQZYZFhnPDp9
	CLMLAazA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kThB1-0003kH-NC; Sat, 17 Oct 2020 08:02:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kThAz-0003ji-7d
 for linux-i3c@lists.infradead.org; Sat, 17 Oct 2020 08:02:54 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 861FA1F45E3C;
 Sat, 17 Oct 2020 09:02:50 +0100 (BST)
Date: Sat, 17 Oct 2020 10:02:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Changes for 5.10
Message-ID: <20201017100247.475552a8@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_040253_371291_BA149332 
X-CRM114-Status: GOOD (  10.63  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

I'm a bit late, but here is the I3C PR for 5.10.

Regards,

Boris

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.10

for you to fetch changes up to abea14bfdebbe9bd02f2ad24a1f3a878ed21c8f0:

  i3c: master: Fix error return in cdns_i3c_master_probe() (2020-10-07 15:14:07 +0200)

----------------------------------------------------------------
* Fix DAA for the pre-reserved address case
* Fix an error path in the cadence driver

----------------------------------------------------------------
Jing Xiangfeng (1):
      i3c: master: Fix error return in cdns_i3c_master_probe()

Parshuram Thombare (2):
      i3c: master add i3c_master_attach_boardinfo to preserve boardinfo
      i3c: master: fix for SETDASA and DAA process

 drivers/i3c/master.c                 | 144 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------
 drivers/i3c/master/i3c-master-cdns.c |   4 +++-
 2 files changed, 94 insertions(+), 54 deletions(-)

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
