Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD12C52D6F
	for <linux-i3c@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKtt5i7rIvUUgIZcFNREkSFP5a32YbyOBL1IeMS/a4A=; b=tHgvdvvmkAQiUp
	xD8N04qi8FATdZe5UI0SKUDs4FOwVY8RBY5dtLBzxaUdpjJiwQx1CVl1a0R3XGwj6qyYjbUPgCPFh
	jxqcFntAkJ+3Y+/RWiJZQFuipcNwiFLuFvwzlk+uZH/9wF5E9/5L9lMo67zE/8D3fVyZxU/5jtewI
	BF11ogfp4oDBp8sDTl6eIlBJQut3NbchUeaFXm7kAQn4/Rda6F/9NtZSKTvMcREhbugHwJOeDM2Uo
	GQxwBernC3uHDOG+xeOktfeHeKXprvS+79LsttNZFwhi2/Pbe/sTn3g6ExkBTskrsbJaipNo6WCzZ
	OoYG3nUhBAyAgKikIwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saiQR-0000000DvWy-3Vtu;
	Sun, 04 Aug 2024 21:05:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJe5-00000002zVe-0SS0
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 00:26:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 990AD61446;
	Thu,  1 Aug 2024 00:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E05C4AF0C;
	Thu,  1 Aug 2024 00:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471976;
	bh=G7oC9KzKZ3u+aZnNGCnn8qE3ProuBDlrSs5M5tCVqK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OA19v7zgAXVzEJ4iufs07mUxKX5BbzNwcgn0JombbHctfD52z7s6LhemaHcBm0+JP
	 fBwoVn7Fh73ya3N9KNo3cQMBzPagpPclgpxM08WA01RsQo9/gNIR3I4XYK3JNnH36k
	 U1/CuaUcoFNgxp06H41Z/F6qWUE5wi6aa/hSmZX5Twer+VjkPgfPc4Igo0MmTdYl4T
	 g+H6F10WUkif5Yli85oyzKG6KrAMUHBTFJLXFVWqxlmDsTRkYyFCTdX1fQ2bUvsoJt
	 KlIY0hUFpOP3sC6FFpsWLu5tWW9k0fg6yOpw/yzGHvrnCRjIlU5+A5j7neGW2A67AA
	 hX2r/kd0fk/IA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 83/83] i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
Date: Wed, 31 Jul 2024 20:18:38 -0400
Message-ID: <20240801002107.3934037-83-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_172617_213818_47F9AB0E 
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
