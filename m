Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AACDCAC5A5
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UtA7SrZ9Dvvi87u/Q7KwEzMqO5tuzG2oOyYMPwwdWfE=; b=sIaYm5Im6J42yP
	9Ve4BiS6pnezNTh7FXg7a/E6HdyVm/k1EWuupL8w4YOrloiMmd//fF+OfwprRAkB3CkQ4NVq3JuW/
	uyJPHGD0oGLyWAyFyI7ZFvGKqhV5/eCy67CXi7M3ZlZde7f5LGOGDLbt3HWxuP43ZN+JAvq9HmSHf
	UOYdS8i3hVn3r01+3XuRBAMnx912l6mIXDkMjSQym6kvRqf5u8ufeO4fW8ZLPYln0I6iF/dceZP85
	HXYZVaT3uA8JzrwRpqmynZataJ07T25Yts5JwT29uMwZ/WsQwlY5mX5H0fui2j0Go7Je8e/L5ezn2
	g3UCtACqmvXIbercbxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R1S-000000011WA-2tP8;
	Wed, 24 Sep 2025 15:03:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R1Q-000000011Ua-3fnM
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 15:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16DA660191;
	Wed, 24 Sep 2025 15:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A9EC4CEE7;
	Wed, 24 Sep 2025 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758726187;
	bh=NHdaRaD3D0V/u38JlJWZFkww+I34dCOx77Sm+WqQ4E4=;
	h=From:To:Cc:Subject:Date:From;
	b=oqUjFlZ9Gv5Em/Ipd0DIbSyJNrIXgyjvqXFpcVeFsMHJP+hAPQGVdXyBnDJEQ2evu
	 jFEXm7AtkfUTpC6bLNBtY770dMIB+mFc2qqH54sJA1ESdf/292x688Ln1PYnCUJOhC
	 LbxRwAngvm4IoYZyYTwkJ8aVUCwW2N30xFYPMG3FR5Zh7x7AkiUh+eal5BeezD+uwT
	 2W51kiodc7aI/PuFTTbC/IxB7cKPU5CfyRTeth398J6pGJVVIXeUfu02sQ8EHsuCzz
	 FgMz0kHeo/LCtn/XQVRI01tbY9J8dAHQsYOsocyYk198KBDgBBk3qYZ3S5sX6BdDgF
	 iOEcIpMLQFRSg==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: fix big-endian FIFO transfers
Date: Wed, 24 Sep 2025 17:02:53 +0200
Message-Id: <20250924150303.3601429-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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
MMIO registers.

The earlier versions in the dw-i3c and i3c-master-cdns had a correct
implementation, but the generic version that was recently added broke it.

Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This was a recent regression, the version in 6.16 still works,
but 6.17-rc is broken.
---
 drivers/i3c/internals.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 0d857cc68cc5..0f8a25cb71e7 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -38,7 +38,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
 		u32 tmp = 0;
 
 		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
-		writel(tmp, addr);
+		writesl(addr, &buf, 1);
 	}
 }
 
@@ -55,7 +55,7 @@ static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
 	if (nbytes & 3) {
 		u32 tmp;
 
-		tmp = readl(addr);
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
