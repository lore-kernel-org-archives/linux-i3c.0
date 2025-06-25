Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC13C77B7C
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tmDIRWhxpT6+YrewqgO/xcNa26KcahlniYcThNPDPfI=; b=oioam80PNwen+X
	cKCM88yPyHCx1a+CYq9vayQAA010bbBlK/OU0T11n/HvZMeSmury15tCMr1M9/m/SSIOrfSlyTvGi
	nkqhhc5Q+BAczyMv3DLfwRKxmPyYE00MpJeS9r5zTmRCnkTkfvCLK4/3iBTViYATOjBR9p5vcnE32
	wYHmCmnehA+0P1zMQdXEegzhyfe8g6MXA7wzBJMeDRPiMFB1mVsYqJ6ANiHxXwWKSfheCeVurmzrB
	IFJSjK0chjvH7s0dbJBacagn78peZHLSqAK+VzfJslVNrAcW2g1N4SxfL8xx8VQe5QmEhiFb0ji2M
	bAjJdvC35yk8Zi9qRX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULT9-00000007x6G-1tbW;
	Wed, 25 Jun 2025 08:26:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKf8-00000007pkG-2uZ8
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 07:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/tne3i1Y/FG1s6
	gAGfKy1Rgq6xzDr4FFhCufsZsqXjo=; b=CXNTs4VlNyY2Hty7PaaWp+cH8TZbdA
	ghN38IidE4J9qDqxuPppr0UThOB0akM2kQrovcHG4A+RYx4CW2RzrTlmxrPCZHbu
	Q8R2ydLFWH4ZMnaAPasUyzEdR4BrYfeMqMc44haB8Mxzlyx/6fsJ1t6fNMHkKx6g
	s+ZtIznrdoFsLtAvGCP6zng6Y+/DamfpCh/xYQ9dam4Ey3kMIHUPLcgXY1/7bgAr
	/Qn0WQLsxI3yFsPE9AMT8SyUTtb+1UZ7nhPgtvou2adghu0mDzu29BxcJHhet63y
	NgIEWY3GF+LbcVRzElSqX3Lkjoxxq6JzgkiVGem4AeRtBb7T8ngAWQ/g==
Received: (qmail 550592 invoked from network); 25 Jun 2025 09:35:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:35:16 +0200
X-UD-Smtp-Session: l3s3148p1@PYpufGA4eNRtKLNf
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Date: Wed, 25 Jun 2025 09:34:52 +0200
Message-ID: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003519_006729_246F67D4 
X-CRM114-Status: GOOD (  11.15  )
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

If a target has the HDR_CAP bit set in BCR, the core wants to get
additional information using the CCC 'GETHDRCAP'. Not all controllers
support this CCC, though. This is not fatal. We can just skip it. The
information is not needed if the controller won't support HDR anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found during the I3C plugfest in Warsaw.

 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 204b96e6be1e..b6b96cf9e4e0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1440,7 +1440,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
 
 	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
 		ret = i3c_master_gethdrcap_locked(master, &dev->info);
-		if (ret)
+		if (ret && ret != -ENOTSUPP)
 			return ret;
 	}
 
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
