Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9CCC52D72
	for <linux-i3c@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWW5JWiynK+3WofKOlLoqkX6elCHjTpRy4OnGRSTDsk=; b=K+Nof4pSIvRnvI
	aYDAx8SF/sz4WSkNWulXfohPDx1GyzLTCWK93k8jRpzAvQ6/D32Q9xK48lle/FOvJQ3bJbgRI9j/I
	KhUO00hI/vWBRDHM4/zD2fNMqQ4diRkQBEzOUa+PVI8jJoaOVmHokMnvNFgU/HA6HNctlhnoyIZcQ
	XwZ6agVpPJSqXGFxC9hOWp3CQRPiTCHhNVVlYQqmpMhUFatrVQJeauClH9bl1WffyltQS7ZwIGxN0
	nN7pak65c2vhB5cKDFZWyJ4aVWfoIKb5Jd3DuM+/We0WTFEipl3ayBLFT1BJqsWsrQ5QCmN1dMA7M
	ECM5NQe5pJiupd4On4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saiQS-0000000DvXX-2GXR;
	Sun, 04 Aug 2024 21:06:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJnD-000000032vO-47yS
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 00:35:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 620A26246A;
	Thu,  1 Aug 2024 00:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F976C4AF10;
	Thu,  1 Aug 2024 00:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722472543;
	bh=iT35glO44uBzpr8ozZp9u0xNHMswLi8eMbjs4xo50MI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhM345aO4AyO9IpNfXyFmxNDiARoalZyQJ/VohLFSOQQdJIcdVducDNHf2n8pWlNa
	 3sjEcYRDHRnuBLzou2LNy6lCB7vKDUGyDKmXE0txZlWHPRPdM6EqytYFc9DSWauu/K
	 iF/ACJAGdDl2pFssbFSK/03bt8kA/OYCcgbKlM/mEly2TggQIQbLxslrgz/WZmlx7R
	 lDvuUKwwbFyfOuDizljlzUL7jhs6XYre67jVaxzVFeXruaT5Guv18Avrtm9QfBaauZ
	 Cb1rK/t+eDAxdurQBxb9V/LLlBJzUgDmTW1+9KQ+xq/3g1LOx05/XuU0Dbpqp+n3FV
	 iERWXGWsn8++Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 47/47] i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
Date: Wed, 31 Jul 2024 20:31:37 -0400
Message-ID: <20240801003256.3937416-47-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801003256.3937416-1-sashal@kernel.org>
References: <20240801003256.3937416-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_173544_101175_F938E7BC 
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
index dd2dc00399600..9df01c15384a5 100644
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
