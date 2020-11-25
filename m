Return-Path: <SRS0=M/mW=E7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B363C5519F
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 10:17:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4B82065E
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 10:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tQNLeOYx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4B82065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bz7l9K28/Ngxntpv9sJxu6QRur89BUQ+6fCbKkF3c6s=; b=tQNLeOYxC9ERL5fC5FNRib+pCc
	skfgY4xziM+CHqUJ+R9O8hL69PhWiCU6LCbYNcwag+iq7mVKwSMnFVOzxs5sVQDGmDJ3KeOWav74o
	NGRzgloCVct0IdkdaQmLOEWGrTuJpkSyT5FAGnH7xDwkWwt/s38HmLien1pZlEtTvgUv3+ynC/W0i
	G5DPBZuIx1+FRZmbGwZn+PLXZBYrtDWzBa18xRKZ9bQPlzLMbPGU2pDOz+gda5a4MQOU1MHSxMG2g
	hCX9q8tJteg9XQHHOJbSGjt1JyOAk7EJ3PPjrYC5I3MqnK2/Ozdu7DTahWEiSOkMfddX/46XajR8N
	yd37LjAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khrrC-0007Yf-0i; Wed, 25 Nov 2020 10:17:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khrr8-0007YG-Vg
 for linux-i3c@lists.infradead.org; Wed, 25 Nov 2020 10:16:59 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C59391F41295;
 Wed, 25 Nov 2020 10:16:56 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v2] i3c: Resign from my maintainer role
Date: Wed, 25 Nov 2020 11:16:43 +0100
Message-Id: <20201125101643.461658-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_051659_133171_337223FB 
X-CRM114-Status: GOOD (  10.99  )
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

I simply don't have time to maintain the I3C subsystem anymore.
Alexandre Belloni proposed to take over which I gladly accepted.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
v2:
* The subsystem is no longer orphan, Alexandre is the new maintainer,
  yay! (Thanks for stepping up and proposing your help BTW)
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..020fb2a0c5e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8333,7 +8333,7 @@ F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
 F:	drivers/i3c/master/dw*
 
 I3C SUBSYSTEM
-M:	Boris Brezillon <bbrezillon@kernel.org>
+M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 C:	irc://chat.freenode.net/linux-i3c
-- 
2.26.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
