Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872CBC3DA64
	for <linux-i3c@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKtt5i7rIvUUgIZcFNREkSFP5a32YbyOBL1IeMS/a4A=; b=o5TWCZDZ/lZ9HA
	OlzbYv1U487KEthD9MXGvdZ1joX3dOEVGbt/NsIq+/e9icttGmkLBkxPefle1I9I/UUKnEV5opbro
	G4RlD+Jshqrhc5KFO48+P7Lsx0gEUDSpHXyD5l3kesbnIbJ+KavTTRWXO05wo5JV08bEtDOxynGcN
	mtYgHPiAZ9ZUXlZAFHEOB47zDqKUMOXPHmQwOzpAhH6W/CpWeED/h9K5+aRSf53xL7qgGIXAH1gIZ
	6tzDcZXd6ogEbfVqBvfBiHPP5Ejf5CNmgpagDwQHuzXr5lwLWha5soPQX4GJo0TPOI/Y70yHX3a7F
	ON/WygH+DnaeMyQhnHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saiQS-0000000DvXB-0iqA;
	Sun, 04 Aug 2024 21:06:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJjF-000000031aX-05e6
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 00:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D16E61345;
	Thu,  1 Aug 2024 00:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9EEC4AF0C;
	Thu,  1 Aug 2024 00:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722472296;
	bh=G7oC9KzKZ3u+aZnNGCnn8qE3ProuBDlrSs5M5tCVqK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5I8DXe0FlcalJ4cnUuM5J391vOtL4tmPQ8wEtL+nK4x4NZKWsVTpdRtM80q1sHdS
	 fhnglx1zlNB693+GqoOmHjVsVBeCMqME1IdR1S8oR2PGxBl85my5yV48Btb+bM1rI0
	 UYPfE5Uq0fVbvqLIIYCRaREpBGjFSG3X8+qDs7wCy3bQ/Klj431dd8Ie/yF9Vf5kbw
	 sT5qZQtRpjT37e5m/tXFJHQRRIG0sgdf0rkPUITBJJhdiW5lZ0UBHUBAGxUDS4/mMM
	 9JtL9SJzNiR+7wobNY7+UNApFtQcsM1MC825SpFJpRifJISZNK/o54Csu0rRnVIazJ
	 tfuTCEa2j+N/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	gustavoars@kernel.org,
	kees@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 61/61] i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
Date: Wed, 31 Jul 2024 20:26:19 -0400
Message-ID: <20240801002803.3935985-61-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_173137_173550_32FCC813 
X-CRM114-Status: GOOD (  10.61  )
X-Mailman-Approved-At: Sun, 04 Aug 2024 14:05:58 -0700
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

[ Upstream commit 8a2be2f1db268ec735419e53ef04ca039fc027dc ]

Definitely condition dma_get_cache_alignment * defined value > 256
during driver initialization is not reason to BUG_ON(). Turn that to
graceful error out with -EINVAL.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20240628131559.502822-3-jarkko.nikula@linux.intel.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 71b5dbe45c45c..a4b56d59a5a13 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -291,7 +291,10 @@ static int hci_dma_init(struct i3c_hci *hci)
 
 		rh->ibi_chunk_sz = dma_get_cache_alignment();
 		rh->ibi_chunk_sz *= IBI_CHUNK_CACHELINES;
-		BUG_ON(rh->ibi_chunk_sz > 256);
+		if (rh->ibi_chunk_sz > 256) {
+			ret = -EINVAL;
+			goto err_out;
+		}
 
 		ibi_status_ring_sz = rh->ibi_status_sz * rh->ibi_status_entries;
 		ibi_data_ring_sz = rh->ibi_chunk_sz * rh->ibi_chunks_total;
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
