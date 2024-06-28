Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C80C30658
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 13:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzGrX4wpIrftdHamH4Z16SeZcuUH/A199m87ADoWaPI=; b=q18D+0a7uTK0Kr
	K7xJ/0mWtBM/1pATue5AMHPNUNxZXwXWqUCRVzbZqmb5BWsvXMPNwohyseDzAnB20Ru3Yjuxl6xE5
	TgMz7P8lesrvrrQqwLm7YgENeijkmfQC07ND5rcLvR6RVRK4vWHx3MSXLf6TKWf+qhsWmwomKNYVn
	QLHWqHFp99IcOpnMtKRopKrwfy5+TLu0WvAX5E+Fek0bcHbc4DmlcB5qxFfq9VxSXwYKhBLpT2Fwj
	2wigD3g0IKIcPe3t5eDNMYCADtkXyhT0IvvdQOTHGE+eu2ZRIOdbaeyMgdAoDW+YSc5hOxRw+v10K
	amMzs876hjPPxD51JzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBTG-0000000DnSG-3sur;
	Fri, 28 Jun 2024 13:16:58 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBTD-0000000DnPK-3EKV
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 13:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719580616; x=1751116616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DU/Yrr4XaHlbDsC0krOE7vOrnN7UkzY/edYfGr8JE9o=;
  b=JZxElEOr+el8CpBtYHSxnx8sNtVBzvpBmDlVSZQ4R7HZc/hSDm6Hr6Gq
   bYckH/RjAMEFn0ON/4fxdsB4hb5dftWqgEOlOpWqqWUT675mIXsFaa4j1
   PMK8uCHbS7efADumXpmCjYbnOWe4R8W4gfIczwl90a2AyJ7D/tkKdyvbe
   VpQaWFQp9mAk+iwPLjyRvcpIDJZ0w4NIm5FOwrVZgzuzace3Ayss6rb8p
   aqFMLzc6JPuHlj7K0aIyWiDNIwuazNPZ2o17xiCb2OsWjvg/tvp8XyVwU
   UwStjYAEijHDw25LlwuhalZ7NYETHLMk2G+RTZDzI8Lt4xRYB0xzHr8k8
   Q==;
X-CSE-ConnectionGUID: MbGXA0cyTUGp8ffsqK/diw==
X-CSE-MsgGUID: x+OJANxCSQ2ViEDiXqIXUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34300190"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="34300190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 06:16:52 -0700
X-CSE-ConnectionGUID: xFDQf724QISp3+ZsBU+oBQ==
X-CSE-MsgGUID: Tv/QNpf0Suq4mNqYWXd4lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49213806"
Received: from ehlflashnuc2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.57])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2024 06:16:51 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 3/4] i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
Date: Fri, 28 Jun 2024 16:15:58 +0300
Message-ID: <20240628131559.502822-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
References: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_061655_965789_E6B24754 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Definitely condition dma_get_cache_alignment * defined value > 256
during driver initialization is not reason to BUG_ON(). Turn that to
graceful error out with -EINVAL.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 7a56ae4a5ddf..9bdfe40bc1e1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -279,7 +279,10 @@ static int hci_dma_init(struct i3c_hci *hci)
 
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
