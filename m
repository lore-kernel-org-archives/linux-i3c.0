Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F16E7717A
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Dec 2024 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+h4q/gYvR93qIWsHAa4TiyyOgxt/zM65SLpuy3VKZE=; b=mLHGwB1CxBL31u
	t1mtn8z8DA6Gg7YS7kkmH/0BkYBaTo5GcgvVLiR0r7v/Q/bnjSo7BQuojeH4j4KeY4hDg88rByO3K
	G/s2QnCHDokPWf5V9tiF77VB2K0Fw8inGixCN0lhua6aNN7i5BOOfTAdxJg6tE9b6mL7SpBq466nf
	QJV7RVVzNNOiHaS5yxw4+dsd4JyQJn9S+xm78jjEJl+1vZ3pOTPoTE0H811REYvrxBXdUYl0UAZC7
	0PmqxY65BDVFWQCANAKV4fBQdRjOLKey9+AX+zBErNnRktGRhOoFls+Bi+B6VT5DX3g2//B0dJIIB
	xxpPewrgHeDeLGQ5RQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJExy-0000000GnOH-05qw;
	Thu, 05 Dec 2024 16:44:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsvY-0000000DJ6J-0I4D
	for linux-i3c@lists.infradead.org;
	Wed, 04 Dec 2024 17:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A67E45C4BBE;
	Wed,  4 Dec 2024 17:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881DBC4CECD;
	Wed,  4 Dec 2024 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733332359;
	bh=+X9biTYdLqrN3HM1KDhzN5t9z9vfwvlhW1FN3fQOejA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhtljgzqIshQE6XxTq1lbxxK3TMOJaSXTaFkm6/f2swWdQkOXOkCKbSBuM3tMA9/L
	 TzJ7ZrAJEXCedkKe5QLTolKXZ1TblD6GdC1hyLg6o8GerI2raKHd/60hKJ8UaLD5+4
	 C7gB+QjTgZ1HgJqP4xfdF8KXkPLg9EjtgRNqXg2Qy/4Gf2zttmqTIAz/WfOLCkRnnK
	 QwO/qVNoszhYBPTRPShemZ03j4xPB2zxzqgg7/lVpjSXAqI6v/KScD9WT5ic6aCVd9
	 Jxn4hL1XlH7vs/DUoKPKb+W+6ttEB2P2ViHRfhsMmKClctVq3rzJAAXVt7++I9EZg/
	 cxtiDWaTxPIFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 03/12] i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
Date: Wed,  4 Dec 2024 11:01:00 -0500
Message-ID: <20241204160115.2216718-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204160115.2216718-1-sashal@kernel.org>
References: <20241204160115.2216718-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_091240_148923_2D32B4D6 
X-CRM114-Status: GOOD (  12.31  )
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:44:11 -0800
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

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

[ Upstream commit 6ca2738174e4ee44edb2ab2d86ce74f015a0cc32 ]

Bus cleanup path in DMA mode may trigger a RING_OP_STAT interrupt when
the ring is being stopped. Depending on timing between ring stop request
completion, interrupt handler removal and code execution this may lead
to a NULL pointer dereference in hci_dma_irq_handler() if it gets to run
after the io_data pointer is set to NULL in hci_dma_cleanup().

Prevent this my masking the ring interrupts before ring stop request.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20240920144432.62370-2-jarkko.nikula@linux.intel.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index edc3a69bfe31f..bcc0c7d4131f2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -174,10 +174,10 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 	for (i = 0; i < rings->total; i++) {
 		rh = &rings->headers[i];
 
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
 		rh_reg_write(RING_CONTROL, 0);
 		rh_reg_write(CR_SETUP, 0);
 		rh_reg_write(IBI_SETUP, 0);
-		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
 
 		if (rh->xfer)
 			dma_free_coherent(&hci->master.dev,
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
