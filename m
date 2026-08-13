Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F9C5B572
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Aug 2026 05:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0CE7PsjXOyR2b0R+PYvbP7Ewv+lgxT7BdJ7s1s1L/00=; b=KgQ86EvQUNtCb9
	X2PE30ujkx3NcVz1LQoOaOVh7fvXaOBgKvI7OEDn3KHbMbkbzOiYH/uP5nZsPS0bn6GdtEt20NpD/
	E1XST9E55c9vlqw80xmwMR3oHDS6KiG5NYfOpXVDeh9LqiSJZKTqP4SZ2yYZ5qeFKl6zmeHFJ2yBr
	uahesCXG+iZIxNNWjbZGwtkPhia2u2QQz5RiHzLJvhNUc8MNDcxs2BOHsdzC47YYQuA9Y/bgTbBRX
	dNgCeZPwb32BWliGUj3+caFiiirir0KigLwk5+cCooDd1JBMnY8wnefzwLg5j1p6XLhnAgstJYomM
	4ND2rodstKXcdGHlS0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNdQ-0000000HO7B-1mnK;
	Thu, 13 Aug 2026 05:05:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNdP-0000000HO75-1bL8
	for linux-i3c@lists.infradead.org;
	Thu, 13 Aug 2026 05:05:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86D44600AD;
	Thu, 13 Aug 2026 05:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E630D1F000E9;
	Thu, 13 Aug 2026 05:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786597542;
	bh=Ps6/ci+cq+PKzEV2brTSXS6AyskmWKbrUcBP3yQT10A=;
	h=From:To:Cc:Subject:Date;
	b=J23JxRXZGEu5w9jfG4HHv4EFB+whQ2ZqrSMZKHdMP5VfJ7dj+UlUqaCMOCq8rSARq
	 NYsV2l9RkVcNVudHpJwlWwRhOuF9717rBbfVxXNKyK1E2wyNzeHKTvKjMzxzLqt6sK
	 sgKacrly9vMsbO9/9yoEEEcNUrk43CyvaYAIi5IAz99Z9gcw/guXZnRYt0bhYtvXdO
	 I1zNgPlFc5fezW12vOnMoQlkZbU4XzPcTKn7Fo3GAQpPlkILfo48C+Pi7hcBZACwVB
	 9pZgc1MnaTIAV48/FDG6u3BkZ0R1lc9BxwKmmXQP1eNdssFrh9f7ZOaCgqniHjTjcp
	 IhRSPLmtHSx7g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: dw: make struct dw_i3c_cmd smaller
Date: Thu, 13 Aug 2026 12:46:03 +0800
Message-ID: <20260813044603.22425-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The dw_i3c_cmd is dynamically allocated, make it smaller. For example
on 64bit platforms, we reduce the size from 48 bytes to 32 bytes.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 6ba84a97765f..d6f84f0f4c2d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -247,10 +247,10 @@ struct dw_i3c_cmd {
 	u32 cmd_lo;
 	u32 cmd_hi;
 	u16 tx_len;
-	const void *tx_buf;
 	u16 rx_len;
-	void *rx_buf;
 	u8 error;
+	const void *tx_buf;
+	void *rx_buf;
 };
 
 struct dw_i3c_xfer {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
