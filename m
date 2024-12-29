Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39BDE7718B
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Dec 2024 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlUG7DczZoUdQf4H+BXVxK5+s3HDxSqM4J00ZNXvXOw=; b=SeVyuLiJoJtYoR
	gYyjDmE/QGdVL1/w1rbkxCvK+M1AZgsUMPohpX5LdIZf9L6FHbpfEICWZv1jC8zimMeSyiqq1wTi7
	1VPZfdtx5dX0ayBi0ktl+qWYvmI0Ow3GgMXI7oDSLrF+aV2mVfECaws1w0bGUmupZqMssiFOeIIid
	GtLv0k6VaHVZDHjPzVls0LySTVb5a6UyV4AyS6U1xQ7HkgVTDufz0YwgAk/3aIjjP/AupLPApW/y9
	cGiL256jkYA+hVTYTPaeDx58Odvq7xBcdHQNGZt6tg8J2z3mDXeYonStR+hCI3Polb6TnEyvvdVdN
	5diUealPVryMA6kMZxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqKu-00000003FQD-1iBc;
	Sun, 29 Dec 2024 10:15:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqHq-00000003EoI-31RN
	for linux-i3c@lists.infradead.org;
	Sun, 29 Dec 2024 10:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=HcEn4SC6k8TM3B5gnzbEg5duKt2BAHa6/yH+isc0eiY=; b=M6oPC6
	GtxOju2Rp23MsXuWEpjI0wp0wTTuPQ8qVd4iki1LoP4TYeSG65Uirmt7AIxPR/rj
	VSr/nmQ6eEb3ry3J0ztf97z5zXzdfdqvaSE7r/R9YSQA+bElRNGH3lNUdKZllN2G
	SAHEdZWO/UcY48+JMliB+JeGnl99jUx/BEV19sjS+jLQPYdzw5te4egVqD5Zc9ED
	cSFRerfJCulX/HdSNceXyOIfeaB4aC1ecLaUDkga7kTD4gdYkkVM7SOwrOHvL1jI
	bc6z653Vpr3iKaj8XnrTiotj99+DRn+QJNJr9513R8nxpb4I/rGh7vDveTPX7Ivy
	JoSK/ce3JKSCqqzQ==
Received: (qmail 3656724 invoked from network); 29 Dec 2024 11:12:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:37 +0100
X-UD-Smtp-Session: l3s3148p1@mkFx72UqmLEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RFT v2 3/5] i3c: dw: use get_parity8 helper instead of open coding it
Date: Sun, 29 Dec 2024 11:12:31 +0100
Message-Id: <20241229101234.2896-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_021243_666917_706ECD6E 
X-CRM114-Status: UNSURE (   9.72  )
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

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* rebased to 6.13-rc4

 drivers/i3c/master/dw-i3c-master.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d4b80eb8cecd..0d4d44458c11 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -251,14 +251,6 @@ struct dw_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
-static u8 even_parity(u8 p)
-{
-	p ^= p >> 4;
-	p &= 0xf;
-
-	return (0x9669 >> p) & 1;
-}
-
 static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 					   const struct i3c_ccc_cmd *cmd)
 {
@@ -848,7 +840,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	struct dw_i3c_xfer *xfer;
 	struct dw_i3c_cmd *cmd;
 	u32 olddevs, newdevs;
-	u8 p, last_addr = 0;
+	u8 last_addr = 0;
 	int ret, pos;
 
 	ret = pm_runtime_resume_and_get(master->dev);
@@ -873,9 +865,9 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		}
 
 		master->devs[pos].addr = ret;
-		p = even_parity(ret);
 		last_addr = ret;
-		ret |= (p << 7);
+
+		ret |= parity8(ret) ? 0 : BIT(7);
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
