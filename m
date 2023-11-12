Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A22DC4167B
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Nov 2023 09:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zCT5N9VhLOADiZ2EP4+mNbnq1MmOd5ljc82UHiKd1to=; b=G1ljTF2Xi+1iiq
	va1ifMB4qf7c2dxXykL4280HZbe0fpSPdY0kvq6p5t3DlHCXU5TwVQUFTo2t6qnV/PG2BYkbgBdMT
	trN4wXKRZTmrjlpE03E2t5khTdbameXJFF3+n9d2S8NNoixKSLL2iPtcYxMo4RPgMdnjr+PJWfeez
	f76ffHXc4dG3anwHhLzgwVDhvYNrDEPLryOxzWb20zYcDbbCJrLTI0WkP1iKl9ajVMZeVwn3OFT5e
	EM6aNSV5klvUZxvg4q1keTDIpIuhUSikn/kcOre1NnDY95y/IfPJRAiwYQl65P+oSwzN8Ha0JP0Kr
	dHzvAjiIeVM2Z6gRV4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2T1T-00DXir-0G;
	Mon, 13 Nov 2023 09:14:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ARK-00COuC-1e
	for linux-i3c@lists.infradead.org;
	Sun, 12 Nov 2023 13:23:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07DA260C42;
	Sun, 12 Nov 2023 13:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BAFC433C8;
	Sun, 12 Nov 2023 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795429;
	bh=KIXhWrqL7vDKt6zj9PJHDRT9sxGHrsKjJWVor0Hm6qc=;
	h=From:To:Cc:Subject:Date:From;
	b=qll+J0YfLGaoU3zjrsru17P7MgZnzp/Vc9PNnK58Gg80cbtQyG2KJeE9XTysI1M+i
	 4INfG9+nN9I/ujBZdijgyUUgpRUiG3OR2S2l/foOR0/dFRoS55KgW+urkx9USe9M9W
	 urPJpGxrHbZvOHKklM70h5abkWn5D0lYT60FPdw2xwDsSJ/nRXgQnZoYmpCgRcoq3E
	 N/QAUFkPy9k6V1QCzlI6LLrg2TICOK4PUu9QfEvhi6dWX4OyzZuIviSKFI5/CBfF3l
	 eRLEImF8fapff8Rp2m0kXJ2ltd3amc1sbAh2D/DlMB030dHbrRJ3BaYuBWQiHNTpGV
	 CxUplgMAHz/Bw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	gustavoars@kernel.org,
	keescook@chromium.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.5 1/7] i3c: mipi-i3c-hci: Fix out of bounds access in hci_dma_irq_handler
Date: Sun, 12 Nov 2023 08:23:33 -0500
Message-ID: <20231112132347.174334-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_052350_589840_DAD5025A 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 13 Nov 2023 01:14:21 -0800
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

[ Upstream commit 45a832f989e520095429589d5b01b0c65da9b574 ]

Do not loop over ring headers in hci_dma_irq_handler() that are not
allocated and enabled in hci_dma_init(). Otherwise out of bounds access
will occur from rings->headers[i] access when i >= number of allocated
ring headers.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20230921055704.1087277-5-jarkko.nikula@linux.intel.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 2990ac9eaade7..71b5dbe45c45c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -734,7 +734,7 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci, unsigned int mask)
 	unsigned int i;
 	bool handled = false;
 
-	for (i = 0; mask && i < 8; i++) {
+	for (i = 0; mask && i < rings->total; i++) {
 		struct hci_rh_data *rh;
 		u32 status;
 
-- 
2.42.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
