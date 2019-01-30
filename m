Return-Path: <SRS0=WTHI=QG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AF9C282D5
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jan 2019 08:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661682087F
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jan 2019 08:21:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VGInX9B2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6rAwXpN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661682087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=mvOi/lzdrovXPHhPUYJ4TSng+D7BSMkJ9Pec90C5L5o=; b=VGI
	nX9B2VxdFd6pV6Yo+/Nzb7ZgvXesuub3Ge1Kzs6VNgfcprJRzw+HLDh2e8ooiiN8EXAxy584IN3Jc
	VOT17ICda52jeNe4OWxTb9wSkEc4NoGAq+rGNYuYqjnlulavG51VEPSSA7TG7gIpg+gGLtareHs4F
	MauqSSI9Uwsdar7LY+ZHJZeUfeGOVD0tD2ZohZaA+xZ7QNqRqewYsfSJ/yXwP/VZsG4M1WCQ/jS5m
	/3u++9U2KDBuA74d33lzdX6BHYs3Zci5tjmeQrDo9a5VGZVa5tUEytSaBlZvAjsl3ScdCQIaX7lOt
	PNIxOGRxkgztddjsTSpc91Zf2JYVHIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gol7m-00035K-1D; Wed, 30 Jan 2019 08:21:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gol7i-000352-PM
 for linux-i3c@lists.infradead.org; Wed, 30 Jan 2019 08:21:32 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CF922087F;
 Wed, 30 Jan 2019 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548836489;
 bh=drqORmh8SjL8JRdhJnSs/Un8W613PATqh97qSiBAjcY=;
 h=From:To:Cc:Subject:Date:From;
 b=H6rAwXpNU/bMyBDg5o33a3F1ege/5q5iJJzQZD6WINYZAVdSWtNJsGVStoPnfSfP0
 fA4NhPj/iPmRRiUXN4ml1wAMx77c6DmMADSnBHeMKdT1aQlfwUd+K5bGq7dszFk5A7
 tLHoHP2QzwUMAe52eDOFSV+APlLSvD9cj+qj0vH8=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Boris Brezillon <bbrezillon@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Add an IRC channel for the I3C subsystem
Date: Wed, 30 Jan 2019 09:21:22 +0100
Message-Id: <20190130082122.5636-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_002130_837596_837A2BF4 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>, Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The #linux-i3c chan has been created on freenode to discuss I3C related
topics.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51029a425dbe..ce1380284e82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7163,6 +7163,7 @@ F:	drivers/i2c/i2c-stub.c
 I3C SUBSYSTEM
 M:	Boris Brezillon <bbrezillon@kernel.org>
 L:	linux-i3c@lists.infradead.org
+C:	irc://chat.freenode.net/linux-i3c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i3c
-- 
2.17.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
