Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C3FE7718A
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Dec 2024 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwYuorfmgiIIGHRYCi0+SEqtiZ94QtRlY6On2mSAlnI=; b=bbzWh0O6M7IJ7V
	RoaXrdR7ESVNedNAJYN4FGwEpARd/cNhuM80pBRUhNbTcz+0yfK63PgPg/cZ/V1cP7fDN2Huba8LW
	k5Ij+XfAUvgwOIw1jokizNEjCD3+A15xVZx2hSUcfvJxZnQaGgl47uAagcLybM2pGniQFpdMexDVU
	AtMLrRuRUxTKLQ4GzGV80vVkVz+2yMlhgv3ZunlbMpgO7VsZXDOvYddYN8Q+k9+7jIOX+3yoqxxem
	JSNVHR8V6sBF0kWhIhlPsqRP1IzVWsXfH4CSpO4HS0ymuKrJwn4TEcJyssuhocNpGq99tJdjYqfBo
	aFBJlZ4SX8c3JPxGkCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObFg-00000004mmA-1GuH;
	Fri, 20 Dec 2024 11:33:04 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObD4-00000004mBH-2SMz
	for linux-i3c@lists.infradead.org;
	Fri, 20 Dec 2024 11:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=JTVYffu7bObqCnm7BryRbyhmBYXN9UAwW1f5OWePOno=; b=kwlhKM
	AN3DbBvDjh703OIGKen6f2vvMi0WWJR+pV3xIf5N3tjLc9GN9hrflnww6AKhLtR3
	tuhnlxFnb0DP2HEe/ikJMnYxuSCZNYnpEZiro5fm1+goDLf7Lqt8xypxv08XWBeD
	b1XMWwe/3ktGrHppyVnBW+MI0ysPYkJ43l68koEe2dJkHfqzV0d/hO93Rtsa3AaW
	GSWPE23CNwgiLT/F33nTB4oSTuuWRnr/PEJmFN+ZXjwfixpXwobiOi+RjVEDyGrL
	voVKiW2CXx1KRcO7AmEzxkqOScfV9Gr/xipmdPj9nQB3PLk7mWknVJQ+j7QzVrA2
	pKn7FyPtdx3tf85g==
Received: (qmail 989755 invoked from network); 20 Dec 2024 12:30:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:30:20 +0100
X-UD-Smtp-Session: l3s3148p1@NOjP+LEpDJ8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH RFT 3/5] i3c: dw: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:29:57 +0100
Message-Id: <20241220113000.17537-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033023_540560_D538EBD1 
X-CRM114-Status: UNSURE (   8.56  )
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
 drivers/i3c/master/dw-i3c-master.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d4b80eb8cecd..a6d7fade5007 100644
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
+		ret |= get_parity8(ret) ? 0 : BIT(7);
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
