Return-Path: <SRS0=GBB+=SB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEBCC43381
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 08:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D06D218A3
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 08:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWLeHTTi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D06D218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=imb7L+U0EKE3cHiuZotcm/Cew77s7BVflgyHixu9ozI=; b=RWLeHTTiB2P53Y
	+mnLhHfaLxmFszBIrj5AxqTbR7V25VaPixxS3ELngHf4zEdxkXdnKtcxSZC5qsNobTEbxeYNgfD2R
	b5GOw3A23gUdYqIueoZqyGGRXkCST95YvaFNxjjyeDL+BWLi+68bVf1k8nzxazwdIteJpCdyU8PC4
	qLrtc9wMqElkHQsZKA9LhK8SqE4dH9s6y6DXTC7wzFsoKfxAgVsL7MQ6g0n5Q5/DEaygzsMSG7rk2
	iW77w96Rj5TzqyIwneAj6VtjzZz+LiFx5NmL9RrnIytTGtWaYin6Q+lBg//wscAMbOzGGzJjdAPun
	mhM/0vploTdsgoVBI0yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA8wZ-0005qU-1o; Sat, 30 Mar 2019 08:02:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA8wV-0005lA-Ne
 for linux-i3c@lists.infradead.org; Sat, 30 Mar 2019 08:02:21 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 57E27274F9B;
 Sat, 30 Mar 2019 08:02:18 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Fix the I3C entry
Date: Sat, 30 Mar 2019 09:02:14 +0100
Message-Id: <20190330080214.650-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_010219_899286_174D8349 
X-CRM114-Status: UNSURE (   7.74  )
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
Cc: Joe Perches <joe@perches.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

There's no include/dt-bindings/i3c/ directory, remove this F: entry
from the I3C file patterns.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>
Reported-by: Joe Perches <joe@perches.com>
Fixes: 4f26d0666961 ("MAINTAINERS: Add myself as the I3C subsystem maintainer")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..5ab47d279d5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7333,7 +7333,6 @@ F:	Documentation/devicetree/bindings/i3c/
 F:	Documentation/driver-api/i3c
 F:	drivers/i3c/
 F:	include/linux/i3c/
-F:	include/dt-bindings/i3c/
 
 I3C DRIVER FOR SYNOPSYS DESIGNWARE
 M:	Vitor Soares <vitor.soares@synopsys.com>
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
