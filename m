Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10FEE7718E
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Dec 2024 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpMb0X70At118EpLCzJtJYYog+UBBjXmjtG3olXfJVA=; b=JUrVb6nYylBsjY
	xi+INPdDUtjyMnTfbqNSTYx1v7+5Gi3n0ZPnEuE5GI/1x/ondKtt9Rucz3mFZR6hzHywJ1bDrqY1E
	DJ65FZOmY75uRwY2VqrtUlQXR+eJ+nkLQtqa7iMyfPQLG2rnelZl5N0S7XrQU5oRS8heiUynDR0eW
	f7l3TPyS5w4JdqUpKwJwACH/8ej2GrPF8wm7iFE5+RDAm9yDV6W8KLV/Vp8VF8on8FSjKDZQukyey
	roB8JyNQGWjmnZg8NxhndPYCZIxtCJrjSWaVzQiMVDbZb/EJYEzTaSU7EhCFTfVWfutqp2PDxjf5h
	n/ZyBhYGvoiX70N7j1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObGI-00000004myT-1zF2;
	Fri, 20 Dec 2024 11:33:42 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObGG-00000004mvW-1c8h
	for linux-i3c@lists.infradead.org;
	Fri, 20 Dec 2024 11:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rsDE8URaHTqtvoHB8Si3sxcYn73y38+s7yQFTYbHb2I=; b=EO5MSg
	yfoTmozbzfM4TSszr5SUnGJnfT+gYqAPQz9gKubm0iAh8efyTxEwJJMSqR25rk5C
	LFUdM0AdlVzSrV27Y5uFQZapXHcucaHNWZVDYJtFuwCf/2Y163Wu43ul5KIOd0DY
	GBWq/PROenKtq8uUpuwSfz1QUYnhXJ3NxR90D6+Vx2a1VVshNfdcwFWDBiSEZXky
	d2d1g+Lkw7eYyU+p6To8fF22etZxQZqsBrRJvAaN/lcNXtVze7jx1aVMVa0WNKie
	8u3ZEXcn7jp+N6HHKvVfymGUo/FhLPo3xi2HccTH05em5jyV+Uzthoz2BRohWauk
	FZVS9J6r8oKLlmSg==
Received: (qmail 991033 invoked from network); 20 Dec 2024 12:33:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:33:38 +0100
X-UD-Smtp-Session: l3s3148p1@C8CcBLIp1uIujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RFT RESEND 5/5] i3c: cdns: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:33:33 +0100
Message-Id: <20241220113335.17937-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
References: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033340_689292_EB41C867 
X-CRM114-Status: UNSURE (   8.43  )
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
