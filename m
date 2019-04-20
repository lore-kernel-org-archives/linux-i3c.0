Return-Path: <SRS0=oBq4=SW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0A5C282DD
	for <linux-i3c@archiver.kernel.org>; Sat, 20 Apr 2019 09:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF303205C9
	for <linux-i3c@archiver.kernel.org>; Sat, 20 Apr 2019 09:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HzRHUEv0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF303205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t/XWbCXoiPlBf6mGqNuwShymya3SCR1Uf7qu/zENCVs=; b=HzRHUEv0ZxDxit
	NRhgUez26/ZYYcGF0S5bD1gICyKSc3M4dKjTQ7jvrNKBn5mozM19Vu8aj6Kd3QeJbHFiQyHlQv7hQ
	raYtrkQK80QHuW0eVZ5ucQ0fK0h2GCDeyGDSJau+eNpF5qMFjueZwikfGf/UV/Xxz1ODgMSqaA+PM
	/o7SVoRawPcP15xPZx5w0/c5N0BdbHxwX/3TVhmmwxDp3nb5znyLIeKlXCE02JTfzX6uoTSM1kKPp
	GfWA0JGDy71AYI80C1Z0I35Unr30Dv/8bP3ILIdMW/5w7AfclCqxnPzqbrOqAQiXveXLttypLCkS+
	9gdAgjdMSo4Q4hr03uaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHmDu-00043e-9c; Sat, 20 Apr 2019 09:23:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHmDr-00042o-GN
 for linux-i3c@lists.infradead.org; Sat, 20 Apr 2019 09:23:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3E3D026BB81;
 Sat, 20 Apr 2019 10:23:43 +0100 (BST)
Date: Sat, 20 Apr 2019 11:23:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Fixes for 5.1-rc6
Message-ID: <20190420112340.24be3932@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190420_022347_671464_B28775A9 
X-CRM114-Status: GOOD (  10.85  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the I3C fixes PR for 5.1-rc6.

Regards,

Boris

The following changes since commit 15ade5d2e7775667cf191cf2f94327a4889f8b9d:

  Linux 5.1-rc4 (2019-04-07 14:09:59 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/fixes-for-5.1-rc6

for you to fetch changes up to 709a53e1948494cc4f6c4636c6f84a4d36a8117e:

  MAINTAINERS: Fix the I3C entry (2019-04-10 12:47:55 +0200)

----------------------------------------------------------------
- Fix the random PID check
- Fix the disable controller logic in the designware driver
- Fix I3C entry in MAINTAINERS

----------------------------------------------------------------
Boris Brezillon (1):
      MAINTAINERS: Fix the I3C entry

Vitor Soares (2):
      i3c: Fix the verification of random PID
      i3c: dw: Fix dw_i3c_master_disable controller by using correct mask

 MAINTAINERS                        | 1 -
 drivers/i3c/master.c               | 5 ++---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
