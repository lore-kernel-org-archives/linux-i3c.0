Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA93C3ABAC
	for <linux-i3c@archiver.kernel.org>; Tue,  6 May 2025 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YwlGYrzlk3ipu/dQ7kXn4rVbmbB0/IphtHWvTAAFXwQ=; b=FTuMSYi44lV0lH
	fMGm0N3ceVuB69N9NaS4p8ZpnVRWp97bliv5SKUf67Et/FdafmJqSvJFt4JdDAuy0HPsHaiQQkfp/
	ClisfNJu/NBc8F00zOzkysbpNYrHv7qMX1QAPy6IyDzsjtJprBRktFXBGAxCUWU5PsQ07mM5Zvdej
	3v3kFw3EMrF70kK/96yGMltCKztZc3JYgQCZJr8HX8koDAeLhj3ksWtJp+C0vCoYh+h+Hdb8X652e
	+BE4EJA0vwhf+27XTsHbY4tyLAX+Shs/WbJkHxgY/vPwCD3EDsdNLCULXto/IyqqPge0TeUiSpc0n
	TzfPukPrASvh11xWdLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCD6y-0000000B2Lj-3i7u;
	Tue, 06 May 2025 07:53:08 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCD6u-0000000B2GU-2tdu
	for linux-i3c@lists.infradead.org;
	Tue, 06 May 2025 07:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=8WlILYCRWuNyeN
	DT8WpojOWWs9oFfR3WA8Well/x80w=; b=O79DzhuIas0V7rtbbhdDMSnvEdANo6
	814iiP0n4wEtqeof8YdeWI5a51BCBx7BVd2JOJSkKhN3j0EvlwzZXqVb8G9EGjOG
	0eW6x9deCewRqusatIZCO6y0itSdotICvS+CcWWKtZw3pQ+go+yv84MIoPoNIRTl
	h51WhLM+RHr6oJ7pS208djeM6C2RkuVIdLcMXvHRVsqD+iuHkNJHA7sgpy1BFGW/
	7VLffwyiJtdy+ZXtWtE8QDrpFEcEask1jf5jPs7IVAuoby2Pa7FvhESDSLLw3w8S
	N23daTeOPfcoWcA0Bqh60tRSZ37xnavH+oOZ0nd0XkWRdgkkXym6V4+A==
Received: (qmail 2832855 invoked from network); 6 May 2025 09:52:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2025 09:52:54 +0200
X-UD-Smtp-Session: l3s3148p1@5Cpe53I0eh5tKPHd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: controllers do not need to depend on I3C
Date: Tue,  6 May 2025 09:52:11 +0200
Message-ID: <20250506075247.1545-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_005305_595305_48574C04 
X-CRM114-Status: UNSURE (   8.39  )
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

The Kconfig file for controller drivers is only sourced if the I3C
symbol is enabled. No need to check for that in individual drivers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Based on linux-next.

 drivers/i3c/master/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 77da199c7413..7b30db3253af 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CDNS_I3C_MASTER
 	tristate "Cadence I3C master driver"
-	depends on I3C
 	depends on HAS_IOMEM
 	depends on !(ALPHA || PARISC)
 	help
@@ -9,7 +8,6 @@ config CDNS_I3C_MASTER
 
 config DW_I3C_MASTER
 	tristate "Synospsys DesignWare I3C master driver"
-	depends on I3C
 	depends on HAS_IOMEM
 	depends on !(ALPHA || PARISC)
 	# ALPHA and PARISC needs {read,write}sl()
@@ -38,7 +36,6 @@ config AST2600_I3C_MASTER
 
 config SVC_I3C_MASTER
 	tristate "Silvaco I3C Dual-Role Master driver"
-	depends on I3C
 	depends on HAS_IOMEM
 	depends on !(ALPHA || PARISC)
 	help
@@ -46,7 +43,6 @@ config SVC_I3C_MASTER
 
 config MIPI_I3C_HCI
 	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
-	depends on I3C
 	depends on HAS_IOMEM
 	help
 	  Support for hardware following the MIPI Aliance's I3C Host Controller
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
