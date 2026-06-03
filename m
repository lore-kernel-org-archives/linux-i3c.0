Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EFECD6E69
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2dRicq3uCZ6TZzEmbQBtDNUA2AHVYxjZu2vwlFsKok=; b=i5U9akGYiGTVKG
	vyJI2ZUnH+OPDNYIyIrJ6Hdt5eMRCnwnQcicaITdRRrJ2V8aw1YiLj9lvnD7z2G3J7ezU8NdCALFZ
	4UGUhccIPQfcSi8u+KieIP6DyUKROAtkOhBNm0TgYJiScRR8jLY4/CgJ+kipdYfExqjRsPy65rU5f
	NUBZj6phS41cFUARds8KlhHByzkiCN1k0j/V6/tHGLrK2hGSRGW54Yq5Q7AyWLzKTBGow2f0TmAYU
	pZ0MBDqDeCqOmX4jS8Znrk6D7TGEalS8nGBFMUSJCGai4brAgErFAj4gW29abQeMsFFjFzsFjyIjv
	j5skRfdpr+xSVWYdT2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhac-0000000Eg00-22Ln;
	Wed, 03 Jun 2026 09:08:42 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaa-0000000Effy-03yR
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477720; x=1812013720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SJo3309KexvrFf//nLbqMf1AExY0G6rtZtFHj0R9BIU=;
  b=RB71bz3qSL11BExDvvsTEjQcwxextWyR9noMMUUtueDne42SxeGXVyz7
   qsfuBtLTXUIcKBd5NiX8G6zUAWCzg0yNZiwUyM615IfhfX3FDsRFn1wND
   DbUZFCeV67Xl8awNKQBb+U2CzMeJ/lpGBaUOqcHc01MR0cOHx+C8aZD70
   dYjdZAYqbxwgq4aEIPoNqWzm1copM1sl5g8D9Smah5yWwqkNVOntLl+xD
   +vLIrF2mlIA8zDsDYqNQ+br9c3CUMWR8N6HMIBHlz+5jcy2Y/IpgM2fM2
   o5L38CZQoUPDozZOwe63fup2fV/5ZVzLEQPAelZmGMacQH3gv0squz9Jq
   Q==;
X-CSE-ConnectionGUID: ktMx08KJSyqgNXwIvei1Ig==
X-CSE-MsgGUID: aV8h5gLwTSqjRPhLZl0F7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852674"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852674"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:39 -0700
X-CSE-ConnectionGUID: rmRzx+hTSTmyL9vEMr/fyg==
X-CSE-MsgGUID: xTvlwOGBSzq6EJYX3pJTVQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:38 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 16/17] i3c: mipi-i3c-hci: Consolidate DMA ring allocation
Date: Wed,  3 Jun 2026 12:07:53 +0300
Message-ID: <20260603090754.16252-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020840_073998_2FCD9BA5 
X-CRM114-Status: UNSURE (   9.51  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'd-by

Changes in V4:

	Cache allocation size in rh->xfer_alloc_sz to avoid recomputing in
	hci_dma_free()

Changes in V3:

	None

Changes in V2:

	Check for failed allocation before assignments to avoid doing
	arithmetic with NULL pointers


 drivers/i3c/master/mipi-i3c-hci/dma.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 9a01c740760f..0136f3064ada 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -130,7 +130,7 @@ struct hci_rh_data {
 	dma_addr_t xfer_dma, resp_dma, ibi_status_dma, ibi_data_dma;
 	unsigned int xfer_entries, ibi_status_entries, ibi_chunks_total;
 	unsigned int xfer_struct_sz, resp_struct_sz, ibi_status_sz, ibi_chunk_sz;
-	unsigned int done_ptr, ibi_chunk_ptr, xfer_space;
+	unsigned int xfer_alloc_sz, done_ptr, ibi_chunk_ptr, xfer_space;
 	struct hci_xfer **src_xfers;
 	struct completion op_done;
 };
@@ -187,13 +187,7 @@ static void hci_dma_free(void *data)
 		rh = &rings->headers[i];
 
 		if (rh->xfer)
-			dma_free_coherent(rings->sysdev,
-					  rh->xfer_struct_sz * rh->xfer_entries,
-					  rh->xfer, rh->xfer_dma);
-		if (rh->resp)
-			dma_free_coherent(rings->sysdev,
-					  rh->resp_struct_sz * rh->xfer_entries,
-					  rh->resp, rh->resp_dma);
+			dma_free_coherent(rings->sysdev, rh->xfer_alloc_sz, rh->xfer, rh->xfer_dma);
 		kfree(rh->src_xfers);
 		if (rh->ibi_status)
 			dma_free_coherent(rings->sysdev,
@@ -359,18 +353,19 @@ static int hci_dma_init(struct i3c_hci *hci)
 		dev_dbg(&hci->master.dev,
 			"xfer_struct_sz = %d, resp_struct_sz = %d",
 			rh->xfer_struct_sz, rh->resp_struct_sz);
-		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
+		xfers_sz = round_up(rh->xfer_struct_sz * rh->xfer_entries, 4);
 		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
+		rh->xfer_alloc_sz = xfers_sz + resps_sz;
 
-		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
+		rh->xfer = dma_alloc_coherent(rings->sysdev, rh->xfer_alloc_sz,
 					      &rh->xfer_dma, GFP_KERNEL);
-		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
-					      &rh->resp_dma, GFP_KERNEL);
 		rh->src_xfers =
 			kzalloc_objs(*rh->src_xfers, rh->xfer_entries);
 		ret = -ENOMEM;
-		if (!rh->xfer || !rh->resp || !rh->src_xfers)
+		if (!rh->xfer || !rh->src_xfers)
 			goto err_out;
+		rh->resp = rh->xfer + xfers_sz;
+		rh->resp_dma = rh->xfer_dma + xfers_sz;
 
 		/* IBIs */
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
