Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF20E77195
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Dec 2024 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXsSIsgWSK64Somm1sUqiRjZXrenrjfp18sttfb2SnY=; b=RWZaBwWi5y045B
	qZ6AGX+QTEhSGiVAdl+DCdlNd28qQl9ysBVqUGlNE0Fulo48O1ZMOGFp/TydbMrayex54OSbf01Iy
	QsRdxelK6FUWtq3Rq5ewkB3iswKG+hTYxLpO8/aCMjEMgxuImh9svMyzmiC9bp2KQ6Pd1tROY4OM+
	LCGHCHAoFj+UDPp2Ms8ZFO/yNapGohexDrJtUUFzjcY8Wb/FvoH2m+ILV76agjC3H58lsB9SCaAUD
	g5VPuFfzojwaqisyW3E3SsE4KBC/IOmhmz6xHeeA7IQ2omHFCW93eRVRVevoFJYjGOexEC20nDr3C
	FJ7/L+oAcb4zBJVHTxtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqKv-00000003FRQ-3wi3;
	Sun, 29 Dec 2024 10:15:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqHv-00000003Eqd-3i0r
	for linux-i3c@lists.infradead.org;
	Sun, 29 Dec 2024 10:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2KA7hCNfCHGJ3bQ72rfcY2S2+sqyqP8iXHnm5KhmB1w=; b=j+NbuK
	nHFFnXj2Buk7ny77kDCnyJr4CiJIVLlIJTJECcVPJx3yxjP9uqYymNSEWjgMvHZ9
	wfSRch8zu9CDPWWyFbo6eSZdJ8s3no+8RNMGYMCsjO7nBDA6nw2fZJt/6c1hqDWR
	L/oPBkXlLCH/8z6So+iyDcukcmqW4ZxEUvOfedJHnVfpqurlKgJb2+6mb936azst
	shgdQOyhlJJ74qx76hVu4eF5YWA6W70eSxCdv4fNg3cDOrzYiEkJ+oRIL2WAWp4h
	1cRxW59DjtuaBB0PnhjYBBgQN1IItAZAOIewsgXNFCxCTJDKFGz+DqjIxMwSCtdv
	nAL71FubWrdxWwrA==
Received: (qmail 3656777 invoked from network); 29 Dec 2024 11:12:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:38 +0100
X-UD-Smtp-Session: l3s3148p1@e8CD72Uqle8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of open coding it
Date: Sun, 29 Dec 2024 11:12:33 +0100
Message-Id: <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_021248_198789_DAC0B0B2 
X-CRM114-Status: UNSURE (   9.21  )
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

 drivers/i3c/master/i3c-master-cdns.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 06c0592487d3..fedbe6624a1c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -889,8 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
 	ret |= (addr & GENMASK(9, 7)) << 6;
 
 	/* RR0[0] = ~XOR(addr[6:0]) */
-	if (!(hweight8(addr & 0x7f) & 1))
-		ret |= 1;
+	ret |= parity8(addr & 0x7f) ? 0 : BIT(0);
 
 	return ret;
 }
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
