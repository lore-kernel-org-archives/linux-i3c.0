Return-Path: <SRS0=L6Ar=5O=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A54C43331
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Mar 2020 08:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF0E20714
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Mar 2020 08:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qjWf/92k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BF0E20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gQY23e0VTBdGMQcFcRxqVjZau2rb5RnKpDL+AFYfoT8=; b=qjWf/92kiT2/28
	gqogAIgIxN1Ed2YwDZZ2H/6f0v8s/lyOwoR80F6RP4VT99StDK5dkNrcSfwFFgFOeWVtqZY8l8Feq
	3GjHuXMmRNnQgoo/XAsyX57vkmnnC6yFHjF1a6xyXIS8SiGh7lAOYjB7hq7R0xRZ3KdFi23VXd9mo
	hKmrVgc97EGU8kPH5yvweiV2h1JLWFvxjAVegrXldMv8/LEuM6g0RWteocES6cgNpHs+CsjHQMpgL
	rBAqUW0wCSEiZqVd2NdUI3Apj7VkCE9iJRCqUWnrrbVslw33cw/BBBrccOKeXUQ5vX0gFrBDzZtFI
	Fox9i8j2HhnPxnNa43Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jITe9-0008SZ-3g; Sun, 29 Mar 2020 08:50:21 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jITe6-0008RW-4m
 for linux-i3c@lists.infradead.org; Sun, 29 Mar 2020 08:50:20 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3514B29054B;
 Sun, 29 Mar 2020 09:50:14 +0100 (BST)
Date: Sun, 29 Mar 2020 10:50:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Changes for 5.7
Message-ID: <20200329104816.5cbdb74f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200329_015018_318901_8DA42104 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the I3C PR for 5.7.

Best Regards,

Boris

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.7

for you to fetch changes up to c4b9de11d0101792c4d5458b18581f4f527862d1:

  i3c: convert to use i2c_new_client_device() (2020-03-29 10:35:50 +0200)

----------------------------------------------------------------
* Fix driver auto-probing related issues
* Stop using the deprecated i2c_new_device() function
* Replace zero-length array with flexible-array member

----------------------------------------------------------------
Boris Brezillon (4):
      i3c: Fix MODALIAS uevents
      i3c: Add a modalias sysfs attribute
      i3c: Generate aliases for i3c modules
      i3c: Simplify i3c_device_match_id()

Gustavo A. R. Silva (1):
      i3c: master: Replace zero-length array with flexible-array member

Wolfram Sang (2):
      i3c: master: no need to iterate master device twice
      i3c: convert to use i2c_new_client_device()

 drivers/i3c/device.c                 | 50 ++++++++++++++++++++++----------------------------
 drivers/i3c/master.c                 | 28 +++++++++++++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c   |  2 +-
 drivers/i3c/master/i3c-master-cdns.c |  2 +-
 scripts/mod/devicetable-offsets.c    |  7 +++++++
 scripts/mod/file2alias.c             | 19 +++++++++++++++++++
 6 files changed, 75 insertions(+), 33 deletions(-)

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
