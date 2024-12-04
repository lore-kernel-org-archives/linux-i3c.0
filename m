Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA864E7716E
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Dec 2024 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8Hh/ZxlghNFOdyWr2Qx40F7lfuy19FluYjn0mwGBNY=; b=KlmXcVcaM7DMfz
	9pWHS5s72I4DXli69s5ttNgu85lb3lqB5ab1SKTJ/2hr53i5+mOQQzSEYudpWXqvqbiU79mtcdKGp
	XRnZkFyLTeZcp1a8GhRZ8PkNcSGR1rIGzkBSEMBTKYwHQmnN3uJKDd9ETTqr4fUWn2cS/GVqQkHTk
	eLYX8eNjSaZqx6YJBc7F1xULBzpPP54llhu22ZANKg6gSIpzep2HQnog5u8CJSzM1gePkI8L0WhJn
	6sjOxVn6X0STvIvnjGI8EdNP1u1tLpF+Dsqcy6GPLg3IhNuyS550yo0M2zNj02jKH44rBHELgrwnO
	sORsh89GtIgMEcikKXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJExx-0000000GnNl-1uSh;
	Thu, 05 Dec 2024 16:44:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsv3-0000000DJ1j-2Ozb
	for linux-i3c@lists.infradead.org;
	Wed, 04 Dec 2024 17:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0B73A40AD9;
	Wed,  4 Dec 2024 17:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EC2C4CECD;
	Wed,  4 Dec 2024 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733332328;
	bh=W/y8zXZkHB6ZxAKXAe+UMRSHimjoR/7RwfdqEpMrYMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FvXW7W+zgSylR/P9XrIDXCtKWEzmmT5NWD0UPj6IzY2SYzIbYbAAEvIbGvpl2Hgt7
	 W+PWqLwQIav469XCsj/2TFM2Tut3H+ddii77IvY19fH+y+nI/zdu5RjnXzRgW8br91
	 h3ZGtPeJUnnGCXLwvScnSQ6QUDvRnqreOIRTX2IhQQSFtsUu7z06V91IdJNoB/rydI
	 4XHbNo/Z/yffzLMA3/alaH+eLDpkWfBv6d2ScW4GVyL3uU3gjPDod+AWOhifANGgQc
	 glnVRQbbsTXJ8DfsaeZzbyeNvg9qCk3FdNsQsiAQP6HRxX4TwYdQ4sos7PpHDGcTIZ
	 Ld7rrGR/Jh75Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 03/13] i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
Date: Wed,  4 Dec 2024 11:00:28 -0500
Message-ID: <20241204160044.2216380-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204160044.2216380-1-sashal@kernel.org>
References: <20241204160044.2216380-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_091209_665964_2E9C1E59 
X-CRM114-Status: GOOD (  12.03  )
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
index a918e96b21fdd..13adc58400942 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -159,10 +159,10 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
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
