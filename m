Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9229CAC5AE
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YbetuBCVtCy4OtUmilHzYcijQIJv+5Ml3zdCmZE3btg=; b=wIo1AvMz7OPwc6
	7qNeb1b81xcJtsqL7WJuBFL+GiYZ7GghVPpowGGKHKW27vRi5VcOSdggRUiyxB6JOebQWL+wiws7b
	5gePf2Fi9f2MfvvCbIPPp39wyX1fIyhXKlN6pJTDdKx40unATRTmCaH5On0ikxgx0cCkBtCcu/RMa
	0PB7mIAaFefzzIdhiS85x62uOR3RXkv4z1AzPa2hcoTFXfi0GQYZFSeOuAlFNIOjN0J6ldjeqaSCO
	FKtyl32eIRy+fYg0s2n8oUhI30EC3WgmCe/5ObIorS0afCZHIV32kJwD70/zHG+kwbzs0IKQbJwu8
	I2PXp/wJXRlj1kTyuYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Vwq-00000003P8e-32X3;
	Wed, 24 Sep 2025 20:18:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Vwo-00000003P6i-3W94
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 20:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 054704041D;
	Wed, 24 Sep 2025 20:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15483C4CEE7;
	Wed, 24 Sep 2025 20:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758745121;
	bh=FVlJZ6+brrbtentTGI5KcPkX7kbX636lXkfIMMbwNLA=;
	h=From:To:Cc:Subject:Date:From;
	b=QtvjJ1lhF7NPqosw6SjTaINVd8X4ZZKsK4P17e/a4LdtseYZTvVFXYhs7FRhIzTq8
	 zvPsyhKlRj89oQB9IzTJHvpxAKGKmB4zyT4868ywcB+j7oDenHSAJGk7L5CDNT2e37
	 ilZhZ1DLwYDZXaFjAdNr6k8JFsDjuBt2pxE8ymekX4H45koFhnJ6ULYbn8v+lFRVSr
	 BjgFi7tqzThkST4KQjNDPK7S2WOfrlLhsTcXM8tlE7z4HPw/uo1i5t3EIP9TyTMkW/
	 X9koHX6Q7tm/C8GFJDInkn08dNZmp8iZVrn0FcJWlwfIoHw3pKfz+tUdHNAXP5C1Ig
	 Ha4NIIz4UWwaw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] i3c: fix big-endian FIFO transfers
Date: Wed, 24 Sep 2025 22:18:33 +0200
Message-Id: <20250924201837.3691486-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_131842_900220_911BF8EF 
X-CRM114-Status: GOOD (  14.91  )
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

From: Arnd Bergmann <arnd@arndb.de>

Short MMIO transfers that are not a multiple of four bytes in size need
a special case for the final bytes, however the existing implementation
is not endian-safe and introduces an incorrect byteswap on big-endian
kernels.

This usually does not cause problems because most systems are
little-endian and most transfers are multiple of four bytes long, but
still needs to be fixed to avoid the extra byteswap.

Change the special case for both i3c_writel_fifo() and i3c_readl_fifo()
to use non-byteswapping writesl() and readsl() with a single element
instead of the byteswapping writel()/readl() that are meant for individual
MMIO registers. As data is copied between a FIFO and a memory buffer,
the writesl()/readsl() loops are typically based on __raw_readl()/
__raw_writel(), resulting in the order of bytes in the FIFO to match
the order in the buffer, regardless of the CPU endianess.

The earlier versions in the dw-i3c and i3c-master-cdns had a correct
implementation, but the generic version that was recently added broke it.

Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This was a recent regression, the version in 6.16 still works,
but 6.17-rc is broken.

v2 changes:
 - add code comments
 - write correct data buffer
---
 drivers/i3c/internals.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 0d857cc68cc5..79ceaa5f5afd 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -38,7 +38,11 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
 		u32 tmp = 0;
 
 		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
-		writel(tmp, addr);
+		/*
+		 * writesl() instead of writel() to keep FIFO
+		 * byteorder on big-endian targets
+		 */
+		writesl(addr, &tmp, 1);
 	}
 }
 
@@ -55,7 +59,11 @@ static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
 	if (nbytes & 3) {
 		u32 tmp;
 
-		tmp = readl(addr);
+		/*
+		 * readsl() instead of readl() to keep FIFO
+		 * byteorder on big-endian targets
+		 */
+		readsl(addr, &tmp, 1);
 		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
 	}
 }
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
