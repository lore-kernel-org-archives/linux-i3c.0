Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64699C5CFCF
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 05:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5afmcQqjBBrNiNxKQ3EJ5d5UYu9Ol2i+iBRd+E820dM=; b=hbxqlk17fcP5iG
	8unHlut2L3IzrVGWDITw0U+ka+RicGVomxb4UPBDkAhBhX2x9QDqiiLSkRx/1UW0O5fF36B+qayk7
	iyLBWDkjKRaMsXBFv8zk/E21Qbk7X/ichUIyHNT7yo3jLBlcs3t3fN/FA9NVMa4ZkqJN/+9X0NWV9
	opr8/wLVG+jByMEdRnIyMR+wsfbUeHKf0m2G8F1gzG1iWE+pRiDOp5cW1/7P/g9gVSIpd/H8PjEq6
	0Pk5eNBXsY1E6oWlSdU56941QdStoK0PVxjRm9cKmuRym1ZhogK81OMCWKDgsemvBLpxgQjyoskhM
	dQPczd9f1cCAvOQ8surw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujS2-00000001vq4-1VCP;
	Fri, 14 Aug 2026 04:23:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujS1-00000001vpy-0tyr
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 04:23:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92DFF4096E;
	Fri, 14 Aug 2026 04:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117091F000E9;
	Fri, 14 Aug 2026 04:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786681404;
	bh=4naHFqAyGUxic/UcwsLDY/HR3q4WOvVHco2zGUhDY8A=;
	h=From:To:Cc:Subject:Date;
	b=lTBhVp0/0wU8wX0K6aSGAmu7hu4npexlQqDR4ehFxXLSJ3a6uOvCEX88wubKbzPTk
	 P7HIXxSX4HxhL9VBdNlx9h6tNIu5pVDX5kU0bIKojzcJE2YwlkV42alWQJTs3owvoc
	 kcdlExQNLIIC5AihInhf5q79OOoYUBE1Zks07s8FupvdWFr2SI8zXJpyK0ettsyyqZ
	 rJ9iIANWhj0GjFnz8gUB5m/wAjFPNYLeKTUWnXDhodxq/pGwVS7g8SUg/zcKFcYdkr
	 NjRNZhTruP+ezl2uuqJmAccVQM6xUMKNh8xoTami1FFUzatLu9Vr+NyjD63IYeygJy
	 IIndYFHQl1sEA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i3c: dw: rename "pclk" to "apb" to match dt-binding
Date: Fri, 14 Aug 2026 12:03:45 +0800
Message-ID: <20260814040345.23033-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Change clock name "pclk" to "apb" to match dt-binding doc. No upstream
device tree sources currently use the "pclk" clock name, so no any
backward compatibility issues.

Fixes: a0d48ebf39ce ("i3c: dw: Add optional apb clock")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

since v1:
 - update commit msg

 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6f84f0f4c2d..1053cfb05c05 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1582,7 +1582,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
-	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "apb");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
