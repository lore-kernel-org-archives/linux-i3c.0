Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75553E7717F
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Dec 2024 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYrafD9GrsOIUDh3BVxZypBoRIGpywV2Pl+Sl9HQzCw=; b=ZTiDpzecp+I3Pl
	nZdWLXGYg/8RuX9dzeQQiId7RQibiEwV5cgSgZbUybz8yZ+tdG5cHuvyaE2Nx8wv9pxtoCUwvHzSw
	VRywFKxuh+wxtxiER/GyMYtWRHRQXgjIHXKiQb5JJ+ASy1U1N8dWHVZVetGK57mGEBF4pxezTpM3T
	16qZDlOnFGFJkHD/cs0eW6Lmc38OcRMosjUzkLCwvJqnasv5F7xzQ2gYKPOBVQ4qTSBBdIF9qEOfF
	HfTXsDYE3yIjUfF3ri3yepnbavMy93VZk6qmwB89In2/rjnLV/VmZW/yhteH+tPD2XGKL4BLW0jpf
	C6FG7wzFddymWAwWm2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJExz-0000000GnPV-0vtg;
	Thu, 05 Dec 2024 16:44:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIswF-0000000DJIw-45Wa
	for linux-i3c@lists.infradead.org;
	Wed, 04 Dec 2024 17:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B3755C6FBA;
	Wed,  4 Dec 2024 17:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD18C4CECD;
	Wed,  4 Dec 2024 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733332403;
	bh=HcMhPImvTT4zfizAJqvG20GxrdA+50plVMVe8cC05KE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8HA1Zt712gJo2q8XgmURCL8WJjz6Momgdrbpl9VBwyg/Xas1SWwjPcEufGuxVsxZ
	 hwasvy9mEcCV2RnObSXyAMZUm8mSudH9L8aW8h3CrcWDB/7q7OzKdEMOcAi7899dVB
	 5G3ZFEhaPA8H6TU1ex87SrRL5/mCi1HyX5STIK+dSRQcw0hewP0KuPbkLR8yB9bnxC
	 j/yS/ic8zlQlUBjzTZX3ARsKGCqBhdCIaTkg2cH+wUK9Zp/r1JaMmHNQw92miYrU4r
	 fouUkfUlSRc/UfPVji3zeY1kGB1/je/X6N9vcA1LApMD+QNzPUhIZPcM6P1W9rW6zv
	 pU2QmM4MQtZ7Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 2/6] i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
Date: Wed,  4 Dec 2024 11:01:52 -0500
Message-ID: <20241204160200.2217169-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204160200.2217169-1-sashal@kernel.org>
References: <20241204160200.2217169-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_091324_054530_75252754 
X-CRM114-Status: GOOD (  12.11  )
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
index b9b6be1864384..61a5abac50dc0 100644
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
