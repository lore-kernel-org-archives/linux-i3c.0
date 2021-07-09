Return-Path: <SRS0=Z2Bd=MB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB1DC07E99
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Jul 2021 23:34:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3830061205
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Jul 2021 23:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3830061205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GrxslE5TiOr2dvIKMMt3qFimLrqTdRzLfu5DQ8FJ8fo=; b=lrWd7+h9smIJAG
	j+930xZhkjZBRQ/h4Qwm1dyQ75/Bz1Wl1JOIaz8ha7MlMNMJ4rueDrDt6CxWqyaxRWZJRMyrU+Z+v
	mb/k9DHLnqzxsPlm0ClSFkJ+l0OzZl50XeT/BdigB2UMKfre6OWZcylNhPpCUgk9FzKCwH3NCjy9p
	0MR7HXuKKRwoLBzq7H22rgQm3wl1JzTQ9U3yABgqmOiJcZk9y3H3Gmc5Y2uTLb7sZ2vXHWQFc7oiX
	ZLDv1ogf9/8eoC+noN00oyRA4cWjnc9+4PSMTHchfLj797q3pxHQJIO0uRJODrm2BZFyQxIlWjqNM
	Uj4637MKxHI88cc5pScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2017-002cJZ-Hr; Fri, 09 Jul 2021 23:34:45 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2014-002cIp-8c
 for linux-i3c@lists.infradead.org; Fri, 09 Jul 2021 23:34:44 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9B909240003;
 Fri,  9 Jul 2021 23:34:37 +0000 (UTC)
Date: Sat, 10 Jul 2021 01:34:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 5.14
Message-ID: <YOjdDda7QIQOmR74@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_163442_486779_F390C083 
X-CRM114-Status: UNSURE (   6.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the I3C pull request for 5.14. Only two non-urgent fixes this cycle.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.14

for you to fetch changes up to 3e5feb11a82945c88a1518fd2682ca8de66c37d3:

  i3c: master: svc: fix doc warning in svc-i3c-master.c (2021-06-09 02:02:45 +0200)

----------------------------------------------------------------
I3C for 5.14

Drivers:
 - svc: two small fixes

----------------------------------------------------------------
Yang Yingliang (2):
      i3c: master: svc: drop free_irq of devm_request_irq allocated irq
      i3c: master: svc: fix doc warning in svc-i3c-master.c

 drivers/i3c/master/svc-i3c-master.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
