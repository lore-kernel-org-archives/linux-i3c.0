Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A62E77198
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Jan 2025 09:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTuP9yWLvgTX7AWXsr3gNvehLx4V/bwQi8Z2u3/J/IM=; b=Qt7w1KJDl2x34v
	vlt0xb7i+kRs14ckfqVX4yhgr2D0Id7PuQ7MPK2sPl9SieQFBWXqMg+byRN3aK5PPihk/hFXHVplk
	irFJfZ7HdDdUUiv8cMoiHr5mlRo6etf3wDQ/ScjSg/ePXHUj8c9w+6ijRVmt1t8GtGRxLkPsL9V0Q
	9Gv0rHRUL59Gonq6NjdxpP0QEXKf+L7+GJpgnH+le13hlLZ3x/yvJGxcN0iprMNohUhqNOYYh+dV6
	YKqWvCvJXA0pnV9MTcXmTjPmmEsNt9g/mSWk4fL+ms9W4B0o5c6kqpgFoF8hy2FDSSZxb/AbkA0PR
	dqRFele6OWQxhdZa4kkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjOd-00000000gJj-0kkX;
	Mon, 06 Jan 2025 09:27:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjOT-00000000gGp-3gm7
	for linux-i3c@lists.infradead.org;
	Mon, 06 Jan 2025 09:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/HzJlxcDzDQ4BvZyB5ZfxXV6i05giy4HK5Wtt3ukFzE=; b=aPPfy3
	5s/163j8j2uLyoDeGPLC6/Qykt2evG8W7DWBim4j7PNHuTry+M1/V7MtK92YE8vZ
	IBFDBjkvfrDIRCMfK5BdsdrxAUikwOPTGe216Fd7NEn7SA+eWBIthxc/k7tXdi6y
	gLDkOpXh+3OTqlCGPqpc85wqIoP2t4mssLk1v4ADAEMihgg6IQcm6d7cAcSs+hli
	5RLnOcLisX4q/h3BrDcbX9/E+C8LpAvYBgq3ptffVnJLv9gN5wSZFnLTX8RNySYY
	IhUk3CRQPXSbdInv7GrreMONlnIWBlfLDUlDPQM1BATTV2mzSalkGdSZbuOb5hX9
	2hxcFp6C/PtNxf+w==
Received: (qmail 1727803 invoked from network); 6 Jan 2025 10:27:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jan 2025 10:27:26 +0100
X-UD-Smtp-Session: l3s3148p1@HqGXPAYr2psgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yury Norov <yury.norov@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v3 1/5] bitops: add generic parity calculation for u8
Date: Mon,  6 Jan 2025 10:27:19 +0100
Message-ID: <20250106092725.22869-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
References: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_012730_797027_EE4F12D5 
X-CRM114-Status: GOOD (  15.90  )
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
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
