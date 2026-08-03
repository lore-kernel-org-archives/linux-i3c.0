Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14734C55179
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Aug 2026 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9CUkZb3z3/cF/RnKB2uGpjC2m6hF/tPKrrGlte/HtMs=; b=1kGNRdXXnmQ9jr
	HnQ+lu8ALqF+PdxhNXcz5nl/jXKBBjIcprEV9F++HqtRR/hLOA6PY1+ceQf2CH4QXJ77EDgsgxEOs
	4MBKuwnyFlvCLvzEa1vT4phX2N6RX3Z6yq4gqDGBllihP7P7Cz+oiewauI7nCqrO+APNErCbD+NG/
	8yL02RFH9QvHIfuXW3trxAWXHph8A9UxbHA5/PoHQYc3ALO+TR9Qaehoay4L9+cPwJOVf2OBYG3Jn
	EzAgD0dCnB3gOb4/DUQgVBDHcEv0T/aqdPj6dAWsGoxOJceuxl74sdYUQ4XmV0KYjlt9CC12/hKuP
	Z7Xkr9qrlSvGwbdAOKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtYy-0000000HNp8-3GUK;
	Mon, 03 Aug 2026 14:22:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtYw-0000000HNoX-3KNH
	for linux-i3c@lists.infradead.org;
	Mon, 03 Aug 2026 14:22:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3659B40103;
	Mon,  3 Aug 2026 14:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFD21F00A3A;
	Mon,  3 Aug 2026 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766962;
	bh=pqY1kCT9TX+fI7i2pqzn2wIK+Qoo1xsDXopsMjOyRy4=;
	h=From:To:Cc:Subject:Date;
	b=F8KvxNj+9gcBoeuLgHcBNEOovAJ12JnZjW2SsVvQHx7uEDH8s2iuDHZz5dyk6z/ot
	 B9zAesF23Qcv9mOU7YvKeJ8JcYQHWpa/4P2kk/nztx9/odmKCmvfFTLjoVouGlUZt/
	 1OnLNkyERMSALElJMq6lyshHJUp+Blkyj83LMecnDDgAHmRcZVuh04s7opn1yFW4/S
	 4ASa7oOin4sGWUJdUqadkCJpr6N2w/mCo1Rq4lX+lnPHylbuKsINn0Rxb9VNm6BER9
	 AVpl23aPBaKveAVAdTop7F/hHjaIEYX0ieCyu+do+37arkEWj2NH8X8Ww5WgfSt9/1
	 xaBzWH8wpfytw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: dw: reduce do_daa time if there's no client
Date: Mon,  3 Aug 2026 22:03:07 +0800
Message-ID: <20260803140307.12665-1-jszhang@kernel.org>
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

If there's no client, wait for completion will timeout, then there's no
need to add i3c dev at all. This can save boot time by ~6s if there's
no client connected to the i3c interface.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 0625587f1527..18ebf304029a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -885,8 +885,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		      COMMAND_PORT_ROC;
 
 	dw_i3c_master_enqueue_xfer(master, xfer);
-	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
+	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT)) {
 		dw_i3c_master_dequeue_xfer(master, xfer);
+		goto rpm_out;
+	}
 
 	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
 	newdevs &= ~olddevs;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
