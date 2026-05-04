Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A46FF885A
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4QY0MTUINLkRtR3PLbVk5+DPBn6TvkIvPIQkkjyHDE=; b=TjXc0x3Xn3JMHs
	5hXt4Iv374mMBIfjkicuxKUA0X6PNKxRoJcyNJoMncJAamdmua8RXRYp1dCGhXzv+Vulspp6iah36
	UPvkbaFMGiDBFNWIt45Oo/8ulFOWtNorg13Xf5HstRA8+izorJxKrcejPheECvQVA0i4XRrjZG0qN
	UWc1yCRHR0fOAiFPM93yFJaIFXFKSRdRkuaJmXirB1bvhnuTvy0hAszuqgZ3Tgxf/NGb3+4ntIw0z
	S6ktFcSScbKs3gcVWdxRjrSs+/Kq9vXS6hzPS2ylvLtjKpeiNtfO5rRmOzhIU07tgaGXqKaQFiJOu
	Py1P52yXTWpqvOJzNxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZK-0000000D3Zl-08cC;
	Mon, 04 May 2026 11:34:34 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZG-0000000D3HH-0sK4
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894470; x=1809430470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3fhwoOwBkgIJmMxuUMApk0MQ0at4iJ07yU50SQdd6PY=;
  b=kodGWBVdhI8Kzg6N+i968lfpuW+yLiZM9Zl+g1ligW93cXE9W2ixGDUI
   51J+G1gOoMHp3YHtbl21o/5VXN4VSQkJpxei2e/3wV1/kujHOwrCiXO22
   I9GMWixiugiQsT/JBqVyCddEN7KVtAgNdVTNBvnpy0atgzPdkHnSMjTVf
   OWkz78YIXFJzWCivxAPuvP5aCQA+7SF/EkSY8WsD63u9Kwsu+Y0il6qDD
   +1ns4nGmmu3L8wmvbkHAvDLitqqQdPQoRU4kySU5g1/Rq42FwZdrQMfXd
   7tT+IPwgZDiNWcG3QyHmP0+/lA0aQKZgZSsESBHReRcHJkmPjImEMON/W
   A==;
X-CSE-ConnectionGUID: Xg4LjcguTAGW9mA2OBO9Vg==
X-CSE-MsgGUID: KbEufClSTtuhr6zGsL7yKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315295"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315295"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:30 -0700
X-CSE-ConnectionGUID: QFkkCzqZTjOVvrEnd9oyOA==
X-CSE-MsgGUID: NTX9ODEtSc6kU3UQ4acWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478333"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:28 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 15/16] i3c: mipi-i3c-hci: Consolidate DMA ring allocation
Date: Mon,  4 May 2026 14:33:51 +0300
Message-ID: <20260504113352.38490-16-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043430_300106_54A31091 
X-CRM114-Status: GOOD (  10.62  )
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


Changes in V3:

	None

Changes in V2:

	Check for failed allocation before assignments to avoid doing
	arithmetic with NULL pointers


 drivers/i3c/master/mipi-i3c-hci/dma.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 6440302c63ca..4029d4d9e784 100644
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
@@ -359,18 +357,18 @@ static int hci_dma_init(struct i3c_hci *hci)
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
