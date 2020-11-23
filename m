Return-Path: <SRS0=AdV8=E5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DBAC56202
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Nov 2020 09:28:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD9C206D5
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Nov 2020 09:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E8SxMHLn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD9C206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2YmX7OVOb+Ney1Sz5IMFzl4Xgx3S+na/TN2XMuYI8hQ=; b=E8SxMHLnb9iRSQLVx6WKTiNl8k
	q7pbAh/PSo/GEbJmR1wpZcqE2QMF/e5Ou6BcqhSkZn5cixlOgpvTn7Xt8m1XdohF6dq5yIBXol9HR
	K4ACU2tGEUrnpS5B6oJohVLezt8S+4wu6iDP/dV4GU5fZltElrqQ7hn9eW6srgV6ctk9Idgps2uWd
	buMvZocv42a+JU/J+zNHWUKNFrhu7XmroiUmWvJ4K3GrWdUtnFoLn1hpasFM9ea3xRdYFtC1xFWA7
	4pREIzVgpxMMBtOfnbI0nO+GZo9C2WHKver3QCl8rxg+lTeKC5Gc1iMe6iiOAz8/3d58ajOd8jIJD
	oAUMPg5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh88k-0004eE-1K; Mon, 23 Nov 2020 09:28:06 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh88i-0004dQ-6h
 for linux-i3c@lists.infradead.org; Mon, 23 Nov 2020 09:28:04 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C227B1F44C92;
 Mon, 23 Nov 2020 09:28:02 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: Resign from my maintainer role
Date: Mon, 23 Nov 2020 10:27:53 +0100
Message-Id: <20201123092753.38304-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_042804_352199_35F26CAD 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

I simply don't have time to maintainer the I3C subsystem anymore.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
If anyone is interested in taking over (ideally someone with a korg
account, so the transition can be done as smootly as possible), please
let me know and I'll make that happen.
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..8510f13a713c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8333,9 +8333,8 @@ F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
 F:	drivers/i3c/master/dw*
 
 I3C SUBSYSTEM
-M:	Boris Brezillon <bbrezillon@kernel.org>
 L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
+S:	Orphan
 C:	irc://chat.freenode.net/linux-i3c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 F:	Documentation/ABI/testing/sysfs-bus-i3c
-- 
2.26.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
