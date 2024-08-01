Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493E6C3DA7F
	for <linux-i3c@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skZ1MZoeuHGHiv25PO0rZcW3yUBSPWsgWRTxAy8Y4Sc=; b=TerEBYLGYiS4Rj
	8llSe2sL4vTwDw5M9vUDVZALnHHXt+p+IfjieGAumZUuUnwAo6HGDLN9WB+tugbkmC5PKKqL3TM9P
	80Ue1kUhplHpKjB+AXQh4FUhynXHWjKDdJw15LODaH7o1zhSuhAS6yy3eUesZ+Z0PIQv9FRL5wPnN
	ZObzd9AixbEjEs0x00HqHtXss4X+jwyJbo04Z+GpTudkvF8EG68PkZ4zVTKHoRun1oezX9K8Eq9nm
	XMMt4DjenbE2ApQDB0vnGtWnH/p3+5+X1CotnMik/6ur1Kokp+hAsN7SylYU4hxKuLJOKIpYK2B5f
	m3acikCmzG5c34dITzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saiQR-0000000DvWc-28LL;
	Sun, 04 Aug 2024 21:05:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJWf-00000002wv1-0Zrs
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 00:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7BC15CE1846;
	Thu,  1 Aug 2024 00:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4C2C32786;
	Thu,  1 Aug 2024 00:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471514;
	bh=ufngkK1NW5FJJk3y562A9XzeMfpxXgZhI0+V1MKWuaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j7G/NV8H0m6pohW4k5M+xOvZY6yUw57KaGchVXGP82P9+mxy0xi+mHoQQBcJfJcCt
	 rUu0AD4mupo8/kB5XTohgVU4vVjn4ZMC/1xkNY7SKZteerqwebNaLpHzRno0wZDe1K
	 tcMQqgDsPCCL7BZKmSLXMoD0Wt7qZGOgC9f7qvQ7YwSqr2CpbHX0/2b0nhMcqxbl6c
	 MXifeW0UlhrIxQ1fuBLaui0p6QYfHp4BeyuWih5ibMKIAub95K9SzCbjpbOB2cMWUh
	 7v/03cMSSexo8StIKOYHeaJFkT6Ugn6KoaYzuvG8XtnUjVubsW7aTReCm7iJwEWt0J
	 4NBAx5Mf3Z7CA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 121/121] i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
Date: Wed, 31 Jul 2024 20:00:59 -0400
Message-ID: <20240801000834.3930818-121-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_171837_399247_545469FD 
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
index 4e01a95cc4d0a..1a96bf5a0bf87 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -294,7 +294,10 @@ static int hci_dma_init(struct i3c_hci *hci)
 
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
