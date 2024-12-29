Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2593E77193
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Dec 2024 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPfFECQloniS05rx1wr+ic2DNBmg+S+oqqoxsV2c5jY=; b=1CC906p/cRt7hE
	kFihjjM0NMQs4kich8sUvVc/AKnqpuIAMkLTcYOky60a7ukcX/BI9HP2wz9wor5C7b2dASJVu6qWI
	xGiSsYMpPlkw9gxEWrrARWEO3Tg/gjbK4z8dLw44j+roajTVzZfJcay4s85Mpf1HY+9FFExXQdAne
	aRtbWBg6m2b0WU24O4JZnyQRDYAABQPIFwMRqDS46elSExkY5nAlNs8xRzyAq0NMoN6AYcoP380ze
	ZspGRgzk6SOL3QSjzDOraeieIsWzK+VMoozr5xYjE70HZNNAIihKbC2UIP2fcXocVyS/vmbokRzgH
	09IMvvf/aJxHBGnihMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqKv-00000003FQk-2WHJ;
	Sun, 29 Dec 2024 10:15:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqHq-00000003EoN-314u
	for linux-i3c@lists.infradead.org;
	Sun, 29 Dec 2024 10:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=plWvPVApWRSIQ2OhiRlGaz0MEdpViJLDsoLZ/6lDlDA=; b=dijRjo
	ADdThNVTeq3XMcZlByKGXwrUpaKcK4vencvoye8hwie4arvk6Yi5b2AtUjpo9Q+T
	0070rb8XEYsy1mx+5EMMtMzhHFKVF8dfJQlTqh4p8S1w+IDDKyz3J6a0g8Uk7WEf
	qmkVK5ebgrZhBhalI68fBxs1hw4/fJp9H+o27AUiF1aCA2rOrQxhZEJ31WZGZRG9
	P3uoBNZcaYAzrp1bMRzrcMAfSGl4MPcK1qoHEuKUiXFSllf+CKJB7J5BesJ6lsIE
	Me9IV4OWNsVjDoLex9+u+IKvaEBUIiuEyJJ7DRGxCYQ5WNSAa27/ovtC6m6Z+yYI
	1GYe0d/HUwLdy/Cg==
Received: (qmail 3656632 invoked from network); 29 Dec 2024 11:12:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:36 +0100
X-UD-Smtp-Session: l3s3148p1@T5td72UqgrEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yury Norov <yury.norov@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH RFT v2 1/5] bitops: add generic parity calculation for u8
Date: Sun, 29 Dec 2024 11:12:29 +0100
Message-Id: <20241229101234.2896-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_021243_675344_07721349 
X-CRM114-Status: GOOD (  15.68  )
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

There are multiple open coded implementations for getting the parity of
a byte in the kernel, even using different approaches. Take the pretty
efficient version from SPD5118 driver and make it generally available by
putting it into the bitops header. As long as there is just one parity
calculation helper, the creation of a distinct 'parity.h' header was
discarded. Also, the usage of hweight8() for architectures having a
popcnt instruction is postponed until a use case within hot paths is
desired. The motivation for this patch is the frequent use of odd parity
in the I3C specification and to simplify drivers there.

Changes compared to the original SPD5118 version are the addition of
kernel documentation, switching the return type from bool to int, and
renaming the argument of the function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Yury Norov <yury.norov@gmail.com>
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* use XOR instead of OR in the kdoc example (Thanks, Rasmus, for both)
* rebased to 6.13-rc4

 include/linux/bitops.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index ba35bbf07798..c1cb53cf2f0f 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -229,6 +229,37 @@ static inline int get_count_order_long(unsigned long l)
 	return (int)fls_long(--l);
 }
 
+/**
+ * parity8 - get the parity of an u8 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u8 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ *
+ * Note: This function informs you about the current parity. Example to bail
+ * out when parity is odd:
+ *
+ *	if (parity8(val) == 1)
+ *		return -EBADMSG;
+ *
+ * If you need to calculate a parity bit, you need to draw the conclusion from
+ * this result yourself. Example to enforce odd parity, parity bit is bit 7:
+ *
+ *	if (parity8(val) == 0)
+ *		val ^= BIT(7);
+ */
+static inline int parity8(u8 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
