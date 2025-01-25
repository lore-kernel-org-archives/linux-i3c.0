Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6305C0218C
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Jan 2025 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LBBTqw7yeJHEQOttpHlu/36QydCJLCOslLghh6x1PuM=; b=BwlPh5MNnPM0GU
	Nx2X/rjBlILN5+IoqWt21h0ONxvvTu9Z4wWDMKfhc55PjnYxaWmM/pjVZHzkSl9huuvkNUltTLUst
	PMqgP6lKd1ySb20Wxs/PqSadg4dzAgTP8CU+HLhmL7tbvKn7qWCs0zNJG1GxG9exuNbx+i3pJhHSV
	JfXwG1/SdS7P0++GhG/0n0olJsdhnZ4W4dvTx7EbhetH0z7oRvPOxeFpFh1vkvKTcspB3rHdj+CCl
	MPSwzIBcuo4dsVbwyXjRno1Lsg1VNWK4ekxK+StF7QFMpuilS/qpQ5/eizKxIUhcDMGUF/B0jjM4Q
	zif+bjNjOEs1yutdlADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbfoy-0000000GQ1S-2qDQ;
	Sat, 25 Jan 2025 13:03:32 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbfov-0000000GQ0N-3lVp
	for linux-i3c@lists.infradead.org;
	Sat, 25 Jan 2025 13:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=TratUz/3MHTxNF
	1MpSrxA2LIt3xvpiwcBbevQNMEFK8=; b=KIdxAVP9uXM1IaqhI7TGf6CEEgQtBA
	xCxPRtoMqX5pPsQTP12hbBcF4MtJHJKsCwILe2BN2hevK345wBYltrje1WeMY6sF
	NgzrCzo8MDUeb5tL0SjrAze9pFKMHloQNV1e/G5bsJhuNUFpVX99ratj0oVQ62c1
	u/+ko7OQhJmgpnTttnrtuAJAtExSLswmweWlR7p4P1+nkZey8fKVRI1CNd9Pikew
	UYvLX221F18kN44p7CnXdT+f0b2JDDzrkfZkAE6NR4Lop4miIgjUVODDidhwBw1E
	NEV9FydoAtHHl6Uwdu8ueqyGWePK9D5cH4fdaeHJ7jUMUxX4i0cYL2UA==
Received: (qmail 3876038 invoked from network); 25 Jan 2025 14:03:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 14:03:24 +0100
X-UD-Smtp-Session: l3s3148p1@chbrd4csppkujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] bitops: use safer link explaining the algorithm
Date: Sat, 25 Jan 2025 14:01:55 +0100
Message-ID: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_050330_206998_F1923AA6 
X-CRM114-Status: UNSURE (   9.54  )
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

During review, a concern was raised that the link explaining the
algorithm might get stale. Meanwhile, the site has been archived in the
WayBack machine. So, use their link which is hopefully more stable.

Fixes: c320592f3f2a ("bitops: add generic parity calculation for u8")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The original patch went upstream via I3C. Yury, do you want to take this
fixup or shall it also go via I3C?

 include/linux/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..dde4ad0034ae 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -254,7 +254,7 @@ static inline int parity8(u8 val)
 {
 	/*
 	 * One explanation of this algorithm:
-	 * https://funloop.org/codex/problem/parity/README.html
+	 * http://web.archive.org/web/20250105093316/https://funloop.org/codex/problem/parity/README.html
 	 */
 	val ^= val >> 4;
 	return (0x6996 >> (val & 0xf)) & 1;
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
