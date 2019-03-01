Return-Path: <SRS0=+Ei+=RE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F25C43381
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Mar 2019 09:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FEE42087E
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Mar 2019 09:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GSHS69wD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FEE42087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3FRBbCXtcK0fatixlu3RpSVU5yYW4c/dVBIes+p60a4=; b=GSHS69wDsfyPO8
	hs0aWU5r4cXUk7920w+P0XDpVFgwT5fU1Fs+6A23vgtLfGe1y0P5oGtJsCLAAnPF7LTFMDx7L+TeY
	c+HIqhViaXV2akY4N3z62YDSR9/jLjLlIzQCe5k8b0aPo7iVbHObAnGDTlk8XQ6S+Lqw9nb7oMX3d
	7zK/8GxVc1KMxnlR/6N0KwQc05nPrxDh24A4ey/aQXe+eQmgeZMCq8Vut30QS2HPTzxAzKy+rJzMP
	awoEsYlAc05nmJJStqE4QKCwbOTCUk3HqBEDAu7dBF0hSnz3jVdl77gEBskLGej204rMFYJgCWVrn
	T5umwA2wDAcOX8kiqrkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzeWn-00007b-Qj; Fri, 01 Mar 2019 09:32:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzeWk-00006L-2Z
 for linux-i3c@lists.infradead.org; Fri, 01 Mar 2019 09:32:24 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8E6F7280A3A;
 Fri,  1 Mar 2019 09:32:18 +0000 (GMT)
Date: Fri, 1 Mar 2019 10:32:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Changes for 5.1
Message-ID: <20190301103215.4ee6e758@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_013222_610042_535A1CFD 
X-CRM114-Status: GOOD (  13.05  )
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

I know the merge window is not opened yet, but I'll be on vacation next
week, so I'm sending my I3C PR a bit earlier this time (already sent the
MTD one earlier this week, but for a different reason: I didn't check if
there was an -rc8 :)).

Regards,

Boris

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.1

for you to fetch changes up to 988bb4a1937bd083267444dda21b901dc6a959b3:

  i3c: master: dw-i3c-master: mark expected switch fall-through (2019-02-28 09:47:53 +0100)

----------------------------------------------------------------
- Add a /* fall-through */ comment in the dw-i3c-master driver
- Update the I3C entries in MAINTAINERS to add an IRC chan

----------------------------------------------------------------
Boris Brezillon (1):
      MAINTAINERS: Add an IRC channel for the I3C subsystem

Gustavo A. R. Silva (1):
      i3c: master: dw-i3c-master: mark expected switch fall-through

 MAINTAINERS                        | 1 +
 drivers/i3c/master/dw-i3c-master.c | 1 +
 2 files changed, 2 insertions(+)

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
