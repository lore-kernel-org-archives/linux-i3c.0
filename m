Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42322C87FCF
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Aug 2025 04:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WSGMUdOKQfKmfmne8fl3m8cAjVHQG6iVbJ35O04YxkM=; b=Huj+MV4lE6Ytiq
	xnad4IZjJVlmh99XF9Jkg3yrFG5gjRJ8xwT6rDhITbCYLuwqiIrYozz+XadOiktzQ+grAIbwvfZpq
	ZXIkCaviIXjcv2q7+DqKbg/XHa2qkEp+1bxYvyJPWyuT+mJlz4kL6WtZPlGXWKVlm6Zuax7G9Q+bh
	fjnN+gFiOdd7yGV3KZuBejr175owf8ZdYE4qB7x+CjYVFwJFz3t8bI5lkdLpJPkDWoztKXxnG5KeT
	wcC57ydvfF9YDop8q3mkqZ3lSnQQH485Qjsj0986yUUni/B+h+wMWKmSIb1E7A0TvAT/vJEQ6xY6e
	gFZFlA6f9l+LV/OzKnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujsLV-0000000HFtr-3CUm;
	Thu, 07 Aug 2025 04:35:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujsLR-0000000HFtR-2YWr
	for linux-i3c@lists.infradead.org;
	Thu, 07 Aug 2025 04:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=0yf9/75yWMvaF+
	FT4siLA18REESy0OotmaTC98XCF2M=; b=XuYMH1/L1ctO1lRYQE7KsHhBBHv24E
	wqZ/WksfNboaqqM8FofSbNSFp4ijoUfiDQLdpIGFIf6lnbrK/bwRT9GoHms4M1e8
	DrzCDIm9nwFMOByxjJKqJ4nTkulORllCr/T59SvFegJv57JiYZ28Ws/lhPPiUzC/
	LAkTA5HYl13ySRf7OlxibcEf9T6lYMMAhJgp6OdBJlIYSU/F2RmwVi1H05PyV2ka
	uWe+JDbtbRbHrUQQKPbPB3uQ0Wa0s+Ird86RakBlNtoDIW6W2pgxg0qR3OKw1lma
	R1aT0bEF6ghp/XcDefidtURYq8bLjRNgxpJNUi72OrRtsWUJzglMdykA==
Received: (qmail 1017297 invoked from network); 7 Aug 2025 06:35:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2025 06:35:07 +0200
X-UD-Smtp-Session: l3s3148p1@YGdW+747RKQujnuY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	kernel test robot <lkp@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: remove 'const' from FIFO helpers
Date: Thu,  7 Aug 2025 06:31:24 +0200
Message-ID: <20250807043456.1624-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_213514_523621_F33DB9BE 
X-CRM114-Status: UNSURE (   9.53  )
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

As buildbot reports, some architectures do not want const pointers.

Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508070438.TZZA3f2S-lkp@intel.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I still wonder why SPARC discards the const but since nobody seems to be
commenting on that, I guess the fastest way to get the build error out
of Linus' tree is to adapt the usage in I3C.

 drivers/i3c/internals.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 0d857cc68cc5..2b0b9c3a9131 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -30,8 +30,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
  * @buf: Pointer to the data bytes to write
  * @nbytes: Number of bytes to write
  */
-static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
-				   int nbytes)
+static inline void i3c_writel_fifo(void __iomem *addr, void *buf, int nbytes)
 {
 	writesl(addr, buf, nbytes / 4);
 	if (nbytes & 3) {
@@ -48,8 +47,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
  * @buf: Pointer to the buffer to store read bytes
  * @nbytes: Number of bytes to read
  */
-static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
-				  int nbytes)
+static inline void i3c_readl_fifo(void __iomem *addr, void *buf, int nbytes)
 {
 	readsl(addr, buf, nbytes / 4);
 	if (nbytes & 3) {
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
