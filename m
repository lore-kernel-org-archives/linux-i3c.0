Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F098E7718D
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Dec 2024 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpMb0X70At118EpLCzJtJYYog+UBBjXmjtG3olXfJVA=; b=ijFD+UkVGvmUn0
	cZFc+TTeCJ/zkssfqUE5pizOonxeSPCZ9R39dPaW0Hp9M4OFkt6zVfZu4o2E/c/Is6neK5FOtQKoP
	s6c2kcTwXJMz1f3NldNPAlyMHlRI9lE+yJOPN171eHPxwFyQpZ8SRLFuELGf8zeR6Ag+GFm9z+A1a
	0sZIA4kRGRWslBflb0esE0SGcONriIeSDiwF1BOek3p5n+JhbxSM/lQXFW6dimXQXfYgS1/vmC3QX
	D1/Sb40T5C5sdDG6Gzuag4tRRAH85QdeSi8AJIHBIhUd+CExzE7IkuRWbl6dY7XfUOCy6rFw7PDw2
	0sT6xEF53aj1ECtgXwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObFg-00000004mmd-4BRn;
	Fri, 20 Dec 2024 11:33:05 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObD5-00000004mBc-381J
	for linux-i3c@lists.infradead.org;
	Fri, 20 Dec 2024 11:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rsDE8URaHTqtvoHB8Si3sxcYn73y38+s7yQFTYbHb2I=; b=Rfb4po
	HgqpyesKVuDDivS2ZFzUzRwZK7+gL8A5R6A6xlwpQ6wO5eid5OpOVKmeuteAdAl3
	Sg9fLQ+khYWj8Q3wWPByxRFDBN5B3Npg7pAo+KTFkxgjFY5fmJXfXx72bPPVG/Kg
	T+d8/T4ORf2/PtY+mNYgA2oHQ38RpqjBxrBT03witTgpNw4y2xJRENMuDv5Wky3E
	spD/IaJAr/j0iLFYkle6O7IVQiJJIFcYL+Etv/YZEhREjqjTEq4ktJ8p3LgphRkJ
	2WY4UP07xLe/3PG9Dkdx7rTNxaOm6ROoB5wJK80/exqzLJsWfFU4JHXKvW+uOYPh
	iIO6DsADxkxy5T3g==
Received: (qmail 989817 invoked from network); 20 Dec 2024 12:30:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:30:22 +0100
X-UD-Smtp-Session: l3s3148p1@I5Pi+LEpFp8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH RFT 5/5] i3c: cdns: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:29:59 +0100
Message-Id: <20241220113000.17537-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033024_058430_A84BF4D8 
X-CRM114-Status: UNSURE (   8.33  )
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

Can't the '& 0x7f' be left out here?

 drivers/i3c/master/i3c-master-cdns.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 06c0592487d3..abeef6f70b53 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -889,8 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
 	ret |= (addr & GENMASK(9, 7)) << 6;
 
 	/* RR0[0] = ~XOR(addr[6:0]) */
-	if (!(hweight8(addr & 0x7f) & 1))
-		ret |= 1;
+	ret |= get_parity8(addr & 0x7f) ? 0 : BIT(0);
 
 	return ret;
 }
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
