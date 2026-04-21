Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72221F94CA1
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENmfRxgOH7InBD4kQSI2fNpghXb8RGxBH3dKvNb4EuI=; b=JjrIAomysH6mUi
	m+8QLOuEMoUN/jv3k3yAAAk/N+hJhCBzlIkdOyfldmVrzxHJk0QLeJq50a0QZRL9ayZz7GbFgUPmj
	kZvRhB6OosNrHsSCdE0Un0H46G3E+lLqxJWFN2Dh06XWB//ACHE2mCy41kd4UUd87VUBjl3toCNQg
	ALdoKJ044iZJqIJYMq3IPdXpsX4EDnBxHBe072L4Z63ShddmJdH473HYpYe9u86K4mx/NDftxbNyz
	ptD3MZ2BjAVGv0RVcC305bwR1ORHXZEfwA3jVh1+orKrlJwfh39Mccmo6xuLngnDMk323H6WJUdPX
	IvulPHrbNmbIk9zs4tVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJg-00000008zkn-0oBG;
	Tue, 21 Apr 2026 17:55:20 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJa-00000008zV1-3Dlb
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794115; x=1808330115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P0k+z6WGmFM1DEJlHBvodqoGoCPDUtAMrmw1EO5LtcE=;
  b=WGlYotHMXPn2k+EMOGTWdp/8oGuperOm9j1Na1+ckjiBb3h/XPMtFhiX
   vwR9Hn4Rrw3JZgHvvEO3pPR2LZ3jGkFqJ6sJMNDDWWcCKPt7dQepaKUqK
   Xo37MqncQtqwZP++9NwchSYHaX/uUHI98QNNcLEnzpir1tGKVH/BRHurD
   OZpnDc3LZZ3o7qI/N+jpGiET11mD2+jsmqbHVoNHLNchFvUNx4kIUuCOU
   gNZwEsdGeCQ5KMolfSHXWIUP20GJCc8MY/1QWcohTBq0ZvtOrg2k3asv8
   8rOJREigDi6rkw8ZqFb+8wwIIP52lnxP5P6Prl5knE2LUaW7NFp5hkoy5
   g==;
X-CSE-ConnectionGUID: A3yt7p1BQ7y9/CSOmpxelw==
X-CSE-MsgGUID: fw+wTWlORkqshV0dtg4dcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651435"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651435"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:14 -0700
X-CSE-ConnectionGUID: fUUpTz6YRTWsxDMIYUQyAQ==
X-CSE-MsgGUID: rIy3YfAnQXqLIBMpgXsGQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227495086"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:13 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 15/16] i3c: mipi-i3c-hci: Consolidate DMA ring allocation
Date: Tue, 21 Apr 2026 20:54:34 +0300
Message-ID: <20260421175435.122094-16-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105514_874266_11719E34 
X-CRM114-Status: GOOD (  10.69  )
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


Changes in V2:

	Check for failed allocation before assignments to avoid doing
	arithmetic with NULL pointers


 drivers/i3c/master/mipi-i3c-hci/dma.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index e169f20608a0..73fd86b6fb17 100644
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
