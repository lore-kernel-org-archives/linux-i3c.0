Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD5BF8D763
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYrVfYDIMCdhIfcVis9AolyDaS63c+T4yNRsfn1XudM=; b=BRwztvw7YucCy0
	Jr6NZGSSq8ZUW8ZiVmrBxt8rLPZk9VDhldRmtroYcohewXi4pLGSf7DIqZkZhuRVeO8D9DcFQycT0
	OO3KjcVjm3TynrfifVC7XlUWvJOK5/fGtnEptkKNLAHTNx/gStuEaUFwLgVoRFH3fD8XU+8ynIdCU
	NLFBrH0Fdv0AC40VNsqmU8G52FXFXV2cJeE4JFaeJbN7EuMt+cktMUU3uRYcfHnfD3O+t0pnTkkAJ
	rI10gb7TK3k01qkYPvZxKKyc1IE//QJKEVPWz/XCsbenXfMaa3jqxSgmM8l1NHNtfh597Keo3gE5l
	PeCpIsiIz0e4D7ulTPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyK-00000002jsS-3tAI;
	Thu, 16 Apr 2026 17:57:48 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyI-00000002jpJ-0d0t
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362266; x=1807898266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V32wPKQw2sdeCcZwqo43xUBPb9zerB8+wnHt21LbQN4=;
  b=F3vtjfyRBT+iouXmYIbVF5op2O1RLrvv8bs8LaVf0VKnV6MhNMMmoIgd
   D8kacPoLh9zPn7fC/ekFZsVby5BVhD8WvU7mr7Bs6ppVgqeerF6MMoXRz
   GUZHm/g23QOf3le7O5eqmkBKrvRmuIhjokgOC94gkocY9abcblxcgkLdQ
   14f0fV/mDeheVig97MKGZ7DDWYTM8qUnh9Cpp5X/Q4y1MO+35AD0mh796
   prOvMMkAyapQONEjv4rdgCLqcIDl3YDkMU8qeex50eR0YF3wHkcywlYXV
   CMZJRoS67RGx3JF5qY9kV4CUtts4L2rgmDVXjHXW9L50McK0wzUTGW39B
   A==;
X-CSE-ConnectionGUID: yE507w/TSiS5T5GdkHhfyw==
X-CSE-MsgGUID: mka0fxW8RFijdVMYIvseCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778428"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:46 -0700
X-CSE-ConnectionGUID: RSd6PmjzREqr2Hu/0SFdKw==
X-CSE-MsgGUID: ycHRl2cKSHOhrAmf615lEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784666"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:45 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] i3c: mipi-i3c-hci: Consolidate DMA ring allocation
Date: Thu, 16 Apr 2026 20:57:03 +0300
Message-ID: <20260416175704.41217-16-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105746_236512_7DEB3998 
X-CRM114-Status: UNSURE (   9.76  )
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

dma_alloc_coherent() allocates memory in whole pages, which can waste
space when command and response queues are allocated separately.

Allocate the DMA command and response queues from a single coherent
allocation instead, while preserving the required 4-byte alignment.

This reduces memory overhead without changing behavior.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 527c282e0734..b06405a9aa7b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -186,14 +186,12 @@ static void hci_dma_free(void *data)
 	for (int i = 0; i < rings->total; i++) {
 		rh = &rings->headers[i];
 
-		if (rh->xfer)
-			dma_free_coherent(rings->sysdev,
-					  rh->xfer_struct_sz * rh->xfer_entries,
-					  rh->xfer, rh->xfer_dma);
-		if (rh->resp)
-			dma_free_coherent(rings->sysdev,
-					  rh->resp_struct_sz * rh->xfer_entries,
-					  rh->resp, rh->resp_dma);
+		if (rh->xfer) {
+			size_t sz = round_up(rh->xfer_struct_sz * rh->xfer_entries, 4);
+
+			sz += rh->resp_struct_sz * rh->xfer_entries;
+			dma_free_coherent(rings->sysdev, sz, rh->xfer, rh->xfer_dma);
+		}
 		kfree(rh->src_xfers);
 		if (rh->ibi_status)
 			dma_free_coherent(rings->sysdev,
@@ -359,17 +357,17 @@ static int hci_dma_init(struct i3c_hci *hci)
 		dev_dbg(&hci->master.dev,
 			"xfer_struct_sz = %d, resp_struct_sz = %d",
 			rh->xfer_struct_sz, rh->resp_struct_sz);
-		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
+		xfers_sz = round_up(rh->xfer_struct_sz * rh->xfer_entries, 4);
 		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
 
-		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
+		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz + resps_sz,
 					      &rh->xfer_dma, GFP_KERNEL);
-		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
-					      &rh->resp_dma, GFP_KERNEL);
+		rh->resp = rh->xfer + xfers_sz;
+		rh->resp_dma = rh->xfer_dma + xfers_sz;
 		rh->src_xfers =
 			kzalloc_objs(*rh->src_xfers, rh->xfer_entries);
 		ret = -ENOMEM;
-		if (!rh->xfer || !rh->resp || !rh->src_xfers)
+		if (!rh->xfer || !rh->src_xfers)
 			goto err_out;
 
 		/* IBIs */
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
