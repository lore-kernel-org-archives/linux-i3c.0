Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2A0EB64DC
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Jul 2023 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cLSG2uHmCHLowpQJl856MgZcy5j0j5/hQ4nnNhrd8UM=; b=iCTIIEEILly26f
	lMpazGTbUv+UCFzrWnsHPsn7l9hOvpfOWGFNtgrHM5/Ly/AUGjbPJ38kUAKlmUxMwUog6DGX754fY
	+u0Tyg9uD7krx2HZlsI8mSJAxxKH/NQF7KlInVH70I6BNMXyf57lKqGllfkeLCFXhiY0XISqxUUIL
	AnfXUx1uIRHTA2uJEJILuFe0e/Zp6FC+ywdKn08a3r5LcUmTtzfsR/CD1TlIqU3AaBEXcdEFgyqS3
	2PVsbZSLgzpvEyI/G213Z6m+BWjxJ39yEMaUY3Hcs/8UfL/8K6j8LAaBfdFYhUoN8R9rlpwON7Y3r
	eJGLy3C8mkeXQPI40Sig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMsS-006oFL-06;
	Fri, 14 Jul 2023 17:46:48 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMsO-006oDo-0M
	for linux-i3c@lists.infradead.org;
	Fri, 14 Jul 2023 17:46:45 +0000
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3457157a164so9375455ab.1
        for <linux-i3c@lists.infradead.org>; Fri, 14 Jul 2023 10:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356803; x=1691948803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFbBoaA1fWC8AyIt0h8Dq7hGWKkGohWfmADxlBaqeLk=;
        b=T+2KDpqfMnoXJo2z1DceRi3jrwebCVpCsdg5sXrrA6bsAkneLkGl65XOhmj6jyAcFG
         DgvozCtRIDq9E1/1pQK/KUwLcsPbN9Ha/RWRRhLD8wQfdtwjIwHfgGA754LUk0RAryzg
         6GzK/QI/N7hClotl3OqcRIiLyXVpW/gemo2pVs/wbBpgEGCrf4gNcTF1WLJA9l5l6AbP
         woVmwxQWjm5mTX8MaUA/XQVD+dVK09gq8KzeyoZrhFttrvKW+DDcATMRcXB4HRupCyBu
         JFIDh67oUehnbCM8y0XsmcYlEF6HqALM49hpCrqQNk+EHFXnUhseiWMzfBxL4HIrbOpu
         0fJA==
X-Gm-Message-State: ABy/qLZv7LFrp5gNJYtey2IAINSxUtYc8X+Fst7KbLsrR7mJ2wy34rN2
	lCx4hgbAA8wVjW+VAznQvA==
X-Google-Smtp-Source: APBJJlEeiilEW5h0B13gLjUnKrGnndNPG2UJn7IQVCJcGFSBD8VSbN8xbH+4UrnAGOld1DOdGVlw6Q==
X-Received: by 2002:a05:6e02:1025:b0:345:66f5:3404 with SMTP id o5-20020a056e02102500b0034566f53404mr5407820ilj.0.1689356803343;
        Fri, 14 Jul 2023 10:46:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m8-20020a92cac8000000b003423af2fda6sm2840440ilq.83.2023.07.14.10.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:46:42 -0700 (PDT)
Received: (nullmailer pid 4057877 invoked by uid 1000);
	Fri, 14 Jul 2023 17:46:26 -0000
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Cc: devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:46:23 -0600
Message-Id: <20230714174623.4057784-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_104644_157512_B183CC78 
X-CRM114-Status: UNSURE (   9.78  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/i3c/master/ast2600-i3c-master.c | 1 -
 drivers/i3c/master/i3c-master-cdns.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index 09ed19d489e9..01a47d3dd499 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -8,7 +8,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 01610fa5b0cc..49551db71bc9 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -22,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
-#include <linux/of_device.h>
 
 #define DEV_ID				0x0
 #define DEV_ID_I3C_MASTER		0x5034
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
