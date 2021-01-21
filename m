Return-Path: <SRS0=pX9d=GY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B28C433E0
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Jan 2021 10:18:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CA2221F8
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Jan 2021 10:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5CA2221F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i7QNK7cRSQArp7rwM/eRU5BUC78k5aASVTJJdOYm+j4=; b=pc4BnUU0Uu/tTF/PwSa656XRs
	mCavaqOYVG+EG32jCPVIki51Aa7+W7BEpb/izR+odaZGqlXDeIfXMHvMc47I48ufsqwG1gEKMvxMj
	2lijvrRFbvfuW25v8TYodvf/V4EKjpbaBIf8dsMMTvnwxp9jiAorlJltzGlOhXNrXoDmaaMGnJP5a
	Y/2Qkr7Hor3T8nBfiWRmgX5hpsFqA1FcFSEDhfUzL8gKNI3xLF/k6IfaJdXCpKitUbGO1UFlAr8cc
	rgFeLTz5hWDUP8FsEg8SsgsJOMSiGuqPE3rEx4r0+KN6TyXAHUbbmqR4JZ98TTZWHqvRsMTXuJZXU
	Mt7uG2I1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2X2m-0002vt-Sw; Thu, 21 Jan 2021 10:18:24 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2X2k-0002uT-7w
 for linux-i3c@lists.infradead.org; Thu, 21 Jan 2021 10:18:23 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A5A782000A;
 Thu, 21 Jan 2021 10:18:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v5 6/6] MAINTAINERS: Add Silvaco I3C master
Date: Thu, 21 Jan 2021 11:18:08 +0100
Message-Id: <20210121101808.14654-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121101808.14654-1-miquel.raynal@bootlin.com>
References: <20210121101808.14654-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_051822_438976_9B466EAA 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Conor Culhane <conor.culhane@silvaco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nicolas Pitre <nico@fluxnic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Add Conor and myself as maintainers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 546aa66428c9..caa4e1ea32a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16237,6 +16237,14 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILVACO I3C DUAL-ROLE MASTER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+M:	Conor Culhane <conor.culhane@silvaco.com>
+L:	linux-i3c@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+F:	drivers/i3c/master/svc-i3c-master.c
+
 SIMPLE FIRMWARE INTERFACE (SFI)
 S:	Obsolete
 W:	http://simplefirmware.org/
-- 
2.20.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
