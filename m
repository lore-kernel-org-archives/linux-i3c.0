Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B99C83F1A
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Jul 2025 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=69w4bp+unLI1zBX4PcAeD3cCc9M2uxvxu18riSNwM5s=; b=Fn6mPCdYtGJqIV
	2CnyQzRIO50kXktahsUD2hNRAr1PP1GIRf9H+1ciuJH3kyVtsEyka6lRWHexVNWe4rx8h86Tt2/EL
	WAhgy0ESiqqLeqtjnlGOA8EQEqqwAGGGuQlJ4Plg74ugqJZqpdABud/mcZl0qwcV3BsxDHMZ7Tx3E
	AOrnZv3/rl/XnRTyOO3ZAe6Iu9v48RzjPGoQgRO0TFqKSnjMLs2HTplislZfwa+Pfh63VaX05CvUW
	vt0Z9HRumq6XGaxtVsuHNB4grsEURDK3Z+zWkdYI4qxFGhG3hfceAULTbTd4RapsWNBvDLyjwWAMQ
	R5KOmpS+zNMMnn1Xwjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucORh-0000000AE4p-0NXt;
	Thu, 17 Jul 2025 13:14:45 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNIT-0000000A3cW-13RW
	for linux-i3c@lists.infradead.org;
	Thu, 17 Jul 2025 12:01:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Iywdj3bEMgSqz2
	EzIawphcUGcb2X+//tviQ2sOEb13U=; b=Ygn4Fuu88XmJ07NUdIiWQGrqTVYaXx
	EulktAm9SygKZPb6shdpGSNxVpDHGWAQl32o0Nhae14Z+TXOqXiUU85dPupppBZU
	64WgYs0iOcfvQb2qjsSHBjb2+TRZMANHCKtB6ia9bOhktBxaKT/w10y+sVr69iyL
	4YF01QvyRWM7lhMYQpQM9ccYlqVJ4CPYOu8z2M//5SOT8n4zPAvjfD1MWAFhhmfR
	BakylX7xFWg0rsIYrIT8epQQVKF01xJh38wRTvwt8rGK7l52zY1KrMvLgY8kyNay
	ydB0bQvS868UPT95MF9VMjzM41Bn/4Iy6YeDocNUQw9pmPmMo2ASRSoQ==
Received: (qmail 3664127 invoked from network); 17 Jul 2025 14:01:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jul 2025 14:01:04 +0200
X-UD-Smtp-Session: l3s3148p1@7hmCwx46kusgAwDPXx+vAAkEB0lWxGP4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	kernel test robot <lkp@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: add missing include to internal header
Date: Thu, 17 Jul 2025 14:00:47 +0200
Message-ID: <20250717120046.9022-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_050110_141655_BEB00032 
X-CRM114-Status: UNSURE (   7.65  )
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

LKP found a random config which failed to build because IO accessors
were not defined:

   In file included from drivers/i3c/master.c:21:
   drivers/i3c/internals.h: In function 'i3c_writel_fifo':
>> drivers/i3c/internals.h:35:9: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]

Add the proper header to where the IO accessors are used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507150208.BZDzzJ5E-lkp@intel.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/internals.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 67ed1c44f615..1bf6aecebcbb 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -9,6 +9,7 @@
 #define I3C_INTERNALS_H
 
 #include <linux/i3c/master.h>
+#include <linux/io.h>
 
 extern const struct device_type i3c_masterdev_type;
 
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
